--
-- emsx_top.vhd
--   ESE MSX-SYSTEM3 / MSX clone on a Cyclone FPGA (ALTERA)
--   Revision 1.00
--
-- modified for Altera DE1 by caro 2007..2013
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
use work.vdp_package.all;

entity emsx_top is
  port(
    -- Clock, Reset ports
--    CLOCK_50	: in std_logic;		-- Input clock DE1 50 MHz
--    CLOCK_27	: in std_logic;		-- Input clock DE1 27 MHz

	clk21m : in std_logic;
	memclk : in std_logic;
	lock_n	: in std_logic;

    -- MSX cartridge slot ports
    pSltClk     : out std_logic;	-- pCpuClk returns here, for Z80, etc.
    pSltRst_n   : in std_logic :='1';		-- pCpuRst_n returns here
    pSltSltsl_n : inout std_logic:='1';
    pSltSlts2_n : inout std_logic:='1';
    pSltIorq_n  : inout std_logic:='1';
    pSltRd_n    : inout std_logic:='1';
    pSltWr_n    : inout std_logic:='1';
    pSltAdr     : inout std_logic_vector(15 downto 0):=(others=>'1');
    pSltDat     : inout std_logic_vector(7 downto 0):=(others=>'1');
    pSltBdir_n  : out std_logic;	-- Bus direction (not used in master mode)

    pSltCs1_n   : inout std_logic:='1';
    pSltCs2_n   : inout std_logic:='1';
    pSltCs12_n  : inout std_logic:='1';
    pSltRfsh_n  : inout std_logic:='1';
    pSltWait_n  : inout std_logic:='1';
    pSltInt_n   : inout std_logic:='1';
    pSltM1_n    : inout std_logic:='1';
    pSltMerq_n  : inout std_logic:='1';

    pSltRsv5    : out std_logic;            -- Reserved
    pSltRsv16   : out std_logic;            -- Reserved (w/ external pull-up)
    pSltSw1     : inout std_logic:='1';          -- Reserved (w/ external pull-up)
    pSltSw2     : inout std_logic:='1';          -- Reserved

    -- SDRAM DE1 ports
--    pMemClk     : out std_logic;            -- SD-RAM Clock
    pMemCke     : out std_logic;            -- SD-RAM Clock enable
    pMemCs_n    : out std_logic;            -- SD-RAM Chip select
    pMemRas_n   : out std_logic;            -- SD-RAM Row/RAS
    pMemCas_n   : out std_logic;            -- SD-RAM /CAS
    pMemWe_n    : out std_logic;            -- SD-RAM /WE
    pMemUdq     : out std_logic;            -- SD-RAM UDQM
    pMemLdq     : out std_logic;            -- SD-RAM LDQM
    pMemBa1     : out std_logic;            -- SD-RAM Bank select address 1
    pMemBa0     : out std_logic;            -- SD-RAM Bank select address 0
    pMemAdr     : out std_logic_vector(11 downto 0);    -- SD-RAM Address
    pMemDat     : inout std_logic_vector(15 downto 0):=(others=>'1');  -- SD-RAM Data

    -- PS/2 keyboard ports
    pPs2Clk_in     : in std_logic:='1';
    pPs2Dat_in     : in std_logic:='1';
    pPs2Clk_out     : out std_logic;
    pPs2Dat_out     : out std_logic;

    -- Joystick ports (Port_A, Port_B)
    pJoyA       : inout std_logic_vector( 5 downto 0):=(others=>'1');
    pStrA       : out std_logic;
    pJoyB       : inout std_logic_vector( 5 downto 0):=(others=>'1');
    pStrB       : out std_logic;

    -- SD/MMC slot ports
    pSd_Ck      : out std_logic;                        -- pin 5
    pSd_Cm      : out std_logic;                        -- pin 2
--  pSd_Dt	    : inout std_logic_vector( 3 downto 0);  -- pin 1(D3), 9(D2), 8(D1), 7(D0)
    pSd_Dt3	    : out std_logic;						-- pin 1
    pSd_Dt0	    : in std_logic;						-- pin 7

    -- DIP switch, Lamp ports
    pSW		    : in std_logic_vector( 3 downto 0);	    -- 0 - press; 1 - unpress
    pDip        : in std_logic_vector( 9 downto 0);     -- 0=ON,  1=OFF(default on shipment)
    pLedG       : out std_logic_vector( 7 downto 0);   	-- 0=OFF, 1=ON(green)
    pLedR	    : out std_logic_vector( 9 downto 0);    -- 0=OFF, 1=ON(red) ...Power & SD/MMC access lamp

    -- Video, Audio/CMT ports
    pDac_VR     : out std_logic_vector( 5 downto 0);  -- RGB_Red / Svideo_C
    pDac_VG     : out std_logic_vector( 5 downto 0);  -- RGB_Grn / Svideo_Y
    pDac_VB     : out std_logic_vector( 5 downto 0);  -- RGB_Blu / CompositeVideo
    pDac_S		: out   std_logic;						-- Sound
    pREM_out	: out   std_logic;						-- REM output; 1 - Tape On
    pCMT_out	: out   std_logic;						-- CMT output
    pCMT_in		: in    std_logic :='1';						-- CMT input

    pVideoHS_n  : out std_logic;                        -- Csync(RGB15K), HSync(VGA31K)
    pVideoVS_n  : out std_logic;                        -- VSync(VGA31K), Blank(RGB15K)
    pVideoVS_OSD_n  : out std_logic;                        -- Audio(RGB15K), VSync(VGA31K)
    pVideoHS_OSD_n  : out std_logic;                        -- Audio(RGB15K), VSync(VGA31K)

    -- Hex display
    hex	    : out std_logic_vector(15 downto 0);

	SOUND_L : out std_logic_vector(15 downto 0);
	SOUND_R : out std_logic_vector(15 downto 0);
	CmtIn : in std_logic;
	
	boot_req : out std_logic;
	boot_ack : in std_logic;
	boot_data : in std_logic_vector(7 downto 0);
	temp_boot : in std_logic;

	-- Volumes
	MstrVol : std_logic_vector(2 downto 0);
	PsgVol : std_logic_vector(2 downto 0);
	SccVol : std_logic_vector(2 downto 0);
	OpllVol : std_logic_vector(2 downto 0)
	
);
end emsx_top;

-- ====================================================================
architecture rtl of emsx_top is

  component t80a
    port(
      RESET_n : in std_logic;
      CLK_n   : in std_logic;
      WAIT_n  : in std_logic;
      INT_n   : in std_logic;
      NMI_n   : in std_logic;
      BUSRQ_n : in std_logic;
      M1_n    : out std_logic;
      MREQ_n  : out std_logic;
      IORQ_n  : out std_logic;
      RD_n    : out std_logic;
      WR_n    : out std_logic;
      RFSH_n  : out std_logic;
      HALT_n  : out std_logic;
      BUSAK_n : out std_logic;
      A       : out std_logic_vector(15 downto 0);
      D       : inout std_logic_vector(7 downto 0)
    );
  end component;

  component iplrom
    port(
      clk     : in std_logic;
      adr     : in std_logic_vector(15 downto 0);
      dbi     : out std_logic_vector(7 downto 0)
    );
  end component;

  component megasd
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
  end component;

  component cyclone_asmiblock   	-- Altera specific component
    port (
      dclkin   : in std_logic;  	-- DCLK
      scein    : in std_logic;  	-- nCSO
      sdoin    : in std_logic;  	-- ASDO
      oe       : in std_logic;  	--(1=disable(Hi-Z))
      data0out : out std_logic  	-- DATA0
    );
  end component;

  component mapper
    port(
      clk21m  : in std_logic;
      reset   : in std_logic;
      clkena  : in std_logic;
      req     : in std_logic;
      ack     : out std_logic;
      mem     : in std_logic;
      wrt     : in std_logic;
      adr     : in std_logic_vector(15 downto 0);
      dbi     : out std_logic_vector(7 downto 0);
      dbo     : in std_logic_vector(7 downto 0);
      ramreq  : out std_logic;
      ramwrt  : out std_logic;
      ramadr  : out std_logic_vector(21 downto 0);
      ramdbi  : in std_logic_vector(7 downto 0);
      ramdbo  : out std_logic_vector(7 downto 0)
    );
  end component;

  component eseps2 is
    port (
      clk21m   : in std_logic;
      reset    : in std_logic;
      clkena   : in std_logic;
      Kmap     : in std_logic;
      Caps     : inout std_logic;
      Kana     : inout std_logic;
      Paus     : inout std_logic;
      Scro     : inout std_logic;
      Reso     : inout std_logic;
      FKeys    : out std_logic_vector(7 downto 0);
		pPs2Clk_in  : in std_logic;
		pPs2Dat_in  : in std_logic;
		pPs2Clk_out  : out std_logic;
		pPs2Dat_out  : out std_logic;
      PpiPortC : inout std_logic_vector(7 downto 0);
      pKeyX    : inout std_logic_vector(7 downto 0)
    );
  end component;

  component rtc
    port(
      clk21m  : in std_logic;
      reset   : in std_logic;
      clkena  : in std_logic;
      req     : in std_logic;
      ack     : out std_logic;
      wrt     : in std_logic;
      adr     : in std_logic_vector(15 downto 0);
      dbi     : out std_logic_vector(7 downto 0);
      dbo     : in std_logic_vector(7 downto 0)
    );
  end component;

  component kanji is
    port (
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
      ramadr  : out std_logic_vector(17 downto 0);
      ramdbi  : in std_logic_vector(7 downto 0);
      ramdbo  : out std_logic_vector(7 downto 0)
    );
  end component;

  -- V9958
  component vdp
    port(
      -- VDP clock ... 21.477MHz
      clk21m  	: in std_logic;
      reset   	: in std_logic;
      req     	: in std_logic;
      ack     	: out std_logic;
      wrt     	: in std_logic;
      adr     	: in std_logic_vector(15 downto 0);
      dbi     	: out std_logic_vector(7 downto 0);
      dbo     	: in std_logic_vector(7 downto 0);
      int_n   	: out std_logic;
      pRamOe_n	: out std_logic;
      pRamWe_n	: out std_logic;
      pRamAdr 	: out std_logic_vector(16 downto 0);
      pRamDbi 	: in  std_logic_vector(15 downto 0);
      pRamDbo 	: out std_logic_vector(7 downto 0);
	  HiSpeed_Mode: in std_logic;
      -- Video Output
      pVideoR 	: out std_logic_vector( 5 downto 0);
      pVideoG 	: out std_logic_vector( 5 downto 0);
      pVideoB 	: out std_logic_vector( 5 downto 0);
      pVideoHS_n 	: out std_logic;
      pVideoVS_n 	: out std_logic;
      pVideoCS_n 	: out std_logic;
      pVideoDHClk : out std_logic;
      pVideoDLClk : out std_logic;
      -- Display resolution (0=15kHz, 1=31kHz)
      DispReso 	: in  std_logic;
      -- Display mode (1 - PAL)
      Disp_PAL	: in  std_logic -- caro
    );
  end component;

  component vencode
    port(
      clk21m    : in std_logic;
      reset     : in std_logic;
      videoR    : in std_logic_vector(5 downto 0);
      videoG    : in std_logic_vector(5 downto 0);
      videoB    : in std_logic_vector(5 downto 0);
      videoHS_n : in std_logic;
      videoVS_n : in std_logic;
      videoY    : out std_logic_vector(5 downto 0);
      videoC    : out std_logic_vector(5 downto 0);
      videoV    : out std_logic_vector(5 downto 0)
    );
  end component;

  component psg
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
      joya    : inout std_logic_vector(5 downto 0);
      stra    : out std_logic;
      joyb    : inout std_logic_vector(5 downto 0);
      strb    : out std_logic;
      kana    : out std_logic;
      cmtin   : in std_logic;
      keymode : in std_logic;
      wave    : out std_logic_vector(9 downto 0)
    );
  end component;

  component megaram
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
      mapsel  : in std_logic_vector(1 downto 0);  -- "x0":SCC+, "01":ASC8K, "11":ASC16K
      wavl    : out std_logic_vector(14 downto 0);
      wavr    : out std_logic_vector(14 downto 0)
    );
  end component;

  component mega_ram is
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
 end component;

  component eseopll
    port(
      clk21m  : in std_logic;
      reset   : in std_logic;
      clkena  : in std_logic;
      enawait : in std_logic;
      req     : in std_logic;
      ack     : out std_logic;
      wrt     : in std_logic;
      adr     : in std_logic_vector(15 downto 0);
      dbo     : in std_logic_vector(7 downto 0);
      wav     : out std_logic_vector(9 downto 0)
      );
  end component;

  component esepwm
    generic (
      MSBI : integer
    );
    port(
      clk     : in std_logic;
      reset   : in std_logic;
      DACin   : in std_logic_vector(MSBI downto 0);
      DACout  : out std_logic
    );
  end component;

  component scc_mix_mul
	port(
		a	: in	std_logic_vector( 15 downto 0 );	-- 16bit �Q¦����
		b	: in	std_logic_vector(  2 downto 0 );	-- 3bit �o�C�i��
		c	: out	std_logic_vector( 18 downto 0 )		-- 19bit �Q¦����
	);
  end component;

