;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Sun Jun  2 21:16:46 2019
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl __send_command
	.globl __talk
	.globl __read
	.globl __write
	.globl _FileRead
	.globl _FileOpen
	.globl _FindDrive
	.globl _MMC_Init
	.globl _vdp_prints
	.globl _vdp_gotoxy
	.globl _vdp_clear
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
_error_count:
	.ds 1
_l:
	.ds 1
_buffer_rd:
	.ds 512
_buffer_wr:
	.ds 512
_temp:
	.ds 256
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_fn_firmware:
	.ds 2
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
;src/main.c:40: static void display_error(unsigned char *message)
;	---------------------------------
; Function display_error
; ---------------------------------
_display_error:
;src/main.c:42: vdp_clear();
	call	_vdp_clear
;src/main.c:44: vdp_gotoxy(1, 11);
	ld	hl,#0x0B01
	push	hl
	call	_vdp_gotoxy
;src/main.c:45: vdp_prints("Error: ");
	ld	hl, #___str_0
	ex	(sp),hl
	call	_vdp_prints
	pop	af
;src/main.c:46: vdp_prints(message);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_vdp_prints
;src/main.c:47: vdp_gotoxy(1, 13);
	ld	hl, #0x0D01
	ex	(sp),hl
	call	_vdp_gotoxy
;src/main.c:48: vdp_prints("Press button 1 to try again");
	ld	hl, #___str_1
	ex	(sp),hl
	call	_vdp_prints
	pop	af
;src/main.c:50: DisableCard();
	ld	a,#0xFF
	out	(_SD_CONTROL),a
;src/main.c:51: ULAPORT = COLOR_RED;
	ld	a,#0x02
	out	(_ULAPORT),a
00103$:
	jr	00103$
___str_0:
	.ascii "Error: "
	.db 0x00
___str_1:
	.ascii "Press button 1 to try again"
	.db 0x00
;src/main.c:55: static void delay(int v)
;	---------------------------------
; Function delay
; ---------------------------------
_delay:
;src/main.c:59: for (f = 0; f < v; f++)
	ld	de,#0x0000
00103$:
	ld	hl,#2
	add	hl,sp
	ld	a,e
	sub	a, (hl)
	ld	a,d
	inc	hl
	sbc	a, (hl)
	jp	PO, 00116$
	xor	a, #0x80
00116$:
	ret	P
;src/main.c:61: __asm__("nop");
	nop
;src/main.c:59: for (f = 0; f < v; f++)
	inc	de
	jr	00103$
;src/main.c:66: static void clear_rx_buffer()
;	---------------------------------
; Function clear_rx_buffer
; ---------------------------------
_clear_rx_buffer:
;src/main.c:71: for (f = 0; f< 256; f++)
	ld	de,#0x0000
