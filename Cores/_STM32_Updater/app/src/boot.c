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

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "hardware.h"
#include "vdp.h"
#include "ff.h"

/* Defines */

#define CMD_INIT  				0x7f
#define CMD_ACK  				0x79
#define CMD_NOACK 	 			0x1f
#define CMD_GET  				0x00
#define CMD_GET_VERSION			0x01
#define CMD_GET_ID  			0x02
#define CMD_READ_MEMORY			0x11
#define CMD_GO  				0x21
#define CMD_WRITE_MEMORY 		0x31
#define CMD_ERASE  				0x43
#define CMD_EXTENDED_ERASE  	0x44
#define CMD_WRITE_PROTECT  		0x63
#define CMD_WRITE_UNPROTECT		0x73
#define CMD_READOUT_PROTECT		0x82
#define CMD_READOUT_UNPROTECT	0x92
#define FLASH_START  			0x08000000


//                    12345678901234567890123456789012
const char TITLE[] = "    Multicore 2 STM Updater     ";

/* Variables */
FATFS		FatFs;		/* FatFs work area needed for each volume */
FIL			Fil, Fil2;	/* File object needed for each open file */
FRESULT		res;

unsigned char * version = " 1.01";

unsigned char scandoubler = 1;
unsigned char freq5060 = 0;
unsigned char timex   = 0;
unsigned char psgmode = 0;
unsigned char divmmc = 1;
unsigned char mf = 1;
unsigned char joystick1 = 0;
unsigned char joystick2 = 0;
unsigned char ps2 = 0;
//unsigned char alt_ps2 = 0;
unsigned char lightpen = 0;
unsigned char scanlines = 0;
unsigned char menu_default = 0;
unsigned char menu_cont = 0;
unsigned char config_changed = 0;
unsigned char dac = 0;
unsigned char ena_turbo = 1;
unsigned char turbosound = 0;
unsigned char covox = 0;
unsigned char intsnd = 0;
unsigned char t[256];


static unsigned char 	*mem = (unsigned char *)0x4000;
static char				line[256], temp[256], buffer[512], *filename;
static char				*comma1, *comma2, *comma3, *comma4;
static char				titletemp[32];
static char				romfile[14];
static unsigned char	mach_id, mach_version, mach_version_sub, l, found = 0;
static unsigned char	opc = 0;
static unsigned int		bl = 0, cont, initial_block, blocks;
static unsigned char	video_timing = 0;
static unsigned char	mode = 0;
static unsigned char	temp_byte = 0;

/* Private functions */

/*******************************************************************************/
void display_error(const unsigned char *msg)
{
	l = 16 - strlen(msg)/2;

	vdp_setcolor(COLOR_RED, COLOR_BLACK, COLOR_WHITE);
	vdp_cls();
	vdp_setcolor(COLOR_RED, COLOR_BLUE, COLOR_WHITE);
	vdp_setflash(0);
	vdp_prints(TITLE);
	vdp_setcolor(COLOR_RED, COLOR_BLACK, COLOR_WHITE);
	vdp_setflash(1);
	vdp_gotoxy(l, 12);
	vdp_prints(msg);
	ULAPORT = COLOR_RED;
	for(;;);
}

/*******************************************************************************/
void error_loading(char e)
{
	vdp_prints("ERROR!!");
	vdp_putchar(e);
	ULAPORT = COLOR_RED;
	for(;;);
}

/*******************************************************************************/
void prints_help()
{
//                       11111111112222222222333
//              12345678901234567890123456789012
	vdp_prints("  F1      - Hard Reset\n");
	vdp_prints("  F2      - Toggle scandoubler\n");
	vdp_prints("  F3      - Toggle 50/60 Hz\n");
	vdp_prints("  F4      - Soft Reset\n");
	vdp_prints("  F7      - Toggle scanlines\n");
	vdp_prints("  F8      - Toggle turbo\n");
	vdp_prints("  F9      - Multiface button\n");
	vdp_prints("  F10     - DivMMC button\n");
	vdp_prints("  SHIFT   - Caps Shift\n");
	vdp_prints("  CONTROL - Symbol Shift\n");
	vdp_prints("\n");
	vdp_prints("  Hold SPACE while power-up or\n");
	vdp_prints("  on Hard Reset to start\n");
	vdp_prints("  the configurator.\n");
	vdp_prints("\n");
}



