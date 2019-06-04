
#include <stdlib.h>
//#include <stdio.h>
#include <string.h>
#include "hardware.h"
#include "vdp.h"
#include "mmc.h"
#include "fat.h"

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


static unsigned char error_count, l;
static const char * fn_firmware = "UPDATE  STM";
static unsigned char buffer_rd[512];
static unsigned char buffer_wr[512];

static char	temp[256];

/* Private functions */

/*******************************************************************************/
static void display_error(unsigned char *message)
{	
	vdp_clear();
	
	vdp_gotoxy(1, 11);
	vdp_prints("Error: ");
	vdp_prints(message);
	vdp_gotoxy(1, 13);
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

static void clear_rx_buffer()
{
	unsigned int f=0;
	unsigned char temp;
	
	for (f = 0; f< 256; f++)
	{
		temp = REG_RX;
	
		delay(8);
	}

}

static void send_char_tx(unsigned char v)
{
	unsigned int f=0;
		
	REG_TX = v;
	
	delay(8);
	
	//vdp_putchar('S');
	//vdp_putchar_hex(v);
	//vdp_putchar(' ');
}

/* Public functions */

// """Write data to serial port"""
int _write( int cnt_wr )
{
       int i;
	   
       // self.log(":".join(['%02x' % d for d in data]), 'WR', level=3)
	   
		for (i = 0; i < cnt_wr; i++ ) send_char_tx( buffer_wr[ i ] );

		return 0;
}

// """Read data from serial port"""
int _read(int cnt_rd, int timeout)
{
        int temp = timeout;
		unsigned char empty;
		int i;
		
        for (i = 0; i < cnt_rd; i++ ) 
		{

			temp = timeout;
		
			empty = REG_TX;
			
			while (((empty & 1) == 0) && temp > 0) // nothing to read yet
			{
				delay(8);
				temp -= 1;
				empty = REG_TX;
			}
			
			if ( temp == 0) return -1;
			
			buffer_rd[ i ] = REG_RX;
			
			//self.log(":".join(['%02x' % d for d in data]), 'RD', level=3)
		}
		
        return 0;
}

// """talk with boot-loader"""
int _talk(int cnt_rd, int cnt_wr, int timeout)
{
	unsigned char xor = buffer_wr[0];
	int i;
	int res;
       
		if ( cnt_wr > 1 )
		{
			for (i=1; i < cnt_wr; i++)
			{
					xor ^= buffer_wr[i];	
			}
			buffer_wr[i] = xor;
		}
		else
		{
			buffer_wr[1] = buffer_wr[0] ^ 0xff;
		}
		
		cnt_wr++; //because the XOR at the end
        _write(cnt_wr);
		
        res = _read(cnt_rd, timeout);
		
        if (res == -1)
            display_error("No answer from STM");
		
        return res;
}		

//  """send command to boot-loader"""
int _send_command(unsigned char cmd, int cnt_rd, int cnt_wr)
{
      
	  int res;
	  
        if ( cnt_rd == 0 )
            cnt_rd = 1;
        else
            cnt_rd += 2;
		
		buffer_wr[0] = cmd;
			
        res = _talk( cnt_rd, cnt_wr, 1000 );
		
        if (buffer_rd[0] != CMD_ACK)
		{
            display_error("No ACK for command");
			return -1;
		}
		
        return 0;
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
	int addr = 0x6000;//point to the memory holding the data
	unsigned int stm_addr;
	
	fileTYPE file;
	
//	DEBUG(1)
	
	REG_NUM = REG_MACHID;
	mach_id = REG_VAL;
	REG_NUM = REG_VERSION;
	mach_version = REG_VAL;
	REG_NUM = REG_RESET;
	reset_type = REG_VAL & RESET_POWERON;
	REG_NUM = REG_ANTIBRICK;
	buttons = REG_VAL & (AB_BTN_DIVMMC | AB_BTN_MULTIFACE);
	

	vdp_clear();
	
	ULAPORT = COLOR_CYAN;				// Cyan border 
	
	vdp_gotoxy(4, 5);
	vdp_prints("UnAmiga STM32 Updater");
	
	vdp_gotoxy(1, 9);
	vdp_prints("Change the STM32 boot0 jumper");
	vdp_gotoxy(1, 10);
	vdp_prints("press the STM32 reset button");
	vdp_gotoxy(8, 11);
	vdp_prints("and press ENTER");


	
	vdp_gotoxy(3, 19);
	vdp_prints("Original by Victor Trucco");

	vdp_gotoxy(5, 21);
	vdp_prints("Adapted by Benitoss");

	vdp_gotoxy(25, 23);
	vdp_prints("V 1.01");
 

	//wait for the ENTER
	while ((HROW6 & 0x01) == 1) { }
	
	
	vdp_gotoxy(6, 15);
	vdp_prints("Are you sure? (Y/N)");

	//wait for Y
	while (((HROW5 & 0x10) >> 4) == 1) { }
	
	vdp_clear();	
	
	

	//reset the STM
	REG_STM32_RESET = 1;
	for (c=0; c< 30000; c++) __asm__("nop");	
	REG_STM32_RESET = 0;


	
	
	
	


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







	if (!FileOpen(&file, fn_firmware)) 
	{
			//             01234567890123456789012345678901
			display_error("Fail to open UPDATE.STM");
	}

			
					
	//	sprintf(temp, "%d", file.size);
	//	temp[20] = '\0';
	//	display_error(temp);

	num_blocks = file.size / 512;

	if (num_blocks * 512 < file.size)
	{
		num_blocks++;
	}










	


/*	num_blocks = 0;
	// Read blocks
	while  (FileRead(&file, mem)) 
	{
		mem += 512;
		num_blocks++;
	}
	
	//stm use 256 bytes blocks
	num_blocks = num_blocks / 2;
	*/
			
	
	
	
	
	//while(1)
	{
			vdp_gotoxy(0, 5);
			vdp_prints("Listening the STM: ");

			while (1)
			{
				//send INIT until sync the STM
				send_char_tx(CMD_INIT);
				delay(8);
				res = REG_RX;
				if (res == CMD_NOACK) break;
			}
			
			clear_rx_buffer();
			
			vdp_prints("OK!");
			
			
			vdp_gotoxy(0, 7);
			vdp_prints("Connecting to the STM: ");
			
			ret = _send_command(CMD_GET, 13, 1);
			
			if (ret == 0)
			{
				/*
				vdp_prints("C:");
				
				for (c=0; c< 15; c++)
				{
					
					vdp_putchar_hex(buffer_rd[c]);
					vdp_putchar(' ');
				}
				*/
				
				vdp_prints("OK!");
				
			}
			else
			{
				display_error("Fail to connect to STM");
			}
		
	
			
			vdp_gotoxy(0, 9);
			vdp_prints("Erasing the STM: ");
			
			//mass erase the STM
			ret = _send_command(CMD_ERASE, 0, 1);
			
			if (ret == 0)
			{
				buffer_wr[0] = 0xff;
				buffer_wr[1] = 0x00;
				_write(2);
				
				ret = _read(1, 1000);
		
				if (ret == -1)
				{
					display_error("Fail to erase");
				}
				else
				{
					vdp_prints("OK!");
				}
				
			} 
			else
			{
				display_error("Fail on erase command");
			}
			
			
			
			//write to the STM
			vdp_gotoxy(0, 11);
			vdp_prints("Writing to memory: ");
			
			stm_addr = 0;
			
			if (!FileOpen(&file, fn_firmware)) {
				//             01234567890123456789012345678901
				display_error("Fail to open UPDATE.STM");
			}
			
			blocks_read = 0;
			
			while  (blocks_read < num_blocks)
			{
				FileRead(&file, mem); //read 512 bytes from file
				
				blocks_read++;
				
				for (i = 0; i < 2; i++)
				{
					XOR = 0;
					addr = 0x6000 + (i * 256); //point to the memory holding the data

					ret = _send_command(CMD_WRITE_MEMORY, 0, 1);
					
					if (ret == 0)
					{
						
						buffer_wr[0] = 0x08;
						buffer_wr[1] = 0x00;
						buffer_wr[2] = stm_addr >> 8;
						buffer_wr[3] = stm_addr & 0xff;
						buffer_wr[4] = buffer_wr[0] ^ buffer_wr[1] ^ buffer_wr[2] ^ buffer_wr[3]; // XOR
						_write(5);
						
						ret = _read(1, 1000);
				
						if (ret == -1)
						{
							display_error("Fail to write address");
						}
						
						buffer_wr[0] = 0xff; // will write 255 bytes
						
						XOR = buffer_wr[0];
						
						//write all the 256 bytes
						for (c=1; c<=256; c++)
						{
							buffer_wr[ c ] = peek(addr); 
							
							XOR ^= buffer_wr[ c ];
							
							addr++;
						}
						
						buffer_wr[257] = XOR;
						
						_write(258);

						
						ret = _read(1, 1000);
				
						if (ret == -1)
						{
							display_error("Fail to write bytes");
						}
					}
					else
					{
						display_error("Fail on write command");
					}
					
					
					stm_addr += 256;
				}
				vdp_prints("*");
			}
			
			vdp_prints(" OK!");
			
			
			//verify
			vdp_gotoxy(0, 14);
			vdp_prints("Verifying: ");
			
			if (!FileOpen(&file, fn_firmware)) {
				//             01234567890123456789012345678901
				display_error("Fail to open UPDATE.STM");
			}
			
			stm_addr = 0;
			blocks_read = 0;
			
			
			while  ( blocks_read < num_blocks ) 
			{
				FileRead(&file, mem); //read 512 bytes from file
				
				blocks_read++;
				
				for (i = 0; i < 2; i++)
				{
					addr = 0x6000 + (i * 256); //point to the memory holding the data
				

					ret = _send_command(CMD_READ_MEMORY, 0, 1);
					
					if (ret == 0)
					{
						
						buffer_wr[0] = 0x08;
						buffer_wr[1] = 0x00;
						buffer_wr[2] = stm_addr >> 8;
						buffer_wr[3] = stm_addr & 0xff;
						buffer_wr[4] = buffer_wr[0] ^ buffer_wr[1] ^ buffer_wr[2] ^ buffer_wr[3]; // XOR
						_write(5);
						
						ret = _read(1, 1000);
				
						if (ret == -1)
						{
							display_error("Fail to write the verify address");
						}
						
						buffer_wr[0] = 0xff; // will read 255 bytes
						buffer_wr[1] = 0x00; // xor
						_write(2);
						
						ret = _read(1, 1000); //read the ACK
				
						if (ret == -1)
						{
							display_error("Fail to verify ACK command");
						}	
						
						ret = _read(256, 1000); //read the block
				
						if (ret == -1)
						{
							display_error("Fail to verify command");
						}	
						
						//verify all the 256 bytes
						for (c=0; c<256; c++)
						{
							if (buffer_rd[ c ] != peek(addr))
							{ 
								/*vdp_prints("C:"); 
								vdp_putchar_hex(c);
								vdp_prints(" I:");
								vdp_putchar_hex(i);
								
								DisableCard();
								ULAPORT = COLOR_RED;
								for(;;);*/
		
								display_error("Fail to verify the bytes");
							}
							
							addr++;
						}


					}
					else
					{
						 display_error("Fail on verify command");
					}
					
					
					stm_addr += 256;
				}
				vdp_prints("*");
			}
				
			

			
		
	}
	
	DisableCard();
	
	
	vdp_clear();
	
	ULAPORT = COLOR_GREEN;				// green border 
	
	vdp_gotoxy(11, 9);
	vdp_prints("UPDATE OK!");
	vdp_gotoxy(4, 11);
	vdp_prints("Restore the boot0 jumper");
	vdp_gotoxy(5, 12);
	vdp_prints("and turn off the power");
	
	for(;;);
	
//	__asm__("jp 0x6000");	// Start firmware
}