-- system timer (MSXturboR)
  component system_timer
    port(
      clk21m  : in	std_logic;
      reset	  : in	std_logic;
      req	  : in	std_logic;
      ack	  : out	std_logic;
      adr     : in	std_logic_vector( 15 downto 0 );
      dbi     : out	std_logic_vector(  7 downto 0 );
      dbo	  : in	std_logic_vector(  7 downto 0 )
   );
end component;

--	low pass filter 2 (8)
  component lpf2
 	generic (
 		msbi	: integer
		);
	port(
		clk21m	: in	std_logic;
		reset	: in	std_logic;
		clkena	: in	std_logic;
		idata	: in	std_logic_vector( msbi downto 0 );
		odata	: out	std_logic_vector( msbi downto 0 )
	);
  end component;

--
  component interpo
	generic (
		msbi	: integer
		);
	port(
		clk21m	: in	std_logic;
		reset	: in	std_logic;
		clkena	: in	std_logic;
		idata	: in	std_logic_vector( msbi downto 0 );
		odata	: out	std_logic_vector( msbi downto 0 )
	);
  end component;

--------------------------------------------------------------------------
-- LOW PASS FILTER FOR SOUND
--------------------------------------------------------------------------
  COMPONENT LPF48K
	GENERIC (
		MSBI	: INTEGER;
		MSBO	: INTEGER
	);
	PORT(
		CLK21M	: IN	STD_LOGIC;
		RESET	: IN	STD_LOGIC;
		CLKENA	: IN	STD_LOGIC;
		IDATA	: IN	STD_LOGIC_VECTOR( MSBI DOWNTO 0 );
		ODATA	: OUT	STD_LOGIC_VECTOR( MSBO DOWNTO 0 )
	);
  END COMPONENT;

-- ///////////////////////////////////////////////////////////////////
-- *******************************************************************
--	system timer
  signal  systim_req	: std_logic;
  signal  systim_ack	: std_logic;
  signal  systim_dbi	: std_logic_vector(7 downto 0);

  -- Operation mode
  signal KeyMode     : std_logic;               	-- Kana key board layout : 1=JIS layout
  signal iDipLed     : std_logic_vector(9 downto 0);
  signal rDipLed     : std_logic_vector(9 downto 0);
  signal DispSel     : std_logic_vector(1 downto 0);-- Select Dislay mode
  signal VdpMode	 : std_logic;
  alias	 MemMode     : std_logic is rDipLed(9);	    -- '0': 2 Mbyte			'1': 4 MByte
  alias	 MRAMmode    : std_logic is rDipLed(8);		-- '0': Cart in Slot1,	'1': MEGA RAM
  alias  ClkMode     : std_logic is iDipLed(7); 	-- '0': CPU_3.58MHz,    '1': CPU_10.74MHz
  alias  Kmap        : std_logic is rDipLed(6); 	-- '0': English-101,    '1': Japanese-106
  alias  MegType     : std_logic_vector(1 downto 0) is rDipLed(5 downto 4); -- "01" - SCC2
  alias	 Slt1Mode    : std_logic is rDipLed(3);		-- '0': Cart in Slot1,	'1': SCC1
  alias  MmcMode     : std_logic is rDipLed(2); 	-- '0': enable SD/MMC,  '1': disable SD/MMC
  alias  DispMode    : std_logic_vector(1 downto 0) is iDipLed(1 downto 0);	-- '0x': VGA out; '1x': TV out

  -- Clock, Reset control signals
--  signal clk21m      : std_logic;
--  signal memclk      : std_logic;
  signal cpuclk      : std_logic;
  signal clkena      : std_logic;
  signal clkdiv      : std_logic_vector(1 downto 0);
  signal ff_turbo    : std_logic;
  signal reset       : std_logic;
--  signal lock_n       : std_logic;
  signal RstEna      : std_logic := '0';
  signal RstSeq      : std_logic_vector(4 downto 0) := (others => '0');
  signal RstPower	 : std_logic := '1'; -- reset from POWER ON
  signal FreeCounter : std_logic_vector(15 downto 0) := (others => '0');
  signal ClkFkey	 : std_logic;
  signal VdpFkey	 : std_logic;

  -- MSX cartridge slot control signals
  signal BusDir      : std_logic;
  signal iSltSltsl_n : std_logic;
  signal iSltRfsh_n  : std_logic;
  signal iSltMerq_n  : std_logic;
  signal iSltIorq_n  : std_logic;
--  signal iSltRd_n    : std_logic;
--  signal iSltWr_n    : std_logic;
  signal xSltRd_n    : std_logic;
  signal xSltWr_n    : std_logic;
  signal iSltAdr     : std_logic_vector(15 downto 0);
  signal iSltDat     : std_logic_vector(7 downto 0);
  signal dlydbi      : std_logic_vector(7 downto 0);
  signal BusReq_n    : std_logic;
  signal CpuM1_n     : std_logic;
  signal CpuRst_n    : std_logic;
  signal CpuRfsh_n   : std_logic;

-- caro
  signal pCpuClk     : std_logic;  -- RU

-- Internal bus signals (common)
  signal req         : std_logic;
--  signal ireq        : std_logic;
  signal ack, iack   : std_logic;
  signal mem         : std_logic;
  signal wrt         : std_logic;
  signal adr         : std_logic_vector(15 downto 0);
  signal dbi         : std_logic_vector(7 downto 0);
  signal dbo         : std_logic_vector(7 downto 0);

-- Primary, Expansion slot signals
  signal ExpDbi      : std_logic_vector(7 downto 0);
  signal ExpSlot0    : std_logic_vector(7 downto 0);
  signal ExpSlot3    : std_logic_vector(7 downto 0);
  signal PriSltNum   : std_logic_vector(1 downto 0);
  signal ExpSltNum0  : std_logic_vector(1 downto 0);
  signal ExpSltNum3  : std_logic_vector(1 downto 0);

  -- Slot decode signals
  signal iSltBot     : std_logic;
  signal iSltMap     : std_logic;
  signal jSltMem     : std_logic;
  signal iSltScc1    : std_logic;
  signal jSltScc1    : std_logic;
  signal iSltScc2    : std_logic;
  signal jSltScc2    : std_logic;
  signal iSltErm     : std_logic;

  -- BIOS-ROM decode signals
  signal RomReq      : std_logic;
  signal rom_main    : std_logic;
  signal rom_opll    : std_logic;
  signal rom_extr    : std_logic;
  signal rom_kanj    : std_logic;
  signal rom_free1   : std_logic;
  signal rom_free2   : std_logic;

  -- IPL-ROM signals
  signal RomDbi      : std_logic_vector(7 downto 0);

  -- ESE-RAM signals
  signal ErmReq      : std_logic;
--  signal ErmAck      : std_logic;
--  signal ErmDbi      : std_logic_vector(7 downto 0);
  signal ErmRam      : std_logic;
  signal ErmWrt      : std_logic;
--  signal ErmDbo      : std_logic_vector(7 downto 0);
  signal ErmAdr      : std_logic_vector(19 downto 0);

  -- SD/MMC signals
  signal MmcEna      : std_logic;
  signal MmcAct      : std_logic;
  signal MmcDbi      : std_logic_vector(7 downto 0);

  -- EPCS/ASMI signals
  signal EPC_CK      : std_logic;
  signal EPC_CS      : std_logic;
  signal EPC_OE      : std_logic;
  signal EPC_DI      : std_logic;
  signal EPC_DO      : std_logic;

  -- Mapper RAM signals
  signal MapReq      : std_logic;
--  signal MapAck      : std_logic;
  signal MapDbi      : std_logic_vector(7 downto 0);
  signal MapRam      : std_logic;
  signal MapWrt      : std_logic;
--  signal MapDbo      : std_logic_vector(7 downto 0);
  signal MapAdr      : std_logic_vector(21 downto 0);

  -- MEGA RAM signals
  signal MRAMReq      : std_logic;
  signal MRAMDbi      : std_logic_vector(7 downto 0);
  signal MRAMRam      : std_logic;
  signal MRAMWrt      : std_logic;
  signal MRAMAdr      : std_logic_vector(18 downto 0);
  signal iMEGA_RAM    : std_logic;
  signal jMEGA_RAM    : std_logic;

  -- PPI(8255) signals
  signal PpiReq      : std_logic;
--  signal PpiAck      : std_logic;
  signal PpiDbi      : std_logic_vector(7 downto 0);
  signal PpiPortA    : std_logic_vector(7 downto 0);
  signal PpiPortB    : std_logic_vector(7 downto 0);
  signal PpiPortC    : std_logic_vector(7 downto 0);

  signal W_PAGE_DEC		: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
  signal W_PRISLT_DEC	: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
  signal W_EXPSLT0_DEC	: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
  signal W_EXPSLT3_DEC	: STD_LOGIC_VECTOR(  3 DOWNTO 0 );

  -- PS/2 signals
  signal Paus        : std_logic;
  signal Reso        : std_logic;
  signal Reso_v      : std_logic;
  signal PAL_v		 : std_logic;
  signal Kana        : std_logic;
  signal Caps        : std_logic;
  signal Fkeys       : std_logic_vector(7 downto 0);

  -- CMT signals
