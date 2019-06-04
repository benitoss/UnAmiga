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
#include "hardware.h"
#include "vdp.h"
#include "font.h"

/* Variables */
unsigned int faddr;
unsigned int vaddr;
unsigned int caddr;
unsigned char cx, cy;

/* Private functions */


/* Public functions */

/*******************************************************************************/
void set_ordered_palette()
{
	unsigned int c;
		
	REG_NUM = 64; 
	REG_VAL = 0;
	
	REG_NUM = 65; 
	
	for (c = 0; c<256;c++)
	{
		REG_VAL = c;
	}
}


void vdp_clear()
{
	unsigned char v;
	unsigned int c,f;
	

	cx = cy = 0;
	//ULAPORT = COLOR_BLACK;
	v = (0 << 7) | (1 << 6) | (COLOR_BLACK << 3) | COLOR_GRAY;
	
	for (c = PIX_BASE; c < (PIX_BASE+6144); c++)
		poke(c, 0);
	for (c = CT_BASE; c < (CT_BASE+768); c++)
		poke(c, v);
}



/*******************************************************************************/
void vdp_gotoxy(unsigned char x, unsigned char y)
{
	cx = x & 31;
	cy = y;
	if (cy > 23) cy = 23;
}

/*******************************************************************************/
void vdp_putchar(unsigned char c)
{
	unsigned char i;

	faddr = (c-32)*8;
	vaddr = cy << 8;
	vaddr = (vaddr & 0x1800) | (vaddr & 0x00E0) << 3 | (vaddr & 0x0700) >> 3;
	vaddr = PIX_BASE + vaddr + cx;
	caddr = CT_BASE + (cy*32) + cx;

	for (i=0; i < 8; i++) {
		poke(vaddr, font[faddr]);
		vaddr += 256;
		faddr++;
	}
	++cx;
}

/*******************************************************************************/
void vdp_prints(const char *str)
{
	char c;
	while ((c = *str++)) vdp_putchar(c);
}

void vdp_putchar_hex(unsigned char c)
{
	char const hex_chars[16] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

	vdp_putchar(hex_chars[ ( c & 0xF0 ) >> 4 ]);
	vdp_putchar(hex_chars[ ( c & 0x0F ) >> 0 ]);
	
}
