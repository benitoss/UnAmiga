-- 
-- rtc.vhd
--   REAL TIME CLOCK (MSX2 CLOCK-IC)
--   Version 1.00
-- 
-- Copyright (c) 2008 Takayuki Hara
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

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY RTC IS
	PORT(
		CLK21M		: IN	STD_LOGIC;
		RESET		: IN	STD_LOGIC;
		CLKENA		: IN	STD_LOGIC;			-- 10HZ
		REQ			: IN	STD_LOGIC;
		ACK			: OUT	STD_LOGIC;
		WRT			: IN	STD_LOGIC;
		ADR			: IN	STD_LOGIC_VECTOR( 15 DOWNTO 0 );
		DBI			: OUT	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		DBO			: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 )
 );
END RTC;

ARCHITECTURE RTL OF RTC IS

	-- BANK MEMORY
	COMPONENT RAM IS
		PORT (
			ADR		: IN	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			CLK		: IN	STD_LOGIC;
			WE		: IN	STD_LOGIC;
			DBO		: IN	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			DBI		: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 )
		);
	END COMPONENT;

	-- FF
	SIGNAL FF_REQ		: STD_LOGIC;
	SIGNAL FF_1SEC_CNT	: STD_LOGIC_VECTOR(  3 DOWNTO 0 );

	-- REGISTER FF
	SIGNAL REG_PTR		: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
	SIGNAL REG_MODE		: STD_LOGIC_VECTOR(  3 DOWNTO 0 );		--	TE, AE(NOT SUPPORTED), M1, M0
	SIGNAL REG_SEC_L	: STD_LOGIC_VECTOR(  3 DOWNTO 0 );		--	HL = X"00" ... X"59"
	SIGNAL REG_SEC_H	: STD_LOGIC_VECTOR(  6 DOWNTO 4 );
	SIGNAL REG_MIN_L	: STD_LOGIC_VECTOR(  3 DOWNTO 0 );		--	HL = X"00" ... X"59"
	SIGNAL REG_MIN_H	: STD_LOGIC_VECTOR(  6 DOWNTO 4 );
	SIGNAL REG_HOU_L	: STD_LOGIC_VECTOR(  3 DOWNTO 0 );		--	HL = X"00" ... X"23" 
	SIGNAL REG_HOU_H	: STD_LOGIC_VECTOR(  5 DOWNTO 4 );		--	HL = X"00" ... X"23" 
	SIGNAL REG_WEE		: STD_LOGIC_VECTOR(  2 DOWNTO 0 );		--	     X"0"  ... X"6"
	SIGNAL REG_DAY_L	: STD_LOGIC_VECTOR(  3 DOWNTO 0 );		--	HL = X"00" ... X"31"
	SIGNAL REG_DAY_H	: STD_LOGIC_VECTOR(  5 DOWNTO 4 );		--
	SIGNAL REG_MON_L	: STD_LOGIC_VECTOR(  3 DOWNTO 0 );		--	HL = X"01" ... X"12"
	SIGNAL REG_MON_H	: STD_LOGIC;
	SIGNAL REG_YEA_L	: STD_LOGIC_VECTOR(  3 DOWNTO 0 );		--	HL = X"00" ... X"99"
	SIGNAL REG_YEA_H	: STD_LOGIC_VECTOR(  7 DOWNTO 4 );
	SIGNAL REG_1224		: STD_LOGIC;							--	'0' = 12HOUR MODE, '1' = 24HOUR MODE
	SIGNAL REG_LEAP		: STD_LOGIC_VECTOR(  1 DOWNTO 0 );		--	"00" LEAP YEAR, "01" ... "11" OTHER YEAR 

	-- WIRE
	SIGNAL W_ADR_DEC	: STD_LOGIC_VECTOR( 15 DOWNTO 0 );
	SIGNAL W_BANK_DEC	: STD_LOGIC_VECTOR(  2 DOWNTO 0 );
	SIGNAL W_WRT		: STD_LOGIC;
	SIGNAL W_MEM_WE		: STD_LOGIC;
	SIGNAL W_MEM_ADDR	: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL W_MEM_Q		: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL W_1SEC		: STD_LOGIC;
	SIGNAL W_10SEC		: STD_LOGIC;
	SIGNAL W_60SEC		: STD_LOGIC;
	SIGNAL W_10MIN		: STD_LOGIC;
	SIGNAL W_60MIN		: STD_LOGIC;
	SIGNAL W_10HOUR		: STD_LOGIC;
	SIGNAL W_1224HOUR	: STD_LOGIC;
	SIGNAL W_10DAY		: STD_LOGIC;
	SIGNAL W_NEXT_MON	: STD_LOGIC;
	SIGNAL W_10MON		: STD_LOGIC;
	SIGNAL W_1YEAR		: STD_LOGIC;
	SIGNAL W_10YEAR		: STD_LOGIC;
	SIGNAL W_100YEAR	: STD_LOGIC;
	SIGNAL W_ENABLE		: STD_LOGIC;
