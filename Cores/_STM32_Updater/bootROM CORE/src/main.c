
#include <stdlib.h>
#include <string.h>
#include "hardware.h"
#include "vdp.h"
#include "mmc.h"
#include "fat.h"

const char ce[5]   = "\\|/-";

// EPCS4 cmds
const unsigned char cmd_write_enable	= 0x06;
const unsigned char cmd_write_disable	= 0x04;
const unsigned char cmd_read_status		= 0x05;
const unsigned char cmd_read_bytes		= 0x03;
const unsigned char cmd_read_id			= 0xAB;
const unsigned char cmd_fast_read		= 0x0B;
const unsigned char cmd_write_status	= 0x01;
const unsigned char cmd_write_bytes		= 0x02;
const unsigned char cmd_erase_bulk		= 0xC7;
const unsigned char cmd_erase_block64	= 0xD8;		// Block Erase 64K


static unsigned char error_count, l;
static const char * fn_firmware = "UPDATE  COR";
unsigned char buffer[550];
unsigned long dsize;
unsigned char L = 0;

/* Private functions */

/*******************************************************************************/
static void display_error(unsigned char *message)
{	
	vdp_clear();
	
	vdp_gotoxy(1, 10);
	vdp_prints("Error: ");
	vdp_prints(message);
	vdp_gotoxy(1, 12);
	vdp_prints("Press button 1 to try again");
	
	DisableCard();
	ULAPORT = COLOR_RED;
	for(;;);
}

static void delay(int v)
{
	int f;
	
	for (f = 0; f < v; f++)
	{
		__asm__("nop");
	}

}

unsigned char reverse(unsigned char b) 
{
   b = (b & 0xF0) >> 4 | (b & 0x0F) << 4;
   b = (b & 0xCC) >> 2 | (b & 0x33) << 2;
   b = (b & 0xAA) >> 1 | (b & 0x55) << 1;
   return b;
}

void writeFlashSector(unsigned int initial_addr)
{
	int i;

	buffer[0] = cmd_write_bytes;
	buffer[1] = (dsize >> 16) & 0xFF;
	buffer[2] = (dsize >> 8) & 0xFF;
	buffer[3] = dsize & 0xFF;
	
	for (i = 0; i < 256; i++)
	{	
		unsigned char c;
		//unsigned char cr;
		//int j;
		
		//RPD files have reversed bits, so we need to adjust before write the data.
		c = peek(initial_addr + i);
		buffer[4 + i] =  reverse(c); //reverse tested, ok
		
		
		/*
		c = peek(0x6000 + i);
		cr = 0;
		for (j = 0; j < 8; j++) {
			if (c & (1 << j)) {
				cr |= (1 << (7-j));
			}
		}
		buffer[4 + i] = cr;
		*/
	}
	
			
	SPI_sendcmd(cmd_write_enable);
	SPI_writebytes(buffer);
	
	vdp_putchar(ce[L]);
	vdp_putchar(8);
	L = (L + 1) & 0x03;
	
	while ((SPI_sendcmd_recv(cmd_read_status) & 0x01) == 1);
}


