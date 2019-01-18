-- 
-- lpf2.vhd
--   low pass filter
--   Revision 1.00
-- 
-- Copyright (c) 2008 Takayuki Hara.
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

--	LPF (cut off 48kHz at 3.58MHz)
LIBRARY	IEEE;
	USE	IEEE.STD_LOGIC_1164.ALL;
	USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY LPF48K IS
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
END LPF48K;

ARCHITECTURE RTL OF LPF48K IS
	TYPE ROM_TYPE IS ARRAY (0 TO 71) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
	CONSTANT LPF_TAP_DATA : ROM_TYPE := (
--		X"40",X"07",X"08",X"08",X"09",X"0A",X"0A",X"0B",
--		X"0B",X"0C",X"0C",X"0D",X"0D",X"0E",X"0E",X"0F",
--		X"0F",X"0F",X"10",X"10",X"10",X"11",X"11",X"11",
--		X"11",X"12",X"12",X"12",X"12",X"12",X"12",X"12",
--		X"12",X"12",X"12",X"12",X"12",X"12",X"12",X"12",
--		X"11",X"11",X"11",X"11",X"10",X"10",X"10",X"0F",
--		X"0F",X"0F",X"0E",X"0E",X"0D",X"0D",X"0C",X"0C",
--		X"0B",X"0B",X"0A",X"0A",X"09",X"08",X"08",X"07",
--		X"40",X"00",X"00",X"00",X"00",X"00",X"00",X"00"
		X"51",X"07",X"07",X"08",X"08",X"08",X"09",X"09", 
		X"09",X"0A",X"0A",X"0A",X"0A",X"0B",X"0B",X"0B", 
		X"0B",X"0C",X"0C",X"0C",X"0C",X"0D",X"0D",X"0D", 
		X"0D",X"0D",X"0D",X"0E",X"0E",X"0E",X"0E",X"0E", 
		X"0E",X"0E",X"0E",X"0E",X"0E",X"0E",X"0E",X"0E", 
		X"0E",X"0E",X"0E",X"0E",X"0E",X"0D",X"0D",X"0D",
		X"0D",X"0D",X"0D",X"0C",X"0C",X"0C",X"0C",X"0B", 
		X"0B",X"0B",X"0B",X"0A",X"0A",X"0A",X"0A",X"09", 
		X"09",X"09",X"08",X"08",X"08",X"07",X"07",X"51"
	);

	SIGNAL FF_ADDR		: STD_LOGIC_VECTOR(       7 DOWNTO 0 );
	SIGNAL FF_INTEG		: STD_LOGIC_VECTOR( MSBI+10 DOWNTO 0 );
	SIGNAL W_DATA		: STD_LOGIC_VECTOR( MSBI+ 8 DOWNTO 0 );
	SIGNAL W_ADDR_END	: STD_LOGIC;
BEGIN

	W_ADDR_END <= '1' WHEN( FF_ADDR = 71 )ELSE '0';

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_ADDR <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( CLKENA = '1' )THEN
				IF( W_ADDR_END = '1' )THEN
					FF_ADDR <= (OTHERS => '0');
				ELSE
					FF_ADDR <= FF_ADDR + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	W_DATA <= LPF_TAP_DATA( CONV_INTEGER(FF_ADDR) ) * IDATA;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_INTEG <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( CLKENA = '1' )THEN
				IF( W_ADDR_END = '1' )THEN
					FF_INTEG <= (OTHERS => '0');
				ELSE
					FF_INTEG <= FF_INTEG + W_DATA;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			ODATA <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( CLKENA = '1' )THEN
				IF( W_ADDR_END = '1' )THEN
					ODATA <= FF_INTEG( MSBI+10 DOWNTO 10-(MSBO-MSBI) );
				END IF;
			END IF;
		END IF;
	END PROCESS;
END RTL;