00102$:
;src/main.c:73: temp = REG_RX;
	ld	a,#>(_REG_RX)
	in	a,(#<(_REG_RX))
;src/main.c:75: delay(8);
	push	de
	ld	hl,#0x0008
	push	hl
	call	_delay
	pop	af
	pop	de
;src/main.c:71: for (f = 0; f< 256; f++)
	inc	de
	ld	a,d
	sub	a, #0x01
	jr	C,00102$
	ret
;src/main.c:80: static void send_char_tx(unsigned char v)
;	---------------------------------
; Function send_char_tx
; ---------------------------------
_send_char_tx:
;src/main.c:84: REG_TX = v;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	ld	bc,#_REG_TX
	out	(c),a
;src/main.c:86: delay(8);
	ld	hl,#0x0008
	push	hl
	call	_delay
	pop	af
	ret
;src/main.c:96: int _write( int cnt_wr )
;	---------------------------------
; Function _write
; ---------------------------------
__write::
;src/main.c:102: for (i = 0; i < cnt_wr; i++ ) send_char_tx( buffer_wr[ i ] );
	ld	de,#0x0000
00103$:
	ld	hl,#2
	add	hl,sp
	ld	a,e
	sub	a, (hl)
	ld	a,d
	inc	hl
	sbc	a, (hl)
	jp	PO, 00116$
	xor	a, #0x80
00116$:
	jp	P,00101$
	ld	hl,#_buffer_wr
	add	hl,de
	ld	h,(hl)
	push	de
	push	hl
	inc	sp
	call	_send_char_tx
	inc	sp
	pop	de
	inc	de
	jr	00103$
00101$:
;src/main.c:104: return 0;
	ld	hl,#0x0000
	ret
;src/main.c:108: int _read(int cnt_rd, int timeout)
;	---------------------------------
; Function _read
; ---------------------------------
__read::
;src/main.c:114: for (i = 0; i < cnt_rd; i++ ) 
	ld	de,#0x0000
00109$:
	ld	hl,#2
	add	hl,sp
	ld	a,e
	sub	a, (hl)
	ld	a,d
	inc	hl
	sbc	a, (hl)
	jp	PO, 00138$
	xor	a, #0x80
00138$:
	jp	P,00107$
;src/main.c:117: temp = timeout;
	ld	iy,#4
	add	iy,sp
	ld	c,0 (iy)
	ld	b,1 (iy)
;src/main.c:119: empty = REG_TX;
	ld	a,#>(_REG_TX)
	in	a,(#<(_REG_TX))
;src/main.c:121: while (((empty & 1) == 0) && temp > 0) // nothing to read yet
00102$:
	rrca
	jr	C,00104$
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00141$
	xor	a, #0x80
00141$:
	jp	P,00104$
;src/main.c:123: delay(8);
	push	bc
	push	de
	ld	hl,#0x0008
	push	hl
	call	_delay
	pop	af
	pop	de
	pop	bc
;src/main.c:124: temp -= 1;
	dec	bc
;src/main.c:125: empty = REG_TX;
	ld	a,#>(_REG_TX)
	in	a,(#<(_REG_TX))
	jr	00102$
00104$:
;src/main.c:128: if ( temp == 0) return -1;
	ld	a,b
	or	a,c
	jr	NZ,00106$
	ld	hl,#0xFFFF
	ret
00106$:
;src/main.c:130: buffer_rd[ i ] = REG_RX;
	ld	hl,#_buffer_rd
	add	hl,de
	ld	a,#>(_REG_RX)
	in	a,(#<(_REG_RX))
	ld	(hl),a
;src/main.c:114: for (i = 0; i < cnt_rd; i++ ) 
	inc	de
	jr	00109$
00107$:
;src/main.c:135: return 0;
	ld	hl,#0x0000
	ret
;src/main.c:139: int _talk(int cnt_rd, int cnt_wr, int timeout)
;	---------------------------------
; Function _talk
; ---------------------------------
__talk::
	push	af
	dec	sp
;src/main.c:141: unsigned char xor = buffer_wr[0];
	ld	bc,#_buffer_wr+0
	ld	a,(bc)
	ld	d,a
	inc	sp
	push	de
	inc	sp
;src/main.c:145: if ( cnt_wr > 1 )
	ld	a,#0x01
	ld	iy,#7
	add	iy,sp
	cp	a, 0 (iy)
	ld	a,#0x00
	sbc	a, 1 (iy)
	jp	PO, 00129$
	xor	a, #0x80
00129$:
	jp	P,00103$
;src/main.c:147: for (i=1; i < cnt_wr; i++)
	ld	de,#0x0001
00108$:
;src/main.c:149: xor ^= buffer_wr[i];	
	ld	a,c
	ld	hl,#1
	add	hl,sp
	add	a, e
	ld	(hl),a
	ld	a,b
	adc	a, d
	inc	hl
	ld	(hl),a
;src/main.c:147: for (i=1; i < cnt_wr; i++)
	ld	hl,#7
	add	hl,sp
	ld	a,e
	sub	a, (hl)
	ld	a,d
	inc	hl
	sbc	a, (hl)
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	jp	P,00101$
;src/main.c:149: xor ^= buffer_wr[i];	
	ld	hl, #1
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	a,(hl)
	ld	iy,#0
	add	iy,sp
	xor	a, 0 (iy)
	inc	sp
	push	af
	inc	sp
;src/main.c:147: for (i=1; i < cnt_wr; i++)
	inc	de
	jr	00108$
00101$:
;src/main.c:151: buffer_wr[i] = xor;
	ld	hl, #1
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	iy,#0
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	jr	00104$
00103$:
;src/main.c:155: buffer_wr[1] = buffer_wr[0] ^ 0xff;
	inc	bc
	ld	a,d
	xor	a, #0xFF
	ld	(bc),a
00104$:
;src/main.c:158: cnt_wr++; //because the XOR at the end
	ld	iy,#7
	add	iy,sp
	inc	0 (iy)
	jr	NZ,00131$
	inc	1 (iy)
00131$:
;src/main.c:159: _write(cnt_wr);
	ld	l,0 (iy)
	ld	h,1 (iy)
	push	hl
	call	__write
	pop	af
;src/main.c:161: res = _read(cnt_rd, timeout);
	ld	hl, #9
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #7
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__read
	pop	af
	pop	af
;src/main.c:163: if (res == -1)
	ld	a,l
	inc	a
	jr	NZ,00106$
	ld	a,h
	inc	a
	jr	NZ,00106$
;src/main.c:164: display_error("No answer from STM");
	ld	de,#___str_2+0
	push	hl
	push	de
	call	_display_error
	pop	af
	pop	hl
00106$:
;src/main.c:166: return res;
	pop	af
	inc	sp
	ret
___str_2:
	.ascii "No answer from STM"
	.db 0x00
;src/main.c:170: int _send_command(unsigned char cmd, int cnt_rd, int cnt_wr)
;	---------------------------------
; Function _send_command
; ---------------------------------
__send_command::
;src/main.c:175: if ( cnt_rd == 0 )
	ld	iy,#3
	add	iy,sp
	ld	a,1 (iy)
	or	a,0 (iy)
	jr	NZ,00102$
;src/main.c:176: cnt_rd = 1;
	ld	0 (iy),#0x01
	ld	1 (iy),#0x00
	jr	00103$
00102$:
;src/main.c:178: cnt_rd += 2;
	ld	hl,#3
	add	hl,sp
	ld	a,(hl)
	add	a, #0x02
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
00103$:
;src/main.c:180: buffer_wr[0] = cmd;
	ld	hl,#_buffer_wr+0
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
;src/main.c:182: res = _talk( cnt_rd, cnt_wr, 1000 );
	ld	hl,#0x03E8
	push	hl
	ld	hl, #7
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #7
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__talk
	pop	af
	pop	af
	pop	af
;src/main.c:184: if (buffer_rd[0] != CMD_ACK)
	ld	a, (#_buffer_rd + 0)
	sub	a, #0x79
	jr	Z,00105$
;src/main.c:186: display_error("No ACK for command");
	ld	hl,#___str_3
	push	hl
	call	_display_error
	pop	af
;src/main.c:187: return -1;
	ld	hl,#0xFFFF
	ret
00105$:
;src/main.c:190: return 0;
	ld	hl,#0x0000
	ret
___str_3:
	.ascii "No ACK for command"
	.db 0x00
;src/main.c:194: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	ld	hl,#-38
	add	hl,sp
	ld	sp,hl
;src/main.c:196: unsigned char *mem   = (unsigned char *)0x6000;
	ld	hl, #20
	add	hl, sp
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x60
;src/main.c:216: REG_NUM = REG_MACHID;
	ld	a,#0x00
	ld	bc,#_REG_NUM
	out	(c),a
;src/main.c:217: mach_id = REG_VAL;
	ld	a,#>(_REG_VAL)
	in	a,(#<(_REG_VAL))
;src/main.c:218: REG_NUM = REG_VERSION;
	ld	a,#0x01
	ld	bc,#_REG_NUM
	out	(c),a
;src/main.c:219: mach_version = REG_VAL;
	ld	a,#>(_REG_VAL)
	in	a,(#<(_REG_VAL))
;src/main.c:220: REG_NUM = REG_RESET;
	ld	a,#0x02
	ld	bc,#_REG_NUM
	out	(c),a
;src/main.c:221: reset_type = REG_VAL & RESET_POWERON;
	ld	a,#>(_REG_VAL)
	in	a,(#<(_REG_VAL))
;src/main.c:222: REG_NUM = REG_ANTIBRICK;
	ld	a,#0x10
	ld	bc,#_REG_NUM
	out	(c),a
;src/main.c:223: buttons = REG_VAL & (AB_BTN_DIVMMC | AB_BTN_MULTIFACE);
	ld	a,#>(_REG_VAL)
	in	a,(#<(_REG_VAL))
;src/main.c:226: vdp_clear();
	call	_vdp_clear
;src/main.c:228: ULAPORT = COLOR_CYAN;				// Cyan border 
	ld	a,#0x05
	out	(_ULAPORT),a
;src/main.c:230: vdp_gotoxy(4, 5);
	ld	hl,#0x0504
	push	hl
	call	_vdp_gotoxy
;src/main.c:231: vdp_prints("UnAmiga STM32 Updater");
	ld	hl, #___str_4
	ex	(sp),hl
	call	_vdp_prints
;src/main.c:233: vdp_gotoxy(1, 9);
	ld	hl, #0x0901
	ex	(sp),hl
	call	_vdp_gotoxy
;src/main.c:234: vdp_prints("Change the STM32 boot0 jumper");
	ld	hl, #___str_5
	ex	(sp),hl
	call	_vdp_prints
;src/main.c:235: vdp_gotoxy(1, 10);
	ld	hl, #0x0A01
	ex	(sp),hl
	call	_vdp_gotoxy
;src/main.c:236: vdp_prints("press the STM32 reset button");
	ld	hl, #___str_6
	ex	(sp),hl
	call	_vdp_prints
;src/main.c:237: vdp_gotoxy(8, 11);
	ld	hl, #0x0B08
	ex	(sp),hl
	call	_vdp_gotoxy
;src/main.c:238: vdp_prints("and press ENTER");
	ld	hl, #___str_7
	ex	(sp),hl
	call	_vdp_prints
;src/main.c:242: vdp_gotoxy(3, 19);
	ld	hl, #0x1303
	ex	(sp),hl
	call	_vdp_gotoxy
;src/main.c:243: vdp_prints("Original by Victor Trucco");
	ld	hl, #___str_8
	ex	(sp),hl
	call	_vdp_prints
;src/main.c:245: vdp_gotoxy(5, 21);
	ld	hl, #0x1505
	ex	(sp),hl
	call	_vdp_gotoxy
;src/main.c:246: vdp_prints("Adapted by Benitoss");
	ld	hl, #___str_9
	ex	(sp),hl
	call	_vdp_prints
;src/main.c:248: vdp_gotoxy(25, 23);
	ld	hl, #0x1719
	ex	(sp),hl
	call	_vdp_gotoxy
;src/main.c:249: vdp_prints("V 1.01");
	ld	hl, #___str_10
	ex	(sp),hl
	call	_vdp_prints
	pop	af
;src/main.c:253: while ((HROW6 & 0x01) == 1) { }
00101$:
	ld	a,#>(_HROW6)
	in	a,(#<(_HROW6))
	and	a, #0x01
	dec	a
	jr	Z,00101$
;src/main.c:256: vdp_gotoxy(6, 15);
	ld	hl,#0x0F06
	push	hl
	call	_vdp_gotoxy
;src/main.c:257: vdp_prints("Are you sure? (Y/N)");
	ld	hl, #___str_11
	ex	(sp),hl
	call	_vdp_prints
	pop	af
;src/main.c:260: while (((HROW5 & 0x10) >> 4) == 1) { }
00104$:
	ld	a,#>(_HROW5)
	in	a,(#<(_HROW5))
	and	a, #0x10
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	dec	a
	jr	Z,00104$
;src/main.c:262: vdp_clear();	
	call	_vdp_clear
;src/main.c:267: REG_STM32_RESET = 1;
	ld	a,#0x01
	ld	bc,#_REG_STM32_RESET
	out	(c),a
;src/main.c:268: for (c=0; c< 30000; c++) __asm__("nop");	
	ld	de,#0x7530
00172$:
	nop
	dec	de
	ld	a,d
;src/main.c:269: REG_STM32_RESET = 0;
	or	a,e
	jr	NZ,00172$
	ld	bc,#_REG_STM32_RESET
	out	(c),a
;src/main.c:278: error_count = 10;
	ld	hl,#_error_count + 0
	ld	(hl), #0x0A
;src/main.c:279: while(error_count > 0) {
00114$:
	ld	a,(#_error_count + 0)
	or	a, a
	jr	Z,00116$
;src/main.c:280: if (!MMC_Init()) {
	call	_MMC_Init
	ld	a,l
	or	a, a
	jr	NZ,00109$
;src/main.c:282: display_error("Fail to init the SD card");
	ld	hl,#___str_12
	push	hl
	call	_display_error
	pop	af
00109$:
;src/main.c:285: if (!FindDrive()) {
	call	_FindDrive
	ld	a,l
	or	a, a
	jr	NZ,00116$
;src/main.c:286: --error_count;
	ld	hl, #_error_count+0
	dec	(hl)
;src/main.c:287: for (c = 0; c < 65000; c++);
	ld	de,#0xFDE8
00175$:
	dec	de
	ld	a,d
	or	a,e
	jr	NZ,00175$
	jr	00114$
;src/main.c:289: break;
00116$:
;src/main.c:292: if (error_count == 0) {
	ld	a,(#_error_count + 0)
	or	a, a
	jr	NZ,00118$
;src/main.c:294: display_error("Fail to mount the SD card");
	ld	hl,#___str_13
	push	hl
	call	_display_error
	pop	af
00118$:
;src/main.c:304: if (!FileOpen(&file, fn_firmware)) 
	ld	hl,#0x0002
	add	hl,sp
	ld	iy,#36
	add	iy,sp
	ld	0 (iy),l
	ld	1 (iy),h
	ld	e,0 (iy)
	ld	d,1 (iy)
	ld	hl,(_fn_firmware)
	push	hl
	push	de
	call	_FileOpen
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jr	NZ,00120$
;src/main.c:307: display_error("Fail to open UPDATE.STM");
	ld	hl,#___str_14
	push	hl
	call	_display_error
	pop	af
00120$:
;src/main.c:316: num_blocks = file.size / 512;
	ld	hl, #36
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0004
	add	hl, de
	ld	a,(hl)
	ld	iy,#26
	add	iy,sp
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	1 (iy),a
	inc	hl
	ld	a,(hl)
	ld	2 (iy),a
	inc	hl
	ld	a,(hl)
	ld	3 (iy),a
	push	af
	ld	l,0 (iy)
	ld	h,1 (iy)
	ld	e,2 (iy)
	ld	d,3 (iy)
	pop	af
	ld	b,#0x09
00370$:
	srl	d
	rr	e
	rr	h
	rr	l
	djnz	00370$
	ld	iy,#18
	add	iy,sp
	ld	0 (iy),l
	ld	1 (iy),h
;src/main.c:318: if (num_blocks * 512 < file.size)
	ld	a,0 (iy)
	add	a, a
	ld	d,a
	ld	e,#0x00
	ld	bc,#0x0000
	ld	hl,#26
	add	hl,sp
	ld	a,e
	sub	a, (hl)
	ld	a,d
	inc	hl
	sbc	a, (hl)
	ld	a,b
	inc	hl
	sbc	a, (hl)
	ld	a,c
	inc	hl
	sbc	a, (hl)
	jr	NC,00122$
;src/main.c:320: num_blocks++;
	inc	0 (iy)
	jr	NZ,00372$
	inc	1 (iy)
00372$:
00122$:
;src/main.c:353: vdp_gotoxy(0, 5);
	ld	hl,#0x0500
	push	hl
	call	_vdp_gotoxy
;src/main.c:354: vdp_prints("Listening the STM: ");
	ld	hl, #___str_15
	ex	(sp),hl
	call	_vdp_prints
	pop	af
;src/main.c:356: while (1)
00126$:
;src/main.c:359: send_char_tx(CMD_INIT);
	ld	a,#0x7F
	push	af
	inc	sp
	call	_send_char_tx
	inc	sp
;src/main.c:360: delay(8);
	ld	hl,#0x0008
	push	hl
	call	_delay
	pop	af
;src/main.c:361: res = REG_RX;
	ld	a,#>(_REG_RX)
	in	a,(#<(_REG_RX))
;src/main.c:362: if (res == CMD_NOACK) break;
	sub	a, #0x1F
	jr	NZ,00126$
;src/main.c:365: clear_rx_buffer();
	call	_clear_rx_buffer
;src/main.c:367: vdp_prints("OK!");
	ld	hl,#___str_16
	push	hl
	call	_vdp_prints
;src/main.c:370: vdp_gotoxy(0, 7);
	ld	hl, #0x0700
	ex	(sp),hl
	call	_vdp_gotoxy
;src/main.c:371: vdp_prints("Connecting to the STM: ");
	ld	hl, #___str_17
	ex	(sp),hl
	call	_vdp_prints
	pop	af
;src/main.c:373: ret = _send_command(CMD_GET, 13, 1);
	ld	hl,#0x0001
	push	hl
	ld	l, #0x0D
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	__send_command
	pop	af
	pop	af
	inc	sp
	ld	c, l
;src/main.c:375: if (ret == 0)
	ld	a, h
	or	a,c
	jr	NZ,00129$
;src/main.c:388: vdp_prints("OK!");
	ld	hl,#___str_16
	push	hl
	call	_vdp_prints
	pop	af
	jr	00130$
00129$:
;src/main.c:393: display_error("Fail to connect to STM");
	ld	hl,#___str_18
	push	hl
	call	_display_error
	pop	af
00130$:
;src/main.c:398: vdp_gotoxy(0, 9);
	ld	hl,#0x0900
	push	hl
	call	_vdp_gotoxy
;src/main.c:399: vdp_prints("Erasing the STM: ");
	ld	hl, #___str_19
	ex	(sp),hl
	call	_vdp_prints
	pop	af
;src/main.c:402: ret = _send_command(CMD_ERASE, 0, 1);
	ld	hl,#0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	a,#0x43
	push	af
	inc	sp
	call	__send_command
	pop	af
	pop	af
	inc	sp
	ld	c, l
;src/main.c:404: if (ret == 0)
	ld	a, h
	or	a,c
	jr	NZ,00135$
;src/main.c:406: buffer_wr[0] = 0xff;
	ld	hl,#_buffer_wr+0
	ld	(hl),#0xFF
;src/main.c:407: buffer_wr[1] = 0x00;
	inc	hl
	ld	(hl),#0x00
;src/main.c:408: _write(2);
	ld	hl,#0x0002
	push	hl
	call	__write
;src/main.c:410: ret = _read(1, 1000);
	ld	hl, #0x03E8
	ex	(sp),hl
	ld	hl,#0x0001
	push	hl
	call	__read
	pop	af
	pop	af
;src/main.c:412: if (ret == -1)
	inc	l
	jr	NZ,00132$
	inc	h
	jr	NZ,00132$
;src/main.c:414: display_error("Fail to erase");
	ld	hl,#___str_20
	push	hl
	call	_display_error
	pop	af
	jr	00136$
00132$:
;src/main.c:418: vdp_prints("OK!");
	ld	hl,#___str_16
	push	hl
	call	_vdp_prints
	pop	af
	jr	00136$
00135$:
;src/main.c:424: display_error("Fail on erase command");
	ld	hl,#___str_21
	push	hl
	call	_display_error
	pop	af
00136$:
;src/main.c:430: vdp_gotoxy(0, 11);
	ld	hl,#0x0B00
	push	hl
	call	_vdp_gotoxy
;src/main.c:431: vdp_prints("Writing to memory: ");
	ld	hl, #___str_22
	ex	(sp),hl
	call	_vdp_prints
	pop	af
;src/main.c:433: stm_addr = 0;
	ld	hl, #26
	add	hl, sp
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:435: if (!FileOpen(&file, fn_firmware)) {
	ld	hl, #36
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl,(_fn_firmware)
	push	hl
	push	de
	call	_FileOpen
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jr	NZ,00217$
;src/main.c:437: display_error("Fail to open UPDATE.STM");
	ld	hl,#___str_14
	push	hl
	call	_display_error
	pop	af
;src/main.c:442: while  (blocks_read < num_blocks)
00217$:
	ld	hl, #36+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#32
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #36+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#32
	add	iy,sp
	ld	1 (iy),a
	ld	hl, #16
	add	hl, sp
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00148$:
	ld	hl,#18
	add	hl,sp
	ld	iy,#16
	add	iy,sp
	ld	a,0 (iy)
	sub	a, (hl)
	ld	a,1 (iy)
	inc	hl
	sbc	a, (hl)
	jp	NC,00150$
;src/main.c:444: FileRead(&file, mem); //read 512 bytes from file
	ld	hl, #32
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	iy,#20
	add	iy,sp
	ld	c,0 (iy)
	ld	b,1 (iy)
	push	bc
	push	hl
	call	_FileRead
	pop	af
	pop	af
;src/main.c:446: blocks_read++;
	ld	iy,#16
	add	iy,sp
	inc	0 (iy)
	jr	NZ,00377$
	inc	1 (iy)
00377$:
;src/main.c:448: for (i = 0; i < 2; i++)
	ld	hl, #26+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#34
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #26+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#34
	add	iy,sp
	ld	1 (iy),a
	ld	hl, #14
	add	hl, sp
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00178$:
;src/main.c:451: addr = 0x6000 + (i * 256); //point to the memory holding the data
	ld	hl, #14+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x00
	ld	hl,#0x6000
	add	hl,de
	ld	iy,#30
	add	iy,sp
	ld	0 (iy),l
	ld	1 (iy),h
;src/main.c:453: ret = _send_command(CMD_WRITE_MEMORY, 0, 1);
	ld	hl,#0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	a,#0x31
	push	af
	inc	sp
	call	__send_command
	pop	af
	pop	af
	inc	sp
	ld	c, l
	ld	b, h
;src/main.c:455: if (ret == 0)
	ld	a,b
	or	a,c
	jp	NZ,00145$
;src/main.c:458: buffer_wr[0] = 0x08;
	ld	hl,#_buffer_wr
	ld	(hl),#0x08
;src/main.c:459: buffer_wr[1] = 0x00;
	ld	hl,#(_buffer_wr + 0x0001)
	ld	(hl),#0x00
;src/main.c:460: buffer_wr[2] = stm_addr >> 8;
	ld	iy,#34
	add	iy,sp
	ld	e,1 (iy)
	ld	hl,#(_buffer_wr + 0x0002)
	ld	(hl),e
;src/main.c:461: buffer_wr[3] = stm_addr & 0xff;
	ld	d,0 (iy)
	ld	hl,#(_buffer_wr + 0x0003)
	ld	(hl),d
;src/main.c:462: buffer_wr[4] = buffer_wr[0] ^ buffer_wr[1] ^ buffer_wr[2] ^ buffer_wr[3]; // XOR
	ld	a, (#_buffer_wr + 0)
	ld	hl, #(_buffer_wr + 0x0001) + 0
	ld	l,(hl)
	xor	a, l
	xor	a, e
	xor	a, d
	ld	(#(_buffer_wr + 0x0004)),a
;src/main.c:463: _write(5);
	ld	hl,#0x0005
	push	hl
	call	__write
;src/main.c:465: ret = _read(1, 1000);
	ld	hl, #0x03E8
	ex	(sp),hl
	ld	hl,#0x0001
	push	hl
	call	__read
	pop	af
	pop	af
;src/main.c:467: if (ret == -1)
	inc	l
	jr	NZ,00140$
	inc	h
	jr	NZ,00140$
;src/main.c:469: display_error("Fail to write address");
	ld	hl,#___str_23
	push	hl
	call	_display_error
	pop	af
00140$:
;src/main.c:472: buffer_wr[0] = 0xff; // will write 255 bytes
	ld	hl,#_buffer_wr
	ld	(hl),#0xFF
;src/main.c:474: XOR = buffer_wr[0];
	ld	a, (#_buffer_wr + 0)
	ld	iy,#24
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),#0x00
;src/main.c:477: for (c=1; c<=256; c++)
	ld	hl, #30
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de,#0x0001
00176$:
;src/main.c:479: buffer_wr[ c ] = peek(addr); 
	ld	hl,#_buffer_wr
	add	hl,de
	ld	iy,#30
	add	iy,sp
	ld	0 (iy),l
	ld	1 (iy),h
	ld	l, c
	ld	h, b
	ld	a,(hl)
	ld	l,0 (iy)
	ld	h,1 (iy)
	ld	(hl),a
;src/main.c:481: XOR ^= buffer_wr[ c ];
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	hl, #24+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#30
	add	iy,sp
	xor	a, 0 (iy)
	ld	iy,#24
	add	iy,sp
	ld	0 (iy),a
	ld	a,1 (iy)
	ld	iy,#30
	add	iy,sp
	xor	a, 1 (iy)
	ld	iy,#24
	add	iy,sp
	ld	1 (iy),a
;src/main.c:483: addr++;
	inc	bc
;src/main.c:477: for (c=1; c<=256; c++)
	inc	de
	xor	a, a
	cp	a, e
	ld	a,#0x01
	sbc	a, d
	jr	NC,00176$
;src/main.c:486: buffer_wr[257] = XOR;
	ld	a,0 (iy)
	ld	(#(_buffer_wr + 0x0101)),a
;src/main.c:488: _write(258);
	ld	hl,#0x0102
	push	hl
	call	__write
;src/main.c:491: ret = _read(1, 1000);
	ld	hl, #0x03E8
	ex	(sp),hl
	ld	hl,#0x0001
	push	hl
	call	__read
	pop	af
	pop	af
;src/main.c:493: if (ret == -1)
	inc	l
	jr	NZ,00146$
	inc	h
	jr	NZ,00146$
;src/main.c:495: display_error("Fail to write bytes");
	ld	hl,#___str_24
	push	hl
	call	_display_error
	pop	af
	jr	00146$
00145$:
;src/main.c:500: display_error("Fail on write command");
	ld	hl,#___str_25
	push	hl
	call	_display_error
	pop	af
00146$:
;src/main.c:504: stm_addr += 256;
	ld	hl,#34
	add	hl,sp
	ld	a,(hl)
	add	a, #0x00
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x01
	ld	(hl),a
;src/main.c:448: for (i = 0; i < 2; i++)
	ld	iy,#14
	add	iy,sp
	inc	0 (iy)
	jr	NZ,00382$
	inc	1 (iy)
00382$:
	ld	a,0 (iy)
	sub	a, #0x02
	ld	a,1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00178$
;src/main.c:506: vdp_prints("*");
	ld	hl, #34+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#26
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #34+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#26
	add	iy,sp
	ld	1 (iy),a
	ld	hl,#___str_26
	push	hl
	call	_vdp_prints
	pop	af
	jp	00148$
00150$:
;src/main.c:509: vdp_prints(" OK!");
	ld	hl,#___str_27
	push	hl
	call	_vdp_prints
;src/main.c:513: vdp_gotoxy(0, 14);
	ld	hl, #0x0E00
	ex	(sp),hl
	call	_vdp_gotoxy
;src/main.c:514: vdp_prints("Verifying: ");
	ld	hl, #___str_28
	ex	(sp),hl
	call	_vdp_prints
	pop	af
;src/main.c:516: if (!FileOpen(&file, fn_firmware)) {
	ld	hl, #36
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl,(_fn_firmware)
	push	hl
	push	de
	call	_FileOpen
	pop	af
	pop	af
	ld	a,l
	or	a, a
	jr	NZ,00152$
;src/main.c:518: display_error("Fail to open UPDATE.STM");
	ld	hl,#___str_14
	push	hl
	call	_display_error
	pop	af
00152$:
;src/main.c:521: stm_addr = 0;
	ld	bc,#0x0000
;src/main.c:525: while  ( blocks_read < num_blocks ) 
	ld	hl, #36+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#30
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #36+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#30
	add	iy,sp
	ld	1 (iy),a
	ld	hl, #16
	add	hl, sp
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00166$:
	ld	hl,#18
	add	hl,sp
	ld	iy,#16
	add	iy,sp
	ld	a,0 (iy)
	sub	a, (hl)
	ld	a,1 (iy)
	inc	hl
	sbc	a, (hl)
	jp	NC,00168$
;src/main.c:527: FileRead(&file, mem); //read 512 bytes from file
	ld	hl, #30
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	bc
	ld	iy,#22
	add	iy,sp
	ld	e,0 (iy)
	ld	d,1 (iy)
	push	de
	push	hl
	call	_FileRead
	pop	af
	pop	af
	pop	bc
;src/main.c:529: blocks_read++;
	ld	iy,#16
	add	iy,sp
	inc	0 (iy)
	jr	NZ,00383$
	inc	1 (iy)
00383$:
;src/main.c:531: for (i = 0; i < 2; i++)
	ld	iy,#34
	add	iy,sp
	ld	0 (iy),c
	ld	1 (iy),b
	ld	hl, #14
	add	hl, sp
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00182$:
;src/main.c:533: addr = 0x6000 + (i * 256); //point to the memory holding the data
	ld	hl, #14+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#32
	add	iy,sp
	ld	1 (iy),a
	ld	0 (iy),#0x00
	ld	hl,#22
	add	hl,sp
	ld	a,0 (iy)
	add	a, #0x00
	ld	(hl),a
	ld	a,1 (iy)
	adc	a, #0x60
	inc	hl
	ld	(hl),a
;src/main.c:536: ret = _send_command(CMD_READ_MEMORY, 0, 1);
	ld	hl,#0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	a,#0x11
	push	af
	inc	sp
	call	__send_command
	pop	af
	pop	af
	inc	sp
	ld	iy,#32
	add	iy,sp
	ld	0 (iy),l
	ld	1 (iy),h
;src/main.c:538: if (ret == 0)
	ld	a,1 (iy)
	or	a,0 (iy)
	jp	NZ,00163$
;src/main.c:541: buffer_wr[0] = 0x08;
	ld	hl,#_buffer_wr
	ld	(hl),#0x08
;src/main.c:542: buffer_wr[1] = 0x00;
	ld	de,#_buffer_wr + 1
	xor	a, a
	ld	(de),a
;src/main.c:543: buffer_wr[2] = stm_addr >> 8;
	ld	iy,#34
	add	iy,sp
	ld	c,1 (iy)
	ld	hl,#(_buffer_wr + 0x0002)
	ld	(hl),c
;src/main.c:544: buffer_wr[3] = stm_addr & 0xff;
	ld	b,0 (iy)
	ld	hl,#(_buffer_wr + 0x0003)
	ld	(hl),b
;src/main.c:545: buffer_wr[4] = buffer_wr[0] ^ buffer_wr[1] ^ buffer_wr[2] ^ buffer_wr[3]; // XOR
	ld	a, (#_buffer_wr + 0)
	push	af
	ld	a,(de)
	ld	h,a
	pop	af
	xor	a, h
	xor	a, c
	xor	a, b
	ld	(#(_buffer_wr + 0x0004)),a
;src/main.c:546: _write(5);
	push	de
	ld	hl,#0x0005
	push	hl
	call	__write
	ld	hl, #0x03E8
	ex	(sp),hl
	ld	hl,#0x0001
	push	hl
	call	__read
	pop	af
	pop	af
	pop	de
;src/main.c:550: if (ret == -1)
	inc	l
	jr	NZ,00154$
	inc	h
	jr	NZ,00154$
;src/main.c:552: display_error("Fail to write the verify address");
	ld	hl,#___str_29
	push	de
	push	hl
	call	_display_error
	pop	af
	pop	de
00154$:
;src/main.c:555: buffer_wr[0] = 0xff; // will read 255 bytes
	ld	hl,#_buffer_wr
	ld	(hl),#0xFF
;src/main.c:556: buffer_wr[1] = 0x00; // xor
	xor	a, a
	ld	(de),a
;src/main.c:557: _write(2);
	ld	hl,#0x0002
	push	hl
	call	__write
;src/main.c:559: ret = _read(1, 1000); //read the ACK
	ld	hl, #0x03E8
	ex	(sp),hl
	ld	hl,#0x0001
	push	hl
	call	__read
	pop	af
	pop	af
;src/main.c:561: if (ret == -1)
	inc	l
	jr	NZ,00156$
	inc	h
	jr	NZ,00156$
;src/main.c:563: display_error("Fail to verify ACK command");
	ld	hl,#___str_30
	push	hl
	call	_display_error
	pop	af
00156$:
;src/main.c:566: ret = _read(256, 1000); //read the block
	ld	hl,#0x03E8
	push	hl
	ld	hl,#0x0100
	push	hl
	call	__read
	pop	af
	pop	af
;src/main.c:568: if (ret == -1)
	inc	l
	jr	NZ,00225$
	inc	h
	jr	NZ,00225$
;src/main.c:570: display_error("Fail to verify command");
	ld	hl,#___str_31
	push	hl
	call	_display_error
	pop	af
;src/main.c:574: for (c=0; c<256; c++)
00225$:
	ld	hl, #22+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#32
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #22+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#32
	add	iy,sp
	ld	1 (iy),a
	ld	hl,#0x0000
	ex	(sp), hl
00180$:
;src/main.c:576: if (buffer_rd[ c ] != peek(addr))
	ld	a,#<(_buffer_rd)
	ld	hl,#0
	add	hl,sp
	add	a, (hl)
	ld	e,a
	ld	a,#>(_buffer_rd)
	inc	hl
	adc	a, (hl)
	ld	d,a
	ld	a,(de)
	ld	d,a
	ld	hl, #32
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	e,(hl)
	ld	a,d
	sub	a, e
	jr	Z,00160$
;src/main.c:587: display_error("Fail to verify the bytes");
	ld	hl,#___str_32
	push	hl
	call	_display_error
	pop	af
00160$:
;src/main.c:590: addr++;
	ld	iy,#32
	add	iy,sp
	inc	0 (iy)
	jr	NZ,00391$
	inc	1 (iy)
00391$:
;src/main.c:574: for (c=0; c<256; c++)
	ld	iy,#0
	add	iy,sp
	inc	0 (iy)
	jr	NZ,00392$
	inc	1 (iy)
00392$:
	ld	a,1 (iy)
	sub	a, #0x01
	jr	C,00180$
	jr	00164$
00163$:
;src/main.c:597: display_error("Fail on verify command");
	ld	hl,#___str_33
	push	hl
	call	_display_error
	pop	af
00164$:
;src/main.c:601: stm_addr += 256;
	ld	hl,#34
	add	hl,sp
	ld	a,(hl)
	add	a, #0x00
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x01
	ld	(hl),a
;src/main.c:531: for (i = 0; i < 2; i++)
	ld	iy,#14
	add	iy,sp
	inc	0 (iy)
	jr	NZ,00393$
	inc	1 (iy)
00393$:
	ld	a,0 (iy)
	sub	a, #0x02
	ld	a,1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00182$
;src/main.c:603: vdp_prints("*");
	ld	hl, #34
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl,#___str_26
	push	bc
	push	hl
	call	_vdp_prints
	pop	af
	pop	bc
	jp	00166$
00168$:
;src/main.c:612: DisableCard();
	ld	a,#0xFF
	out	(_SD_CONTROL),a
;src/main.c:615: vdp_clear();
	call	_vdp_clear
;src/main.c:617: ULAPORT = COLOR_GREEN;				// green border 
	ld	a,#0x04
	out	(_ULAPORT),a
;src/main.c:619: vdp_gotoxy(11, 9);
	ld	hl,#0x090B
	push	hl
	call	_vdp_gotoxy
;src/main.c:620: vdp_prints("UPDATE OK!");
	ld	hl, #___str_34+0
	ex	(sp),hl
	call	_vdp_prints
;src/main.c:621: vdp_gotoxy(4, 11);
	ld	hl, #0x0B04
	ex	(sp),hl
	call	_vdp_gotoxy
;src/main.c:622: vdp_prints("Restore the boot0 jumper");
	ld	hl, #___str_35+0
	ex	(sp),hl
	call	_vdp_prints
;src/main.c:623: vdp_gotoxy(5, 12);
	ld	hl, #0x0C05
	ex	(sp),hl
	call	_vdp_gotoxy
;src/main.c:624: vdp_prints("and turn off the power");
	ld	hl, #___str_36+0
	ex	(sp),hl
	call	_vdp_prints
	pop	af
00185$:
	jr	00185$
	ld	hl,#38
	add	hl,sp
	ld	sp,hl
	ret
___str_4:
	.ascii "UnAmiga STM32 Updater"
	.db 0x00
___str_5:
	.ascii "Change the STM32 boot0 jumper"
	.db 0x00
___str_6:
	.ascii "press the STM32 reset button"
	.db 0x00
___str_7:
	.ascii "and press ENTER"
	.db 0x00
___str_8:
	.ascii "Original by Victor Trucco"
	.db 0x00
___str_9:
	.ascii "Adapted by Benitoss"
	.db 0x00
___str_10:
	.ascii "V 1.01"
	.db 0x00
___str_11:
	.ascii "Are you sure? (Y/N)"
	.db 0x00
___str_12:
	.ascii "Fail to init the SD card"
	.db 0x00
___str_13:
	.ascii "Fail to mount the SD card"
	.db 0x00
___str_14:
	.ascii "Fail to open UPDATE.STM"
	.db 0x00
___str_15:
	.ascii "Listening the STM: "
	.db 0x00
___str_16:
	.ascii "OK!"
	.db 0x00
___str_17:
	.ascii "Connecting to the STM: "
	.db 0x00
___str_18:
	.ascii "Fail to connect to STM"
	.db 0x00
___str_19:
	.ascii "Erasing the STM: "
	.db 0x00
___str_20:
	.ascii "Fail to erase"
	.db 0x00
___str_21:
	.ascii "Fail on erase command"
	.db 0x00
___str_22:
	.ascii "Writing to memory: "
	.db 0x00
___str_23:
	.ascii "Fail to write address"
	.db 0x00
___str_24:
	.ascii "Fail to write bytes"
	.db 0x00
___str_25:
	.ascii "Fail on write command"
	.db 0x00
___str_26:
	.ascii "*"
	.db 0x00
___str_27:
	.ascii " OK!"
	.db 0x00
___str_28:
	.ascii "Verifying: "
	.db 0x00
___str_29:
	.ascii "Fail to write the verify address"
	.db 0x00
___str_30:
	.ascii "Fail to verify ACK command"
	.db 0x00
___str_31:
	.ascii "Fail to verify command"
	.db 0x00
___str_32:
	.ascii "Fail to verify the bytes"
	.db 0x00
___str_33:
	.ascii "Fail on verify command"
	.db 0x00
___str_34:
	.ascii "UPDATE OK!"
	.db 0x00
___str_35:
	.ascii "Restore the boot0 jumper"
	.db 0x00
___str_36:
	.ascii "and turn off the power"
	.db 0x00
	.area _CODE
___str_37:
	.ascii "UPDATE  STM"
	.db 0x00
	.area _INITIALIZER
__xinit__fn_firmware:
	.dw ___str_37
	.area _CABS (ABS)
