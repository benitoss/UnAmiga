;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Sat Jun  1 21:33:05 2019
;--------------------------------------------------------
	.module fat
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _MMC_Read
	.globl _buffered_fat_index
	.globl _partitioncount
	.globl _sector_buffer
	.globl _fat_size
	.globl _dir_entries
	.globl _cluster_mask
	.globl _cluster_size
	.globl _fat_number
	.globl _root_directory_size
	.globl _root_directory_start
	.globl _root_directory_cluster
	.globl _data_start
	.globl _fat_start
	.globl _fat32
	.globl _compare
	.globl _FindDrive
	.globl _FileOpen
	.globl _FileRead
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
_fat32::
	.ds 2
_fat_start::
	.ds 4
_data_start::
	.ds 4
_root_directory_cluster::
	.ds 4
_root_directory_start::
	.ds 4
_root_directory_size::
	.ds 4
_fat_number::
	.ds 2
_cluster_size::
	.ds 4
_cluster_mask::
	.ds 4
_dir_entries::
	.ds 4
_fat_size::
	.ds 4
_sector_buffer::
	.ds 512
_partitioncount::
	.ds 2
_buffered_fat_index::
	.ds 4
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
;src/fat.c:89: static unsigned long GetCluster(unsigned long cluster)
;	---------------------------------
; Function GetCluster
; ---------------------------------
_GetCluster:
	push	af
	push	af
	push	af
	push	af
