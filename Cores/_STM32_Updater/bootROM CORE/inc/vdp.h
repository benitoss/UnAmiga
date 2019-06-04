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
#define PIX_BASE (MEM_BASE + 0)				// 0x4000 - 0x57FF
#define CT_BASE  (MEM_BASE + 0x1800)		// 0x5800 - 0x5AFF

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

void vdp_clear();
void vdp_gotoxy(unsigned char x, unsigned char y);
void vdp_putchar(unsigned char c);
void vdp_prints(const char *str);
void vdp_putchar_hex(unsigned char c);

#endif	/* _VDP_H */