/*******************************************************************************/
void main()
{
	unsigned char *mem   = (unsigned char *)0x6000;
	unsigned char mach_id, mach_version, reset_type, buttons;
	unsigned int c = 0;
	unsigned char res = 0;
	unsigned int val = 0;
	unsigned int digit = 0;
	int ret = 0;
	
		
	unsigned int num_blocks; 
	unsigned int blocks_read;

	int i = 0;
	int XOR = 0;
	int addr = 0x6000;//point to the momory holding the data
	
	fileTYPE file;
	
//	DEBUG(1)

	memset(buffer, 0, 550);
	
	REG_NUM = REG_MACHID;
	mach_id = REG_VAL;
	REG_NUM = REG_VERSION;
	mach_version = REG_VAL;
	REG_NUM = REG_RESET;
	reset_type = REG_VAL & RESET_POWERON;
	REG_NUM = REG_ANTIBRICK;
	buttons = REG_VAL & (AB_BTN_DIVMMC | AB_BTN_MULTIFACE);
	

	vdp_clear();
	
	ULAPORT = COLOR_BLUE;				// Blue border 
	
	vdp_gotoxy(4, 4);
	vdp_prints("Multicore 2 CORE updater");
	vdp_gotoxy(11, 8);
	vdp_prints("ATTENTION!");
	vdp_gotoxy(2, 10);
	vdp_prints("The core will be overwritten");
	vdp_gotoxy(5, 12);
	vdp_prints("Press ENTER when ready");
	
	vdp_gotoxy(25, 23);
	vdp_prints("V 1.01");

	//wait for the ENTER
	while ((HROW6 & 0x01) == 1) { }
	
	
	vdp_gotoxy(7, 15);
	vdp_prints("Are you sure? (Y/N)");

	//wait for Y
	while (((HROW5 & 0x10) >> 4) == 1) { }
	
	
	vdp_clear();	
	
	

	//reset the STM and hold
	REG_STM32_RESET = 1;



	
	
	
	


	error_count = 10;
	while(error_count > 0) {
		if (!MMC_Init()) {
			//             01234567890123456789012345678901
			display_error("Fail to init the SD card");
		}
//		DEBUG(3)
		if (!FindDrive()) {
			--error_count;
			for (c = 0; c < 65000; c++);
		} else {
			break;
		}
	}
	if (error_count == 0) {
		//             01234567890123456789012345678901
		display_error("Fail to mount the SD card");
	}
//	DEBUG(4)





	if (!FileOpen(&file, fn_firmware)) {
		//             01234567890123456789012345678901
		display_error("Fail to open UPDATE.COR");
	}

	
	num_blocks = file.size / 512;

	if (num_blocks * 512 < file.size)
	{
		num_blocks++;
	}

	

	
	// Read flash ID
	// EPCS4     = 0x12
	// W25Q32BV  = 0x15
	// W25Q64BV  = 0x16
	// W25Q128JV = 0x17
	buffer[0] = cmd_read_id;
	L = SPI_send4bytes_recv(buffer);
	
	//L = SPI_GET_ID();
	/*vdp_prints ("L: ");
	vdp_putchar_hex(L);
	vdp_putchar(' ');
		*/
	if (L != 0x12 && L != 0x15 && L != 0x16 && L != 0x17) 
	{
		display_error("Flash IC not detected!");
	} 
	

	
	vdp_gotoxy(2, 4);
	vdp_prints("Flash IC detected: W25Q64BV");
	
	vdp_gotoxy(2, 6);
	vdp_prints("Erasing Flash: ");
	
	SPI_sendcmd(cmd_write_enable);
	SPI_sendcmd(cmd_erase_bulk);
	
	
	// wait the flash to become available again, after the erase
	L = 0;
	while ((SPI_sendcmd_recv(cmd_read_status) & 0x01) == 1) {
		vdp_putchar(ce[L]);
		vdp_putchar(8);
		L = (L + 1) & 0x03;

		for (i = 0; i < 5000; i++) ;
	}
	
	vdp_prints(" OK\n");
	
	vdp_gotoxy(2, 8);
	vdp_prints("Writing Flash: ");
	
	
	dsize = 0;
	
	L = 0;
	
	
	blocks_read = 0;
			
	while  (blocks_read < num_blocks)
	{

		FileRead(&file, mem); //read a 512 bytes block
		
		blocks_read++;
		
		writeFlashSector(0x6000); // first 256
		dsize += 256;
		
		writeFlashSector(0x6100); // last  256
		dsize += 256;
		
	}
	vdp_prints(" OK\n");

	SPI_sendcmd(cmd_write_disable);
	

	DisableCard();
	
	
	vdp_clear();
	
	ULAPORT = COLOR_GREEN;				// green border 
	
	vdp_gotoxy(11, 9);
	vdp_prints("UPDATE OK!");
	vdp_gotoxy(7, 13);
	vdp_prints("Turn off the power");
	
	for(;;);
	
}