;src/fat.c:93: if (fat32) {
	ld	a,(#_fat32 + 1)
	ld	hl,#_fat32 + 0
	or	a,(hl)
	jr	Z,00102$
;src/fat.c:94: sb = cluster >> 7; // calculate sector number containing FAT-link
	push	af
	ld	hl, #12+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#2
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #12+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#2
	add	iy,sp
	ld	1 (iy),a
	ld	hl, #12+2
	add	hl, sp
	ld	a, (hl)
	ld	iy,#2
	add	iy,sp
	ld	2 (iy),a
	ld	hl, #12+3
	add	hl, sp
	ld	a, (hl)
	ld	iy,#2
	add	iy,sp
	ld	3 (iy),a
	pop	af
	ld	b,#0x07
00128$:
	srl	3 (iy)
	rr	2 (iy)
	rr	1 (iy)
	rr	0 (iy)
	djnz	00128$
;src/fat.c:95: i = cluster & 0x7F; // calculate link offsset within sector
	ld	hl, #10+0
	add	hl, sp
	ld	e, (hl)
	res	7, e
	ld	d,#0x00
	ld	bc,#0x0000
	jr	00103$
00102$:
;src/fat.c:97: sb = cluster >> 8; // calculate sector number containing FAT-link
	push	af
	ld	hl, #12+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#2
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #12+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#2
	add	iy,sp
	ld	1 (iy),a
	ld	hl, #12+2
	add	hl, sp
	ld	a, (hl)
	ld	iy,#2
	add	iy,sp
	ld	2 (iy),a
	ld	hl, #12+3
	add	hl, sp
	ld	a, (hl)
	ld	iy,#2
	add	iy,sp
	ld	3 (iy),a
	pop	af
	ld	b,#0x08
00130$:
	srl	3 (iy)
	rr	2 (iy)
	rr	1 (iy)
	rr	0 (iy)
	djnz	00130$
;src/fat.c:98: i = cluster & 0xFF; // calculate link offsset within sector
	ld	hl, #10+0
	add	hl, sp
	ld	e, (hl)
	ld	d,#0x00
	ld	bc,#0x0000
00103$:
;src/fat.c:102: if (sb != buffered_fat_index) {
	ld	hl, #0+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#_buffered_fat_index
	sub	a, 0 (iy)
	jr	NZ,00132$
	ld	hl, #0+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#_buffered_fat_index
	sub	a, 1 (iy)
	jr	NZ,00132$
	ld	hl, #0+2
	add	hl, sp
	ld	a, (hl)
	ld	iy,#_buffered_fat_index
	sub	a, 2 (iy)
	jr	NZ,00132$
	ld	hl, #0+3
	add	hl, sp
	ld	a, (hl)
	ld	iy,#_buffered_fat_index
	sub	a, 3 (iy)
	jr	Z,00107$
00132$:
;src/fat.c:103: if (!MMC_Read(fat_start + sb, (unsigned char*)&fat_buffer)) {
	ld	hl,#0
	add	hl,sp
	push	de
	ld	iy,#6
	add	iy,sp
	push	iy
	pop	de
	ld	a,(#_fat_start + 0)
	add	a, (hl)
	ld	(de),a
	ld	a,(#_fat_start + 1)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,(#_fat_start + 2)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,(#_fat_start + 3)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	pop	de
	push	bc
	push	de
	ld	hl,#_sector_buffer
	push	hl
	ld	iy,#10
	add	iy,sp
	ld	l,2 (iy)
	ld	h,3 (iy)
	push	hl
	ld	l,0 (iy)
	ld	h,1 (iy)
	push	hl
	call	_MMC_Read
	pop	af
	pop	af
	pop	af
	ld	a,l
	pop	de
	pop	bc
	or	a, a
	jr	NZ,00105$
;src/fat.c:104: return 0;
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jr	00108$
00105$:
;src/fat.c:107: buffered_fat_index = sb;
	push	de
	push	bc
	ld	de, #_buffered_fat_index
	ld	hl, #4
	add	hl, sp
	ld	bc, #4
	ldir
	pop	bc
	pop	de
00107$:
;src/fat.c:109: i = fat32 ? SwapBBBB(fat_buffer.fat32[i]) & 0x0FFFFFFF : SwapBB(fat_buffer.fat16[i]); // get FAT link for 68000 
	ld	a,(#_fat32 + 1)
	ld	hl,#_fat32 + 0
	or	a,(hl)
	jr	Z,00110$
	ld	hl,#_sector_buffer
	ld	a,#0x02
00133$:
	sla	e
	rl	d
	rl	c
	rl	b
	dec	a
	jr	NZ,00133$
	add	hl,de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	a, (hl)
	and	a, #0x0F
	ld	d,a
	jr	00111$
00110$:
	ld	hl,#_sector_buffer
	sla	e
	rl	d
	rl	c
	rl	b
	add	hl,de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	de,#0x0000
00111$:
	ld	l,c
	ld	h,b
;src/fat.c:110: return i;
00108$:
	pop	af
	pop	af
	pop	af
	pop	af
	ret
;src/fat.c:114: int compare(const char *s1, const char *s2, int b) {
;	---------------------------------
; Function compare
; ---------------------------------
_compare::
	push	af
	push	af
;src/fat.c:117: for(i = 0; i < b; ++i) {
	ld	hl, #6
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #8+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#2
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #8+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#2
	add	iy,sp
	ld	1 (iy),a
	ld	bc,#0x0000
00105$:
	ld	hl,#10
	add	hl,sp
	ld	a,c
	sub	a, (hl)
	ld	a,b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00121$
	xor	a, #0x80
00121$:
	jp	P,00103$
;src/fat.c:118: if(*s1++ != *s2++)
	ld	a,(de)
	ld	iy,#1
	add	iy,sp
	ld	0 (iy),a
	inc	de
	ld	iy,#2
	add	iy,sp
	ld	l,0 (iy)
	ld	h,1 (iy)
	ld	a,(hl)
	inc	sp
	push	af
	inc	sp
	inc	0 (iy)
	jr	NZ,00122$
	inc	1 (iy)
00122$:
	ld	hl, #1+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#0
	add	iy,sp
	sub	a, 0 (iy)
	jr	Z,00106$
;src/fat.c:119: return 1;
	ld	hl,#0x0001
	jr	00107$
00106$:
;src/fat.c:117: for(i = 0; i < b; ++i) {
	inc	bc
	jr	00105$
00103$:
;src/fat.c:121: return 0;
	ld	hl,#0x0000
00107$:
	pop	af
	pop	af
	ret
;src/fat.c:126: unsigned char FindDrive(void)
;	---------------------------------
; Function FindDrive
; ---------------------------------
_FindDrive::
	ld	hl,#-17
	add	hl,sp
	ld	sp,hl
;src/fat.c:129: buffered_fat_index = 0xFFFFFFFF;
	ld	hl,#_buffered_fat_index + 0
	ld	(hl), #0xFF
	ld	hl,#_buffered_fat_index + 1
	ld	(hl), #0xFF
	ld	hl,#_buffered_fat_index + 2
	ld	(hl), #0xFF
	ld	hl,#_buffered_fat_index + 3
	ld	(hl), #0xFF
;src/fat.c:130: fat32=0;
	ld	hl,#0x0000
	ld	(_fat32),hl
;src/fat.c:132: if (!MMC_Read(0, sector_buffer)) // read MBR
	ld	hl,#_sector_buffer
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_MMC_Read
	pop	af
	pop	af
	pop	af
	ld	iy,#8
	add	iy,sp
	ld	0 (iy),l
	ld	hl, #8+0
	add	hl, sp
	ld	a, (hl)
;src/fat.c:133: return(0);
	or	a,a
	jr	NZ,00102$
	ld	l,a
	jp	00135$
00102$:
;src/fat.c:135: boot_sector=0;
	xor	a, a
	ld	iy,#9
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),a
	ld	2 (iy),a
	ld	3 (iy),a
;src/fat.c:136: partitioncount=1;
	ld	hl,#0x0001
	ld	(_partitioncount),hl
;src/fat.c:139: if (compare((const char*)&sector_buffer[0x36], "FAT16   ",8)==0) // check for FAT16
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),#<((_sector_buffer + 0x0036))
	ld	1 (iy),#>((_sector_buffer + 0x0036))
	ld	l, #0x08
	push	hl
	ld	hl,#___str_0
	push	hl
	ld	l,0 (iy)
	ld	h,1 (iy)
	push	hl
	call	_compare
	pop	af
	pop	af
	pop	af
	ld	a,h
	or	a,l
	jr	NZ,00104$
;src/fat.c:140: partitioncount=0;
	ld	hl,#0x0000
	ld	(_partitioncount),hl
00104$:
;src/fat.c:141: if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8)==0) // check for FAT32
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),#<((_sector_buffer + 0x0052))
	ld	1 (iy),#>((_sector_buffer + 0x0052))
	ld	hl,#0x0008
	push	hl
	ld	hl,#___str_1
	push	hl
	ld	l,0 (iy)
	ld	h,1 (iy)
	push	hl
	call	_compare
	pop	af
	pop	af
	pop	af
	ld	iy,#6
	add	iy,sp
	ld	1 (iy),h
	ld	0 (iy),l
	ld	hl, #6+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a,(hl)
	jr	NZ,00106$
;src/fat.c:142: partitioncount=0;
	ld	hl,#0x0000
	ld	(_partitioncount),hl
00106$:
;src/fat.c:144: if(partitioncount)
	ld	a,(#_partitioncount + 1)
	ld	hl,#_partitioncount + 0
	or	a,(hl)
	jp	Z,00115$
;src/fat.c:147: struct MasterBootRecord *mbr=(struct MasterBootRecord *)sector_buffer;
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),#<(_sector_buffer)
	ld	1 (iy),#>(_sector_buffer)
	ld	a,0 (iy)
	ld	iy,#0
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #6+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#0
	add	iy,sp
	ld	1 (iy),a
;src/fat.c:149: boot_sector = mbr->Partition[0].startlba;
	ld	a,0 (iy)
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #0+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#6
	add	iy,sp
	ld	1 (iy),a
	ld	l,0 (iy)
	ld	h,1 (iy)
	ld	de, #0x01C6
	add	hl, de
	ld	a,(hl)
	ld	iy,#2
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
	ld	hl, #9
	add	hl, sp
	ex	de, hl
	ld	hl, #2
	add	hl, sp
	ld	bc, #4
	ldir
;src/fat.c:150: if(mbr->Signature==0x55aa)
	ld	hl, #0+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #0+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#6
	add	iy,sp
	ld	1 (iy),a
	ld	l,0 (iy)
	ld	h,1 (iy)
	ld	de, #0x01FE
	add	hl, de
	ld	a,(hl)
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	1 (iy),a
	ld	a,0 (iy)
	sub	a, #0xAA
	jr	NZ,00110$
	ld	a,1 (iy)
	sub	a, #0x55
	jr	NZ,00110$
;src/fat.c:151: boot_sector=SwapBBBB(mbr->Partition[0].startlba);
	ld	hl, #9
	add	hl, sp
	ex	de, hl
	ld	hl, #2
	add	hl, sp
	ld	bc, #4
	ldir
	jr	00111$
00110$:
;src/fat.c:152: else if(mbr->Signature!=0xaa55)
	ld	iy,#6
	add	iy,sp
	ld	a,0 (iy)
	sub	a, #0x55
	jr	NZ,00199$
	ld	a,1 (iy)
	sub	a, #0xAA
	jr	Z,00111$
00199$:
;src/fat.c:155: return(0);
	ld	l,#0x00
	jp	00135$
00111$:
;src/fat.c:157: if (!MMC_Read(boot_sector, sector_buffer)) // read discriptor
	ld	hl,#_sector_buffer
	push	hl
	ld	iy,#11
	add	iy,sp
	ld	l,2 (iy)
	ld	h,3 (iy)
	push	hl
	ld	l,0 (iy)
	ld	h,1 (iy)
	push	hl
	call	_MMC_Read
	pop	af
	pop	af
	pop	af
	ld	a,l
;src/fat.c:158: return(0);
	or	a,a
	jr	NZ,00115$
	ld	l,a
	jp	00135$
00115$:
;src/fat.c:162: if (compare(sector_buffer+0x52, "FAT32   ",8)==0) // check for FAT32
	ld	hl,#0x0008
	push	hl
	ld	hl,#___str_1
	push	hl
	ld	hl,#(_sector_buffer + 0x0052)
	push	hl
	call	_compare
	pop	af
	pop	af
	pop	af
	ld	a,h
	or	a,l
	jr	NZ,00119$
;src/fat.c:163: fat32=1;
	ld	hl,#0x0001
	ld	(_fat32),hl
	jr	00120$
00119$:
;src/fat.c:164: else if (compare(sector_buffer+0x36, "FAT16   ",8)!=0) // check for FAT16
	ld	hl,#0x0008
	push	hl
	ld	hl,#___str_0
	push	hl
	ld	hl,#(_sector_buffer + 0x0036)
	push	hl
	call	_compare
	pop	af
	pop	af
	pop	af
	ld	a,h
	or	a,l
	jr	Z,00120$
;src/fat.c:167: return(0);
	ld	l,#0x00
	jp	00135$
00120$:
;src/fat.c:170: if (sector_buffer[510] != 0x55 || sector_buffer[511] != 0xaa)  // check signature
	ld	a, (#_sector_buffer + 510)
	sub	a, #0x55
	jr	NZ,00121$
	ld	a, (#_sector_buffer + 511)
	sub	a, #0xAA
	jr	Z,00122$
00121$:
;src/fat.c:171: return(0);
	ld	l,#0x00
	jp	00135$
00122$:
;src/fat.c:174: if (sector_buffer[0] != 0xe9 && sector_buffer[0] != 0xeb)
	ld	a,(#_sector_buffer + 0)
	cp	a,#0xE9
	jr	Z,00125$
	sub	a, #0xEB
	jr	Z,00125$
;src/fat.c:175: return(0);
	ld	l,#0x00
	jp	00135$
00125$:
;src/fat.c:178: if (sector_buffer[11] != 0x00 || sector_buffer[12] != 0x02)
	ld	a, (#_sector_buffer + 11)
	or	a, a
	jr	NZ,00127$
	ld	a, (#_sector_buffer + 12)
	sub	a, #0x02
	jr	Z,00128$
00127$:
;src/fat.c:179: return(0);
	ld	l,#0x00
	jp	00135$
00128$:
;src/fat.c:182: cluster_size = sector_buffer[13];
	ld	a, (#_sector_buffer + 13)
	ld	(#_cluster_size + 0),a
	ld	hl,#_cluster_size + 1
	ld	(hl), #0x00
	ld	hl,#_cluster_size + 2
	ld	(hl), #0x00
	ld	hl,#_cluster_size + 3
	ld	(hl), #0x00
;src/fat.c:185: cluster_mask = cluster_size - 1;
	ld	hl,#_cluster_mask
	ld	a,(#_cluster_size + 0)
	add	a,#0xFF
	ld	(hl),a
	ld	a,(#_cluster_size + 1)
	adc	a,#0xFF
	inc	hl
	ld	(hl),a
	ld	a,(#_cluster_size + 2)
	adc	a,#0xFF
	inc	hl
	ld	(hl),a
	ld	a,(#_cluster_size + 3)
	adc	a,#0xFF
	inc	hl
	ld	(hl),a
;src/fat.c:187: fat_start = boot_sector + sector_buffer[0x0E] + (sector_buffer[0x0F] << 8); // reserved sector count before FAT table (usually 32 for FAT32)
	ld	a,(#_sector_buffer + 14)
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),a
	ld	a,0 (iy)
	ld	iy,#13
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	2 (iy),#0x00
	ld	3 (iy),#0x00
	ld	hl,#13
	add	hl,sp
	ld	iy,#9
	add	iy,sp
	ld	a,0 (iy)
	add	a, (hl)
	ld	(hl),a
	ld	a,1 (iy)
	inc	hl
	adc	a, (hl)
	ld	(hl),a
	ld	a,2 (iy)
	inc	hl
	adc	a, (hl)
	ld	(hl),a
	ld	a,3 (iy)
	inc	hl
	adc	a, (hl)
	ld	(hl),a
	ld	a,(#_sector_buffer + 15)
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),a
	ld	a,0 (iy)
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	a,0 (iy)
	ld	1 (iy),a
	ld	0 (iy),#0x00
	ld	a,0 (iy)
	ld	iy,#9
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #6+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#9
	add	iy,sp
	ld	1 (iy),a
	ld	hl, #6+1
	add	hl, sp
	ld	a, (hl)
	rla
	sbc	a, a
	ld	iy,#9
	add	iy,sp
	ld	2 (iy),a
	ld	3 (iy),a
	ld	hl,#9
	add	hl,sp
	push	de
	ld	de,#_fat_start
	ld	iy,#15
	add	iy,sp
	ld	a,0 (iy)
	add	a, (hl)
	ld	(de),a
	ld	a,1 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,2 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,3 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	pop	de
;src/fat.c:188: fat_number = sector_buffer[0x10];
	ld	a, (#_sector_buffer + 16)
	ld	(#_fat_number + 0),a
	ld	hl,#_fat_number + 1
	ld	(hl), #0x00
;src/fat.c:190: if (fat32)
	ld	a,(#_fat32 + 1)
	ld	hl,#_fat32 + 0
	or	a,(hl)
	jp	Z,00133$
;src/fat.c:192: if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8) != 0) // check file system type
	ld	iy,#13
	add	iy,sp
	ld	0 (iy),#<((_sector_buffer + 0x0052))
	ld	1 (iy),#>((_sector_buffer + 0x0052))
	ld	a,0 (iy)
	ld	0 (iy),a
	ld	a,1 (iy)
	ld	1 (iy),a
	ld	hl,#0x0008
	push	hl
	ld	hl,#___str_1
	push	hl
	ld	l,0 (iy)
	ld	h,1 (iy)
	push	hl
	call	_compare
	pop	af
	pop	af
	pop	af
	ld	a,h
	or	a,l
	jr	Z,00131$
;src/fat.c:193: return(0);
	ld	l,#0x00
	jp	00135$
00131$:
;src/fat.c:195: dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
	push	af
	ld	a,(#_cluster_size + 0)
	ld	iy,#_dir_entries
	ld	0 (iy),a
	ld	a,(#_cluster_size + 1)
	ld	iy,#_dir_entries
	ld	1 (iy),a
	ld	a,(#_cluster_size + 2)
	ld	iy,#_dir_entries
	ld	2 (iy),a
	ld	a,(#_cluster_size + 3)
	ld	iy,#_dir_entries
	ld	3 (iy),a
	pop	af
	ld	b,#0x04
00206$:
	ld	iy,#_dir_entries
	sla	0 (iy)
	ld	iy,#_dir_entries
	rl	1 (iy)
	ld	iy,#_dir_entries
	rl	2 (iy)
	ld	iy,#_dir_entries
	rl	3 (iy)
	djnz	00206$
;src/fat.c:196: root_directory_size = cluster_size; // root directory size in sectors
	ld	de, #_root_directory_size
	ld	hl, #_cluster_size
	ld	bc, #4
	ldir
;src/fat.c:197: fat_size = sector_buffer[0x24] + (((unsigned long)sector_buffer[0x25]) << 8) + (((unsigned long)sector_buffer[0x26]) << 16) + (((unsigned long)sector_buffer[0x27]) << 24);
	ld	a,(#_sector_buffer + 36)
	ld	iy,#13
	add	iy,sp
	ld	0 (iy),a
	ld	a,(#_sector_buffer + 37)
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),a
	ld	a,0 (iy)
	ld	iy,#9
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	2 (iy),#0x00
	ld	3 (iy),#0x00
	push	af
	pop	af
	ld	b,#0x08
00208$:
	sla	0 (iy)
	rl	1 (iy)
	rl	2 (iy)
	rl	3 (iy)
	djnz	00208$
	ld	iy,#13
	add	iy,sp
	ld	a,0 (iy)
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	2 (iy),#0x00
	ld	3 (iy),#0x00
	ld	hl,#9
	add	hl,sp
	push	de
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	pop	de
	ld	a,(#_sector_buffer + 38)
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),a
	ld	a,0 (iy)
	ld	iy,#9
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	2 (iy),#0x00
	ld	3 (iy),#0x00
	push	af
	pop	af
	ld	b,#0x10
00210$:
	sla	0 (iy)
	rl	1 (iy)
	rl	2 (iy)
	rl	3 (iy)
	djnz	00210$
	ld	hl,#9
	add	hl,sp
	push	de
	ld	iy,#15
	add	iy,sp
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	pop	de
	ld	a,(#_sector_buffer + 39)
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),a
	ld	a,0 (iy)
	ld	iy,#9
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	2 (iy),#0x00
	ld	3 (iy),#0x00
	push	af
	pop	af
	ld	b,#0x18
00212$:
	sla	0 (iy)
	rl	1 (iy)
	rl	2 (iy)
	rl	3 (iy)
	djnz	00212$
	ld	hl,#9
	add	hl,sp
	push	de
	ld	de,#_fat_size
	ld	iy,#15
	add	iy,sp
	ld	a,0 (iy)
	add	a, (hl)
	ld	(de),a
	ld	a,1 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,2 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,3 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	pop	de
;src/fat.c:198: data_start = fat_start + (fat_number * fat_size);
	ld	a,(#_fat_number + 0)
	ld	iy,#13
	add	iy,sp
	ld	0 (iy),a
	ld	a,(#_fat_number + 1)
	ld	iy,#13
	add	iy,sp
	ld	1 (iy),a
	ld	2 (iy),#0x00
	ld	3 (iy),#0x00
	ld	hl,(_fat_size + 2)
	push	hl
	ld	hl,(_fat_size)
	push	hl
	ld	l,2 (iy)
	ld	h,3 (iy)
	push	hl
	ld	l,0 (iy)
	ld	h,1 (iy)
	push	hl
	call	__mullong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	iy,#13
	add	iy,sp
	ld	3 (iy),d
	ld	2 (iy),e
	ld	1 (iy),h
	ld	0 (iy),l
	ld	hl,#13
	add	hl,sp
	push	de
	ld	iy,#_data_start
	push	iy
	pop	de
	ld	a,(#_fat_start + 0)
	add	a, (hl)
	ld	(de),a
	ld	a,(#_fat_start + 1)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,(#_fat_start + 2)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,(#_fat_start + 3)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	pop	de
;src/fat.c:199: root_directory_cluster = sector_buffer[0x2C] + (((unsigned long)sector_buffer[0x2D]) << 8) + (((unsigned long)sector_buffer[0x2E]) << 16) + ((unsigned long)(sector_buffer[0x2F] & 0x0F) << 24);
	ld	a,(#_sector_buffer + 44)
	ld	iy,#13
	add	iy,sp
	ld	0 (iy),a
	ld	a,(#_sector_buffer + 45)
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),a
	ld	a,0 (iy)
	ld	iy,#9
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	2 (iy),#0x00
	ld	3 (iy),#0x00
	push	af
	pop	af
	ld	b,#0x08
00214$:
	sla	0 (iy)
	rl	1 (iy)
	rl	2 (iy)
	rl	3 (iy)
	djnz	00214$
	ld	iy,#13
	add	iy,sp
	ld	a,0 (iy)
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	2 (iy),#0x00
	ld	3 (iy),#0x00
	ld	hl,#9
	add	hl,sp
	push	de
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	pop	de
	ld	a,(#_sector_buffer + 46)
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),a
	ld	a,0 (iy)
	ld	iy,#9
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	2 (iy),#0x00
	ld	3 (iy),#0x00
	push	af
	pop	af
	ld	b,#0x10
00216$:
	sla	0 (iy)
	rl	1 (iy)
	rl	2 (iy)
	rl	3 (iy)
	djnz	00216$
	ld	hl,#9
	add	hl,sp
	push	de
	ld	iy,#15
	add	iy,sp
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	pop	de
	ld	a,(#_sector_buffer + 47)
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),a
	ld	a,0 (iy)
	and	a, #0x0F
	ld	0 (iy),a
	ld	a,0 (iy)
	ld	iy,#9
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	2 (iy),#0x00
	ld	3 (iy),#0x00
	push	af
	pop	af
	ld	b,#0x18
00218$:
	sla	0 (iy)
	rl	1 (iy)
	rl	2 (iy)
	rl	3 (iy)
	djnz	00218$
	ld	hl,#9
	add	hl,sp
	push	de
	ld	de,#_root_directory_cluster
	ld	iy,#15
	add	iy,sp
	ld	a,0 (iy)
	add	a, (hl)
	ld	(de),a
	ld	a,1 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,2 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,3 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	pop	de
;src/fat.c:200: root_directory_start = (root_directory_cluster - 2) * cluster_size + data_start;
	ld	hl,#13
	add	hl,sp
	ld	a,(#_root_directory_cluster + 0)
	add	a,#0xFE
	ld	(hl),a
	ld	a,(#_root_directory_cluster + 1)
	adc	a,#0xFF
	inc	hl
	ld	(hl),a
	ld	a,(#_root_directory_cluster + 2)
	adc	a,#0xFF
	inc	hl
	ld	(hl),a
	ld	a,(#_root_directory_cluster + 3)
	adc	a,#0xFF
	inc	hl
	ld	(hl),a
	ld	hl,(_cluster_size + 2)
	push	hl
	ld	hl,(_cluster_size)
	push	hl
	ld	iy,#17
	add	iy,sp
	ld	l,2 (iy)
	ld	h,3 (iy)
	push	hl
	ld	l,0 (iy)
	ld	h,1 (iy)
	push	hl
	call	__mullong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	iy,#13
	add	iy,sp
	ld	3 (iy),d
	ld	2 (iy),e
	ld	1 (iy),h
	ld	0 (iy),l
	ld	hl,#_data_start
	push	de
	ld	de,#_root_directory_start
	ld	iy,#15
	add	iy,sp
	ld	a,0 (iy)
	add	a, (hl)
	ld	(de),a
	ld	a,1 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,2 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,3 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	pop	de
	jp	00134$
00133$:
;src/fat.c:205: dir_entries = sector_buffer[17] + (sector_buffer[18] << 8);
	ld	a, (#_sector_buffer + 17)
	ld	iy,#13
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	a,(#_sector_buffer + 18)
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),a
	ld	a,0 (iy)
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	a,0 (iy)
	ld	1 (iy),a
	ld	0 (iy),#0x00
	ld	hl,#6
	add	hl,sp
	push	de
	ld	iy,#15
	add	iy,sp
	push	iy
	pop	de
	ld	a,0 (iy)
	add	a, (hl)
	ld	(de),a
	ld	a,1 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	pop	de
	ld	a,0 (iy)
	ld	(#_dir_entries + 0),a
	ld	hl, #13+1
	add	hl, sp
	ld	a, (hl)
	ld	(#_dir_entries + 1),a
	ld	hl, #13+1
	add	hl, sp
	ld	a, (hl)
	rla
	sbc	a, a
	ld	(#_dir_entries + 2),a
	ld	(#_dir_entries + 3),a
;src/fat.c:206: root_directory_size = ((dir_entries << 5) + 511) >> 9;
	push	af
	ld	a,(#_dir_entries + 0)
	ld	iy,#15
	add	iy,sp
	ld	0 (iy),a
	ld	a,(#_dir_entries + 1)
	ld	iy,#15
	add	iy,sp
	ld	1 (iy),a
	ld	a,(#_dir_entries + 2)
	ld	iy,#15
	add	iy,sp
	ld	2 (iy),a
	ld	a,(#_dir_entries + 3)
	ld	iy,#15
	add	iy,sp
	ld	3 (iy),a
	pop	af
	ld	b,#0x05
00220$:
	sla	0 (iy)
	rl	1 (iy)
	rl	2 (iy)
	rl	3 (iy)
	djnz	00220$
	ld	hl,#13
	add	hl,sp
	ld	a,(hl)
	add	a, #0xFF
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x01
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	push	af
	ld	a,0 (iy)
	ld	(#_root_directory_size + 0),a
	ld	hl, #15+1
	add	hl, sp
	ld	a, (hl)
	ld	(#_root_directory_size + 1),a
	ld	hl, #15+2
	add	hl, sp
	ld	a, (hl)
	ld	(#_root_directory_size + 2),a
	ld	hl, #15+3
	add	hl, sp
	ld	a, (hl)
	ld	(#_root_directory_size + 3),a
	pop	af
	ld	b,#0x09
00222$:
	ld	iy,#_root_directory_size
	srl	3 (iy)
	ld	iy,#_root_directory_size
	rr	2 (iy)
	ld	iy,#_root_directory_size
	rr	1 (iy)
	ld	iy,#_root_directory_size
	rr	0 (iy)
	djnz	00222$
;src/fat.c:209: fat_size = sector_buffer[22] + (sector_buffer[23] << 8);
	ld	a, (#_sector_buffer + 22)
	ld	iy,#13
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	a,(#_sector_buffer + 23)
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),a
	ld	a,0 (iy)
	ld	0 (iy),a
	ld	1 (iy),#0x00
	ld	a,0 (iy)
	ld	1 (iy),a
	ld	0 (iy),#0x00
	ld	hl,#6
	add	hl,sp
	push	de
	ld	iy,#15
	add	iy,sp
	push	iy
	pop	de
	ld	a,0 (iy)
	add	a, (hl)
	ld	(de),a
	ld	a,1 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	pop	de
	ld	a,0 (iy)
	ld	(#_fat_size + 0),a
	ld	hl, #13+1
	add	hl, sp
	ld	a, (hl)
	ld	(#_fat_size + 1),a
	ld	hl, #13+1
	add	hl, sp
	ld	a, (hl)
	rla
	sbc	a, a
	ld	(#_fat_size + 2),a
	ld	(#_fat_size + 3),a
;src/fat.c:212: root_directory_start = fat_start + (fat_number * fat_size);
	ld	a,(#_fat_number + 0)
	ld	iy,#13
	add	iy,sp
	ld	0 (iy),a
	ld	a,(#_fat_number + 1)
	ld	iy,#13
	add	iy,sp
	ld	1 (iy),a
	ld	2 (iy),#0x00
	ld	3 (iy),#0x00
	ld	hl,(_fat_size + 2)
	push	hl
	ld	hl,(_fat_size)
	push	hl
	ld	l,2 (iy)
	ld	h,3 (iy)
	push	hl
	ld	l,0 (iy)
	ld	h,1 (iy)
	push	hl
	call	__mullong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	iy,#13
	add	iy,sp
	ld	3 (iy),d
	ld	2 (iy),e
	ld	1 (iy),h
	ld	0 (iy),l
	ld	hl,#13
	add	hl,sp
	push	de
	ld	iy,#_root_directory_start
	push	iy
	pop	de
	ld	a,(#_fat_start + 0)
	add	a, (hl)
	ld	(de),a
	ld	a,(#_fat_start + 1)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,(#_fat_start + 2)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,(#_fat_start + 3)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	pop	de
;src/fat.c:213: root_directory_cluster = 0; // unused
	xor	a, a
	ld	(#_root_directory_cluster + 0),a
	ld	(#_root_directory_cluster + 1),a
	ld	(#_root_directory_cluster + 2),a
	ld	(#_root_directory_cluster + 3),a
;src/fat.c:216: data_start = root_directory_start + root_directory_size;
	ld	hl,#_root_directory_size
	push	de
	ld	iy,#_data_start
	push	iy
	pop	de
	ld	a,(#_root_directory_start + 0)
	add	a, (hl)
	ld	(de),a
	ld	a,(#_root_directory_start + 1)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,(#_root_directory_start + 2)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	ld	a,(#_root_directory_start + 3)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	pop	de
00134$:
;src/fat.c:219: return(1);
	ld	l,#0x01
00135$:
	ld	iy,#17
	add	iy,sp
	ld	sp,iy
	ret
___str_0:
	.ascii "FAT16   "
	.db 0x00
___str_1:
	.ascii "FAT32   "
	.db 0x00
;src/fat.c:223: unsigned char FileOpen(fileTYPE *file, const char *name)
;	---------------------------------
; Function FileOpen
; ---------------------------------
_FileOpen::
	ld	hl,#-32
	add	hl,sp
	ld	sp,hl
;src/fat.c:226: DIRENTRY       *pEntry = 0;          // pointer to current entry in sector buffer
	ld	hl, #4
	add	hl, sp
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;src/fat.c:232: buffered_fat_index = 0xFFFFFFFF;
	ld	hl,#_buffered_fat_index + 0
	ld	(hl), #0xFF
	ld	hl,#_buffered_fat_index + 1
	ld	(hl), #0xFF
	ld	hl,#_buffered_fat_index + 2
	ld	(hl), #0xFF
	ld	iy,#_buffered_fat_index
	ld	3 (iy),#0xFF
;src/fat.c:234: iDirectoryCluster = root_directory_cluster;
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	hl, #_root_directory_cluster
	ld	bc, #4
	ldir
;src/fat.c:235: iDirectorySector = root_directory_start;
	ld	hl, #28
	add	hl, sp
	ex	de, hl
	ld	hl, #_root_directory_start
	ld	bc, #4
	ldir
;src/fat.c:236: nEntries = fat32 ?  cluster_size << 4 : root_directory_size << 4; // 16 entries per sector
	ld	a,(#_fat32 + 1)
	ld	hl,#_fat32 + 0
	or	a,(hl)
	jr	Z,00125$
	push	af
	ld	iy,#_cluster_size
	ld	l,0 (iy)
	ld	iy,#_cluster_size
	ld	h,1 (iy)
	ld	iy,#_cluster_size
	ld	e,2 (iy)
	ld	iy,#_cluster_size
	ld	d,3 (iy)
	pop	af
	ld	b,#0x04
00177$:
	add	hl, hl
	rl	e
	rl	d
	djnz	00177$
	jr	00126$
00125$:
	push	af
	ld	iy,#_root_directory_size
	ld	l,0 (iy)
	ld	iy,#_root_directory_size
	ld	h,1 (iy)
	ld	iy,#_root_directory_size
	ld	e,2 (iy)
	ld	iy,#_root_directory_size
	ld	d,3 (iy)
	pop	af
	ld	b,#0x04
00179$:
	add	hl, hl
	rl	e
	rl	d
	djnz	00179$
00126$:
	ld	iy,#10
	add	iy,sp
	ld	0 (iy),l
	ld	1 (iy),h
	ld	2 (iy),e
	ld	3 (iy),d
;src/fat.c:238: while (1)
;src/fat.c:240: for (iEntry = 0; iEntry < nEntries; iEntry++)
00137$:
	ld	hl, #24
	add	hl, sp
	ex	de, hl
	ld	hl, #28
	add	hl, sp
	ld	bc, #4
	ldir
	xor	a, a
	ld	iy,#6
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),a
	ld	2 (iy),a
	ld	3 (iy),a
00121$:
	ld	hl,#10
	add	hl,sp
	ld	iy,#6
	add	iy,sp
	ld	a,0 (iy)
	sub	a, (hl)
	ld	a,1 (iy)
	inc	hl
	sbc	a, (hl)
	ld	a,2 (iy)
	inc	hl
	sbc	a, (hl)
	ld	a,3 (iy)
	inc	hl
	sbc	a, (hl)
	jp	NC,00111$
;src/fat.c:242: if ((iEntry & 0x0F) == 0) // first entry in sector, load the sector
	ld	a,0 (iy)
	and	a, #0x0F
	jr	NZ,00102$
;src/fat.c:245: MMC_Read(iDirectorySector++, sector_buffer); // root directory is linear
	ld	iy,#24
	add	iy,sp
	ld	e,0 (iy)
	ld	d,1 (iy)
	ld	c,2 (iy)
	ld	b,3 (iy)
	inc	0 (iy)
	jr	NZ,00183$
	inc	1 (iy)
	jr	NZ,00183$
	inc	2 (iy)
	jr	NZ,00183$
	inc	3 (iy)
00183$:
	ld	hl,#_sector_buffer
	push	hl
	push	bc
	push	de
	call	_MMC_Read
	pop	af
	pop	af
	pop	af
;src/fat.c:246: pEntry = (DIRENTRY*)sector_buffer;
	ld	hl, #4
	add	hl, sp
	ld	(hl), #<(_sector_buffer)
	inc	hl
	ld	(hl), #>(_sector_buffer)
	jr	00103$
00102$:
;src/fat.c:249: pEntry++;
	ld	hl,#4
	add	hl,sp
	ld	a,(hl)
	add	a, #0x20
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
00103$:
;src/fat.c:252: if (pEntry->Name[0] != SLOT_EMPTY && pEntry->Name[0] != SLOT_DELETED) // valid entry??
	ld	iy,#4
	add	iy,sp
	ld	l,0 (iy)
	ld	h,1 (iy)
	ld	a,(hl)
	or	a, a
	jp	Z,00122$
	sub	a, #0xE5
	jp	Z,00122$
;src/fat.c:254: if (!(pEntry->Attributes & (ATTR_VOLUME | ATTR_DIRECTORY))) // not a volume nor directory
	ld	l,0 (iy)
	ld	h,1 (iy)
	ld	de, #0x000B
	add	hl, de
	ld	a,(hl)
	and	a, #0x18
	jp	NZ,00122$
;src/fat.c:257: if (compare((const char*)pEntry->Name, name, 11) == 0)
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	bc,#0x000B
	push	bc
	ld	iy,#38
	add	iy,sp
	ld	c,0 (iy)
	ld	b,1 (iy)
	push	bc
	push	hl
	call	_compare
	pop	af
	pop	af
	pop	af
	ld	a,h
	or	a,l
	jp	NZ,00122$
;src/fat.c:259: file->size = SwapBBBB(pEntry->FileSize); 		// for 68000
	ld	hl, #34+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#22
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #34+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#22
	add	iy,sp
	ld	1 (iy),a
	ld	hl,#20
	add	hl,sp
	ld	a,0 (iy)
	add	a, #0x04
	ld	(hl),a
	ld	a,1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl),a
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	de, #0x001C
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	c,(hl)
	ld	hl, #20
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),c
;src/fat.c:260: file->cluster = SwapBB(pEntry->StartCluster) + (fat32 ? ((unsigned long)(SwapBB(pEntry->HighCluster) & 0x0FFF)) << 16 : 0);
	ld	hl,#20
	add	hl,sp
	ld	iy,#22
	add	iy,sp
	ld	a,0 (iy)
	add	a, #0x08
	ld	(hl),a
	ld	a,1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl),a
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	de, #0x001A
	add	hl, de
	ld	a,(hl)
	ld	iy,#18
	add	iy,sp
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	1 (iy),a
	ld	a,(#_fat32 + 1)
	ld	hl,#_fat32 + 0
	or	a,(hl)
	jr	Z,00127$
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0014
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	a, (hl)
	and	a, #0x0F
	ld	d,a
	ld	hl,#0x0000
	push	af
	ld	iy,#16
	add	iy,sp
	ld	0 (iy),e
	ld	1 (iy),d
	ld	2 (iy),h
	ld	3 (iy),l
	pop	af
	ld	a,#0x10
00187$:
	sla	0 (iy)
	rl	1 (iy)
	rl	2 (iy)
	rl	3 (iy)
	dec	a
	jr	NZ,00187$
	jr	00128$
00127$:
	xor	a, a
	ld	iy,#14
	add	iy,sp
	ld	0 (iy),a
	ld	1 (iy),a
	ld	2 (iy),a
	ld	3 (iy),a
00128$:
	ld	hl, #18
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	bc,#0x0000
	ld	a,e
	ld	hl,#14
	add	hl,sp
	add	a, (hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a, (hl)
	ld	d,a
	ld	a,c
	inc	hl
	adc	a, (hl)
	ld	c,a
	ld	a,b
	inc	hl
	adc	a, (hl)
	ld	b,a
	ld	hl, #20
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;src/fat.c:261: file->sector = 0;
	ld	hl, #22
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/fat.c:265: return(1);
	ld	l,#0x01
	jp	00123$
00122$:
;src/fat.c:240: for (iEntry = 0; iEntry < nEntries; iEntry++)
	ld	iy,#6
	add	iy,sp
	inc	0 (iy)
	jp	NZ,00121$
	inc	1 (iy)
	jp	NZ,00121$
	inc	2 (iy)
	jp	NZ,00121$
	inc	3 (iy)
	jp	00121$
00111$:
;src/fat.c:271: if (fat32) // subdirectory is a linked cluster chain
	ld	a,(#_fat32 + 1)
	ld	hl,#_fat32 + 0
	or	a,(hl)
	jp	Z,00119$
;src/fat.c:273: iDirectoryCluster = GetCluster(iDirectoryCluster); // get next cluster in chain
	ld	iy,#0
	add	iy,sp
	ld	l,2 (iy)
	ld	h,3 (iy)
	push	hl
	ld	l,0 (iy)
	ld	h,1 (iy)
	push	hl
	call	_GetCluster
	pop	af
	pop	af
	ld	iy,#14
	add	iy,sp
	ld	3 (iy),d
	ld	2 (iy),e
	ld	1 (iy),h
	ld	0 (iy),l
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	hl, #14
	add	hl, sp
	ld	bc, #4
	ldir
;src/fat.c:277: if ((iDirectoryCluster & 0x0FFFFFF8) == 0x0FFFFFF8) // check if end of cluster chain
	ld	hl, #0+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0xF8
	ld	iy,#14
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #0+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#14
	add	iy,sp
	ld	1 (iy),a
	ld	hl, #0+2
	add	hl, sp
	ld	a, (hl)
	ld	iy,#14
	add	iy,sp
	ld	2 (iy),a
	ld	hl, #0+3
	add	hl, sp
	ld	a, (hl)
	and	a, #0x0F
	ld	iy,#14
	add	iy,sp
	ld	3 (iy),a
	ld	a,0 (iy)
	sub	a, #0xF8
	jr	NZ,00190$
	ld	a,1 (iy)
	inc	a
	jr	NZ,00190$
	ld	a,2 (iy)
	inc	a
	jr	NZ,00190$
	ld	a,3 (iy)
	sub	a, #0x0F
	jr	Z,00119$
00190$:
;src/fat.c:280: iDirectorySector = data_start + cluster_size * (iDirectoryCluster - 2); // calculate first sector address of the new cluster
	ld	iy,#0
	add	iy,sp
	ld	a,0 (iy)
	add	a,#0xFE
	ld	e,a
	ld	a,1 (iy)
	adc	a,#0xFF
	ld	d,a
	ld	a,2 (iy)
	adc	a,#0xFF
	ld	c,a
	ld	a,3 (iy)
	adc	a,#0xFF
	ld	b,a
	push	bc
	push	de
	ld	hl,(_cluster_size + 2)
	push	hl
	ld	hl,(_cluster_size)
	push	hl
	call	__mullong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	ld	b,h
	ld	a,(#_data_start + 0)
	add	a, c
	ld	c,a
	ld	a,(#_data_start + 1)
	adc	a, b
	ld	b,a
	ld	a,(#_data_start + 2)
	adc	a, e
	ld	e,a
	ld	a,(#_data_start + 3)
	adc	a, d
	ld	d,a
	ld	iy,#28
	add	iy,sp
	ld	0 (iy),c
	ld	1 (iy),b
	ld	2 (iy),e
	ld	3 (iy),d
	jp	00137$
;src/fat.c:283: break;
00119$:
;src/fat.c:286: return(0);
	ld	l,#0x00
00123$:
	ld	iy,#32
	add	iy,sp
	ld	sp,iy
	ret
;src/fat.c:290: unsigned char FileRead(fileTYPE *file, unsigned char *pBuffer)
;	---------------------------------
; Function FileRead
; ---------------------------------
_FileRead::
	ld	hl,#-12
	add	hl,sp
	ld	sp,hl
;src/fat.c:294: sb = data_start;							// start of data in partition
	ld	hl, #4
	add	hl, sp
	ex	de, hl
	ld	hl, #_data_start
	ld	bc, #4
	ldir
;src/fat.c:295: sb += cluster_size * (file->cluster-2);		// cluster offset
	ld	hl, #14+0
	add	hl, sp
	ld	a, (hl)
	ld	iy,#10
	add	iy,sp
	ld	0 (iy),a
	ld	hl, #14+1
	add	hl, sp
	ld	a, (hl)
	ld	iy,#10
	add	iy,sp
	ld	1 (iy),a
	ld	hl,#8
	add	hl,sp
	ld	a,0 (iy)
	add	a, #0x08
	ld	(hl),a
	ld	a,1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl),a
	ld	hl, #8
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,e
	add	a,#0xFE
	ld	e,a
	ld	a,d
	adc	a,#0xFF
	ld	d,a
	ld	a,c
	adc	a,#0xFF
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
	push	bc
	push	de
	ld	hl,(_cluster_size + 2)
	push	hl
	ld	hl,(_cluster_size)
	push	hl
	call	__mullong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	ld	b,h
	ld	iy,#4
	add	iy,sp
	ld	a,0 (iy)
	add	a, c
	ld	c,a
	ld	a,1 (iy)
	adc	a, b
	ld	b,a
	ld	a,2 (iy)
	adc	a, e
	ld	e,a
	ld	a,3 (iy)
	adc	a, d
	ld	d,a
	ld	iy,#0
	add	iy,sp
	ld	0 (iy),c
	ld	1 (iy),b
	ld	2 (iy),e
	ld	3 (iy),d
;src/fat.c:296: sb += file->sector & cluster_mask;			// sector offset in cluster
	ld	hl, #10
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,e
	ld	iy,#_cluster_mask
	and	a, 0 (iy)
	ld	e,a
	ld	a,d
	ld	iy,#_cluster_mask
	and	a, 1 (iy)
	ld	d,a
	ld	a,c
	ld	iy,#_cluster_mask
	and	a, 2 (iy)
	ld	c,a
	ld	a,b
	ld	iy,#_cluster_mask
	and	a, 3 (iy)
	ld	b,a
	ld	iy,#0
	add	iy,sp
	ld	a,0 (iy)
	add	a, e
	ld	e,a
	ld	a,1 (iy)
	adc	a, d
	ld	d,a
	ld	a,2 (iy)
	adc	a, c
	ld	c,a
	ld	a,3 (iy)
	adc	a, b
	ld	b,a
;src/fat.c:298: if (!MMC_Read(sb, pBuffer)) {				// read sector from drive
	ld	hl, #16
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	push	de
	call	_MMC_Read
	pop	af
	pop	af
	pop	af
	ld	a,l
;src/fat.c:299: return 0;
	or	a,a
	jr	NZ,00104$
	ld	l,a
	jp	00106$
00104$:
;src/fat.c:302: file->sector++;
	ld	iy,#10
	add	iy,sp
	ld	l,0 (iy)
	ld	h,1 (iy)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	c
	jr	NZ,00116$
	inc	b
	jr	NZ,00116$
	inc	e
	jr	NZ,00116$
	inc	d
00116$:
	ld	l,0 (iy)
	ld	h,1 (iy)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/fat.c:305: if ((file->sector & cluster_mask) == 0) {
	ld	a,c
	ld	iy,#_cluster_mask
	and	a, 0 (iy)
	ld	c,a
	ld	a,b
	ld	iy,#_cluster_mask
	and	a, 1 (iy)
	ld	b,a
	ld	a,e
	ld	iy,#_cluster_mask
	and	a, 2 (iy)
	ld	e,a
	ld	a,d
	ld	iy,#_cluster_mask
	and	a, 3 (iy)
	or	a, e
	or	a, b
	or	a,c
	jr	NZ,00105$
;src/fat.c:306: file->cluster = GetCluster(file->cluster);
	ld	hl, #8
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	bc
	push	de
	call	_GetCluster
	pop	af
	pop	af
	ld	b,l
	ld	c,h
	ld	hl, #8
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	(hl),b
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
00105$:
;src/fat.c:309: return 1;
	ld	l,#0x01
00106$:
	ld	iy,#12
	add	iy,sp
	ld	sp,iy
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
