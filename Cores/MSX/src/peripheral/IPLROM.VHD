-- 
-- iplrom.vhd
--   initial program loader for Cyclone & EPCS (Altera)
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
-- 31th,March,2008
-- patch caro for load KANJI BASIC from SD/MMC
--
-- 13th,April,2008
-- patch t.hara for load SLOT0-1/SLOT0-3 from SD/MMC
--
-- 29th,April,2008
-- patch caro for load compressed BIOS from EPCS4
--

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY IPLROM IS
	PORT (
		CLK		: IN STD_LOGIC;
		ADR		: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		DBI		: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END IPLROM;

ARCHITECTURE RTL OF IPLROM IS
	TYPE ROM_TYPE IS ARRAY (0 TO 767) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
	CONSTANT IPL_DATA : ROM_TYPE := (
		X"F3",X"18",X"03",X"C3",X"74",X"FD",X"01",X"EF",
		X"02",X"11",X"00",X"FC",X"21",X"00",X"00",X"ED",
		X"B0",X"21",X"21",X"FC",X"01",X"99",X"02",X"ED",
		X"B3",X"01",X"9A",X"20",X"ED",X"B3",X"C3",X"43",
		X"FC",X"00",X"90",X"00",X"00",X"00",X"00",X"11",
		X"06",X"33",X"07",X"17",X"01",X"27",X"03",X"51",
		X"01",X"27",X"06",X"71",X"01",X"73",X"03",X"61",
		X"06",X"64",X"06",X"11",X"04",X"65",X"02",X"55",
-- 40
		X"05",X"77",X"07",X"31",X"FF",X"FF",X"CD",X"A4",
		X"FC",X"28",X"46",X"3E",X"40",X"32",X"00",X"60",
		X"01",X"00",X"01",X"11",X"00",X"00",X"21",X"00",
		X"C0",X"CD",X"03",X"FC",X"38",X"1F",X"CD",X"A5",
		X"FD",X"38",X"13",X"CD",X"C6",X"FD",X"38",X"15",
		X"D5",X"C5",X"06",X"01",X"21",X"00",X"C0",X"CD",
		X"03",X"FC",X"C1",X"D1",X"38",X"07",X"CD",X"DE",
		X"FD",X"06",X"18",X"30",X"11",X"21",X"D2",X"FC",
-- 80
		X"22",X"04",X"FC",X"3E",X"60",X"32",X"00",X"60",
		X"01",X"04",X"20",X"11",X"00",X"00",X"CD",X"B5",
		X"FC",X"AF",X"32",X"00",X"60",X"3C",X"32",X"00",
		X"68",X"32",X"00",X"70",X"32",X"00",X"78",X"3E",
		X"C0",X"D3",X"A8",X"C7",X"3E",X"80",X"32",X"00",
		X"70",X"21",X"00",X"80",X"7E",X"FE",X"41",X"C0",
		X"23",X"7E",X"FE",X"42",X"C9",X"3E",X"80",X"32",
		X"00",X"70",X"3C",X"32",X"00",X"78",X"3C",X"F5",
-- C0
		X"C5",X"06",X"20",X"21",X"00",X"80",X"CD",X"03",
		X"FC",X"79",X"C1",X"E1",X"D8",X"4F",X"7C",X"10",
		X"E6",X"C9",X"CD",X"E5",X"FC",X"D8",X"D5",X"C5",
		X"21",X"00",X"C0",X"11",X"00",X"80",X"CD",X"2F",
		X"FE",X"C1",X"D1",X"AF",X"C9",X"D5",X"C5",X"21",
		X"00",X"40",X"36",X"03",X"71",X"72",X"73",X"00",	-- Nopped dummy SPI read
		X"11",X"00",X"C0",X"7E",X"B7",X"20",X"20",X"7E",
		X"FE",X"40",X"20",X"1B",X"4E",X"46",X"C5",X"0B",
-- 100
		X"0B",X"0B",X"0B",X"7E",X"12",X"13",X"0B",X"79",
		X"B0",X"20",X"F8",X"3A",X"00",X"50",X"E1",X"C1",
		X"D1",X"19",X"EB",X"D0",X"0C",X"AF",X"C9",X"3A",
		X"00",X"50",X"C1",X"D1",X"37",X"C9",X"7E",X"CB",
		X"23",X"CB",X"12",X"CB",X"11",X"70",X"71",X"72",
		X"73",X"36",X"00",X"36",X"95",X"7E",X"06",X"10",
		X"7E",X"FE",X"FF",X"3F",X"D0",X"10",X"F9",X"37",
		X"C9",X"06",X"0A",X"3A",X"00",X"50",X"10",X"FB",
-- 140
		X"01",X"00",X"40",X"59",X"51",X"CD",X"1E",X"FD",
		X"D8",X"E6",X"F7",X"FE",X"01",X"37",X"C0",X"06",
		X"77",X"CD",X"1E",X"FD",X"E6",X"04",X"28",X"07",
		X"06",X"41",X"CD",X"1E",X"FD",X"18",X"05",X"06",
		X"69",X"CD",X"1E",X"FD",X"D8",X"FE",X"01",X"28",
		X"E6",X"B7",X"C8",X"37",X"C9",X"CD",X"39",X"FD",
		X"C1",X"D1",X"E1",X"D8",X"E5",X"D5",X"C5",X"06",
		X"51",X"21",X"00",X"40",X"CD",X"1E",X"FD",X"38",
-- 180
		X"EC",X"C1",X"D1",X"E1",X"B7",X"37",X"C0",X"D5",
		X"C5",X"EB",X"01",X"00",X"02",X"21",X"00",X"40",
		X"7E",X"FE",X"FE",X"20",X"FB",X"ED",X"B0",X"EB",
		X"1A",X"C1",X"1A",X"D1",X"13",X"7A",X"B3",X"20",
		X"01",X"0C",X"10",X"D0",X"C9",X"21",X"00",X"C0",
		X"01",X"80",X"00",X"3E",X"46",X"ED",X"B1",X"28",
		X"02",X"B7",X"C9",X"E5",X"56",X"23",X"5E",X"21",
		X"54",X"41",X"B7",X"ED",X"52",X"E1",X"20",X"EB",
		X"0E",X"00",X"59",X"51",X"37",X"C9",X"06",X"04",
		X"21",X"C6",X"C1",X"E5",X"5E",X"23",X"56",X"23",
		X"4E",X"79",X"B2",X"B3",X"E1",X"C0",X"11",X"10",
		X"00",X"19",X"10",X"EF",X"37",X"C9",X"DD",X"21",
		X"00",X"C0",X"DD",X"6E",X"0E",X"DD",X"66",X"0F",
		X"79",X"19",X"CE",X"00",X"4F",X"DD",X"5E",X"11",
		X"DD",X"56",X"12",X"7B",X"E6",X"0F",X"06",X"04",
		X"CB",X"3A",X"CB",X"1B",X"10",X"FA",X"B7",X"28",
		X"01",X"13",X"D5",X"DD",X"46",X"10",X"DD",X"5E",
		X"16",X"DD",X"56",X"17",X"79",X"19",X"CE",X"00",
		X"10",X"FB",X"D1",X"19",X"EB",X"4F",X"D5",X"C5",
		X"06",X"01",X"21",X"00",X"C0",X"CD",X"03",X"FC",
		X"D8",X"2A",X"00",X"C0",X"11",X"41",X"42",X"B7",
		X"ED",X"52",X"C1",X"D1",X"C8",X"37",X"C9",X"7E",
		X"23",X"D9",X"11",X"00",X"00",X"87",X"3C",X"CB",
		X"13",X"87",X"CB",X"13",X"87",X"CB",X"13",X"CB",
		X"13",X"21",X"E3",X"FE",X"19",X"5E",X"DD",X"6B",
		X"23",X"5E",X"DD",X"63",X"1E",X"01",X"D9",X"FD",
		X"21",X"55",X"FE",X"ED",X"A0",X"87",X"20",X"03",
		X"7E",X"23",X"17",X"30",X"F6",X"D9",X"62",X"6B",
		X"87",X"20",X"05",X"D9",X"7E",X"23",X"D9",X"17",
		X"30",X"2A",X"87",X"20",X"05",X"D9",X"7E",X"23",
		X"D9",X"17",X"ED",X"6A",X"D8",X"87",X"20",X"05",
		X"D9",X"7E",X"23",X"D9",X"17",X"30",X"15",X"87",
		X"20",X"05",X"D9",X"7E",X"23",X"D9",X"17",X"ED",
		X"6A",X"D8",X"87",X"20",X"05",X"D9",X"7E",X"23",
		X"D9",X"17",X"38",X"D6",X"23",X"D9",X"4E",X"23",
		X"06",X"00",X"CB",X"79",X"28",X"36",X"DD",X"E9",
		X"87",X"20",X"03",X"7E",X"23",X"17",X"CB",X"10",
		X"87",X"20",X"03",X"7E",X"23",X"17",X"CB",X"10",
		X"87",X"20",X"03",X"7E",X"23",X"17",X"CB",X"10",
		X"87",X"20",X"03",X"7E",X"23",X"17",X"CB",X"10",
		X"87",X"20",X"03",X"7E",X"23",X"17",X"CB",X"10",
		X"87",X"20",X"03",X"7E",X"23",X"17",X"30",X"04",
		X"B7",X"04",X"CB",X"B9",X"03",X"E5",X"D9",X"E5",
		X"D9",X"6B",X"62",X"ED",X"42",X"C1",X"ED",X"B0",
		X"E1",X"FD",X"E9",X"D4",X"FE",X"C0",X"FE",X"B8",
		X"FE",X"B0",X"FE",X"A8",X"FE",X"A0",X"FE",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00"
	);
BEGIN

	PROCESS( CLK )
	BEGIN
		IF( CLK'EVENT AND CLK = '1' )THEN
			DBI <= IPL_DATA( CONV_INTEGER( ADR(9 DOWNTO 0) ) );
		END IF;
	END PROCESS;
END RTL;
