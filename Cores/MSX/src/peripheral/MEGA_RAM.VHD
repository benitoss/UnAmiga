-- 
-- mega_ram.vhd
--   Revision 1.00
--
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

entity mega_ram is
  port(
    clk21m  : in std_logic;
    reset   : in std_logic;
    clkena  : in std_logic;
    req     : in std_logic;
    mem     : in std_logic;
    wrt     : in std_logic;
    adr     : in std_logic_vector(15 downto 0);
    dbi     : out std_logic_vector(7 downto 0);
    dbo     : in std_logic_vector(7 downto 0);

    ramreq  : out std_logic;
    ramwrt  : out std_logic;
    ramadr  : out std_logic_vector(18 downto 0);
    ramdbi  : in std_logic_vector(7 downto 0);
    ramdbo  : out std_logic_vector(7 downto 0)
  );
end mega_ram;

architecture rtl of mega_ram is

  signal MRAMBank0    : std_logic_vector(7 downto 0);
  signal MRAMBank1    : std_logic_vector(7 downto 0);
  signal MRAMBank2    : std_logic_vector(7 downto 0);
  signal MRAMBank3    : std_logic_vector(7 downto 0);
  signal MRAMMode     : std_logic;

begin

  ----------------------------------------------------------------
  -- Mega RAM bank register access
  ----------------------------------------------------------------
  process(clk21m, reset)
  begin
    if (reset = '1') then
        MRAMMode <= '0';    
    elsif (clk21m'event and clk21m = '1') then
  -- I/O port access on 8Eh ... Mode switch
      if (req = '1' and mem = '0') then
           MRAMMode <= not wrt;
  -- MRAMmode = 0 -> "block switch mode"
      elsif (req = '1' and mem = '1' and wrt = '1' and MRAMMode = '0') then
        case adr(14 downto 13) is
          when "00"   => MRAMBank0 <= dbo;
          when "01"   => MRAMBank1 <= dbo;
          when "10"   => MRAMBank2 <= dbo;
          when others => MRAMBank3 <= dbo;
        end case;
      end if;
    end if;
  end process;

  -- MRAMmode = 1 -> "write enable mode"
  RamReq <= req when (mem = '1' and MRAMMode = '1') else '0';
  RamWrt <= wrt;
  RamAdr <= MRAMBank0(5 downto 0) & adr(12 downto 0) when adr(14 downto 13) = "00" else
            MRAMBank1(5 downto 0) & adr(12 downto 0) when adr(14 downto 13) = "01" else
            MRAMBank2(5 downto 0) & adr(12 downto 0) when adr(14 downto 13) = "10" else
            MRAMBank3(5 downto 0) & adr(12 downto 0);
  RamDbo <= dbo;
  dbi    <= RamDbi;

end rtl;