--  signal CmtIn       : std_logic;
  alias  CmtOut      : std_logic is PpiPortC(5);
  alias  REMOut      : std_logic is PpiPortC(4);

  -- 1 bit sound port signal
  alias  KeyClick    : std_logic is PpiPortC(7);

  -- RTC signals
  signal RtcReq      : std_logic;
  signal RtcDbi      : std_logic_vector(7 downto 0);

  -- Kanji ROM signals
  signal KanReq      : std_logic;
  signal KanDbi      : std_logic_vector(7 downto 0);
  signal KanRom      : std_logic;
  signal KanAdr      : std_logic_vector(17 downto 0);

  -- VDP signals
  signal VdpReq      : std_logic;
  signal VdpDbi      : std_logic_vector(7 downto 0);
  signal VideoSC     : std_logic;
  signal VideoDLClk  : std_logic;
  signal VideoDHClk  : std_logic;
  signal WeVdp_n     : std_logic;
  signal VdpAdr      : std_logic_vector(16 downto 0);
  signal VrmDbo      : std_logic_vector(7 downto 0);
  signal VrmDbi      : std_logic_vector(15 downto 0);
  signal pVdpInt_n   : std_logic;

  -- Video signals
  signal VideoR      : std_logic_vector( 5 downto 0);   -- RGB_Red
  signal VideoG      : std_logic_vector( 5 downto 0);   -- RGB_Green
  signal VideoB      : std_logic_vector( 5 downto 0);   -- RGB_Blue
  signal VideoHS_n   : std_logic;                       -- Holizontal Sync
  signal VideoVS_n   : std_logic;                       -- Vertical Sync
  signal VideoCS_n   : std_logic;                       -- Composite Sync
  signal videoY      : std_logic_vector( 5 downto 0);   -- Svideo_Y
  signal videoC      : std_logic_vector( 5 downto 0);   -- Svideo_C
  signal videoV      : std_logic_vector( 5 downto 0);   -- CompositeVideo

  -- PSG signals
  signal PsgReq      : std_logic;
  signal PsgDbi      : std_logic_vector(7 downto 0);
  signal PsgAmp      : std_logic_vector(9 downto 0);

  -- SCC signals
  signal Scc1Req     : std_logic;
  signal Scc1Ack     : std_logic;
  signal Scc1Dbi     : std_logic_vector(7 downto 0);
  signal Scc1Ram     : std_logic;
  signal Scc1Wrt     : std_logic;
  signal Scc1Adr     : std_logic_vector(19 downto 0);
  signal Scc1AmpL    : std_logic_vector(14 downto 0);

  signal Scc2Req     : std_logic;
  signal Scc2Ack     : std_logic;
  signal Scc2Dbi     : std_logic_vector(7 downto 0);
  signal Scc2Ram     : std_logic;
  signal Scc2Wrt     : std_logic;
  signal Scc2Adr     : std_logic_vector(19 downto 0);
  signal Scc2AmpL    : std_logic_vector(14 downto 0);

  signal Scc1Type    : std_logic_vector(1 downto 0);

  -- Opll signals
  signal OpllReq     : std_logic;
  signal OpllAck     : std_logic;
  signal OpllAmp     : std_logic_vector(9 downto 0);
  signal OpllEnaWait : std_logic;

  -- Sound signals
  constant DAC_MSBI  : integer := 13;
  signal DACin       : std_logic_vector(DAC_MSBI downto 0);
  signal DACin_L     : std_logic_vector(DAC_MSBI downto 0);
  signal DACin_R     : std_logic_vector(DAC_MSBI downto 0);
  signal DACout      : std_logic;
  signal Sound_level : std_logic_vector(8 downto 0);
--  signal Sound_L     : std_logic_vector(15 downto 0);
--  signal Sound_R     : std_logic_vector(15 downto 0);

--  signal MstrVol     : std_logic_vector(2 downto 0);
--  signal PsgVol     : std_logic_vector(2 downto 0);
--  signal SccVol     : std_logic_vector(2 downto 0);
--  signal OpllVol     : std_logic_vector(2 downto 0);

  signal vFKeys			: std_logic_vector(  7 downto 0 );

