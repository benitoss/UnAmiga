;
;  TBBlue / ZX Spectrum Next project
;  Copyright (c) 2015 Fabio Belavenuto & Victor Trucco
;
;This program is free software: you can redistribute it and/or modify
;it under the terms of the GNU General Public License as published by
;the Free Software Foundation, either version 3 of the License, or
;(at your option) any later version.
;
;This program is distributed in the hope that it will be useful,
;but WITHOUT ANY WARRANTY; without even the implied warranty of
;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;GNU General Public License for more details.
;
;You should have received a copy of the GNU General Public License
;along with this program.  If not, see <http://www.gnu.org/licenses/>.
;

	.module spi
	.optsdcc -mz80

	.area	_CODE

PORTCFG		= 0xE7
PORTSPI		= 0xEB

; ------------------------------------------------
; Send 1 byte to flash
; ------------------------------------------------
; void SPI_sendcmd(unsigned char cmd)
_SPI_sendcmd::
	ld		iy, #0
	add		iy, sp
	ld		l, 2(iy)

	ld		a, #0x7F
	out		(PORTCFG), a			; /CS = 0
	ld		a, l
	out		(PORTSPI), a
	ld		a, #0xFF
	out		(PORTCFG), a			; /CS = 1
	ret

; ------------------------------------------------
; Send 3 bytes to flash
; ------------------------------------------------
; void SPI_send3bytes(unsigned char *buffer)
_SPI_send3bytes::
	pop		bc
	pop		hl
	push	hl
	push	bc

	ld		c, #PORTSPI
	ld		a, #0x7F
	out		(#PORTCFG), a			; /CS = 0	11 T-States
	.rept 3
	outi							; 			16 T-States
	.endm
	ld		a, #0xFF
	out		(PORTCFG), a			; /CS = 1
	ret

; ------------------------------------------------
; Send 4 bytes to flash
; ------------------------------------------------
; void SPI_send4bytes(unsigned char *buffer)
_SPI_send4bytes::
	pop		bc
	pop		hl
	push	hl
	push	bc

	ld		c, #PORTSPI
	ld		a, #0x7F
	out		(#PORTCFG), a			; /CS = 0	11 T-States
	.rept 4
	outi							; 			16 T-States
	.endm
	ld		a, #0xFF
	out		(PORTCFG), a			; /CS = 1
	ret

; ------------------------------------------------
; Send 1 byte to flash and receive answer
; ------------------------------------------------
; unsigned char SPI_sendcmd_recv(unsigned char cmd)
_SPI_sendcmd_recv::
	ld		hl, #2
	add		hl, sp
	ld		l, (hl)

	ld		c, #PORTSPI
	ld		a, #0x7F
	out		(#PORTCFG), a			; /CS = 0	11 T-States
	ld		a, l					; 			 4 T-States
	out		(c), a					; 			12 T-States
	nop								; 			 4 T-States
	in		a, (c)					; 			12 T-States
	nop								; 			 4 T-States
	in		l, (c)					; 			12 T-States
	ld		a, #0xFF
	out		(#PORTCFG), a			; /CS = 1
	ret

; ------------------------------------------------
; Send 4 bytes to flash and receive answer
; ------------------------------------------------
; unsigned char SPI_send4bytes_recv(unsigned char *buffer)
_SPI_send4bytes_recv::
	pop		bc
	pop		hl
	push	hl
	push	bc

	ld		c, #PORTSPI
	ld		a, #0x7F
	out		(#PORTCFG), a			; /CS = 0	11 T-States
	.rept 4
	outi							; 			16 T-States
	.endm
	in		a, (c)					; 			12 T-States
	nop								; 			 4 T-States
	in		a, (c)					; 			12 T-States
	nop								; 			 4 T-States
	in		a, (c)					; 			12 T-States
	ld		l, a					; 			 4 T-States
	ld		a, #0xFF
	out		(#PORTCFG), a			; /CS = 1
	ret

; ------------------------------------------------
; Writing data in flash (260 bytes)
; ------------------------------------------------
; void SPI_writebytes(unsigned char *buffer)
_SPI_writebytes::
	pop		bc
	pop		hl
	push	hl
	push	bc

	ld		c, #PORTSPI
	ld		a, #0x7F
	out		(#PORTCFG), a			; /CS = 0	11 T-States
	.rept 260
	outi							; 			16 T-States
	.endm
	ld		a, #0xFF
	out		(#PORTCFG), a			; /CS = 1
	ret
