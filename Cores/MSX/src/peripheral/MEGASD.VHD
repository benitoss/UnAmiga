-- 
-- megasd.vhd
--   SD/MMC card interface
--   Revision 1.00
-- 
-- Copyright (c) 2006 Kazuhiro Tsujikawa (ESE Artists' factory)
-- All rights reserved.
-- 
-- Redistribution and use of this source code or any derivative works, are 
-- permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice, 
--    this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright 
--    notice, this list of conditions and the following disclaimer in the 
--    documentation and/or other materials provided with the distribution.
-- 3. Redistributions may not be sold, nor may they be used in a commercial 
--    product or activity without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED 
-- TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR 
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-- OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
-- WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
-- OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity megasd is
  port(
    clk21m  : in std_logic;
    reset   : in std_logic;
    clkena  : in std_logic;
    req     : in std_logic;
    ack     : out std_logic;
    wrt     : in std_logic;
    adr     : in std_logic_vector(15 downto 0);
    dbi     : out std_logic_vector(7 downto 0);
    dbo     : in std_logic_vector(7 downto 0);

    ramreq  : out std_logic;
    ramwrt  : out std_logic;
    ramadr  : out std_logic_vector(19 downto 0);
    ramdbi  : in std_logic_vector(7 downto 0);
    ramdbo  : out std_logic_vector(7 downto 0);

    mmcdbi  : out std_logic_vector(7 downto 0);
    mmcena  : out std_logic;
    mmcact  : out std_logic;

    mmc_ck  : out std_logic;
    mmc_cs  : out std_logic;
    mmc_di  : out std_logic;
    mmc_do  : in std_logic;

    epc_ck  : out std_logic;
    epc_cs  : out std_logic;
    epc_oe  : out std_logic;
    epc_di  : out std_logic;
    epc_do  : in std_logic;
	 
	 boot_req : out std_logic;
	 boot_ack : in std_logic :='1';
	 boot_data : in std_logic_vector(7 downto 0) := (others=>'0')
  );
end megasd;

architecture rtl of megasd is

  signal ErmBank0    : std_logic_vector(7 downto 0);
  signal ErmBank1    : std_logic_vector(7 downto 0);
  signal ErmBank2    : std_logic_vector(7 downto 0);
  signal ErmBank3    : std_logic_vector(7 downto 0);

  signal mmcact_i : std_logic;
  signal boot_req_r : std_logic;
  
begin

	boot_req<=boot_req_r;
  ----------------------------------------------------------------
  -- ESE-RAM bank register access
  ----------------------------------------------------------------
  process(clk21m, reset)
  begin
    if (reset = '1') then
      ErmBank0   <= X"00";
      ErmBank1   <= X"00";
      ErmBank2   <= X"00";
      ErmBank3   <= X"00";
    elsif (clk21m'event and clk21m = '1') then
 -- Mapped I/O port access on 6000-7FFFh ... Bank register write
      if (req = '1' and wrt = '1' and adr(15 downto 13) = "011") then
        case adr(12 downto 11) is
          when "00"   => ErmBank0 <= dbo;	-- 6000..67ff
          when "01"   => ErmBank1 <= dbo;	-- 6800..6fff
          when "10"   => ErmBank2 <= dbo;	-- 7000..77ff
          when others => ErmBank3 <= dbo;	-- 7800..7fff
        end case;
      end if;
      ack <= req;
    end if;
  end process;
-- =====================================================
  RamReq <= req when wrt = '0'                                      else	-- rd
            req when ErmBank0(7) = '1' and adr(14 downto 13) = "10" else	-- wr 4000..5fff
            req when ErmBank2(7) = '1' and adr(14 downto 13) = "00" else	-- wr 8000..9fff
            req when ErmBank3(7) = '1' and adr(14 downto 13) = "01" else	-- wr A000..Bfff
			'0';
  RamWrt <= wrt;

  RamAdr <= ErmBank0(6 downto 0) & adr(12 downto 0) when adr(14 downto 13) = "10" else	-- 4000..5fff
            ErmBank1(6 downto 0) & adr(12 downto 0) when adr(14 downto 13) = "11" else	-- 6000..7fff
            ErmBank2(6 downto 0) & adr(12 downto 0) when adr(14 downto 13) = "00" else	-- 8000..9fff
            ErmBank3(6 downto 0) & adr(12 downto 0);									-- A000..Bfff

  RamDbo <= dbo;
  dbi    <= RamDbi;
  ----------------------------------------------------------------
  -- SD/MMC card access
  ----------------------------------------------------------------
  process(clk21m, reset)
	 -- Slowed down the SPI comms for the benefit of the Chameleon port,
	 -- but hit trouble; the CPU doesn't seem to wait for writes to complete.
	 -- Not yet sure how to address this issue.  -- AMR
    constant MMCSEQ_HIGH : integer:=5;
	 constant MMCSEQ_LOW : integer:=2;
    variable MmcEnx : std_logic;
    variable EpcEna : std_logic;
    variable MmcMod : std_logic_vector(1 downto 0);
    variable MmcSeq : std_logic_vector(MMCSEQ_HIGH downto 0);
    variable MmcTmp : std_logic_vector(7 downto 0);
    variable MmcDbo : std_logic_vector(7 downto 0);
  begin
    if (reset = '1') then
      MmcEnx := '0';
      EpcEna := '0';
      MmcMod := (others => '0');
      MmcSeq := (others => '0');
      MmcTmp := (others => '1');
      MmcDbo := (others => '1');
      mmcdbi <= (others => '1');

      mmc_ck <= '1';
      mmc_cs <= '1';
      mmc_di <= 'Z';
      epc_ck <= '1';
      epc_cs <= '1';
      epc_di <= 'Z';
		mmcact_i<='0';
		
		boot_req_r<='0';
    elsif (clk21m'event and clk21m = '1') then
      if (ErmBank0(7 downto 6) = "01") then		-- 40h (4000..5fff)
        MmcEnx := '1';
      else
        MmcEnx := '0';
      end if;

      if (ErmBank0(7 downto 4) = "0110") then	-- 60h (4000..5fff)
        EpcEna := '1';		-- EPC
      else
        EpcEna := '0';		-- MMC
      end if;
-- WR MMC & EPC 
      if MmcSeq(MMCSEQ_LOW-1) = '0' then
        case MmcSeq(MMCSEQ_HIGH downto MMCSEQ_LOW) is
          when "1010" => mmc_di <= MmcDbo(7); epc_di <= MmcDbo(7);
          when "1001" => mmc_di <= MmcDbo(6); epc_di <= MmcDbo(6);
          when "1000" => mmc_di <= MmcDbo(5); epc_di <= MmcDbo(5);
          when "0111" => mmc_di <= MmcDbo(4); epc_di <= MmcDbo(4);
          when "0110" => mmc_di <= MmcDbo(3); epc_di <= MmcDbo(3);
          when "0101" => mmc_di <= MmcDbo(2); epc_di <= MmcDbo(2);
          when "0100" => mmc_di <= MmcDbo(1); epc_di <= MmcDbo(1);
          when "0011" => mmc_di <= MmcDbo(0); epc_di <= MmcDbo(0);
          when "0010" => mmc_di <= '1';       epc_di <= '1';      
          when "0001" => mmc_di <= 'Z';       epc_di <= '1';      
          when others => mmc_di <= 'Z';       epc_di <= '1';      
        end case;
      end if;
-- RD MMC
      if MmcSeq(MMCSEQ_LOW-1 downto 0) = (MMCSEQ_LOW-1 downto 0=>'1') -- Rising edge...
				and EpcEna = '0' then
        case MmcSeq(MMCSEQ_HIGH downto MMCSEQ_LOW) is
          when "1001" => MmcTmp(7) := mmc_do;
          when "1000" => MmcTmp(6) := mmc_do;
          when "0111" => MmcTmp(5) := mmc_do;
          when "0110" => MmcTmp(4) := mmc_do;
          when "0101" => MmcTmp(3) := mmc_do;
          when "0100" => MmcTmp(2) := mmc_do;
          when "0011" => MmcTmp(1) := mmc_do;
          when "0010" => MmcTmp(0) := mmc_do;
          when "0001" => mmcdbi <= MmcTmp;		-- RD data MMC
          when others => null;
        end case;
-- RD EPC
--      elsif (MmcSeq(0) = '0' and EpcEna = '1') then
--        case MmcSeq(4 downto 1) is
--          when "1001" => MmcTmp(7) := epc_do;
--          when "1000" => MmcTmp(6) := epc_do;
--          when "0111" => MmcTmp(5) := epc_do;
--          when "0110" => MmcTmp(4) := epc_do;
--          when "0101" => MmcTmp(3) := epc_do;
--          when "0100" => MmcTmp(2) := epc_do;
--          when "0011" => MmcTmp(1) := epc_do;
--          when "0010" => MmcTmp(0) := epc_do;
--          when "0001" => mmcdbi <= MmcTmp;		-- RD data EPC
--          when others => null;
--        end case;
      end if;

-- CLK
      if (MmcSeq(MMCSEQ_HIGH downto MMCSEQ_LOW) < "1011" and MmcSeq(MMCSEQ_HIGH downto MMCSEQ_LOW) > "0010") then
        if (EpcEna = '0') then
-- MMC
          mmc_ck <= MmcSeq(MMCSEQ_LOW-1);
          epc_ck <= '1';
        else
-- EPC
          mmc_ck <= '1';
--          epc_ck <= MmcSeq(MMCSEQ_LOW-1);
        end if;
      else
        mmc_ck <= '1';
        epc_ck <= '1';
      end if;

-- Memory mapped I/O port access on 4000-57FFh ... SD/MMC data register
      if (req = '1' and adr(15 downto 13) = "010" and adr(12 downto 11) /= "11" and 
					MmcEnx = '1' and MmcSeq = (MmcSeq'range => '0') and MmcMod(0) = '0') then
        if (wrt = '1') then
          MmcDbo := dbo;
        else
          MmcDbo := (others => '1');
        end if;
        if (EpcEna = '0') then
          mmc_cs <= adr(12);		-- /CS MMC (4000h..47ff)
          epc_cs <= '1';
			 MmcSeq:=(others=>'1');
			 MmcSeq(MMCSEQ_HIGH downto MMCSEQ_LOW-1) := "10101";
			 mmcact_i<='1';
        else
          mmc_cs <= '1';
          epc_cs <= '1';
--			 if wrt='0' then
				boot_req_r<=not(adr(12) or wrt); -- Needs to be 1 when adr(12) and wrt are both zero
				mmcact_i<=not(adr(12) or wrt);
--			 else
--           epc_cs <= adr(12);		-- /CS EPC (4000h..47ff)
--			 end if;
        end if;
      elsif (MmcSeq /= (MmcSeq'range =>'0')) then
        MmcSeq := MmcSeq - 1;
      end if;
		
-- Memory mapped I/O port access on 5800-5FFFh ... SD/MMC data register
      if (req = '1' and adr(15 downto 13) = "010" and adr(12 downto 11)  = "11" and 
					MmcEnx = '1' and wrt = '1') then
        MmcMod := dbo(1 downto 0);	-- 
      end if;
-- generate /WAIT for Z80
		-- Read data from boot channel
		if boot_req_r='1' then
--			mmcact<='1';
			if boot_ack='1' then
				mmcdbi <= boot_data;		-- RD data EPC
				boot_req_r<='0';
				MmcSeq:=(others=>'0');
				-- FIXME - a better way to delay this?
				MmcSeq(4 downto 0) := (others=>'1');
			end if;
--		elsif (MmcSeq = (MmcSeq'range =>'0')) then
--        mmcact <= '0';
--      else
--        mmcact <= '1';
      end if;
--
    end if;

--	if boot_req_r='1' or MmcSeq /= (MmcSeq'range =>'0')
----		or (mmcenx='1' and wrt='1') then
--			then
--		mmcact<='1';
--	else
--		mmcact<='0';
--	end if;

-- AMR: UGLY HACK ALERT
-- The original OCMSX core doesn't (correctly) pause the CPU while an SPI transaction's in progress.
-- Because we've had to halve the SPI speed to accommodate the Chameleon's MUX limitations, we now have
-- to pause the CPU for half the SPI transaction to avoid breaking the MegaSD firmware's write support.

-- 10010  -  Boot works, Write works irrespective of turbo setting.
-- 10000  -  Boot works, Write works in turbo, Write fails without turbo.
-- 01010  -  Boot works, Writes fail irrespective of turbo setting.
-- 01000  -  Boot fails

	if MmcSeq(MMCSEQ_HIGH downto 5)=(MMCSEQ_HIGH downto 5=>'0') and MmcSeq(4 downto 0) = "10011" then
		mmcact_i<='0';
	end if;

end process;
--

mmcact<=mmcact_i or boot_req_r;

  mmcena <= '1' when ErmBank0(7 downto 6) = "01" else '0';
  epc_oe <= '1' when reset = '1' else '0';  -- epc_oe = 0:enable, 1:disable

end rtl;
