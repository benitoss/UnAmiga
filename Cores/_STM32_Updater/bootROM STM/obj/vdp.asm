;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Sat Jun  1 21:33:05 2019
;--------------------------------------------------------
	.module vdp
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_ordered_palette
	.globl _cy
	.globl _cx
	.globl _caddr
	.globl _vaddr
	.globl _faddr
	.globl _font
	.globl _vdp_clear
	.globl _vdp_gotoxy
	.globl _vdp_putchar
	.globl _vdp_prints
	.globl _vdp_putchar_hex
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_SD_CONTROL	=	0x00e7
_SD_STATUS	=	0x00e7
_SD_DATA	=	0x00eb
_ULAPORT	=	0x00fe
_REG_NUM	=	0x243b
_REG_VAL	=	0x253b
_REG_STM32_RESET	=	0x303b
_LED	=	0x103b
_REG_TX	=	0x133b
_REG_RX	=	0x143b
_HROW0	=	0xfefe
_HROW1	=	0xfdfe
_HROW2	=	0xfbfe
_HROW3	=	0xf7fe
_HROW4	=	0xeffe
_HROW5	=	0xdffe
_HROW6	=	0xbffe
_HROW7	=	0x7ffe
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_faddr::
	.ds 2
_vaddr::
	.ds 2
_caddr::
	.ds 2
_cx::
	.ds 1
_cy::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/vdp.c:37: void set_ordered_palette()
;	---------------------------------
; Function set_ordered_palette
; ---------------------------------
_set_ordered_palette::
;src/vdp.c:41: REG_NUM = 64; 
	ld	a,#0x40
	ld	bc,#_REG_NUM
	out	(c),a
;src/vdp.c:42: REG_VAL = 0;
	ld	a,#0x00
	ld	bc,#_REG_VAL
	out	(c),a
;src/vdp.c:44: REG_NUM = 65; 
	ld	a,#0x41
	ld	bc,#_REG_NUM
	out	(c),a
;src/vdp.c:46: for (c = 0; c<256;c++)
	ld	de,#0x0000
00102$:
;src/vdp.c:48: REG_VAL = c;
	ld	bc,#_REG_VAL
	out	(c),e
;src/vdp.c:46: for (c = 0; c<256;c++)
	inc	de
	ld	a,d
	sub	a, #0x01
	jr	C,00102$
	ret
_font:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x7E	; 126
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x7E	; 126
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x3E	; 62
	.db #0x28	; 40
	.db #0x3E	; 62
	.db #0x0A	; 10
	.db #0x3E	; 62
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x62	; 98	'b'
	.db #0x64	; 100	'd'
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x2A	; 42
	.db #0x44	; 68	'D'
	.db #0x3A	; 58
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x3E	; 62
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x3E	; 62
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3E	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x46	; 70	'F'
	.db #0x4A	; 74	'J'
	.db #0x52	; 82	'R'
	.db #0x62	; 98	'b'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x3E	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x42	; 66	'B'
	.db #0x02	; 2
	.db #0x3C	; 60
	.db #0x40	; 64
	.db #0x7E	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x42	; 66	'B'
	.db #0x0C	; 12
	.db #0x02	; 2
	.db #0x42	; 66	'B'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x48	; 72	'H'
	.db #0x7E	; 126
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7E	; 126
	.db #0x40	; 64
	.db #0x7C	; 124
	.db #0x02	; 2
	.db #0x42	; 66	'B'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x40	; 64
	.db #0x7C	; 124
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7E	; 126
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x42	; 66	'B'
	.db #0x3C	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3E	; 62
	.db #0x02	; 2
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3E	; 62
	.db #0x00	; 0
	.db #0x3E	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x42	; 66	'B'
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x4A	; 74	'J'
	.db #0x56	; 86	'V'
	.db #0x5E	; 94
	.db #0x40	; 64
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x7E	; 126
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7C	; 124
	.db #0x42	; 66	'B'
	.db #0x7C	; 124
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x7C	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x42	; 66	'B'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7E	; 126
	.db #0x40	; 64
	.db #0x7C	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7E	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7E	; 126
	.db #0x40	; 64
	.db #0x7C	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x42	; 66	'B'
	.db #0x40	; 64
	.db #0x4E	; 78	'N'
	.db #0x42	; 66	'B'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x7E	; 126
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3E	; 62
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x3E	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x48	; 72	'H'
	.db #0x70	; 112	'p'
	.db #0x48	; 72	'H'
	.db #0x44	; 68	'D'
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7E	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x66	; 102	'f'
	.db #0x5A	; 90	'Z'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x62	; 98	'b'
	.db #0x52	; 82	'R'
	.db #0x4A	; 74	'J'
	.db #0x46	; 70	'F'
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7C	; 124
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x7C	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x52	; 82	'R'
	.db #0x4A	; 74	'J'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7C	; 124
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x7C	; 124
	.db #0x44	; 68	'D'
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x40	; 64
	.db #0x3C	; 60
	.db #0x02	; 2
	.db #0x42	; 66	'B'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFE	; 254
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x5A	; 90	'Z'
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7E	; 126
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x7E	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x54	; 84	'T'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x22	; 34
	.db #0x78	; 120	'x'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x7E	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x3C	; 60
	.db #0x44	; 68	'D'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3C	; 60
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x3C	; 60
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3C	; 60
	.db #0x04	; 4
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3C	; 60
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3C	; 60
	.db #0x04	; 4
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7C	; 124
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x7C	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x42	; 66	'B'
	.db #0x99	; 153
	.db #0xA1	; 161
	.db #0xA1	; 161
	.db #0x99	; 153
	.db #0x42	; 66	'B'
	.db #0x3C	; 60
