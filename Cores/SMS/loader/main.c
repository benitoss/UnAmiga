#include <sms.h>
#include "sd.h"
#include "fat.h"
#include <stdio.h>

unsigned char pal1[] = {0x20, 0xFF, 0x08, 0x28, 0x02, 0x22, 0x0A, 0x2A,
				0x15, 0x35, 0x1D, 0x3D, 0x17, 0x37, 0x1F, 0x3F};

unsigned char pal2[] = {0x00, 0x03, 0x08, 0x28, 0x02, 0x22, 0x0A, 0x2A,
				0x15, 0x35, 0x1D, 0x3D, 0x17, 0x37, 0x1F, 0x3F};


extern void __LIB__ clear_vram();

void print_dir(file_descr_t *entries, file_descr_t *current);
void load_rom(file_descr_t *entry);
void pick_and_load_rom();
void start_rom();
void wait_key();

void irq_handler()
{
	// nothing
}

void nmi_handler()
{
	// nothing
}

void clear_screen()
{	
	int i;
			
	for (i=0; i<22; i++) 
	{
		gotoxy(0,i);
		printf("                                \n");
	}
	
	gotoxy(0,0);
}

void main()
{
	int i;
	
	clear_vram();
	
	set_vdp_reg(VDP_REG_FLAGS1, VDP_REG_FLAGS1_SCREEN);
	load_tiles(standard_font, 0, 255, 1);
	load_palette(pal1, 0, 16);
	load_palette(pal2, 16, 16);


	//Sound off - if resetted from a prior game
	set_sound_volume(0,0);
	set_sound_volume(1,0);
	set_sound_volume(2,0);
	set_sound_volume(3,0);

	while (1) {
		//console_init();
		//console_clear();
		
		
		gotoxy(3,0);
		printf("MASTER SYSTEM ROM LOADER\n");
		gotoxy(3,1);
		printf("------------------------\n");
	
		gotoxy(0,4);
	//	gotoxy(3,2);
	//	printf("ABCDEFGHIJKLMNOPQRSTUVWX\n");
	//	gotoxy(3,3);
	//	printf("abcdefghijklmnopqrstuvwx\n");
	//	gotoxy(3,4);
	//	printf("012345678901234567890123\n");

		i = 0;
	
		if (!sd_init()) {
			printf("Error initializing SD/MMC card\n");
		} else {
	#ifdef DEBUG2
			printf("SD card initialized\n");
	#endif
			if (!fat_init()) {
				//printf("could not initialize FAT system\n"); //qq
	
			} else {
	#ifdef DEBUG2
				printf("FAT system initialized\n");
	#endif
				i = 1;
			}
		}

		choose_mode(i);
	}
}

void choose_mode(int sd_ok)
{
	int i = 0;

	
	gotoxy(9,8);
	if (sd_ok) {
		printf("loading from SD card");
		
		pick_and_load_rom();
	} else {
		printf("retry SD/MMC card");
	}
	//gotoxy(9,12);
	//printf("boot SRAM");

	for (;;) {
		int key;
		gotoxy(6,10);
		if (i==0) { printf(">"); } else { printf("  "); }
		gotoxy(6,12);
		if (i==1) { printf(">"); } else { printf("  "); }
		key = wait_key();
		switch (key) {
		case JOY_UP:
			i = 0;
			break;
	//	case JOY_DOWN:
	//		i = 1;
	//		break;
		case JOY_FIREA:
		case JOY_FIREB:
			if (i==0) {
				if (sd_ok) {
					pick_and_load_rom();
				}
			} else {
				start_rom();
			}
			return;
		}
	}
}

