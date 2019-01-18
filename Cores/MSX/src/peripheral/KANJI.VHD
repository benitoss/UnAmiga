-- 
-- kanji.vhd
--   Kanji ROM controller
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
-------------------------------------------------------------------------------
-- 05th, April, 2008 modified by t.hara
-- リファクタリング。
--

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY KANJI IS
	PORT(
		CLK21M		: IN	STD_LOGIC;
		RESET		: IN	STD_LOGIC;
		CLKENA		: IN	STD_LOGIC;
		REQ			: IN	STD_LOGIC;
		ACK			: OUT	STD_LOGIC;
		WRT			: IN	STD_LOGIC;
		ADR			: IN	STD_LOGIC_VECTOR( 15 DOWNTO 0 );
		DBI			: OUT	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		DBO			: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );

		RAMREQ		: OUT	STD_LOGIC;
		RAMADR		: OUT	STD_LOGIC_VECTOR( 17 DOWNTO 0 );
		RAMDBI		: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		RAMDBO		: OUT	STD_LOGIC_VECTOR(  7 DOWNTO 0 )
	);
END KANJI;

ARCHITECTURE RTL OF KANJI IS

	SIGNAL UPDATEREQ	 : STD_LOGIC;
	SIGNAL UPDATEACK	 : STD_LOGIC;
	SIGNAL KANJISEL		 : STD_LOGIC;
	SIGNAL KANJIPTR1	 : STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	SIGNAL KANJIPTR2	 : STD_LOGIC_VECTOR( 16 DOWNTO 0 );

BEGIN

	----------------------------------------------------------------
	-- RAM ACCESS
	----------------------------------------------------------------
	RAMREQ	<=	REQ	WHEN( WRT = '0' AND ADR(0) = '1' )ELSE
				'0';
	RAMADR	<=	('0' & KANJIPTR1) WHEN( KANJISEL = '0' )ELSE
				('1' & KANJIPTR2);
	RAMDBO	<=	DBO;

	----------------------------------------------------------------
	-- KANJI ROM PORT ACCESS
	----------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			ACK <= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( WRT = '1' )THEN
				ACK <= REQ;
			ELSE
				ACK <= '0';
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			KANJISEL	<= '0';
			UPDATEREQ	<= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( REQ = '1' AND WRT = '0' AND ADR(0) = '1' )THEN
				KANJISEL	<= ADR(1);
				UPDATEREQ	<= NOT UPDATEACK;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			UPDATEACK <= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( REQ = '0' AND (UPDATEREQ /= UPDATEACK) )THEN
				UPDATEACK <= NOT UPDATEACK;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			KANJIPTR1 <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( REQ = '1' AND WRT = '1' AND ADR(1) = '0' )THEN
				IF( ADR(0) = '0' )THEN
					KANJIPTR1( 10 DOWNTO  5 ) <= DBO( 5 DOWNTO 0 );
				ELSE
					KANJIPTR1( 16 DOWNTO 11 ) <= DBO( 5 DOWNTO 0 );
				END IF;
				KANJIPTR1( 4 DOWNTO 0 ) <= (OTHERS => '0');
			ELSIF( REQ = '0' AND (UPDATEREQ /= UPDATEACK) AND KANJISEL = '0' )THEN
				KANJIPTR1( 4 DOWNTO 0 ) <= KANJIPTR1( 4 DOWNTO 0 ) + 1;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			KANJIPTR2 <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( REQ = '1' AND WRT = '1' AND ADR(1) = '1' )THEN
				IF( ADR(0) = '0' )THEN
					KANJIPTR2( 10 DOWNTO  5 ) <= DBO( 5 DOWNTO 0 );
				ELSE
					KANJIPTR2( 16 DOWNTO 11 ) <= DBO( 5 DOWNTO 0 );
				END IF;
				KANJIPTR2(  4 DOWNTO  0 ) <= (OTHERS => '1');
			ELSIF( REQ = '0' AND (UPDATEREQ /= UPDATEACK) AND KANJISEL = '1' )THEN
				KANJIPTR2( 4 DOWNTO 0 ) <= KANJIPTR2( 4 DOWNTO 0 ) + 1;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '0' )THEN -- modified by caro for TURBO-mode
--		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( REQ = '0' AND (UPDATEREQ /= UPDATEACK) )THEN
				DBI <= RAMDBI;
			END IF;
		END IF;
	END PROCESS;

END RTL;
