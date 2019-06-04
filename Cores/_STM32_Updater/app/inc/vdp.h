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

#ifndef _VDP_H
#define _VDP_H

#define MEM_BASE 0x4000
#define PIX_BASE (MEM_BASE + 0)				// 4000 a 57FF
#define CT_BASE  (MEM_BASE + 0x1800)		// 5800 a 5B00

enum {
	COLOR_BLACK		= 0,
	COLOR_BLUE,
	COLOR_RED,
	COLOR_MAGENTA,
	COLOR_GREEN,
	COLOR_CYAN,
	COLOR_YELLOW,
	COLOR_GRAY,
	COLOR_BLACK2,
	COLOR_LBLUE,
	COLOR_LRED,
	COLOR_LMAGENTA,
	COLOR_LGREEN,
	COLOR_LCYAN,
	COLOR_LYELLOW,
	COLOR_WHITE,
};

void vdp_init();
void vdp_setcolor(unsigned char border, unsigned char background, unsigned char foreground);
void vdp_setborder(unsigned char border);
void vdp_setflash(unsigned char flash);
void vdp_setfg(unsigned char foreground);
void vdp_setbg(unsigned char background);
void vdp_cls();
void vdp_gotoxy(unsigned char x, unsigned char y);
void vdp_gotox(unsigned char x);
void vdp_putchar(unsigned char c);
void vdp_prints(const char *str);
void puthex8(unsigned char v);
void puthex16(unsigned int v);

#endif	/* _VDP_H */