;src/vdp.c:53: void vdp_clear()
;	---------------------------------
; Function vdp_clear
; ---------------------------------
_vdp_clear::
;src/vdp.c:59: cx = cy = 0;
	ld	hl,#_cy + 0
	ld	(hl), #0x00
	ld	hl,#_cx + 0
	ld	(hl), #0x00
;src/vdp.c:63: for (c = PIX_BASE; c < (PIX_BASE+6144); c++)
	ld	de,#0x4000
00103$:
;src/vdp.c:64: poke(c, 0);
	ld	l, e
	ld	h, d
	ld	(hl),#0x00
;src/vdp.c:63: for (c = PIX_BASE; c < (PIX_BASE+6144); c++)
	inc	de
	ld	a,d
	sub	a, #0x58
	jr	C,00103$
;src/vdp.c:65: for (c = CT_BASE; c < (CT_BASE+768); c++)
	ld	de,#0x5800
00105$:
;src/vdp.c:66: poke(c, v);
	ld	l, e
	ld	h, d
	ld	(hl),#0x47
;src/vdp.c:65: for (c = CT_BASE; c < (CT_BASE+768); c++)
	inc	de
	ld	a,d
	sub	a, #0x5B
	jr	C,00105$
	ret
;src/vdp.c:72: void vdp_gotoxy(unsigned char x, unsigned char y)
;	---------------------------------
; Function vdp_gotoxy
; ---------------------------------
_vdp_gotoxy::
;src/vdp.c:74: cx = x & 31;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x1F
	ld	(#_cx + 0),a
;src/vdp.c:75: cy = y;
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	ld	(#_cy + 0),a
;src/vdp.c:76: if (cy > 23) cy = 23;
	ld	a,#0x17
	ld	iy,#_cy
	sub	a, 0 (iy)
	ret	NC
	ld	hl,#_cy + 0
	ld	(hl), #0x17
	ret
;src/vdp.c:80: void vdp_putchar(unsigned char c)
;	---------------------------------
; Function vdp_putchar
; ---------------------------------
_vdp_putchar::
	push	af
	push	af
;src/vdp.c:84: faddr = (c-32)*8;
	ld	hl, #6+0
	add	hl, sp
	ld	a, (hl)
	ld	b, #0x00
	add	a,#0xE0
	ld	e,a
	ld	a,b
	adc	a,#0xFF
	ld	d,a
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ld	(_faddr),de
;src/vdp.c:85: vaddr = cy << 8;
	ld	a,(#_cy + 0)
	ld	iy,#2
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	a,0 (iy)
	ld	(#_vaddr + 1),a
	ld	hl,#_vaddr + 0
	ld	(hl), #0x00
;src/vdp.c:86: vaddr = (vaddr & 0x1800) | (vaddr & 0x00E0) << 3 | (vaddr & 0x0700) >> 3;
	ld	e,#0x00
	ld	a,(#_vaddr + 1)
	and	a, #0x18
	ld	d,a
	ld	a,(#_vaddr + 0)
	and	a, #0xE0
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,e
	or	a, l
	ld	e,a
	ld	a,d
	or	a, h
	ld	d,a
	ld	c,#0x00
	ld	a,(#_vaddr + 1)
	and	a, #0x07
	ld	b,a
	ld	a,#0x03
00117$:
	srl	b
	rr	c
	dec	a
	jr	NZ,00117$
	ld	a,e
	or	a, c
	ld	(#_vaddr + 0),a
	ld	a,d
	or	a, b
	ld	(#_vaddr + 1),a
;src/vdp.c:87: vaddr = PIX_BASE + vaddr + cx;
	ld	hl,#0
	add	hl,sp
	ld	a,(#_vaddr + 0)
	ld	(hl),a
	ld	a,(#_vaddr + 1)
	add	a,#0x40
	inc	hl
	ld	(hl),a
	ld	hl,#_cx + 0
	ld	d, (hl)
	ld	e,#0x00
	ld	c, d
	ld	b, e
	ld	hl,#_vaddr
	ld	iy,#0
	add	iy,sp
	ld	a,0 (iy)
	add	a, c
	ld	(hl),a
	ld	a,1 (iy)
	adc	a, b
	inc	hl
	ld	(hl),a
;src/vdp.c:88: caddr = CT_BASE + (cy*32) + cx;
	pop	bc
	pop	hl
	push	hl
	push	bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	a,h
	add	a,#0x58
	ld	b,a
	ld	a,c
	ld	hl,#_caddr
	add	a, d
	ld	(hl),a
	ld	a,b
	adc	a, e
	inc	hl
	ld	(hl),a
;src/vdp.c:90: for (i=0; i < 8; i++) {
	ld	d,#0x00
00102$:
;src/vdp.c:91: poke(vaddr, font[faddr]);
	ld	bc,(_vaddr)
	ld	iy,#_font
	push	bc
	ld	bc,(_faddr)
	add	iy, bc
	pop	bc
	ld	a, 0 (iy)
	ld	(bc),a
;src/vdp.c:92: vaddr += 256;
	ld	hl,#_vaddr
	ld	a,(hl)
	add	a, #0x00
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x01
	ld	(hl),a
;src/vdp.c:93: faddr++;
	ld	hl, #_faddr+0
	inc	(hl)
	jr	NZ,00118$
	ld	hl, #_faddr+1
	inc	(hl)
00118$:
;src/vdp.c:90: for (i=0; i < 8; i++) {
	inc	d
	ld	a,d
	sub	a, #0x08
	jr	C,00102$
;src/vdp.c:95: ++cx;
	ld	hl, #_cx+0
	inc	(hl)
	pop	af
	pop	af
	ret
;src/vdp.c:99: void vdp_prints(const char *str)
;	---------------------------------
; Function vdp_prints
; ---------------------------------
_vdp_prints::
;src/vdp.c:102: while ((c = *str++)) vdp_putchar(c);
	pop	bc
	pop	hl
	push	hl
	push	bc
00101$:
	ld	a,(hl)
	inc	hl
	ld	d,a
	or	a, a
	ret	Z
	push	hl
	push	de
	inc	sp
	call	_vdp_putchar
	inc	sp
	pop	hl
	jr	00101$
;src/vdp.c:105: void vdp_putchar_hex(unsigned char c)
;	---------------------------------
; Function vdp_putchar_hex
; ---------------------------------
_vdp_putchar_hex::
	ld	hl,#-16
	add	hl,sp
	ld	sp,hl
;src/vdp.c:107: char const hex_chars[16] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
	ld	hl,#0x0000
	add	hl,sp
	ex	de,hl
	ld	a,#0x30
	ld	(de),a
	ld	l, e
	ld	h, d
	inc	hl
	ld	(hl),#0x31
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl),#0x32
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#0x33
	ld	hl,#0x0004
	add	hl,de
	ld	(hl),#0x34
	ld	hl,#0x0005
	add	hl,de
	ld	(hl),#0x35
	ld	hl,#0x0006
	add	hl,de
	ld	(hl),#0x36
	ld	hl,#0x0007
	add	hl,de
	ld	(hl),#0x37
	ld	hl,#0x0008
	add	hl,de
	ld	(hl),#0x38
	ld	hl,#0x0009
	add	hl,de
	ld	(hl),#0x39
	ld	hl,#0x000A
	add	hl,de
	ld	(hl),#0x41
	ld	hl,#0x000B
	add	hl,de
	ld	(hl),#0x42
	ld	hl,#0x000C
	add	hl,de
	ld	(hl),#0x43
	ld	hl,#0x000D
	add	hl,de
	ld	(hl),#0x44
	ld	hl,#0x000E
	add	hl,de
	ld	(hl),#0x45
	ld	hl,#0x000F
	add	hl,de
	ld	(hl),#0x46
;src/vdp.c:109: vdp_putchar(hex_chars[ ( c & 0xF0 ) >> 4 ]);
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0xF0
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	l, a
	ld	h,#0x00
	add	hl,de
	ld	h,(hl)
	push	de
	push	hl
	inc	sp
	call	_vdp_putchar
	inc	sp
	pop	de
;src/vdp.c:110: vdp_putchar(hex_chars[ ( c & 0x0F ) >> 0 ]);
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x0F
	ld	l, a
	ld	h,#0x00
	add	hl,de
	ld	h,(hl)
	push	hl
	inc	sp
	call	_vdp_putchar
	inc	sp
	ld	hl,#16
	add	hl,sp
	ld	sp,hl
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