-- mixer
  signal    ff_prepsg   : std_logic_vector( 9 downto 0 );
  signal    ff_prescc   : std_logic_vector( 15 downto 0 );
  signal    ff_psg      : std_logic_vector( DACin'high + 2 downto DACin'low );
  signal    ff_scc      : std_logic_vector( DACin'high + 2 downto DACin'low );
  signal    w_scc_sft   : std_logic_vector( DACin'high + 2 downto DACin'low );
  signal    w_scc       : std_logic_vector( 18 downto 0 );
  signal    w_s         : std_logic_vector( 15 downto 7 );
  signal    ff_opll     : std_logic_vector( DACin'high + 2 downto DACin'low );
  signal    ff_psg_offset : std_logic_vector( DACin'high + 2 downto DACin'low );
  signal    ff_scc_offset : std_logic_vector( DACin'high + 2 downto DACin'low );
  signal    ff_pre_dacin  : std_logic_vector( DACin'high + 2 downto DACin'low );
  signal    ff_pre_dacin_L  : std_logic_vector( DACin'high + 2 downto DACin'low );
  signal    ff_pre_dacin_R  : std_logic_vector( DACin'high + 2 downto DACin'low );
  constant  c_amp_offset  : std_logic_vector( DACin'high + 2 downto DACin'low ) := ( ff_pre_dacin'high => '1', others => '0' );
  constant  c_opll_zero   : std_logic_vector( OpllAmp'range ) := ( OpllAmp'high => '1', others => '0' );

-- sound output filter
  signal lpf1_wave	: std_logic_vector( DACin'high downto 0 );
  signal lpf5_wave	: std_logic_vector( DACin'high downto 0 );
  signal lpf18_wave_L	: std_logic_vector( DACin'high downto 0 );
  signal lpf18_wave_R	: std_logic_vector( DACin'high downto 0 );

-- Exernal memory signals
  signal RamReq      : std_logic;
  signal RamAck      : std_logic;
  signal RamDbi      : std_logic_vector(7 downto 0);
  signal ClrAdr      : std_logic_vector(17 downto 0);
  signal CpuAdr      : std_logic_vector(22 downto 0);

-- SD-RAM control signals
  signal SdrSta      : std_logic_vector(2 downto 0);
  signal SdrCmd      : std_logic_vector(3 downto 0);
  signal SdrBa	     : std_logic_vector(1 downto 0);
  signal SdrUdq      : std_logic;
  signal SdrLdq      : std_logic;
  signal SdrAdr      : std_logic_vector(11 downto 0);
  signal SdrDat      : std_logic_vector(15 downto 0);
  signal SdPaus      : std_logic;

-- SdrCmd =  pMemCs_n,pMemRas_n,pMemCas_n,pMemWe_n;
  constant SdrCmd_de : std_logic_vector(3 downto 0) := "1111"; -- deselect
  constant SdrCmd_pr : std_logic_vector(3 downto 0) := "0010"; -- precharge all
  constant SdrCmd_re : std_logic_vector(3 downto 0) := "0001"; -- refresh
  constant SdrCmd_ms : std_logic_vector(3 downto 0) := "0000"; -- mode regiser set

  constant SdrCmd_xx : std_logic_vector(3 downto 0) := "0111"; -- no operation
  constant SdrCmd_ac : std_logic_vector(3 downto 0) := "0011"; -- activate
  constant SdrCmd_rd : std_logic_vector(3 downto 0) := "0101"; -- read
  constant SdrCmd_wr : std_logic_vector(3 downto 0) := "0100"; -- write

-- clock divider
  signal clkdiv3     : std_logic_vector(  1 downto 0 );
  signal w_10hz      : std_logic;
  signal ff_mem_seq  : std_logic_vector(  1 downto 0 );

-- operation mode
  signal ff_clk21m_cnt : std_logic_vector( 21 downto 0 ); -- free run counter
  signal ff_rst_seq  : std_logic_vector(  1 downto 0 );

-- DRAM arbiter
  signal w_wrt_req   : std_logic;

-- SD-RAM controller
  signal ff_sdr_seq  : std_logic_vector(2 downto 0);

-- port F4
  signal portF4_req  : std_logic;
  signal portF4_bit7 : std_logic; -- 1 - hard reset; 0 - soft reset
  
  signal ff_ldbios   : std_logic; -- 1 - load BIOS
  
-- ***************************************************************
begin
----------------------------------------------------------------
-- Clock generator (21.48MHz > 3.58MHz)
-- pCpuClk should be independent from reset
----------------------------------------------------------------
-- clock enabler : 3.58MHz = 21.48MHz / 6
process( reset, clk21m )
begin
	if( reset = '1' )then
		clkena	<= '0';
	elsif (clk21m'event and clk21m = '1') then
		if( clkdiv3 = "00" )then
			clkena <= cpuclk;
		else
			clkena <= '0';
		end if;
	end if;
end process;

-- CPUCLK : 3.58MHz = 21.48MHz / 6
process( reset, clk21m )
begin
	if( reset = '1' )then
		cpuclk	<= '1';
	elsif (clk21m'event and clk21m = '1') then
		if( clkdiv3 = "10" )then
			cpuclk <= not cpuclk;
		else
			-- hold
		end if;
	end if;
end process;

-- Prescaler : 21.48MHz / 3
process( reset, clk21m )
begin
	if( reset = '1' )then
		clkdiv3	<= "10";
	elsif( clk21m'event and clk21m = '1' )then
		if( clkdiv3 = "00" )then
			clkdiv3	<= "10";
		else
			clkdiv3	<= clkdiv3 - 1;
		end if;
	end if;
end process;

-- Prescaler : 21.48MHz / 4
process( reset, clk21m )
begin
	if( reset = '1' )then
		clkdiv <= (others => '0');
	elsif( clk21m'event and clk21m = '1' )then
		clkdiv <= clkdiv - 1;
	end if;
end process;
----------------------------------------------------------------
-- Clock selector
----------------------------------------------------------------

-- Disable keyboard shortcut for turbo since we use the OSD
--process( reset, clk21m )
--begin
--	if( reset = '1' )then
--		ClkFkey	<= '0';
--		VdpFkey	<= '0';
--	elsif( clk21m'event and clk21m = '1' )then
--		if( Fkeys(0) /= vFKeys(0) )then
--			if( Fkeys(7) = '0' )then
--				ClkFkey <= not ClkFkey;		-- F12 = Togle Clock
--			else
--				VdpFkey <= not VdpFkey;		-- SHIFT+F12 = Togle VDP Turbo
--			end if;
--		end if;
--	end if;
--end process;

process (reset, clk21m)
begin
	if (reset = '1') then
		ff_turbo <= '1';					-- 10.74MHz (TURBO)
		VdpMode	 <= '1';					-- Turbo VDP
	elsif (clk21m'event and clk21m = '0') then
		if (cpuclk = '0' and clkdiv = "00" and ff_ldbios = '0') then
			if( ClkFkey = '0' )then
				ff_turbo <= ClkMode;		-- Clock selector (F12)
			else
				ff_turbo <= not ClkMode;
			end if;
		end if;
		VdpMode <= ff_turbo;
	end if;
end process;

pCpuClk <= cpuclk when (ff_turbo = '0') else clkdiv(0); -- TURBO
pSltClk <= clkdiv(0); -- 3.58 MHz

----------------------------------------------------------------
-- Reset control
-- "RstSeq" should be cleared when power-on reset
----------------------------------------------------------------
process( memclk )
begin
	if( memclk'event and memclk = '1' )then
		ff_mem_seq <= ff_mem_seq(0) & (not ff_mem_seq(1));
	end if;
end process;

process(memclk)
begin
	if (memclk'event and memclk = '1') then
		if (ff_mem_seq = "00") then
			FreeCounter <= FreeCounter + 1;
		end if;
	end if;
end process;

process(memclk)
begin
	if (memclk'event and memclk = '1') then
		if( (ff_mem_seq = "00") and (FreeCounter = X"FFFF") and (RstSeq /= "11111") )then
			RstSeq <= RstSeq + 1;			-- 3ms (= 65536 / 21.48MHz)
		else
			RstPower <= '0';	
		end if;
	end if;
end process;

--	Reset pulse width = 48 ms
process( RstEna, memclk )
begin
	if( RstEna = '0' )then
		CpuRst_n <= '0';
	elsif( memclk'event and memclk = '1' )then
		CpuRst_n <= '1';
	end if;
end process;

reset <= RstPower or (not pSW(0)); -- not pSltRst_n;
----------------------------------------------------------------
-- Operation mode
----------------------------------------------------------------
-- reset enable wait counter
--
-- ff_rst_seq(0)	\___/~~~X~~~\___X___X ...
-- ff_rst_seq(1)	\___X___/~~~X~~~\___X ...
--
process( reset, clk21m )
begin
	if( reset = '1' )then
		ff_rst_seq <= "00";
	elsif( clk21m'event and clk21m = '1' )then
		if( w_10hz = '1' )then
			ff_rst_seq <= ff_rst_seq(0) & (not ff_rst_seq(1));
		end if;
	end if;
end process;

-- reset enabler
process( reset, clk21m )
begin
	if (reset = '1') then
		RstEna <= '0';
	elsif (clk21m'event and clk21m = '1')then
		if (ff_rst_seq = "11") then	-- RstEna change to 1 after 200ms from power on.
			RstEna	 <= '1';
		end if;
	end if;
end process;

-- DIP SW latch
process( clk21m )
begin
	if( clk21m'event and clk21m = '1' )then
		if (w_10hz = '1') then	-- chattering protect
			iDipLed <= pDip;	-- latch
			if (RstEna = '0') then
				rDipLed <= pDip;
			end if;
		end if;
	end if;
end process;

-- 10HZ GENERATOR (FOR KEY LATCH TIMING AND RTC BASE)
PROCESS( RESET, CLK21M )
BEGIN
	IF( RESET = '1' )THEN
		FF_CLK21M_CNT <= (OTHERS => '0');
	ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
		IF( w_10Hz = '1' )THEN
			FF_CLK21M_CNT <= "1000001011001010001001";	-- 21.428571 MHZ / 10HZ = 2142857
		ELSE
			FF_CLK21M_CNT <= FF_CLK21M_CNT - 1;
		END IF;
	END IF;
END PROCESS;

w_10Hz	<=  '1' WHEN( FF_CLK21M_CNT = "0000000000000000000000" )ELSE
			'0';
-- ===============================================================
KeyMode   <= '1';     -- Kana key board layout  : 1=JIS layout
----------------------------------------------------------------
-- MSX cartridge slot control
----------------------------------------------------------------
pSltCs1_n   <=	pSltRd_n when( pSltAdr(15 downto 14) = "01" and pSltMerq_n = '0' )else '1';
pSltCs2_n   <=	pSltRd_n when( pSltAdr(15 downto 14) = "10" and pSltMerq_n = '0' )else '1';
pSltCs12_n  <=  pSltCs1_n and pSltCs2_n; 
pSltM1_n    <=	CpuM1_n;
pSltRfsh_n  <=	CpuRfsh_n;
pSltInt_n   <=	pVdpInt_n;
pSltSltsl_n <=	'1' when (Scc1Type /= "00" or MRAMmode = '1') else
				'0' when ( pSltMerq_n = '0' and CpuRfsh_n = '1' and PriSltNum = "01")else
				'1';
pSltSlts2_n <=	'1' when MegType /= "00" else
				'0' when (pSltMerq_n = '0' and CpuRfsh_n = '1' and PriSltNum = "10") else
				'1';
pSltBdir_n  <=	'1';
pSltDat     <= (others => 'Z') when pSltRd_n = '1' else
				dbi when( pSltIorq_n = '0' and BusDir    = '1' )else
				dbi when( pSltMerq_n = '0' and PriSltNum = "00" )else
				dbi when( pSltMerq_n = '0' and PriSltNum = "11" )else
				dbi when( pSltMerq_n = '0' and PriSltNum = "01" and (Scc1Type /= "00" or MRAMmode = '1'))else
				dbi when( pSltMerq_n = '0' and PriSltNum = "10" and MegType  /= "00" )else
				(others => 'Z');
pSltRsv5    <= '1';
pSltRsv16   <= '1';
pSltSw1     <= '1';
pSltSw2     <= '1';
----------------------------------------------------------------
-- Z80 CPU wait control
----------------------------------------------------------------
process(pCpuClk, reset)
	variable iCpuM1_n	: std_logic;
	variable jSltMerq_n	: std_logic;
	variable jSltIorq_n	: std_logic;
	variable count		: std_logic_vector(1 downto 0);
begin
	if (reset = '1') then
		iCpuM1_n	:= '1';
		jSltIorq_n	:= '1';
		jSltMerq_n	:= '1';
		count		:= (others => '0');
		pSltWait_n	<= '1';
	elsif (pCpuClk'event and pCpuClk = '1') then
		if (pSltMerq_n = '0' and jSltMerq_n = '1') then
			if( ff_turbo = '1' )then	-- TURBO
				count := "10";
			end if;
		elsif (pSltIorq_n = '0' and jSltIorq_n = '1') then
			if( ff_turbo = '1' )then	-- TURBO
				count := "10";
			end if;
		elsif (count /= "00") then
			count := count - 1;
		end if;

		if (CpuM1_n = '0' and iCpuM1_n = '1' and ff_turbo = '0') then
			pSltWait_n <= '0';
		elsif (count /= "00") then
			pSltWait_n <= '0';
		elsif (ff_turbo = '1' and OpllReq = '1' and OpllAck = '0') then
			pSltWait_n <= '0';

-- AMR: Some weirdness here - this line appears to be designed to delay the CPU until the
-- SPI transaction is finished, however, because ErmReq is simply a filtered version of the
-- req pulse, it does essentially nothing.  Fixing it by changing "and" to "or" works, and
-- allows the SPI clock to be reduced to accommodate the MUX in the Turbo Chameleon 64, but
-- breaks writing; either I'm misunderstanding something here or the previous buggy behaviour
-- is worked around in the MegaSD ROM.
--		elsif (ErmReq = '1' and (adr(15 downto 13) = "010" and MmcAct = '1')) then
		elsif (ErmReq = '1' or (adr(15 downto 13) = "010" and MmcAct = '1')) then
--		elsif ((ErmReq = '1' or temp_boot='1') and (adr(15 downto 13) = "010" and MmcAct = '1')) then  -- ErmReq is not a constant signal
			pSltWait_n <= '0';
		elsif (SdPaus = '1') then
			pSltWait_n <= '0';
		else
			pSltWait_n <= '1';
		end if;
		iCpuM1_n 	:= CpuM1_n;
		jSltIorq_n	:= pSltIorq_n;
		jSltMerq_n	:= pSltMerq_n;
	end if;
end process;
----------------------------------------------------------------
-- On chip internal bus control
----------------------------------------------------------------
process(clk21m, reset)
    variable ExpDec : std_logic;
begin
    if (reset = '1') then
      iSltSltsl_n <= '1';
      iSltRfsh_n  <= '1';
      iSltMerq_n  <= '1';
      iSltIorq_n  <= '1';
      xSltRd_n    <= '1';
      xSltWr_n    <= '1';
      iSltAdr     <= (others => '1');
      iSltDat     <= (others => '1');
      iack        <= '0';
      dlydbi      <= (others => '1');
      ExpDec      := '0';
    elsif (clk21m'event and clk21m = '1') then
-- MSX slot signals
      iSltRfsh_n  <= pSltRfsh_n;
      iSltMerq_n  <= pSltMerq_n;
      iSltIorq_n  <= pSltIorq_n;
      xSltRd_n    <= pSltRd_n;
      xSltWr_n    <= pSltWr_n;
      iSltAdr     <= pSltAdr;
      iSltDat     <= pSltDat;

      if (iSltSltsl_n = '1' and iSltMerq_n  = '1' and iSltIorq_n = '1') then
        iack <= '0';
      elsif (ack = '1') then
        iack <= '1';
      end if;

      if (mem = '1' and ExpDec = '1') then
        dlydbi <= ExpDbi;
      elsif (mem = '1' and iSltBot = '1') then
        dlydbi <= RomDbi;
      elsif (mem = '1' and iSltErm = '1' and MmcEna = '1') then
        dlydbi <= MmcDbi;
--      elsif (mem = '0' and adr(7 downto 2)  = "100010") then
--        dlydbi <= VdpDbi;
      elsif (mem = '0' and adr(7 downto 2)  = "100110") then
        dlydbi <= VdpDbi;
      elsif (mem = '0' and adr(7 downto 2)  = "101000") then
        dlydbi <= PsgDbi;
      elsif (mem = '0' and adr(7 downto 2)  = "101010") then
        dlydbi <= PpiDbi;
      elsif (mem = '0' and adr(7 downto 2)  = "111111") then
        dlydbi <= MapDbi;
      elsif (mem = '0' and adr(7 downto 1)  = "1011010") then
        dlydbi <= RtcDbi;
      elsif (mem = '0' and adr(7 downto 2)  = "110110") then     -- I/O:D8-DBh / Kanji
        dlydbi <= KanDbi;
      elsif (mem = '0' and adr(7 downto 1)  = "1110011") then
		dlydbi <= systim_dbi;
      elsif (mem = '0' and adr(7 downto 0)  = "11110100") then	-- port F4
		dlydbi <= portF4_bit7 & "1111111";
      else
        dlydbi <= (others => '1');
      end if;
      if (adr = X"FFFF") then
        ExpDec := '1';
      else
        ExpDec := '0';
      end if;
    end if;
  end process;
----------------------------------------------------------------
process(clk21m, reset)
begin
    if (reset = '1') then
      jSltScc1  <= '0';
      jMEGA_RAM <= '0';
      jSltScc2  <= '0';
      jSltMem   <= '0';
      wrt <= '0';
    elsif (clk21m'event and clk21m = '0') then
      jSltScc1 <= iSltScc1;
      jMEGA_RAM <= iMEGA_RAM;
      jSltScc2 <= iSltScc2;
      if (iSltErm = '1') then
        if (MmcEna = '1' and adr(15 downto 13) = "010") then
          jSltMem <= '0';
        elsif (MmcMode = '0') then
          jSltMem <= '1';      -- enable SD/MMC drive
        elsif (ff_ldbios = '1') then
          jSltMem <= '1';      -- enable SD/MMC drive
        else
          jSltMem <= '0';      -- disable SD/MMC drive
        end if;
      elsif (iSltMap = '1' or rom_main = '1' or rom_opll = '1' or rom_extr = '1'
				or rom_free1 = '1' or rom_free2 = '1') then
          jSltMem <= '1';
      else
          jSltMem <= '0';
      end if;
      if (req = '0') then
		   wrt <= not pSltWr_n;   -- 1=write, 0=read
      end if;
    end if;
end process;
---------------------------------------------------------------
-- access request, CPU > Components
req <= '1' when (((iSltMerq_n = '0') or (iSltIorq_n = '0')) and
		((xSltRd_n = '0') or (xSltWr_n = '0')) and iack = '0') else '0';
mem <= iSltIorq_n; -- 1=memory area, 0=i/o area
dbo <= iSltDat;    -- CPU data (CPU > device)
adr <= iSltAdr;    -- CPU address (CPU > device)
-- access acknowledge, Components > CPU
ack     <= RamAck  when                 RamReq = '1' else     -- ErmAck, MapAck, KanAck;
           Scc1Ack when mem = '1' and iSltScc1 = '1' else     -- Scc1Ack
           Scc2Ack when mem = '1' and iSltScc2 = '1' else     -- Scc2Ack
           OpllAck when                OpllReq = '1' else     -- OpllAck
           req;                                               -- PsgAck, PpiAck, MapAck, VdpAck, RtcAck
dbi     <= Scc1Dbi when (jSltScc1 = '1') else
           MRAMDbi when (jMEGA_RAM = '1') else
           Scc2Dbi when (jSltScc2 = '1') else
           RamDbi  when (jSltMem  = '1') else
           dlydbi;
----------------------------------------------------------------
-- port F4
----------------------------------------------------------------
process(clk21m, reset)
begin
   if (reset = '1') then
      portF4_bit7 <= '1';					-- view LOGO MSX
   elsif (clk21m'event and clk21m = '1')then
           if (portF4_req = '1' and wrt = '1')then
                portF4_bit7 <= dbo(7);
           end if;
   end if;
end process;
----------------------------------------------------------------
-- PPI(8255) / primary-slot, keyboard, 1 bit sound port
----------------------------------------------------------------
process(clk21m, reset)
begin
   if (reset = '1') then
      PpiPortA <= "11111111"; -- primary slot : page 0 => boot-rom, page 1/2 => ese-mmc, page 3 => mapper
      ff_ldbios <= '1';		 -- load BIOS
--    PpiPortB <= (others => '1');
      PpiPortC <= (others => '0');
   elsif (clk21m'event and clk21m = '1') then
-- I/O port access on A8-ABh ... PPI(8255) access
      if (PpiReq = '1') then
        if (wrt = '1' and adr(1 downto 0) = "00") then
          PpiPortA <= dbo;
          ff_ldbios <= '0';		-- end load BIOS
        elsif (wrt = '1' and adr(1 downto 0) = "10") then
          PpiPortC <= dbo;
        elsif (wrt = '1' and adr(1 downto 0) = "11" and dbo(7) = '0') then
          case dbo(3 downto 1) is
            when "000"  => PpiPortC(0) <= dbo(0); -- key_matrix Y(0)
            when "001"  => PpiPortC(1) <= dbo(0); -- key_matrix Y(1)
            when "010"  => PpiPortC(2) <= dbo(0); -- key_matrix Y(2)
            when "011"  => PpiPortC(3) <= dbo(0); -- key_matrix Y(3)
            when "100"  => PpiPortC(4) <= dbo(0); -- cassete motor on (0=ON,1=OFF)
            when "101"  => PpiPortC(5) <= dbo(0); -- cassete audio out
            when "110"  => PpiPortC(6) <= dbo(0); -- CAPS lamp (0=ON,1=OFF)
            when others => PpiPortC(7) <= dbo(0); -- 1 bit sound port
          end case;
        end if;
      end if;
--      PpiAck <= PpiReq;
   end if;
end process;
---------------------------------------------------------
Caps <= PpiPortC(6);
-- I/O port access on A8-ABh ... PPI(8255) register read
PpiDbi <= PpiPortA when adr(1 downto 0) = "00" else
          PpiPortB when adr(1 downto 0) = "01" else
          PpiPortC when adr(1 downto 0) = "10" else
          (others => '1');
----------------------------------------------------------------
-- EXPANSION SLOT
----------------------------------------------------------------
-- SLOT #0
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			EXPSLOT0 <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			-- MEMORY MAPPED I/O PORT ACCESS ON FFFFH ... EXPANSION SLOT REGISTER (MASTER MODE)
			IF( REQ = '1' AND ISLTMERQ_N = '0' AND WRT = '1' AND ADR = X"FFFF" )THEN
				IF( PPIPORTA(7 DOWNTO 6) = "00" )THEN
					EXPSLOT0 <= DBO;
				END IF;
			END IF;
		END IF;
	END PROCESS;

-- SLOT #3
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			EXPSLOT3 <= "00101011";			 -- PRIMARY SLOT : PAGE 0 => IPLROM, PAGE 1/2 => MEGASD, PAGE 3 => MAPPER
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			-- MEMORY MAPPED I/O PORT ACCESS ON FFFFH ... EXPANSION SLOT REGISTER (MASTER MODE)
			IF( REQ = '1' AND ISLTMERQ_N = '0' AND WRT = '1' AND ADR = X"FFFF" )THEN
				IF( PPIPORTA(7 DOWNTO 6) = "11" )THEN
					EXPSLOT3 <= DBO;
				END IF;
			END IF;
		END IF;
	END PROCESS;

-- PRIMARY SLOT NUMBER (MASTER MODE)
	WITH ADR(15 DOWNTO 14) SELECT PRISLTNUM	<=
		PPIPORTA(1 DOWNTO 0) WHEN "00",
		PPIPORTA(3 DOWNTO 2) WHEN "01",
		PPIPORTA(5 DOWNTO 4) WHEN "10",
		PPIPORTA(7 DOWNTO 6) WHEN OTHERS;

-- EXPANSION SLOT NUMBER : SLOT 0 (MASTER MODE)
	WITH ADR(15 DOWNTO 14) SELECT EXPSLTNUM0 <=
		EXPSLOT0(1 DOWNTO 0) WHEN "00",
		EXPSLOT0(3 DOWNTO 2) WHEN "01",
		EXPSLOT0(5 DOWNTO 4) WHEN "10",
		EXPSLOT0(7 DOWNTO 6) WHEN OTHERS;

-- EXPANSION SLOT NUMBER : SLOT 3 (MASTER MODE)
	WITH ADR(15 DOWNTO 14) SELECT EXPSLTNUM3 <=
		EXPSLOT3(1 DOWNTO 0) WHEN "00",
		EXPSLOT3(3 DOWNTO 2) WHEN "01",
		EXPSLOT3(5 DOWNTO 4) WHEN "10",
		EXPSLOT3(7 DOWNTO 6) WHEN OTHERS;

-- EXPANSION SLOT REGISTER READ
	WITH PPIPORTA(7 DOWNTO 6) SELECT EXPDBI <=
		NOT EXPSLOT0		 WHEN "00",
		NOT EXPSLOT3		 WHEN "11",
		(OTHERS => '1')		 WHEN OTHERS;
----------------------------------------------------------------
--	SLOT/PAGE DECODE
----------------------------------------------------------------
	WITH( ADR(15 DOWNTO 14) ) SELECT W_PAGE_DEC <=
		"0001"		WHEN "00",
		"0010"		WHEN "01",
		"0100"		WHEN "10",
		"1000"		WHEN "11",
		"XXXX"		WHEN OTHERS;

	WITH( PRISLTNUM ) SELECT W_PRISLT_DEC <=
		"0001"		WHEN "00",
		"0010"		WHEN "01",
		"0100"		WHEN "10",
		"1000"		WHEN "11",
		"XXXX"		WHEN OTHERS;

	WITH( EXPSLTNUM0 ) SELECT W_EXPSLT0_DEC <=
		"0001"		WHEN "00",
		"0010"		WHEN "01",
		"0100"		WHEN "10",
		"1000"		WHEN "11",
		"XXXX"		WHEN OTHERS;

	WITH( EXPSLTNUM3 ) SELECT W_EXPSLT3_DEC <=
		"0001"		WHEN "00",
		"0010"		WHEN "01",
		"0100"		WHEN "10",
		"1000"		WHEN "11",
		"XXXX"		WHEN OTHERS;
----------------------------------------------------------------
--	ADDRESS DECODE FOR CPU
----------------------------------------------------------------
-- SLOT0-X
ROM_MAIN	<=	MEM	WHEN( (W_PRISLT_DEC(0) AND W_EXPSLT0_DEC(0) AND (W_PAGE_DEC(0) OR W_PAGE_DEC(1))) = '1' )ELSE
				'0';
ROM_FREE1	<=	MEM	WHEN( (W_PRISLT_DEC(0) AND W_EXPSLT0_DEC(1)                ) = '1' AND ADR /= X"FFFF"   )ELSE
				'0';
ROM_OPLL	<=	MEM	WHEN( (W_PRISLT_DEC(0) AND W_EXPSLT0_DEC(2) AND  W_PAGE_DEC(1)                  ) = '1' )ELSE
				'0';
ROM_FREE2	<=	MEM	WHEN( (W_PRISLT_DEC(0) AND W_EXPSLT0_DEC(3)                ) = '1' AND ADR /= X"FFFF"   )ELSE
				'0';
-- SLOT1
ISLTSCC1	<=	MEM	WHEN( (W_PRISLT_DEC(1) AND (W_PAGE_DEC(1) OR W_PAGE_DEC(2))) = '1' AND SCC1TYPE /= "00" AND MRAMmode = '0')ELSE
				'0';
IMEGA_RAM	<=	MEM	WHEN( (W_PRISLT_DEC(1) AND (W_PAGE_DEC(1) OR W_PAGE_DEC(2))) = '1' AND MRAMmode = '1' )ELSE
				'0';
-- SLOT2
ISLTSCC2	<=	MEM	WHEN( (W_PRISLT_DEC(2) AND (W_PAGE_DEC(1) OR W_PAGE_DEC(2))) = '1' AND MEGTYPE  /= "00" )ELSE
				'0';
-- SLOT3-X
ISLTMAP		<=	MEM	WHEN( (W_PRISLT_DEC(3) AND W_EXPSLT3_DEC(0)                ) = '1' AND ADR /= X"FFFF"   )ELSE
				'0';
ROM_EXTR	<=	MEM	WHEN( (W_PRISLT_DEC(3) AND W_EXPSLT3_DEC(1) AND  W_PAGE_DEC(0)                  ) = '1' )ELSE
				'0';
ISLTERM		<=	MEM	WHEN( (W_PRISLT_DEC(3) AND W_EXPSLT3_DEC(2) AND (W_PAGE_DEC(1) OR W_PAGE_DEC(2))) = '1' )ELSE
				'0';
ISLTBOT		<=	MEM	WHEN( (W_PRISLT_DEC(3) AND W_EXPSLT3_DEC(3) AND (W_PAGE_DEC(0) OR W_PAGE_DEC(3))) = '1' )ELSE
				'0';
-- I/O
ROM_KANJ	<=	(NOT MEM) WHEN( ADR(7 DOWNTO 2) = "110110" )ELSE
				'0';

-- RamX / RamY access request
RamReq	<= Scc1Ram or Scc2Ram or ErmRam or MapRam or RomReq or KanRom or MRAMRam;

-- access request to component
VdpReq	<= req when( mem = '0' and adr(7 downto 2) = "100110")else '0';	-- I/O:98-9Bh	/ VDP(V9958)
PsgReq	<= req when( mem = '0' and adr(7 downto 2) = "101000")else '0';	-- I/O:A0-A3h	/ PSG(AY-3-8910)
PpiReq	<= req when( mem = '0' and adr(7 downto 2) = "101010")else '0';	-- I/O:A8-ABh	/ PPI(8255)
OpllReq	<= req when( mem = '0' and adr(7 downto 2) = "011111")else '0';	-- I/O:7C-7Fh	/ OPLL(YM2413)
KanReq	<= req when( mem = '0' and adr(7 downto 2) = "110110")else '0';	-- I/O:D8-DBh	/ Kanji
RomReq	<= req when( (rom_main or rom_opll or rom_extr or rom_free1 or rom_free2) = '1')else '0';

MapReq	<= req when( mem = '0' and adr(7 downto 2) = "111111")else	        -- I/O:FC-FFh/ Memory-mapper
           req when( iSltMap = '1') else '0';				                -- MEM/ Memory-mapper

MRAMReq <= req when( mem = '0' and adr(7 downto 0) = "10001110")else	    -- I/O:8Eh/ Mega RAM
           req when( iMEGA_RAM = '1') else '0';				                -- MEM/ Mega RAM

Scc1Req	<= req when( iSltScc1 = '1')else '0';                               -- MEM:/ ESE-SCC 1
Scc2Req	<= req when( iSltScc2 = '1')else '0';                               -- MEM:/ ESE-SCC 2
ErmReq	<= req when( iSltErm  = '1')else '0';                               -- MEM:/ ESE-RAM, MegaSD
RtcReq	<= req when( mem = '0' and adr(7 downto 1) = "1011010")else '0';    -- I/O:B4-B5h/ RTC(RP-5C01)
systim_req <= req when( mem = '0' and adr(7 downto 1) = "1110011")else '0'; -- I/O:E6-E7h/ system timer
portF4_req <= req when( mem = '0' and adr(7 downto 0) = "11110100")else '0'; -- I/O:F4h  port F4
-- uart_req <= req when( mem = '0' and adr(7 downto 3) = "10000")else '0';      -- I/O:80-87h UART

BusDir	<= '1' when( pSltAdr(7 downto 2) = "100110"  )else -- I/O:98-9Bh / VDP(V9958)
           '1' when( pSltAdr(7 downto 2) = "101000"  )else -- I/O:A0-A3h / PSG(AY-3-8910)
           '1' when( pSltAdr(7 downto 2) = "101010"  )else -- I/O:A8-ABh / PPI(8255)
           '1' when( pSltAdr(7 downto 2) = "110110"  )else -- I/O:D8-DBh / Kanji
           '1' when( pSltAdr(7 downto 2) = "111111"  )else -- I/O:FC-FFh / Memory-mapper
           '1' when( pSltAdr(7 downto 1) = "1011010" )else -- I/O:B4-B5h / RTC(RP-5C01)
           '1' when( pSltAdr(7 downto 1) = "1110011" )else -- I/O:E6-E7h / system timer
           '1' when( pSltAdr(7 downto 0) = "11110100" )else-- I/O:F4h    / port F4
--           '1' when( pSltAdr(7 downto 3) = "10000" )else   -- I/O:80-87h / UART
           '0';

  pLedR(9) <= MemMode;
  pLedR(8) <= MRAMmode;
  pLedR(7) <= ff_turbo;
  pLedR(6) <= Kmap;
  pLedR(5) <= MegType(1);
  pLedR(4) <= MegType(0);
  pLedR(3) <= Slt1Mode;
  pLedR(2) <= MmcMode;
  pLedR(1) <= DispSel(1);
  pLedR(0) <= DispSel(0);

  pLedG <= CmtIn & Sound_level(7 downto 1);

   ----------------------------------------------------------------
  -- Select Video output
  ----------------------------------------------------------------
  process ( clk21m,lock_n )
    variable iReso		: std_logic;
  begin
    if (clk21m'event and clk21m = '1') then
--      if ( DispSel = "11" ) then	-- TV 15KHz
--          pDac_VR <= videoC;
--          pDac_VG <= videoY;
--          pDac_VB <= videoV;
--          pVideoHS_n <= VideoCS_n;
--          pVideoVS_n <= DACout;
--          Reso_v  <= '0';			-- Hsync:15kHz
--          PAL_v   <= '0';			-- Vsync:60Hz
--      elsif ( DispSel = "10" ) then	-- RGB 15KHz
--          pDac_VR <= videoR;
--          pDac_VG <= videoG;
--          pDac_VB <= videoB;
--          pVideoHS_n <= VideoCS_n;	-- Synhro
--          pVideoVS_n <= DACout;		-- sound
--          Reso_v  <= '0';			-- Hsync:15kHz
--          PAL_v   <= '0';			-- Vsync:60Hz
      if ( DispSel = "11" ) then	-- TV - 576i RGB
          pDac_VR <= videoR;
          pDac_VG <= videoG;
          pDac_VB <= videoB;
          pVideoHS_n <= VideoCS_n;
          pVideoVS_n <= '1';
          Reso_v  <= '0';			-- Hsync:15kHz
          PAL_v   <= '1';			-- Vsync:60Hz
      elsif ( DispSel = "10" ) then	-- TG - 480i RGB
          pDac_VR <= videoR;
          pDac_VG <= videoG;
          pDac_VB <= videoB;
          pVideoHS_n <= VideoCS_n;	-- Synhro
          pVideoVS_n <= '1';
          Reso_v  <= '0';			-- Hsync:15kHz
          PAL_v   <= '0';			-- Vsync:60Hz
      elsif ( DispSel = "01" ) then	-- VGA 31KHz/50Hz
          pDac_VR <= videoR;
          pDac_VG <= videoG;
          pDac_VB <= videoB;
          pVideoHS_n <= VideoHS_n;
          pVideoVS_n <= VideoVS_n;
          Reso_v  <= '1';			-- Hsync:31kHz
          PAL_v   <= '1';			-- Vsync:50Hz
      else			  				-- VGA 31kHz/60Hz
          pDac_VR <= VideoR;
          pDac_VG <= VideoG;
          pDac_VB <= VideoB;
          pVideoHS_n <= VideoHS_n;
          pVideoVS_n <= VideoVS_n;
          Reso_v  <= '1';			-- Hsync:31kHz
          PAL_v   <= '0';			-- Vsync:60Hz
		end if;
		pVideoVS_OSD_n <= VideoVS_n; -- Make sure VSync is available even for TV modes.
		pVideoHS_OSD_n <= VideoHS_n; -- OSD struggled with CSync - so make vanilla HSync available

--      if ( lock_n = '0' ) then
--          DispSel <= DispMode;
--		  iReso := Reso;
--      elsif (iReso /= Reso) then	-- Print Screen
-- 			 DispSel <= DispSel + 1;
--		  iReso := Reso;
--      end if;
      DispSel <= DispMode;
    end if;
end process;

----------------------------------------------------------------
-- Sound output
----------------------------------------------------------------
-- master volume
--	process( clk21m,lock_n )
--	begin
--		if( clk21m'event and clk21m = '1' )then
--			if( lock_n = '0' )then
--				MstrVol <= "000";			-- Maximum
--			elsif( Fkeys(5) /= vFkeys(5) )then -- PgUp Master Volume Up
--				if( MstrVol /= "000" )then
--					MstrVol <= MstrVol - '1';
--				end if;
--			elsif( Fkeys(4) /= vFkeys(4) )then -- PgDn Master Volume Down
--				if( MstrVol /= "111" )then
--					MstrVol <= MstrVol + '1';
--				end if;
--			end if;
--		end if;
--	end process;

--	-- PSG volume
--	process( clk21m,lock_n )
--	begin
--		if( clk21m'event and clk21m = '1' )then
--			if( lock_n = '0' )then
--				PsgVol <= "111";	-- original "011";
--			elsif( Fkeys(3) /= vFKeys(3) )then	-- F9
--				if( Fkeys(7) = '1' )then		-- SHIFT
--					if( PsgVol /= "000" )then	-- F9+SHIFT
--						PsgVol <= PsgVol - '1';
--					end if;
--				else
--					if( PsgVol /= "111" )then	-- F9
--						PsgVol <= PsgVol + '1';
--					end if;
--				end if;
--			end if;
--		end if;
--	end process;

--	-- SCC volume
--	process( clk21m,lock_n )
--	begin
--		if( clk21m'event and clk21m = '1' )then
--			if( lock_n = '0' )then
--				SccVol <= "111";	-- orignal "110";
--			elsif( Fkeys(2) /= vFKeys(2) )then	-- F10
--				if( Fkeys(7) = '1' )then		-- SHIFT
--					if( SccVol /= "000" )then	-- F10+SHIFT
--						SccVol <= SccVol - '1';
--					end if;
--				else
--					if( SccVol /= "111" )then	-- F10
--						SccVol <= SccVol + '1';
--					end if;
--				end if;
--			end if;
--		end if;
--	end process;

--	-- OPLL volume
--	process( clk21m,lock_n )
--	begin
--		if( clk21m'event and clk21m = '1' )then
--			if( lock_n = '0' )then
--				OpllVol <= "111";	-- original "110";
--			elsif( Fkeys(1) /= vFKeys(1) )then	-- F11
--				if( Fkeys(7) = '1' )then		-- SHIFT
--					if( OpllVol /= "000" )then	-- F11+SHIFT
--						OpllVol <= OpllVol - '1';
--					end if;
--				else
--					if( OpllVol /= "111" )then	-- F11
--						OpllVol <= OpllVol + '1';
--					end if;
--				end if;
--			end if;			 
--		end if;
--	end process;

	process( clk21m )
	begin
		if( clk21m'event and clk21m = '1' )then
			vFkeys <= Fkeys;
		end if;
	end process;

	-- mixer (pipe lined)
	u_mul: scc_mix_mul
	port map (
		a	=> ff_prescc,	-- 16bit 
		b	=> SccVol,		-- 3bit 
		c	=> w_scc		-- 19bit 
	);

	w_s <= (others => w_scc(18));
	with MstrVol select w_scc_sft <=
		                      w_scc( 18 downto  3 )	when "000",
		w_s( 15 )           & w_scc( 18 downto  4 )	when "001",
		w_s( 15 downto 14 ) & w_scc( 18 downto  5 )	when "010",
		w_s( 15 downto 13 ) & w_scc( 18 downto  6 )	when "011",
		w_s( 15 downto 12 ) & w_scc( 18 downto  7 )	when "100",
		w_s( 15 downto 11 ) & w_scc( 18 downto  8 )	when "101",
		w_s( 15 downto 10 ) & w_scc( 18 downto  9 )	when "110",
		w_s( 15 downto  9 ) & w_scc( 18 downto 10 )	when "111",
		(others => 'X') when others;

	process( clk21m )
		variable chAmp : std_logic_vector( ff_pre_dacin'range );
	begin
		if( clk21m'event and clk21m = '1' )then
			ff_prepsg <= (PsgAmp + (KeyClick & "000000"));
			ff_prescc <= ((Scc1AmpL(14) & Scc1AmpL) + (Scc2AmpL(14) & Scc2AmpL));

			ff_psg <= "00" & SHR((ff_prepsg * PsgVol) &  "0", MstrVol);
			ff_scc <= w_scc_sft;

			if( OpllAmp < c_opll_zero )then
				chAmp := SHR( ((c_opll_zero - OpllAmp) * OpllVol) & "000", MstrVol );
				ff_opll <= c_amp_offset - ( chAmp - chAmp( chAmp'high downto 3 ) );
			else
				chAmp := SHR( ((OpllAmp - c_opll_zero) * OpllVol) & "000", MstrVol );
				ff_opll <= c_amp_offset + ( chAmp - chAmp( chAmp'high downto 3 ) );
			end if;
		end if;
	end process;

	process( clk21m )
	begin
		if( clk21m'event and clk21m = '1' )then
			ff_pre_dacin	<=	((ff_psg + ff_scc) + ff_opll);
				-- Limitter
			case ff_pre_dacin( ff_pre_dacin'high downto ff_pre_dacin'high - 2 ) is
				when "111" => DACin	<= (others=>'1');
				when "110" => DACin	<= (others=>'1');
				when "101" => DACin	<= (others=>'1');
				when "100" => DACin	<= "1" & ff_pre_dacin( ff_pre_dacin'high - 3 downto 0 );
				when "011" => DACin	<= "0" & ff_pre_dacin( ff_pre_dacin'high - 3 downto 0 );
				when "010" => DACin	<= (others=>'0');
				when "001" => DACin	<= (others=>'0');
				when "000" => DACin	<= (others=>'0');
			end case;
            -- Indicator Sound
            if ( DACin(DACin'high) = '0' ) then
                Sound_level <= DACin(DACin'high-1 downto DACin'high-9);
            else
                Sound_level <= "00000000" - DACin(DACin'high-1 downto DACin'high-9);
            end if;
		end if;
	end process;
    pDac_S <= DACout;
    -- Left chanel
	process( clk21m )
	begin
		if( clk21m'event and clk21m = '1' )then
			DACin_L	<=	"1000000000000" + ff_psg(ff_psg'high - 2 downto 0);
		end if;
	end process;
	-- Right chanel
	process( clk21m )
	begin
		if( clk21m'event and clk21m = '1' )then
			ff_pre_dacin_R	<=	(ff_scc + ff_opll);
				-- Limitter
			case ff_pre_dacin_R( ff_pre_dacin_R'high downto ff_pre_dacin_R'high - 2 ) is
				when "111" => DACin_R	<= (others=>'1');
				when "110" => DACin_R	<= (others=>'1');
				when "101" => DACin_R	<= (others=>'1');
				when "100" => DACin_R	<= "1" & ff_pre_dacin_R( ff_pre_dacin_R'high - 3 downto 0 );
				when "011" => DACin_R	<= "0" & ff_pre_dacin_R( ff_pre_dacin_R'high - 3 downto 0 );
				when "010" => DACin_R	<= (others=>'0');
				when "001" => DACin_R	<= (others=>'0');
				when "000" => DACin_R	<= (others=>'0');
			end case;
		end if;
	end process;
    Sound_L <= "1" & lpf18_wave_L(lpf18_wave_L'high downto 0) & "0";
    Sound_R <= "1" & lpf18_wave_R(lpf18_wave_R'high downto 0) & "0";
  ----------------------------------------------------------------
  -- Cassette Magnetic Tape (CMT) interface
  ----------------------------------------------------------------
    pREM_out <= REMOut;
    pCMT_out <= CmtOut;
--    CmtIn <= pCMT_in;
  ----------------------------------------------------------------
  -- External memory access
  ----------------------------------------------------------------
  -- Slot map / SD-RAM memory map
  --
  -- Slot 0-0 : MainROM         610000-617FFF(  32KB)
  -- Slot 0-1 : rom_free1       640000-64FFFF(  64KB) MegaSD(iSltErm)
  -- Slot 0-2 : FM-BIOS         61C000-61FFFF(  16KB)
  -- Slot 0-3 : rom_free2       650000-65FFFF(  64KB) MegaSD(iSltErm)

  -- Slot 1   : (EXTERNAL-SLOT)
  --            / MegaRam1      400000-4FFFFF(1024KB)
  -- Slot 2   : (EXTERNAL-SLOT)
  --            / MegaRam2      500000-5FFFFF(1024KB)

  -- Slot 3-0 : Mapper          000000-3FFFFF(4096KB)
  -- Slot 3-1 : ExtROM          618000-61BFFF(  16KB)
  -- Slot 3-2 : MegaSD          600000-60FFFF(  64KB)
  --            EseRAM          600000-63FFFF(BIOS:256KB)
  -- Slot 1   : Mega RAM        680000-6FFFFF( 512KB)
  -- Slot 3-3 : IPL-ROM         (blockRAM:512Bytes)

  -- VRAM     : VRAM            700000-71FFFF( 128KB)

-- CpuAdr(22 downto 20) <= "00" & MapAdr(20)            when iSltMap  = '1' else -- 0xxxxx -> 2048 KB
-- CpuAdr(22 downto 20) <= "0"  & MapAdr(21 downto 20)  when iSltMap  = '1' else -- 0xxxxx -> 4096 KB MainRAM
   CpuAdr(22 downto 20) <= "0"  & (MapAdr(21) and MemMode) & MapAdr(20)  when iSltMap  = '1' else -- 0xxxxx -> 4096 KB MainRAM
                           "100"                        when iSltScc1 = '1' else -- 4xxxxx -> 1024 KB MegaRAM1
                           "101"                        when iSltScc2 = '1' else -- 5xxxxx -> 1024 KB MegaRAM2
                           "110";                                                -- 6xxxxx -> 1024 KB ESE-RAM + MEGA RAM
--                         "111"                                                 -- 7xxxxx -> 1024 KB Video RAM
   CpuAdr(19 downto 0)  <=    MapAdr (19 downto 0) when iSltMap   = '1' else -- 000000-3FFFFF (4096KB)
                              Scc1Adr(19 downto 0) when iSltScc1  = '1' else -- 400000-4FFFFF (1024KB)
                              Scc2Adr(19 downto 0) when iSltScc2  = '1' else -- 500000-5FFFFF (1024KB)
                   "1"      & MRAMAdr(18 downto 0) when iMEGA_RAM = '1' else -- 680000-6FFFFF (512 KB) MEGA RAM
                   "0"      & ErmAdr(18 downto 0)  when iSltErm   = '1' else -- 600000-67FFFF (512KB) ESE-RAM
                   "001"    & KanAdr(16 downto 0)  when rom_kanj  = '1' else -- 620000-63FFFF (128KB) KANJI ROM
                   "0100"   & adr(15 downto 0 )    when rom_free1 = '1' else -- 640000-64FFFF (64 KB)
                   "0101"   & adr(15 downto 0 )    when rom_free2 = '1' else -- 650000-65FFFF (64 KB)
                   "00010"  & adr(14 downto 0)     when rom_main  = '1' else -- 610000-617FFF (32 KB)
                   "000110" & adr(13 downto 0)     when rom_extr  = '1' else -- 618000-61BFFF (16 KB)
                   "000111" & adr(13 downto 0); --  when rom_opll  = '1' else -- 61C000-61FFFF (16 KB)
----------------------------------------------------------------
-- SD-RAM access
----------------------------------------------------------------
--	 SdrSta = "000" => idle
--	 SdrSta = "001" => precharge all
--	 SdrSta = "010" => refresh
--	 SdrSta = "011" => mode register set
--	 SdrSta = "100" => read cpu
--	 SdrSta = "101" => write cpu
--	 SdrSta = "110" => read vdp
--	 SdrSta = "111" => write vdp
----------------------------------------------------------------
w_wrt_req <=(RamReq  and (
			(Scc1Wrt and iSltScc1) or
			(Scc2Wrt and iSltScc2) or
			(ErmWrt  and iSltErm ) or
			(MapWrt  and iSltMap ) or
			(MRAMWrt and iMEGA_RAM )));
----------------------------------------------------------------
process( memclk )
begin
	if( memclk'event and memclk = '1' )then
		if( ff_sdr_seq = "111" )then
			if( RstSeq(4 downto 2) = "000" )then
				SdrSta <= "000";					-- Idle
			elsif( RstSeq(4 downto 2) = "001" )then
				case RstSeq(1 downto 0) is
					when "00"	=> SdrSta <= "000";	-- Idle
					when "01"	=> SdrSta <= "001";	-- precharge all
					when "10"	=> SdrSta <= "010";	-- refresh (more than 8 cycles)
					when others	=> SdrSta <= "011";	-- mode register set
				end case;
			elsif( RstSeq(4 downto 3) /= "11" )then
				SdrSta <= "101";			-- Write (Initialize memory content)
			elsif( iSltRfsh_n = '0' and VideoDLClk = '1' )then
				SdrSta <= "010";			-- refresh -- TURBO
			elsif( SdPaus = '1' and VideoDLClk = '1' )then
				SdrSta <= "010";			-- refresh
			else
				-- Normal memory access mode
				SdrSta(2) <= '1';			-- read/write cpu/vdp
			end if;
		elsif( ff_sdr_seq = "001" and SdrSta(2) = '1' and RstSeq(4 downto 3) = "11" )then
			SdrSta(1) <= VideoDLClk;			-- 0:cpu, 1:vdp
			if( VideoDLClk = '0' )then
				SdrSta(0) <= w_wrt_req;			-- for cpu
			else
				SdrSta(0) <= not WeVdp_n;		-- for vdp	
			end if;
		end if;
	end if;
end process;
----------------------------------------------------------------
process( memclk )
begin
	if( memclk'event and memclk = '1' )then
		case ff_sdr_seq is
			when "000" =>
				if( SdrSta(2) = '1' )then				-- 1xx CPU/VDP read/write
					SdrCmd <= SdrCmd_ac;
				elsif( SdrSta(1 downto 0) = "00" )then	-- 000 idle
					SdrCmd <= SdrCmd_xx;
				elsif( SdrSta(1 downto 0) = "01" )then	-- 001 precharge all
					SdrCmd <= SdrCmd_pr;
				elsif( SdrSta(1 downto 0) = "10" )then	-- 010 refresh
					SdrCmd <= SdrCmd_re;
				else									-- 011 mode register set
					SdrCmd <= SdrCmd_ms;
				end if;
			when "001" =>
				SdrCmd <= SdrCmd_xx;
			when "010" =>
				if( SdrSta(2) = '1' )then
					if( SdrSta(0) = '0' )then
						SdrCmd <= SdrCmd_rd;	-- "100"(cpu read) / "110"(vdp read)
					else
						SdrCmd <= SdrCmd_wr;	-- "101"(cpu write) / "111"(vdp write)
					end if;
				end if;
			when "011" =>
				SdrCmd <= SdrCmd_xx;
			when others	=>
				null;
		end case;
	end if;
end process;
----------------------------------------------------------------
process( memclk )
begin
	if( memclk'event and memclk = '1' )then
		case ff_sdr_seq is
			when "000" =>
				SdrUdq <= '1';
				SdrLdq <= '1';
			when "010" =>
				if( SdrSta(2) = '1' )then
					if( SdrSta(0) = '0' )then				-- read
						SdrUdq <= '0';
						SdrLdq <= '0';
					else									-- write
						if( RstSeq(4 downto 3) /= "11" )then
							SdrUdq <= '0';
							SdrLdq <= '0';
						elsif( VideoDLClk = '0' )then		-- cpu read/write
							SdrUdq <= not CpuAdr(0);
							SdrLdq <= CpuAdr(0);
						   else								-- vdp read/write
							SdrUdq <= not VdpAdr(16);
							SdrLdq <= VdpAdr(16);
						end if;
					end if;
				end if;
			when "011" =>
				SdrUdq <= '1';
				SdrLdq <= '1';
			when others
				=> null;
		end case;
	end if;
end process;
----------------------------------------------------------------
process( memclk )
begin
	if( memclk'event and memclk = '1' )then
		case ff_sdr_seq is
		when "000" =>
			if( SdrSta(2) = '0' )then						-- set command mode
				--         single   CL=2  WT=0(seq) BL=1
				SdrAdr <= "00100" & "010" & "0" & "000";
				SdrBa  <= "00";
			else											-- set row address
				if   ( RstSeq(4 downto 2) = "010" )then
					SdrAdr <= ClrAdr(11 downto 0);			-- clear VRAM(128KB)
					SdrBa <= "11";
				elsif( RstSeq(4 downto 2) = "011" )then
					SdrAdr <= ClrAdr(11 downto 0);			-- clear ERAM(128KB)
					SdrBa  <= "10";
				elsif( RstSeq(4 downto 3) = "10" )then
					SdrAdr <= ClrAdr(11 downto 0);			-- clear MainRAM(128KB)
					SdrBa <= "11";
				elsif (VideoDLClk = '0') then
					SdrAdr <= CpuAdr(12 downto 1);			-- cpu read/write
					SdrBa  <= CpuAdr(22 downto 21);
				else
					SdrAdr <= VdpAdr(11 downto 0);			-- vdp read/write
					SdrBa <= "11";
				end if;
			end if;
		when "010" =>										-- set collumn address
			SdrAdr(11 downto 8) <= "0100";					-- A10=1 => enable auto precharge
			-- clear memory
			if   ( RstSeq(4 downto 2) = "010" )then
				SdrAdr(7 downto 0) <= "1000" & ClrAdr(15 downto 12);	-- clear VRAM(128KB)
				SdrBa <= "11";
			elsif( RstSeq(4 downto 2) = "011" )then
				SdrAdr(7 downto 0) <= "0000" & ClrAdr(15 downto 12);	-- clear ERAM(128KB)
				SdrBa  <= "10";
			elsif( RstSeq(4 downto 3) = "10" )then
				SdrAdr(7 downto 0) <= "0000" & ClrAdr(15 downto 12);	-- clear MainRAM(128KB)
				SdrBa <= "11";
			-- work memory
			elsif( VideoDLClk = '0' )then
				SdrAdr(7 downto 0) <= CpuAdr(20 downto 13);				-- cpu read/write
				SdrBa  <= CpuAdr(22 downto 21);
			   else
				SdrAdr(7 downto 0) <= "1000" & VdpAdr(15 downto 12);	-- vdp read/write
				SdrBa <= "11";
			end if;
		when others =>
			null;
		end case;
	end if;
end process;
----------------------------------------------------------------
process( memclk )
begin
	if( memclk'event and memclk = '1' )then
		if( ff_sdr_seq = "010" )then
			if (SdrSta(2) = '1') then
				if (SdrSta(0) = '0') then			-- Read
					SdrDat <= (others => 'Z');
				else								-- Write
					if (RstSeq(4 downto 3) /= "11") then	-- Clear memory
						SdrDat <= (others => '0');
					elsif (VideoDLClk = '0') then
						SdrDat <= dbo & dbo;		-- "101"(cpu write)
					else
						SdrDat <= VrmDbo & VrmDbo;	-- "111"(vdp write)
					end if;
				end if;
			end if;
		else
			SdrDat <= (others => 'Z');
		end if;
	end if;
end process;
----------------------------------------------------------------
process( memclk )
begin
	if( memclk'event and memclk = '1' )then
		if( ff_sdr_seq = "010" )then
			if( RstSeq(4 downto 3) /= "11" )then
				ClrAdr <= (others => '0');
			else
				ClrAdr <= ClrAdr + 1;
			end if;
		end if;
	end if;
end process;
----------------------------------------------------------------
process( memclk )
begin
	if( memclk'event and memclk = '1' )then
		if( ff_sdr_seq = "101" )then
			if( SdrSta(2) = '1' and SdrSta(0) = '0' )then	-- mem activ
				if( VideoDLClk = '0' )then					-- dotState = x1b
					if( CpuAdr(0) = '0' )then
						RamDbi	<= pMemDat(  7 downto 0 );	-- "100"(cpu read)
					else
						RamDbi	<= pMemDat( 15 downto 8 );	-- "100"(cpu read)
					end if;
				else
						VrmDbi	<= pMemDat( 15 downto 0 );	-- "110"(vdp read)
				end if;
			end if;
		end if;
	end if;
end process;
----------------------------------------------------------------
process( memclk )
begin
	if( memclk'event and memclk = '1' )then
		if( ff_sdr_seq = "101" )then
			if( SdrSta(2) = '1' )then
				if( SdrSta(0) = '0' and VideoDLClk = '0' )then
					SdPaus <= Paus;
				end if;
			else
					SdPaus <= Paus;
			end if;
		end if;
	end if;
end process;
----------------------------------------------------------------
process( memclk )
begin
	if( memclk'event and memclk = '1' )then
		case ff_sdr_seq is
			when "000" =>
				if( VideoDHClk = '1' or RstSeq(4 downto 3) /= "11" )then
					ff_sdr_seq <= "001";
				end if;
			when "111" =>
				if( VideoDHClk = '0' or RstSeq(4 downto 3) /= "11" )then
					ff_sdr_seq <= "000";
				end if;
			when others =>
				ff_sdr_seq <= ff_sdr_seq + 1;				
		end case;
	end if;
end process;
----------------------------------------------------------------
process( reset, clk21m )
begin
	if( reset = '1' )then
		RamAck <= '0';
	elsif( clk21m'event and clk21m = '1' )then
		if( RamReq = '0' )then
			RamAck <= '0';
		elsif( VideoDLClk = '0' and VideoDHClk = '1' )then
			RamAck <= '1';
		end if;
	end if;
end process;
----------------------------------------------------------------
pMemCke		<= '1';
pMemCs_n	<= SdrCmd(3);
pMemRas_n	<= SdrCmd(2);
pMemCas_n	<= SdrCmd(1);
pMemWe_n	<= SdrCmd(0);
pMemUdq		<= SdrUdq;
pMemLdq		<= SdrLdq;
pMemBa1		<= SdrBa(1);
pMemBa0		<= SdrBa(0);

pMemAdr		<= SdrAdr;
pMemDat		<= SdrDat;
----------------------------------------------------------------
-- Reserved ports
----------------------------------------------------------------


----------------------------------------------------------------
-- Connect components
----------------------------------------------------------------

  U01 : t80a
    port map(
      RESET_n => CpuRst_n,
      CLK_n   => pCpuClk,
      WAIT_n  => pSltWait_n,
      INT_n   => pSltInt_n,
      NMI_n   => '1',
      BUSRQ_n => BusReq_n,
      M1_n    => CpuM1_n,
      MREQ_n  => pSltMerq_n,
      IORQ_n  => pSltIorq_n,
      RD_n    => pSltRd_n,
      WR_n    => pSltWr_n,
      RFSH_n  => CpuRfsh_n,
      HALT_n  => open,
      BUSAK_n => open,
      A       => pSltAdr,
      D       => pSltDat
    );
    BusReq_n  <= '1';

  U02 : iplrom
    port map(clk21m, adr, RomDbi);

  U03 : megasd
    port map(clk21m, reset, clkena, ErmReq, Open, wrt, adr, Open, dbo,
             ErmRam, ErmWrt, ErmAdr, RamDbi, Open,
             MmcDbi, MmcEna, MmcAct, pSd_Ck, pSd_Dt3, pSd_Cm, pSd_Dt0,
             EPC_CK, EPC_CS, EPC_OE, EPC_DI, EPC_DO,boot_req,boot_ack,boot_data);
--
--  U04 : cyclone_asmiblock
--    port map(EPC_CK, EPC_CS, EPC_DI, EPC_OE, EPC_DO);

  U05 : mapper
    port map(clk21m, reset, clkena, MapReq, Open, mem, wrt, adr, MapDbi, dbo,
             MapRam, MapWrt, MapAdr, RamDbi, Open);

  U06 : eseps2
    port map (clk21m, reset, clkena, not Kmap, Caps, Kana, Paus, open, Reso, Fkeys,
              pPs2Clk_in, pPs2Dat_in, pPs2Clk_out, pPs2Dat_out, PpiPortC, PpiPortB);

  U07 : rtc
    port map(clk21m, reset, w_10Hz, RtcReq, Open, wrt, adr, RtcDbi, dbo);

  U08 : kanji
    port map(clk21m, reset, clkena, KanReq, Open, wrt, adr, KanDbi, dbo,
             KanRom, KanAdr, RamDbi, Open);

  U20 : vdp
    port map(clk21m, reset, VdpReq, Open, wrt, adr, VdpDbi, dbo, pVdpInt_n,
		    Open, WeVdp_n, VdpAdr, VrmDbi, VrmDbo,
		    VdpMode,
      		VideoR, VideoG, VideoB, VideoHS_n, VideoVS_n, VideoCS_n,
      		VideoDHClk, VideoDLClk, Reso_v, PAL_v );

  U21 : vencode
    port map(clk21m, reset, VideoR, VideoG, videoB, VideoHS_n, VideoVS_n,
      		 videoY, videoC, videoV);

  U30 : psg
    port map(clk21m, reset, clkena, PsgReq, Open, wrt, adr, PsgDbi, dbo,
             pJoyA, pStrA, pJoyB, pStrB, Kana, CmtIn, KeyMode, PsgAmp);

  U31_1 : megaram
    port map(clk21m, reset, clkena, Scc1Req, Scc1Ack, wrt, adr, Scc1Dbi, dbo,
             Scc1Ram, Scc1Wrt, Scc1Adr, RamDbi, Open, Scc1Type, Scc1AmpL, Open);
	Scc1Type <= "00" when (Slt1Mode = '0') else "10";
--	Slt1Mode: '0' - Cart in Slot 1; '1' -SCC1

  U31_2 : megaram
    port map(clk21m, reset, clkena, Scc2Req, Scc2Ack, wrt, adr, Scc2Dbi, dbo,
             Scc2Ram, Scc2Wrt, Scc2Adr, RamDbi, Open, MegType, Scc2AmpL, Open);
--	MegType: "00" - Cart in Slot 2; "10" -SCC2; "01" -ASC8K; "11" -ASC16K
 
  U32 : eseopll
    port map(clk21m, reset, clkena, OpllEnaWait, OpllReq, OpllAck, wrt, adr, dbo, OpllAmp);
    OpllEnaWait <= '1' when (ff_turbo = '1') else '0';
	
  U38 :  mega_ram
    port map(clk21m, reset, clkena, MRAMreq, mem, wrt, adr, MRAMdbi, dbo, 
             MRAMram, MRAMwrt, MRAMadr, RamDbi, Open);
-- hara
	u_interpo: interpo
	generic map (
		msbi	=> DACin'high
	)
	port map (
		clk21m	=> clk21m,
		reset	=> reset,
		clkena	=> clkena,
		idata	=> DACin,
		odata	=> lpf1_wave	
	);

	u_lpf2: lpf2
	generic map (
		msbi	=> DACin'high
	)
	port map (
		clk21m	=> clk21m,
		reset	=> reset,
		clkena	=> clkena,
		idata	=> lpf1_wave,
		odata	=> lpf5_wave	
	);
-- end hara

  U_LPFL: LPF48K
	GENERIC MAP (
		MSBI		=> DACin_L'high, --lpf5_wave'high,
		MSBO		=> lpf18_wave_L'high
	)
	PORT MAP (
		CLK21M		=> clk21m,
		RESET		=> reset,
		CLKENA		=> clkena,
		IDATA		=> DACin_L,	-- lpf5_wave,
		ODATA		=> lpf18_wave_L		
	);

  U_LPFR: LPF48K
	GENERIC MAP (
		MSBI		=> DACin_R'high, --lpf5_wave'high,
		MSBO		=> lpf18_wave_R'high
	)
	PORT MAP (
		CLK21M		=> clk21m,
		RESET		=> reset,
		CLKENA		=> clkena,
		IDATA		=> DACin_R,	-- lpf5_wave,
		ODATA		=> lpf18_wave_R		
	);

  U33: esepwm
    generic map (DAC_MSBI) port map (clk21m, reset, lpf5_wave, DACout);

	 hex<=PpiPortA & EXPSLOT3;

  U37: system_timer
	port map (
	  clk21m => clk21m,
	  reset	 => reset,
	  req	 => systim_req,
	  ack	 => systim_ack,
	  adr	 => adr,
	  dbi	 => systim_dbi,
	  dbo	 => dbo
	);

-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\	
end rtl;