BEGIN

	----------------------------------------------------------------
	-- ADDRESS DECODER
	----------------------------------------------------------------
	WITH REG_PTR SELECT W_ADR_DEC <=
		"0000000000000001" WHEN "0000",
		"0000000000000010" WHEN "0001",
		"0000000000000100" WHEN "0010",
		"0000000000001000" WHEN "0011",
		"0000000000010000" WHEN "0100",
		"0000000000100000" WHEN "0101",
		"0000000001000000" WHEN "0110",
		"0000000010000000" WHEN "0111",
		"0000000100000000" WHEN "1000",
		"0000001000000000" WHEN "1001",
		"0000010000000000" WHEN "1010",
		"0000100000000000" WHEN "1011",
		"0001000000000000" WHEN "1100",
		"0010000000000000" WHEN "1101",
		"0100000000000000" WHEN "1110",
		"1000000000000000" WHEN "1111",
		"XXXXXXXXXXXXXXXX" WHEN OTHERS;

	WITH REG_MODE( 1 DOWNTO 0 ) SELECT W_BANK_DEC <=
		"001" WHEN "00",
		"010" WHEN "01",
		"100" WHEN "10",
		"100" WHEN "11",
		"XXX" WHEN OTHERS;

	W_WRT <= REQ AND WRT;

	----------------------------------------------------------------
	-- RTC REGISTER READ
	----------------------------------------------------------------
	DBI <=	"1111"    & REG_MODE            WHEN(                         W_ADR_DEC(13) = '1' AND ADR(0) = '1' )ELSE
			"1111"    & REG_SEC_L           WHEN( W_BANK_DEC(0) = '1' AND W_ADR_DEC( 0) = '1' AND ADR(0) = '1' )ELSE
			"11110"   & REG_SEC_H           WHEN( W_BANK_DEC(0) = '1' AND W_ADR_DEC( 1) = '1' AND ADR(0) = '1' )ELSE
			"1111"    & REG_MIN_L           WHEN( W_BANK_DEC(0) = '1' AND W_ADR_DEC( 2) = '1' AND ADR(0) = '1' )ELSE
			"11110"   & REG_MIN_H           WHEN( W_BANK_DEC(0) = '1' AND W_ADR_DEC( 3) = '1' AND ADR(0) = '1' )ELSE
			"1111"    & REG_HOU_L           WHEN( W_BANK_DEC(0) = '1' AND W_ADR_DEC( 4) = '1' AND ADR(0) = '1' )ELSE
			"111100"  & REG_HOU_H           WHEN( W_BANK_DEC(0) = '1' AND W_ADR_DEC( 5) = '1' AND ADR(0) = '1' )ELSE
			"11110"   & REG_WEE             WHEN( W_BANK_DEC(0) = '1' AND W_ADR_DEC( 6) = '1' AND ADR(0) = '1' )ELSE
			"1111"    & REG_DAY_L           WHEN( W_BANK_DEC(0) = '1' AND W_ADR_DEC( 7) = '1' AND ADR(0) = '1' )ELSE
			"111100"  & REG_DAY_H           WHEN( W_BANK_DEC(0) = '1' AND W_ADR_DEC( 8) = '1' AND ADR(0) = '1' )ELSE
			"1111"    & REG_MON_L           WHEN( W_BANK_DEC(0) = '1' AND W_ADR_DEC( 9) = '1' AND ADR(0) = '1' )ELSE
			"1111000" & REG_MON_H           WHEN( W_BANK_DEC(0) = '1' AND W_ADR_DEC(10) = '1' AND ADR(0) = '1' )ELSE
			"1111"    & REG_YEA_L           WHEN( W_BANK_DEC(0) = '1' AND W_ADR_DEC(11) = '1' AND ADR(0) = '1' )ELSE
			"1111"    & REG_YEA_H           WHEN( W_BANK_DEC(0) = '1' AND W_ADR_DEC(12) = '1' AND ADR(0) = '1' )ELSE
			"111100"  & REG_LEAP            WHEN( W_BANK_DEC(1) = '1' AND W_ADR_DEC(11) = '1' AND ADR(0) = '1' )ELSE
			"1111"    & W_MEM_Q(3 DOWNTO 0) WHEN( W_BANK_DEC(2) = '1'                         AND ADR(0) = '1' )ELSE
			(OTHERS => '1');

	----------------------------------------------------------------
	-- REQUEST AND ACK
	----------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_REQ <= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			FF_REQ <= REQ;
		END IF;
	END PROCESS;

	ACK <= FF_REQ;

	----------------------------------------------------------------
	-- MODE REGISTER [TE BIT]
	----------------------------------------------------------------
	W_ENABLE <= CLKENA AND REG_MODE(3);

	----------------------------------------------------------------
	-- 1SEC TIMER
	----------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_1SEC_CNT <= "1001";
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(1) = '1' AND W_ADR_DEC(15) = '1' )THEN
				-- RESET REGISTER [CR BIT]
				IF( DBO(1) = '1' )THEN
					FF_1SEC_CNT <= "1001";
				END IF;
			ELSIF( W_1SEC = '1' )THEN
				FF_1SEC_CNT <= "1001";
			ELSIF( W_ENABLE = '1' )THEN
				FF_1SEC_CNT <= FF_1SEC_CNT - 1;
			END IF;
		END IF;
	END PROCESS;

	W_1SEC	<=	W_ENABLE WHEN( FF_1SEC_CNT = "0000" )ELSE
				'0';

	----------------------------------------------------------------
	-- 10SEC TIMER
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(0) = '1' AND W_ADR_DEC( 0) = '1' )THEN
				REG_SEC_L <= DBO(3 DOWNTO 0);
			ELSIF( W_1SEC = '1' )THEN
				IF( W_10SEC = '1' )THEN
					REG_SEC_L <= "0000";
				ELSE
					REG_SEC_L <= REG_SEC_L + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	W_10SEC	<=	'1' WHEN( REG_SEC_L = "1001" )ELSE
				'0';

	----------------------------------------------------------------
	-- 60SEC TIMER
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(0) = '1' AND W_ADR_DEC( 1) = '1' )THEN
				REG_SEC_H <= DBO(2 DOWNTO 0);
			ELSIF( (W_1SEC AND W_10SEC) = '1' )THEN
				IF( W_60SEC = '1' )THEN
					REG_SEC_H <= "000";
				ELSE
					REG_SEC_H <= REG_SEC_H + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	W_60SEC	<=	'1' WHEN( REG_SEC_H = "101" )ELSE
				'0';

	----------------------------------------------------------------
	-- 10MIN TIMER
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(0) = '1' AND W_ADR_DEC( 2) = '1' )THEN
				REG_MIN_L <= DBO(3 DOWNTO 0);
			ELSIF( (W_1SEC AND W_10SEC AND W_60SEC) = '1' )THEN
				IF( W_10MIN = '1' )THEN
					REG_MIN_L <= "0000";
				ELSE
					REG_MIN_L <= REG_MIN_L + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	W_10MIN	<=	'1' WHEN( REG_MIN_L = "1001" )ELSE
				'0';

	----------------------------------------------------------------
	-- 60MIN TIMER
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(0) = '1' AND W_ADR_DEC( 3) = '1' )THEN
				REG_MIN_H <= DBO(2 DOWNTO 0);
			ELSIF( (W_1SEC AND W_10SEC AND W_60SEC AND W_10MIN) = '1' )THEN
				IF( W_60MIN = '1' )THEN
					REG_MIN_H <= "000";
				ELSE
					REG_MIN_H <= REG_MIN_H + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	W_60MIN	<=	'1' WHEN( REG_MIN_H = "101" )ELSE
				'0';

	----------------------------------------------------------------
	-- 10HOUR TIMER
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(0) = '1' AND W_ADR_DEC( 4) = '1' )THEN
				REG_HOU_L <= DBO(3 DOWNTO 0);
			ELSIF( (W_1SEC AND W_10SEC AND W_60SEC AND W_10MIN AND W_60MIN) = '1' )THEN
				IF( (W_10HOUR OR W_1224HOUR) = '1' )THEN
					REG_HOU_L <= "0000";
				ELSE
					REG_HOU_L <= REG_HOU_L + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(0) = '1' AND W_ADR_DEC( 5) = '1' )THEN
				REG_HOU_H <= DBO(1 DOWNTO 0);
			ELSIF( (W_1SEC AND W_10SEC AND W_60SEC AND W_10MIN AND W_60MIN) = '1' )THEN
				IF( W_10HOUR = '1' )THEN
					REG_HOU_H <= REG_HOU_H + 1;
				ELSIF( W_1224HOUR = '1' )THEN
					REG_HOU_H(5) <= NOT REG_HOU_H(5);
					REG_HOU_H(4) <= '0';
				END IF;
			END IF;
		END IF;
	END PROCESS;

	W_10HOUR	<=	'1' WHEN( REG_HOU_L = "1001" )ELSE								--  09 --> 10
					'0';

	W_1224HOUR	<=	'1' WHEN(	(REG_1224 = '0' AND REG_HOU_H(4) =  '1' AND REG_HOU_L = "0001") OR		--  11 --> 00
								(REG_1224 = '1' AND REG_HOU_H    = "10" AND REG_HOU_L = "0011") )ELSE	--  23 --> 00
					'0';

	----------------------------------------------------------------
	-- WEEK DAY TIMER
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(0) = '1' AND W_ADR_DEC( 6) = '1' )THEN
				REG_WEE <= DBO(2 DOWNTO 0);
			ELSIF( (W_1SEC AND W_10SEC AND W_60SEC AND W_10MIN AND W_60MIN AND W_1224HOUR) = '1' )THEN
				IF( REG_WEE = "110" )THEN
					REG_WEE <= (OTHERS => '0');
				ELSE
					REG_WEE <= REG_WEE + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	----------------------------------------------------------------
	-- 10DAY TIMER
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(0) = '1' AND W_ADR_DEC( 7) = '1' )THEN
				REG_DAY_L <= DBO(3 DOWNTO 0);
			ELSIF( (W_1SEC AND W_10SEC AND W_60SEC AND W_10MIN AND W_60MIN AND W_1224HOUR) = '1' )THEN
				IF( W_10DAY = '1' )THEN
					REG_DAY_L <= "0000";
				ELSIF( W_NEXT_MON = '1' )THEN
					REG_DAY_L <= "0001";
				ELSE
					REG_DAY_L <= REG_DAY_L + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	W_10DAY		<=	'1' WHEN( REG_DAY_L = "1001" )ELSE
					'0';

	----------------------------------------------------------------
	-- 1MONTH TIMER
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(0) = '1' AND W_ADR_DEC( 8) = '1' )THEN
				REG_DAY_H <= DBO(1 DOWNTO 0);
			ELSIF( (W_1SEC AND W_10SEC AND W_60SEC AND W_10MIN AND W_60MIN AND W_1224HOUR) = '1' )THEN
				IF( W_NEXT_MON = '1' )THEN
					REG_DAY_H <= "00";
				ELSIF( W_10DAY = '1' )THEN
					REG_DAY_H <= REG_DAY_H + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	W_NEXT_MON	<=	'1'	WHEN(	(                                           REG_DAY_H = "11" AND REG_DAY_L = "0001" ) OR						--	XX/31
								(REG_MON_H = '0' AND REG_MON_L = "0010" AND REG_DAY_H = "10" AND REG_DAY_L = "1001" AND REG_LEAP  = "00" ) OR	--	02/29 (LEAP YEAR)
								(REG_MON_H = '0' AND REG_MON_L = "0010" AND REG_DAY_H = "10" AND REG_DAY_L = "1000" AND REG_LEAP /= "00" ) OR	--	02/28
								(REG_MON_H = '0' AND REG_MON_L = "0100" AND REG_DAY_H = "11" AND REG_DAY_L = "0000" ) OR						--	04/30
								(REG_MON_H = '0' AND REG_MON_L = "0110" AND REG_DAY_H = "11" AND REG_DAY_L = "0000" ) OR						--	06/30
								(REG_MON_H = '0' AND REG_MON_L = "1001" AND REG_DAY_H = "11" AND REG_DAY_L = "0000" ) OR						--	09/30
								(REG_MON_H = '1' AND REG_MON_L = "0001" AND REG_DAY_H = "11" AND REG_DAY_L = "0000" ) )ELSE						--	11/30
					'0';

	----------------------------------------------------------------
	-- 10MONTH TIMER
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(0) = '1' AND W_ADR_DEC( 9) = '1' )THEN
				REG_MON_L <= DBO(3 DOWNTO 0);
			ELSIF( (W_1SEC AND W_10SEC AND W_60SEC AND W_10MIN AND W_60MIN AND W_1224HOUR AND W_NEXT_MON) = '1' )THEN
				IF( W_10MON = '1' )THEN
					REG_MON_L <= "0000";
				ELSIF( W_1YEAR = '1' )THEN
					REG_MON_L <= "0001";
				ELSE
					REG_MON_L <= REG_MON_L + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	W_10MON	<=	'1'	WHEN( REG_MON_L = "1001" )ELSE
				'0';

	----------------------------------------------------------------
	-- 1YEAR TIMER
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(0) = '1' AND W_ADR_DEC(10) = '1' )THEN
				REG_MON_H <= DBO(0);
			ELSIF( (W_1SEC AND W_10SEC AND W_60SEC AND W_10MIN AND W_60MIN AND W_1224HOUR AND W_NEXT_MON) = '1' )THEN
				IF( W_10MON = '1' )THEN
					REG_MON_H <= '1';
				ELSIF( W_1YEAR = '1' )THEN
					REG_MON_H <= '0';
				END IF;
			END IF;
		END IF;
	END PROCESS;

	W_1YEAR	<=	'1'	WHEN( REG_MON_H = '1' AND REG_MON_L = "0010" )ELSE		--	X"12"
				'0';

	----------------------------------------------------------------
	-- 10YEAR TIMER
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(0) = '1' AND W_ADR_DEC(11) = '1' )THEN
				REG_YEA_L <= DBO(3 DOWNTO 0);
			ELSIF( (W_1SEC AND W_10SEC AND W_60SEC AND W_10MIN AND W_60MIN AND W_1224HOUR AND W_NEXT_MON AND W_1YEAR) = '1' )THEN
				IF( W_10YEAR = '1' )THEN
					REG_YEA_L <= "0000";
				ELSE
					REG_YEA_L <= REG_YEA_L + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	W_10YEAR	<=	'1'	WHEN( REG_YEA_L = "1001" )ELSE
					'0';

	----------------------------------------------------------------
	-- 100YEAR TIMER
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(0) = '1' AND W_ADR_DEC(12) = '1' )THEN
				REG_YEA_H <= DBO(3 DOWNTO 0);
			ELSIF( (W_1SEC AND W_10SEC AND W_60SEC AND W_10MIN AND W_60MIN AND W_1224HOUR AND W_NEXT_MON AND W_1YEAR AND W_10YEAR) = '1' )THEN
				IF( W_100YEAR = '1' )THEN
					REG_YEA_H <= "0000";
				ELSE
					REG_YEA_H <= REG_YEA_H + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	W_100YEAR	<=	'1'	WHEN( REG_YEA_H = "1001" )ELSE
					'0';

	----------------------------------------------------------------
	-- LEAP YEAR TIMER
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(1) = '1' AND W_ADR_DEC(11) = '1' )THEN
				REG_LEAP <= DBO(1 DOWNTO 0);
			ELSIF( (W_1SEC AND W_10SEC AND W_60SEC AND W_10MIN AND W_60MIN AND W_1224HOUR AND W_NEXT_MON AND W_1YEAR) = '1' )THEN
				REG_LEAP <= REG_LEAP + 1;
			END IF;
		END IF;
	END PROCESS;

	----------------------------------------------------------------
	-- 12HOUR MODE/24 HOUR MODE
	----------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_BANK_DEC(1) = '1' AND W_ADR_DEC(10) = '1' )THEN
				REG_1224 <= DBO(0);
			END IF;
		END IF;
	END PROCESS;

	----------------------------------------------------------------
	-- RTC REGISTER POINTER
	----------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			REG_PTR	<= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '0' )THEN
				-- REGISTER POINTER
				REG_PTR <= DBO(3 DOWNTO 0);
			END IF;
		END IF;
	END PROCESS;

	----------------------------------------------------------------
	-- RTC TEST REGISTER
	----------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			REG_MODE <= "1000";
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_WRT = '1' AND ADR(0) = '1' AND W_ADR_DEC(13) = '1' )THEN
				REG_MODE <= DBO(3 DOWNTO 0);
			END IF;
		END IF;
	END PROCESS;

	----------------------------------------------------------------
	-- BACKUP MEMORY EMULATION
	----------------------------------------------------------------
	W_MEM_ADDR	<= "00" & REG_MODE(1 DOWNTO 0) & REG_PTR;
	W_MEM_WE	<=	'1' WHEN( W_WRT = '1' AND ADR(0) = '1' )ELSE
					'0';

	U_MEM: RAM
	PORT MAP (
		ADR		=> W_MEM_ADDR,
		CLK		=> CLK21M,
		WE		=> W_MEM_WE,
		DBO		=> DBO,
		DBI		=> W_MEM_Q		
	);

END RTL;