void pick_and_load_rom()
{
	int cont = 0;
	int cdiv = 3;
	file_descr_t *entries,*top_of_screen,*current;
	
	gotoxy(9,8);
	printf("                    ");

	entries = fat_open_root_directory();
	if (entries==0) {
		printf("Error reading root directory");
		return;
	}

	top_of_screen = entries;
	current = entries;
	for (;;) {
		int key;
		print_dir(top_of_screen,current);
		//key = wait_key();
		key = read_joypad1();
		//switch (key) {
		//case JOY_UP:
		cont++;
		if (cont>20)
		   cdiv= 3;
		if ((key & JOY_UP) && (cont%cdiv==0)) {
			if (current!=entries) {
				current--;
				cdiv = 8;
				if (current<top_of_screen) {
					top_of_screen = current;
				}
			}
		cont = 0;
		}	//break;
		if ((key & JOY_DOWN) && (cont%cdiv==0)) {
		//case JOY_DOWN:
			if (current[1].type!=0) {
				current++;
				cdiv = 8;
				if ((current-top_of_screen)>19) {
					top_of_screen++;
				}
			}
		cont = 0;
		}	//break;
		//case JOY_LEFT:
		if ((key & JOY_LEFT) && (cont%(cdiv)==0)) {
			if ((current!=entries) && current>(entries+4)) {
				current = current-5;
				cdiv = 8;
				if (current<top_of_screen) {
					top_of_screen = current;
				}
			} else {
			   current = entries;
			   top_of_screen = current;
			}
		cont = 0;
		}	//break;
		//case JOY_RIGHT:
		if ((key & JOY_RIGHT) && (cont%(cdiv)==0)) {
			if (current[5].type!=0 && current[4].type!=0 && current[3].type!=0 && current[2].type!=0 && current[1].type!=0) {
				current = current + 5;
				cdiv = 8;
				if ((current-top_of_screen)>19) {
					top_of_screen = top_of_screen + 5;
				}
			}
			else {
				if (current[1].type == 0)			
					current = current;
				else if (current[2].type == 0)			
					current = current+1;
				else if (current[3].type == 0)			
					current = current+2;
				else if (current[4].type == 0)			
					current = current+3;
				else if (current[5].type == 0)			
					current = current+4;
				//top_of_screen = current;
			cdiv = 8;
			     }
		cont = 0;
		}	//break;
		//case JOY_FIREA:
		//case JOY_FIREB:
		if ((key & (JOY_FIREA | JOY_FIREB)) && (cont%cdiv==0)) {
			if ((current->type&0x10)==0) {
				entries = fat_open_directory(current->cluster);
				if (entries==0) {
					printf("Error while reading directory");
					return;
				}
				top_of_screen = entries;
				current = entries;
				cdiv = 12;
			} else {
				load_rom(current);
				start_rom();
				return;
			}
		cont = 0;
		}	//break;
		//}
	}
}

void load_rom(file_descr_t *entry)
{
	file_t file;
	int i;
	DWORD size;

	clear_screen();
	
	gotoxy (12,9);
	printf("Loading ");
	
	gotoxy (10,11);
	for (i=0; i<8; i++) {
		printf("%c",entry->name[i]);
	}
	printf(".");
	for (i=8; i<11; i++) {
		printf("%c",entry->name[i]);
	}
	printf("\n\n");

	fat_open_file(&file, entry->cluster);
	size = 0;
	while (1) {
		UBYTE* data;
		if ((size&0x3fff)==0) {
			// switch page 1
			*((UBYTE*)0xffff) = (size>>14)&0xff;
		}
		// write to page 2
		data = 0x8000+(size&0x3fff);
		data = fat_load_file_sector(&file,data);
		if (data==0) {
			printf("Error while reading file\n");
		} else if (data==FAT_EOF) {
			gotoxy(0,2);
			return;
		} else {
			// process data
			size += 0x200;
			if ((size)%16384 == 0)
			   printf(".");
			//gotoxy(0,3);
			//console_print_dword(size);
			//printf(" bytes loaded");
		}
	}
}

void start_rom()
{
	clear_screen();
	
	gotoxy (10,12);
	printf("booting rom\n");

	*((UBYTE*)0xfffd) = 0;
	*((UBYTE*)0xfffe) = 1;
	*((UBYTE*)0xffff) = 2;
	
	// any write to $00 when in bootloader mode sets normal mode and reboots the CPU
	#asm
	out ($00),a
	#endasm
}

void print_dir_entry(file_descr_t *entry)
{
	int dir;
	int i;
	dir = (entry->type&0x10)==0;
	if (!dir) {
		printf(" ");
	} else {
		printf("[");
	}
	for (i=0; i<8; i++) {
		printf("%c",entry->name[i]);
	}
	printf(".");
	for (i=0; i<3; i++) {
		printf("%c",entry->name[8+i]);
	}
	if (!dir) {
		printf(" ");
	} else {
		printf("]");
	}
}

void print_dir(file_descr_t *entries, file_descr_t *current)
{
	int i;
	for (i=0; i<20; i++) {
		gotoxy(6,4+i);
		if (&entries[i]==current) {
			printf("> ");
		} else {
			printf("  ");
		}
		if (entries[i].type!=0) {
			print_dir_entry(&entries[i]);
		} else {
			printf("              ");
		}
	}
}

void wait_key()
{
	int j1,nj1;
	j1 = read_joypad1();
	while (1) {
		nj1 = read_joypad1();
		if (nj1&~j1) {
			return nj1&~j1;
		} else {
			j1 = nj1;
		}
	}
}
