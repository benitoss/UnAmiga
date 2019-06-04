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
/*
  TBBlue / ZX Spectrum Next project
  Copyright (c) 2015 Fabio Belavenuto & Victor Trucco
*/

#ifndef SPI_H
#define SPI_H


void SPI_sendcmd(unsigned char cmd);
void SPI_send3bytes(unsigned char *buffer);
void SPI_send4bytes(unsigned char *buffer);
unsigned char SPI_sendcmd_recv(unsigned char cmd);
unsigned char SPI_send4bytes_recv(unsigned char *buffer);
void SPI_writebytes(unsigned char *buffer);

#endif