/*******************************************************************************/
void load_and_start()
{
	
	//turn off the debug led
	LED = 1;
	
	REG_NUM = REG_RAMPAGE;




	vdp_prints("Loading ROM:\n");
	vdp_prints(romfile);
	vdp_prints(" ... ");

	// Load 16K
	strcpy(temp, NEXT_DIRECTORY);
	strcat(temp, romfile);
	res = f_open(&Fil, temp, FA_READ);
	if (res != FR_OK) {
		error_loading('O');
	}
	REG_VAL = RAMPAGE_ROMSPECCY;
	res = f_read(&Fil, (unsigned char *)0, 16384, &bl);
	if (res != FR_OK || bl != 16384) {
		error_loading('R');
	}
	// If Speccy > 48K, load more 16K
	if (mode > 0) {
		REG_VAL = RAMPAGE_ROMSPECCY+1;
		res = f_read(&Fil, (unsigned char *)0, 16384, &bl);
		if (res != FR_OK || bl != 16384) {
			error_loading('R');
		}
	}
	// If +2/+3e, load more 32K
	//if (mode > 1) {
	if (mode == 2) {

		REG_VAL = RAMPAGE_ROMSPECCY+2;
		res = f_read(&Fil, (unsigned char *)0, 16384, &bl);
		if (res != FR_OK || bl != 16384) {
			error_loading('R');
		}
		REG_VAL = RAMPAGE_ROMSPECCY+3;
		res = f_read(&Fil, (unsigned char *)0, 16384, &bl);
		if (res != FR_OK || bl != 16384) {
			error_loading('R');
		}
	}
	f_close(&Fil);
	vdp_prints("OK!\n");
	
	REG_NUM = REG_MACHTYPE;
//	REG_VAL = (mode+1) << 3 | (mode+1);	// Set machine (and timing)
	REG_VAL = (mode+1);
	
	//REG_NUM = REG_VIDEOT;
	//REG_VAL = video_timing; 
	
	REG_NUM = REG_RESET;
	REG_VAL = RESET_SOFT;				// Soft-reset
	
	for(;;);
}

/* Public functions */

/*******************************************************************************/
unsigned long get_fattime()
{
	return 0x44210000UL;
}

/*******************************************************************************/
void main()
{
	long i=0;
	unsigned int error_count = 100;

//	vdp_init();
/*	vdp_setcolor(COLOR_BLACK, COLOR_BLUE, COLOR_WHITE);
	vdp_prints(TITLE);
	vdp_setcolor(COLOR_BLACK, COLOR_BLACK, COLOR_WHITE);*/


	vdp_setflash(0);


	for(cont=0;cont<1000;cont++);	

START:
	--error_count;
	f_mount(&FatFs, "", 0);		/* Give a work area to the default drive */


	res = f_open(&Fil, FIRMWARE_FILE, FA_READ);
	if (res != FR_OK) {
		if (error_count > 0) {
			goto START;
		}
		//             12345678901234567890123456789012
		display_error("Error opening UPDATE.DAT file!");
	}
	
	error_count = 100;

	res = f_read(&Fil, buffer, 512, &bl);
	if (res != FR_OK || bl != 512) {
		error_loading('F');
	}
	
	
	vdp_setcolor(COLOR_BLACK, COLOR_BLACK, COLOR_BLACK);

	res = f_read(&Fil, mem, blocks, &bl);
	if (res != FR_OK || bl != blocks) {
		error_loading('F');
	}

	f_close(&Fil);

	vdp_setcolor(COLOR_BLACK, COLOR_BLACK, COLOR_WHITE);

	vdp_gotoxy(0, 21); 
	vdp_prints("Updater v.");
	vdp_prints(version);

	vdp_gotoxy(0, 22);
	vdp_prints("Core v.");
	sprintf(t, "%d.%02d.%02d", mach_version >> 4, mach_version & 0x0F, mach_version_sub);
	vdp_prints(t);


	vdp_gotoxy(1, 0); 

	
	
	REG_TX = 0x01;
	REG_TX = 0xFE;
 
 

	while(1){
	//	sprintf(t, "%02x ", REG_RX);
	}



	//load_and_start();
}
