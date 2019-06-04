/*
TBBlue / ZX Spectrum Next project

Copyright (c) 2015 Fabio Belavenuto & Victor Trucco

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef _HARDWARE_H
#define _HARDWARE_H

__sfr __at 0xE7 SD_CONTROL;
__sfr __at 0xE7 SD_STATUS;
__sfr __at 0xEB SD_DATA;
__sfr __at 0xFE ULAPORT;
__sfr __banked __at 0x243B REG_NUM;
__sfr __banked __at 0x253B REG_VAL;

__sfr __banked __at 0x133B REG_TX;
__sfr __banked __at 0x143B REG_RX;


__sfr __banked __at 0x103B LED;


/* Keyboard */
__sfr __banked __at 0xFEFE HROW0; // SHIFT,Z,X,C,V
__sfr __banked __at 0xFDFE HROW1; // A,S,D,F,G
__sfr __banked __at 0xFBFE HROW2; // Q,W,E,R,T
__sfr __banked __at 0xF7FE HROW3; // 1,2,3,4,5
__sfr __banked __at 0xEFFE HROW4; // 0,9,8,7,6
__sfr __banked __at 0xDFFE HROW5; // P,O,I,U,Y
__sfr __banked __at 0xBFFE HROW6; // ENTER,L,K,J,H
__sfr __banked __at 0x7FFE HROW7; // SPACE,SYM SHFT,M,N,B

#define peek(A) (*(volatile unsigned char*)(A))
#define poke(A,V) *(volatile unsigned char*)(A)=(V)
#define peek16(A) (*(volatile unsigned int*)(A))
#define poke16(A,V) *(volatile unsigned int*)(A)=(V)

/* Filenames */
#define FIRMWARE_FILE "UPDATE.DAT"
#define NEXT_DIRECTORY      "/tbblue/"
#define CONFIG_FILE         NEXT_DIRECTORY "config.ini"
#define TIMING_FILE         NEXT_DIRECTORY "timing.ini"


/* Hardware IDs */
#define HWID_DE1A		1		/* DE-1 */
#define HWID_DE2A		2		/* DE-2  */
//#define HWID_DE2N		3		/* DE-2 (new) */
//#define HWID_DE1N		4		/* DE-1 (new) */
#define HWID_FBLABS		5		/* FBLabs */
#define HWID_VTRUCCO	6		/* VTrucco */
#define HWID_WXEDA		7		/* WXEDA */
#define HWID_EMULATORS	8		/* Emulators */
#define HWID_ZXNEXT		10		/* ZX Spectrum Next */
#define HWID_MC			11		/* Multicore */
#define HWID_ZXNEXT_AB	250		/* ZX Spectrum Next Anti-brick */

/* Register numbers */
#define REG_MACHID		0
#define REG_VERSION		1
#define REG_RESET		2
#define REG_MACHTYPE	3
#define REG_RAMPAGE		4
#define REG_PERIPH1		5
#define REG_PERIPH2		6
#define REG_TURBO		7
#define REG_PERIPH3		8
#define REG_VERSION_SUB 14
#define REG_ANTIBRICK	16
#define REG_VIDEOREG	15
#define REG_VIDEOT		17
#define REG_KMHA		40
#define REG_KMLA		41
#define REG_KMHD		42
#define REG_KMLD		43
#define REG_DEBUG		0xFF

/* Reset types */
#define RESET_POWERON	4
#define RESET_HARD		2
#define RESET_SOFT		1
#define RESET_NONE		0

/* Anti-brick */
#define AB_CMD_NORMALCORE	0x80
#define AB_BTN_DIVMMC		0x02
#define AB_BTN_MULTIFACE	0x01

/* RAM pages */
#define RAMPAGE_RAMDIVMMC	0x08 /* 0x00 */
#define RAMPAGE_ROMDIVMMC	0x04 /* 0x18 */
#define RAMPAGE_ROMMF		0x05 /* 0x19 */
#define RAMPAGE_ROMSPECCY	0x00 /* 0x1C */


#endif /* _HARDWARE_H */