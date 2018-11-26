
bin/ctrl_boot.or32:     file format elf32-or32
bin/ctrl_boot.or32
architecture: or32, flags 0x00000112:
EXEC_P, HAS_SYMS, D_PAGED
start address 0x00000018

Program Header:
    LOAD off    0x00002000 vaddr 0x00000000 paddr 0x00000000 align 2**13
         filesz 0x00000ebc memsz 0x00000ebc flags r-x
    LOAD off    0x00004000 vaddr 0x00440000 paddr 0x00000ebc align 2**13
         filesz 0x00000000 memsz 0x0000124c flags rw-

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .vectors      00000018  00000000  00000000  00002000  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .text         00000e84  00000018  00000018  00002018  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata       00000020  00000e9c  00000e9c  00002e9c  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .bss          0000024c  00440000  00000ebc  00004000  2**2
                  ALLOC
  4 .stack        00001000  0044024c  00001108  00004000  2**0
                  ALLOC
  5 .debug_abbrev 0000031f  00000000  00000000  00002ebc  2**0
                  CONTENTS, READONLY, DEBUGGING
  6 .debug_info   00000b3a  00000000  00000000  000031db  2**0
                  CONTENTS, READONLY, DEBUGGING
  7 .debug_line   00000b91  00000000  00000000  00003d15  2**0
                  CONTENTS, READONLY, DEBUGGING
  8 .debug_frame  000000ec  00000000  00000000  000048a8  2**2
                  CONTENTS, READONLY, DEBUGGING
  9 .debug_loc    00000768  00000000  00000000  00004994  2**0
                  CONTENTS, READONLY, DEBUGGING
 10 .debug_pubnames 0000001b  00000000  00000000  000050fc  2**0
                  CONTENTS, READONLY, DEBUGGING
 11 .debug_pubtypes 000000ca  00000000  00000000  00005117  2**0
                  CONTENTS, READONLY, DEBUGGING
 12 .debug_aranges 00000020  00000000  00000000  000051e1  2**0
                  CONTENTS, READONLY, DEBUGGING
 13 .debug_ranges 000001a0  00000000  00000000  00005201  2**0
                  CONTENTS, READONLY, DEBUGGING
 14 .debug_str    000003f6  00000000  00000000  000053a1  2**0
                  CONTENTS, READONLY, DEBUGGING
 15 .comment      00000051  00000000  00000000  00005797  2**0
                  CONTENTS, READONLY
SYMBOL TABLE:
00000000 l    d  .vectors	00000000 .vectors
00000018 l    d  .text	00000000 .text
00000e9c l    d  .rodata	00000000 .rodata
00440000 l    d  .bss	00000000 .bss
0044024c l    d  .stack	00000000 .stack
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_line	00000000 .debug_line
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_pubnames	00000000 .debug_pubnames
00000000 l    d  .debug_pubtypes	00000000 .debug_pubtypes
00000000 l    d  .debug_aranges	00000000 .debug_aranges
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_str	00000000 .debug_str
00000000 l    d  .comment	00000000 .comment
0044124c l       .stack	00000000 _stack
00000004 l       .vectors	00000000 _reset
00000004 l       .vectors	00000000 real_reset
00000028 l       .text	00000000 bss_init_start
0000003c l       .text	00000000 bss_init_end
00000000 l    df *ABS*	00000000 main.c
00000084 l     F .text	00000070 FatalError
00440218 l     O .bss	00000001 led.895
000000f4 l     F .text	0000003c SwapBBBB
00000130 l     F .text	00000068 MMC_CRC
00440219 l     O .bss	00000001 crc.4459
00000198 l     F .text	0000012c MMC_Command
00440220 l     O .bss	00000001 response.4461
000002c4 l     F .text	0000012c MMC_Read
00440221 l     O .bss	00000001 CardType.4462
0044021c l     O .bss	00000004 timeout.4460
000003f0 l     F .text	00000040 compare
00000430 l     F .text	000000ec GetCluster
00440208 l     O .bss	00000004 fat32.877
00440248 l     O .bss	00000004 buffered_fat_index.5411
00440224 l     O .bss	00000004 fat_start.5399
00440000 l     O .bss	00000200 sector_buffer.874
00440244 l     O .bss	00000004 partitioncount.5410
00440200 l     O .bss	00000004 cluster_size.875
00440204 l     O .bss	00000004 cluster_mask.876
00440238 l     O .bss	00000004 fat_number.5404
0044023c l     O .bss	00000004 dir_entries.5407
00440234 l     O .bss	00000004 root_directory_size.5403
00440240 l     O .bss	00000004 fat_size.5408
00440228 l     O .bss	00000004 data_start.5400
0044022c l     O .bss	00000004 root_directory_cluster.5401
00440230 l     O .bss	00000004 root_directory_start.5402
0044020c l     O .bss	0000000c file.893
00440000 g       *ABS*	00000000 __ram_start
00000ebc g       *ABS*	00000000 __data_rom
0045effc g       *ABS*	00000000 _heap_end
0044024c g       .bss	00000000 __bss_end
00001400 g       *ABS*	00000000 __rom_length
00020000 g       *ABS*	00000000 __ram_length
00000ebc g       *ABS*	00000000 __rom_size
00440000 g       .rodata	00000000 __data_end
00000048 g       .text	00000000 __mulsi3
00440000 g       .bss	00000000 __bss_start
0000051c g     F .text	00000980 main
0045fffc g       *ABS*	00000000 __stack
00000000 g       *ABS*	00000000 __rom_start
00440000 g       .rodata	00000000 __data_start



Disassembly of section .vectors:

00000000 <_reset-0x4>:
   0:	00 00 0e bc 	l.j 3af0 <__rom_length+0x26f0>

00000004 <_reset>:
   4:	18 00 00 00 	l.movhi r0,0x0
   8:	9c 60 00 01 	l.addi r3,r0,0x1
   c:	c0 00 18 11 	l.mtspr r0,r3,0x11
  10:	18 20 00 45 	l.movhi r1,0x45
  14:	a8 21 ff fc 	l.ori r1,r1,0xfffc

Disassembly of section .text:

00000018 <bss_init_start-0x10>:
  18:	18 40 00 44 	l.movhi r2,0x44
  1c:	a8 42 00 00 	l.ori r2,r2,0x0
  20:	18 60 00 44 	l.movhi r3,0x44
  24:	a8 63 02 4c 	l.ori r3,r3,0x24c

00000028 <bss_init_start>:
  28:	e4 62 18 00 	l.sfgeu r2,r3
  2c:	10 00 00 04 	l.bf 3c <bss_init_end>
  30:	d4 02 00 00 	l.sw 0x0(r2),r0
  34:	9c 42 00 04 	l.addi r2,r2,0x4
  38:	0f ff ff fc 	l.bnf 28 <bss_init_start>

0000003c <bss_init_end>:
  3c:	18 60 00 00 	l.movhi r3,0x0
  40:	a8 63 05 1c 	l.ori r3,r3,0x51c
  44:	44 00 18 00 	l.jr r3

00000048 <__mulsi3>:
  48:	9d 60 00 00 	l.addi r11,r0,0x0
  4c:	e4 23 58 00 	l.sfne r3,r11
  50:	0c 00 00 0b 	l.bnf 7c <__mulsi3+0x34>
  54:	a8 a3 00 00 	l.ori r5,r3,0x0
  58:	9c c0 00 00 	l.addi r6,r0,0x0
  5c:	a4 65 00 01 	l.andi r3,r5,0x1
  60:	e4 03 30 00 	l.sfeq r3,r6
  64:	10 00 00 03 	l.bf 70 <__mulsi3+0x28>
  68:	b8 a5 00 41 	l.srli r5,r5,0x1
  6c:	e1 6b 20 00 	l.add r11,r11,r4
  70:	e4 25 30 00 	l.sfne r5,r6
  74:	13 ff ff fa 	l.bf 5c <__mulsi3+0x14>
  78:	b8 84 00 01 	l.slli r4,r4,0x1
  7c:	44 00 48 00 	l.jr r9
  80:	15 00 00 00 	l.nop 0x0

00000084 <FatalError>:
// fatal error
void FatalError(void)
{
  DEBUG_FUNC_IN();

  DisableCard();
  84:	18 80 00 80 	l.movhi r4,0x80
  88:	9c a0 00 10 	l.addi r5,r0,0x10
  8c:	a8 64 00 20 	l.ori r3,r4,0x20
}


// fatal error
void FatalError(void)
{
  90:	d7 e1 17 fc 	l.sw 0xfffffffc(r1),r2
  DEBUG_FUNC_IN();

  DisableCard();
  94:	d4 03 28 00 	l.sw 0x0(r3),r5
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  98:	18 60 00 44 	l.movhi r3,0x44
}


// fatal error
void FatalError(void)
{
  9c:	9c 21 ff fc 	l.addi r1,r1,0xfffffffc
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  a0:	a8 63 02 18 	l.ori r3,r3,0x218
  a4:	90 a3 00 00 	l.lbs r5,0x0(r3)

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  a8:	a8 64 00 18 	l.ori r3,r4,0x18
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  ac:	a4 a5 ff ff 	l.andi r5,r5,0xffff
  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
  b0:	a8 84 00 04 	l.ori r4,r4,0x4

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  b4:	9c 40 00 00 	l.addi r2,r0,0x0
  b8:	d4 03 10 00 	l.sw 0x0(r3),r2
  bc:	84 c3 00 00 	l.lwz r6,0x0(r3)
  c0:	bc a6 00 c7 	l.sfleui r6,0xc7
  c4:	13 ff ff fe 	l.bf bc <FatalError+0x38>
  c8:	9c 40 00 00 	l.addi r2,r0,0x0
    LEDS(0x0);
  cc:	dc 04 10 00 	l.sh 0x0(r4),r2
    TIMER_wait(200);
  d0:	9c 40 00 00 	l.addi r2,r0,0x0
  d4:	d4 03 10 00 	l.sw 0x0(r3),r2
  d8:	84 c3 00 00 	l.lwz r6,0x0(r3)
  dc:	bc a6 00 c7 	l.sfleui r6,0xc7
  e0:	13 ff ff fe 	l.bf d8 <FatalError+0x54>
  e4:	15 00 00 00 	l.nop 0x0
    LEDS(led);
  e8:	dc 04 28 00 	l.sh 0x0(r4),r5
  }
  ec:	03 ff ff f3 	l.j b8 <FatalError+0x34>
  f0:	9c 40 00 00 	l.addi r2,r0,0x0

000000f4 <SwapBBBB>:

#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
  f4:	b8 83 00 58 	l.srli r4,r3,0x18
  f8:	b9 63 00 18 	l.slli r11,r3,0x18


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  fc:	d7 e1 17 fc 	l.sw 0xfffffffc(r1),r2
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
 100:	18 40 00 ff 	l.movhi r2,0xff
 104:	e1 6b 20 04 	l.or r11,r11,r4
 108:	e0 83 10 03 	l.and r4,r3,r2
 10c:	a4 63 ff 00 	l.andi r3,r3,0xff00
 110:	b8 84 00 48 	l.srli r4,r4,0x8


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
 114:	9c 21 ff fc 	l.addi r1,r1,0xfffffffc
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
 118:	b8 63 00 08 	l.slli r3,r3,0x8
 11c:	e1 6b 20 04 	l.or r11,r11,r4
}
 120:	9c 21 00 04 	l.addi r1,r1,0x4
 124:	e1 6b 18 04 	l.or r11,r11,r3
 128:	44 00 48 00 	l.jr r9
 12c:	84 41 ff fc 	l.lwz r2,0xfffffffc(r1)

00000130 <MMC_CRC>:
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 130:	18 80 00 44 	l.movhi r4,0x44
 134:	9c a0 00 00 	l.addi r5,r0,0x0
 138:	a8 84 02 19 	l.ori r4,r4,0x219
 13c:	8c 84 00 00 	l.lbz r4,0x0(r4)
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
 140:	b8 c3 00 18 	l.slli r6,r3,0x18
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
    crc <<= 1;
 144:	e0 84 20 00 	l.add r4,r4,r4
    if (c & 0x80)   crc ^= 0x09;
 148:	bd 66 00 00 	l.sfgesi r6,0x0
 14c:	10 00 00 03 	l.bf 158 <MMC_CRC+0x28>
 150:	a4 84 00 ff 	l.andi r4,r4,0xff
 154:	ac 84 00 09 	l.xori r4,r4,0x9
    if (crc & 0x80) crc ^= 0x09;
 158:	b8 c4 00 18 	l.slli r6,r4,0x18
 15c:	bd 66 00 00 	l.sfgesi r6,0x0
 160:	10 00 00 03 	l.bf 16c <MMC_CRC+0x3c>
 164:	15 00 00 00 	l.nop 0x0
 168:	ac 84 00 09 	l.xori r4,r4,0x9
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 16c:	9c a5 00 01 	l.addi r5,r5,0x1
 170:	a4 a5 00 ff 	l.andi r5,r5,0xff
 174:	bc 05 00 08 	l.sfeqi r5,0x8
 178:	10 00 00 04 	l.bf 188 <MMC_CRC+0x58>
 17c:	e0 63 18 00 	l.add r3,r3,r3
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
    if (crc & 0x80) crc ^= 0x09;
    c <<= 1;
 180:	03 ff ff f0 	l.j 140 <MMC_CRC+0x10>
 184:	a4 63 00 ff 	l.andi r3,r3,0xff
 188:	18 60 00 44 	l.movhi r3,0x44
 18c:	a8 63 02 19 	l.ori r3,r3,0x219
  }

  DEBUG_FUNC_OUT();
}
 190:	44 00 48 00 	l.jr r9
 194:	d8 03 20 00 	l.sb 0x0(r3),r4

00000198 <MMC_Command>:
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 198:	d7 e1 87 f4 	l.sw 0xfffffff4(r1),r16
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 19c:	1a 00 00 44 	l.movhi r16,0x44
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1a0:	d7 e1 17 ec 	l.sw 0xffffffec(r1),r2
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 1a4:	aa 10 02 19 	l.ori r16,r16,0x219
 1a8:	9c 40 00 00 	l.addi r2,r0,0x0
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1ac:	d7 e1 97 f8 	l.sw 0xfffffff8(r1),r18
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 1b0:	d8 10 10 00 	l.sb 0x0(r16),r2
  SPI(0xFF); // flush SPI-bus
 1b4:	18 40 00 80 	l.movhi r2,0x80
 1b8:	9e 40 00 ff 	l.addi r18,r0,0xff
 1bc:	a8 42 00 24 	l.ori r2,r2,0x24
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1c0:	d7 e1 4f fc 	l.sw 0xfffffffc(r1),r9
 1c4:	d7 e1 77 f0 	l.sw 0xfffffff0(r1),r14
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus
 1c8:	d4 02 90 00 	l.sw 0x0(r2),r18
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1cc:	a9 c4 00 00 	l.ori r14,r4,0x0
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus
 1d0:	84 82 00 00 	l.lwz r4,0x0(r2)

  SPI(cmd);
 1d4:	d4 02 18 00 	l.sw 0x0(r2),r3
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1d8:	9c 21 ff ec 	l.addi r1,r1,0xffffffec
  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus

  SPI(cmd);
 1dc:	84 82 00 00 	l.lwz r4,0x0(r2)
  MMC_CRC(cmd);
 1e0:	07 ff ff d4 	l.jal 130 <MMC_CRC>
 1e4:	15 00 00 00 	l.nop 0x0

  c = (unsigned char)(arg >> 24);
 1e8:	b8 6e 00 58 	l.srli r3,r14,0x18
  SPI(c);
 1ec:	d4 02 18 00 	l.sw 0x0(r2),r3
 1f0:	84 82 00 00 	l.lwz r4,0x0(r2)
  MMC_CRC(c);
 1f4:	07 ff ff cf 	l.jal 130 <MMC_CRC>
 1f8:	15 00 00 00 	l.nop 0x0

  c = (unsigned char)(arg >> 16);
 1fc:	b8 6e 00 50 	l.srli r3,r14,0x10
 200:	a4 63 00 ff 	l.andi r3,r3,0xff
  SPI(c);
 204:	d4 02 18 00 	l.sw 0x0(r2),r3
 208:	84 82 00 00 	l.lwz r4,0x0(r2)
  MMC_CRC(c);
 20c:	07 ff ff c9 	l.jal 130 <MMC_CRC>
 210:	15 00 00 00 	l.nop 0x0

  c = (unsigned char)(arg >> 8);
 214:	b8 6e 00 48 	l.srli r3,r14,0x8
 218:	a4 63 00 ff 	l.andi r3,r3,0xff
  SPI(c);
 21c:	d4 02 18 00 	l.sw 0x0(r2),r3
 220:	84 82 00 00 	l.lwz r4,0x0(r2)
  MMC_CRC(c);
 224:	07 ff ff c3 	l.jal 130 <MMC_CRC>
 228:	15 00 00 00 	l.nop 0x0

  c = (unsigned char)(arg);
 22c:	a4 6e 00 ff 	l.andi r3,r14,0xff
  SPI(c);
 230:	d4 02 18 00 	l.sw 0x0(r2),r3
 234:	84 82 00 00 	l.lwz r4,0x0(r2)
  MMC_CRC(c);
 238:	07 ff ff be 	l.jal 130 <MMC_CRC>
 23c:	15 00 00 00 	l.nop 0x0

  crc <<= 1;
 240:	8c 70 00 00 	l.lbz r3,0x0(r16)
 244:	e0 63 18 00 	l.add r3,r3,r3
  crc++;
 248:	9c 63 00 01 	l.addi r3,r3,0x1
 24c:	a4 63 00 ff 	l.andi r3,r3,0xff
 250:	d8 10 18 00 	l.sb 0x0(r16),r3
  SPI(crc);
 254:	d4 02 18 00 	l.sw 0x0(r2),r3
 258:	84 62 00 00 	l.lwz r3,0x0(r2)

  unsigned char Ncr = 100;  // Ncr = 0..8 (SD) / 1..8 (MMC)
 25c:	9c 60 00 64 	l.addi r3,r0,0x64
  do {
    response = SPI(0xFF); // get response
 260:	d4 02 90 00 	l.sw 0x0(r2),r18
 264:	85 62 00 00 	l.lwz r11,0x0(r2)
 268:	a5 6b 00 ff 	l.andi r11,r11,0xff
  } while (response == 0xFF && Ncr--);
 26c:	bc 0b 00 ff 	l.sfeqi r11,0xff
 270:	10 00 00 06 	l.bf 288 <MMC_Command+0xf0>
 274:	bc 03 00 00 	l.sfeqi r3,0x0
 278:	18 40 00 44 	l.movhi r2,0x44
 27c:	a8 42 02 20 	l.ori r2,r2,0x220
 280:	00 00 00 0a 	l.j 2a8 <MMC_Command+0x110>
 284:	d8 02 58 00 	l.sb 0x0(r2),r11
 288:	10 00 00 04 	l.bf 298 <MMC_Command+0x100>
 28c:	9c 63 ff ff 	l.addi r3,r3,0xffffffff
 290:	03 ff ff f4 	l.j 260 <MMC_Command+0xc8>
 294:	a4 63 00 ff 	l.andi r3,r3,0xff
 298:	18 40 00 44 	l.movhi r2,0x44
 29c:	9c 60 ff ff 	l.addi r3,r0,0xffffffff
 2a0:	a8 42 02 20 	l.ori r2,r2,0x220
 2a4:	d8 02 18 00 	l.sb 0x0(r2),r3

  return response;

  DEBUG_FUNC_OUT();
}
 2a8:	9c 21 00 14 	l.addi r1,r1,0x14
 2ac:	85 21 ff fc 	l.lwz r9,0xfffffffc(r1)
 2b0:	84 41 ff ec 	l.lwz r2,0xffffffec(r1)
 2b4:	85 c1 ff f0 	l.lwz r14,0xfffffff0(r1)
 2b8:	86 01 ff f4 	l.lwz r16,0xfffffff4(r1)
 2bc:	44 00 48 00 	l.jr r9
 2c0:	86 41 ff f8 	l.lwz r18,0xfffffff8(r1)

000002c4 <MMC_Read>:
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2c4:	a8 a3 00 00 	l.ori r5,r3,0x0
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2c8:	18 60 00 44 	l.movhi r3,0x44
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2cc:	d7 e1 17 f8 	l.sw 0xfffffff8(r1),r2
 2d0:	d7 e1 4f fc 	l.sw 0xfffffffc(r1),r9
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2d4:	a8 63 02 21 	l.ori r3,r3,0x221
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2d8:	9c 21 ff f8 	l.addi r1,r1,0xfffffff8
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2dc:	8c 63 00 00 	l.lbz r3,0x0(r3)
 2e0:	bc 03 00 03 	l.sfeqi r3,0x3
 2e4:	10 00 00 03 	l.bf 2f0 <MMC_Read+0x2c>
 2e8:	a8 44 00 00 	l.ori r2,r4,0x0
    lba = lba << 9; // otherwise convert sector adddress to byte address
 2ec:	b8 a5 00 09 	l.slli r5,r5,0x9
  }

  //EnableCard();

  if (MMC_Command(CMD17, lba)) {
 2f0:	9c 60 00 51 	l.addi r3,r0,0x51
 2f4:	07 ff ff a9 	l.jal 198 <MMC_Command>
 2f8:	a8 85 00 00 	l.ori r4,r5,0x0
    //printf("CMD17 (READ_BLOCK): invalid response 0x%02X (lba=%lu)\r", response, lba);
    //DisableCard();
    return(0);
 2fc:	9c 60 00 00 	l.addi r3,r0,0x0
    lba = lba << 9; // otherwise convert sector adddress to byte address
  }

  //EnableCard();

  if (MMC_Command(CMD17, lba)) {
 300:	e4 2b 18 00 	l.sfne r11,r3
 304:	10 00 00 36 	l.bf 3dc <MMC_Read+0x118>
 308:	15 00 00 00 	l.nop 0x0
    //DisableCard();
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
 30c:	18 60 00 44 	l.movhi r3,0x44
  while ((SPI(0xFF)) != 0xFE) {
 310:	9c 80 00 ff 	l.addi r4,r0,0xff
    //DisableCard();
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
 314:	a8 63 02 1c 	l.ori r3,r3,0x21c
 318:	d4 03 58 00 	l.sw 0x0(r3),r11
  while ((SPI(0xFF)) != 0xFE) {
 31c:	18 60 00 80 	l.movhi r3,0x80
 320:	00 00 00 0d 	l.j 354 <MMC_Read+0x90>
 324:	a8 63 00 24 	l.ori r3,r3,0x24
 328:	9d 6b 00 01 	l.addi r11,r11,0x1
    if (timeout++ >= 1000000) { // we can't wait forever
 32c:	9c ab ff ff 	l.addi r5,r11,0xffffffff
 330:	a8 c6 42 3f 	l.ori r6,r6,0x423f
 334:	e4 a5 30 00 	l.sfleu r5,r6
 338:	10 00 00 07 	l.bf 354 <MMC_Read+0x90>
 33c:	15 00 00 00 	l.nop 0x0
 340:	18 40 00 44 	l.movhi r2,0x44
      //printf("CMD17 (READ_BLOCK): no data token! (lba=%lu)\r", lba);
      //DisableCard();
      return(0);
 344:	9c 60 00 00 	l.addi r3,r0,0x0
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
    if (timeout++ >= 1000000) { // we can't wait forever
 348:	a8 42 02 1c 	l.ori r2,r2,0x21c
 34c:	00 00 00 24 	l.j 3dc <MMC_Read+0x118>
 350:	d4 02 58 00 	l.sw 0x0(r2),r11
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 354:	d4 03 20 00 	l.sw 0x0(r3),r4
 358:	84 a3 00 00 	l.lwz r5,0x0(r3)
 35c:	bc 25 00 fe 	l.sfnei r5,0xfe
 360:	13 ff ff f2 	l.bf 328 <MMC_Read+0x64>
 364:	18 c0 00 0f 	l.movhi r6,0xf
 368:	18 60 00 44 	l.movhi r3,0x44
  DEBUG_FUNC_OUT();
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
 36c:	9c c2 02 00 	l.addi r6,r2,0x200
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 370:	a8 63 02 1c 	l.ori r3,r3,0x21c
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
    *(pReadBuffer++) = SPI(0xFF);
 374:	9c 80 00 ff 	l.addi r4,r0,0xff
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 378:	d4 03 58 00 	l.sw 0x0(r3),r11
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
    *(pReadBuffer++) = SPI(0xFF);
 37c:	18 60 00 80 	l.movhi r3,0x80
 380:	a8 63 00 24 	l.ori r3,r3,0x24
 384:	d4 03 20 00 	l.sw 0x0(r3),r4
 388:	9c a0 00 ff 	l.addi r5,r0,0xff
 38c:	84 e3 00 00 	l.lwz r7,0x0(r3)
 390:	d8 02 38 00 	l.sb 0x0(r2),r7
    *(pReadBuffer++) = SPI(0xFF);
 394:	d4 03 20 00 	l.sw 0x0(r3),r4
 398:	84 e3 00 00 	l.lwz r7,0x0(r3)
 39c:	d8 02 38 01 	l.sb 0x1(r2),r7
    *(pReadBuffer++) = SPI(0xFF);
 3a0:	d4 03 20 00 	l.sw 0x0(r3),r4
 3a4:	84 e3 00 00 	l.lwz r7,0x0(r3)
 3a8:	d8 02 38 02 	l.sb 0x2(r2),r7
    *(pReadBuffer++) = SPI(0xFF);
 3ac:	d4 03 20 00 	l.sw 0x0(r3),r4
 3b0:	84 e3 00 00 	l.lwz r7,0x0(r3)
 3b4:	d8 02 38 03 	l.sb 0x3(r2),r7
  DEBUG_FUNC_OUT();
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
 3b8:	9c 42 00 04 	l.addi r2,r2,0x4
      //DisableCard();
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
 3bc:	e4 22 30 00 	l.sfne r2,r6
 3c0:	13 ff ff f1 	l.bf 384 <MMC_Read+0xc0>
 3c4:	15 00 00 00 	l.nop 0x0
    *(pReadBuffer++) = SPI(0xFF);
    *(pReadBuffer++) = SPI(0xFF);
    *(pReadBuffer++) = SPI(0xFF);
  }

  SPI(0xFF); // read CRC lo byte
 3c8:	d4 03 28 00 	l.sw 0x0(r3),r5
 3cc:	84 43 00 00 	l.lwz r2,0x0(r3)
  SPI(0xFF); // read CRC hi byte
 3d0:	d4 03 28 00 	l.sw 0x0(r3),r5
 3d4:	84 43 00 00 	l.lwz r2,0x0(r3)

  //DisableCard();
  return(1);
 3d8:	9c 60 00 01 	l.addi r3,r0,0x1

  DEBUG_FUNC_OUT();
}
 3dc:	9c 21 00 08 	l.addi r1,r1,0x8
 3e0:	a9 63 00 00 	l.ori r11,r3,0x0
 3e4:	85 21 ff fc 	l.lwz r9,0xfffffffc(r1)
 3e8:	44 00 48 00 	l.jr r9
 3ec:	84 41 ff f8 	l.lwz r2,0xfffffff8(r1)

000003f0 <compare>:


int compare(const char *s1, const char *s2,int b)
{
	int i;
	for(i=0;i<b;++i)
 3f0:	00 00 00 08 	l.j 410 <compare+0x20>
 3f4:	9c c0 00 00 	l.addi r6,r0,0x0
#define printf(...)
#define putserial(x)
#define BootPrint(x) puts(x);


int compare(const char *s1, const char *s2,int b)
 3f8:	e0 e4 30 00 	l.add r7,r4,r6
{
	int i;
	for(i=0;i<b;++i)
	{
		if(*s1++!=*s2++)
 3fc:	91 08 00 00 	l.lbs r8,0x0(r8)
 400:	90 e7 00 00 	l.lbs r7,0x0(r7)
 404:	e4 28 38 00 	l.sfne r8,r7
 408:	10 00 00 07 	l.bf 424 <compare+0x34>
 40c:	9c c6 00 01 	l.addi r6,r6,0x1


int compare(const char *s1, const char *s2,int b)
{
	int i;
	for(i=0;i<b;++i)
 410:	e5 86 28 00 	l.sflts r6,r5
 414:	13 ff ff f9 	l.bf 3f8 <compare+0x8>
 418:	e1 03 30 00 	l.add r8,r3,r6
	{
		if(*s1++!=*s2++)
			return(1);
	}
	return(0);
 41c:	00 00 00 03 	l.j 428 <compare+0x38>
 420:	9d 60 00 00 	l.addi r11,r0,0x0
{
	int i;
	for(i=0;i<b;++i)
	{
		if(*s1++!=*s2++)
			return(1);
 424:	9d 60 00 01 	l.addi r11,r0,0x1
	}
	return(0);
}
 428:	44 00 48 00 	l.jr r9
 42c:	15 00 00 00 	l.nop 0x0

00000430 <GetCluster>:
    return(1);
}


int GetCluster(int cluster)
{
 430:	d7 e1 17 ec 	l.sw 0xffffffec(r1),r2
	int i;
	uint32_t sb;
    if (fat32)
 434:	18 40 00 44 	l.movhi r2,0x44
    return(1);
}


int GetCluster(int cluster)
{
 438:	d7 e1 4f fc 	l.sw 0xfffffffc(r1),r9
 43c:	d7 e1 77 f0 	l.sw 0xfffffff0(r1),r14
 440:	d7 e1 87 f4 	l.sw 0xfffffff4(r1),r16
 444:	d7 e1 97 f8 	l.sw 0xfffffff8(r1),r18
	int i;
	uint32_t sb;
    if (fat32)
 448:	a8 42 02 08 	l.ori r2,r2,0x208
 44c:	86 42 00 00 	l.lwz r18,0x0(r2)
 450:	bc 12 00 00 	l.sfeqi r18,0x0
 454:	10 00 00 05 	l.bf 468 <GetCluster+0x38>
 458:	9c 21 ff ec 	l.addi r1,r1,0xffffffec
    {
        sb = cluster >> 7; // calculate sector number containing FAT-link
 45c:	b9 c3 00 87 	l.srai r14,r3,0x7
        i = cluster & 0x7F; // calculate link offsset within sector
 460:	00 00 00 04 	l.j 470 <GetCluster+0x40>
 464:	a4 43 00 7f 	l.andi r2,r3,0x7f
    }
    else
    {
        sb = cluster >> 8; // calculate sector number containing FAT-link
 468:	b9 c3 00 88 	l.srai r14,r3,0x8
        i = cluster & 0xFF; // calculate link offsset within sector
 46c:	a4 43 00 ff 	l.andi r2,r3,0xff
    }

    // read sector of FAT if not already in the buffer
    if (sb != buffered_fat_index)
 470:	1a 00 00 44 	l.movhi r16,0x44
 474:	aa 10 02 48 	l.ori r16,r16,0x248
 478:	84 70 00 00 	l.lwz r3,0x0(r16)
 47c:	e4 0e 18 00 	l.sfeq r14,r3
 480:	10 00 00 0c 	l.bf 4b0 <GetCluster+0x80>
 484:	18 60 00 44 	l.movhi r3,0x44
    {
        if (!MMC_Read(fat_start + sb, (unsigned char*)&fat_buffer))
 488:	18 80 00 44 	l.movhi r4,0x44
 48c:	a8 63 02 24 	l.ori r3,r3,0x224
 490:	a8 84 00 00 	l.ori r4,r4,0x0
 494:	84 63 00 00 	l.lwz r3,0x0(r3)
 498:	07 ff ff 8b 	l.jal 2c4 <MMC_Read>
 49c:	e0 6e 18 00 	l.add r3,r14,r3
 4a0:	bc 0b 00 00 	l.sfeqi r11,0x0
 4a4:	10 00 00 17 	l.bf 500 <GetCluster+0xd0>
 4a8:	15 00 00 00 	l.nop 0x0
            return(0);

        // remember current buffer index
        buffered_fat_index = sb;
 4ac:	d4 10 70 00 	l.sw 0x0(r16),r14
    }
    i = fat32 ? SwapBBBB(fat_buffer.fat32[i]) & 0x0FFFFFFF : SwapBB(fat_buffer.fat16[i]); // get FAT link for 68000 
 4b0:	bc 12 00 00 	l.sfeqi r18,0x0
 4b4:	10 00 00 0b 	l.bf 4e0 <GetCluster+0xb0>
 4b8:	18 60 00 44 	l.movhi r3,0x44
 4bc:	b8 42 00 02 	l.slli r2,r2,0x2
 4c0:	a8 63 00 00 	l.ori r3,r3,0x0
 4c4:	e0 42 18 00 	l.add r2,r2,r3
 4c8:	84 62 00 00 	l.lwz r3,0x0(r2)
 4cc:	07 ff ff 0a 	l.jal f4 <SwapBBBB>
 4d0:	18 40 0f ff 	l.movhi r2,0xfff
 4d4:	a8 42 ff ff 	l.ori r2,r2,0xffff
 4d8:	00 00 00 0a 	l.j 500 <GetCluster+0xd0>
 4dc:	e1 6b 10 03 	l.and r11,r11,r2
 4e0:	e0 42 10 00 	l.add r2,r2,r2
 4e4:	a8 63 00 00 	l.ori r3,r3,0x0
 4e8:	e0 42 18 00 	l.add r2,r2,r3
 4ec:	94 42 00 00 	l.lhz r2,0x0(r2)


uint16_t SwapBB(uint16_t i)
{
  return ((i&0x00ff)<<8) | ((i&0xff00)>>8);
 4f0:	b9 62 00 08 	l.slli r11,r2,0x8
 4f4:	b8 42 00 48 	l.srli r2,r2,0x8
 4f8:	e1 6b 10 04 	l.or r11,r11,r2
 4fc:	a5 6b ff ff 	l.andi r11,r11,0xffff
	return(i);
}
 500:	9c 21 00 14 	l.addi r1,r1,0x14
 504:	85 21 ff fc 	l.lwz r9,0xfffffffc(r1)
 508:	84 41 ff ec 	l.lwz r2,0xffffffec(r1)
 50c:	85 c1 ff f0 	l.lwz r14,0xfffffff0(r1)
 510:	86 01 ff f4 	l.lwz r16,0xfffffff4(r1)
 514:	44 00 48 00 	l.jr r9
 518:	86 41 ff f8 	l.lwz r18,0xfffffff8(r1)

0000051c <main>:
void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
{
 51c:	d7 e1 17 d8 	l.sw 0xffffffd8(r1),r2

  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
 520:	18 40 00 44 	l.movhi r2,0x44
 524:	9c 60 00 0f 	l.addi r3,r0,0xf
 528:	a8 42 02 18 	l.ori r2,r2,0x218
void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
{
 52c:	d7 e1 4f fc 	l.sw 0xfffffffc(r1),r9
 530:	d7 e1 77 dc 	l.sw 0xffffffdc(r1),r14
 534:	d7 e1 87 e0 	l.sw 0xffffffe0(r1),r16
 538:	d7 e1 97 e4 	l.sw 0xffffffe4(r1),r18
 53c:	d7 e1 a7 e8 	l.sw 0xffffffe8(r1),r20
 540:	d7 e1 b7 ec 	l.sw 0xffffffec(r1),r22
 544:	d7 e1 c7 f0 	l.sw 0xfffffff0(r1),r24
 548:	d7 e1 d7 f4 	l.sw 0xfffffff4(r1),r26
 54c:	d7 e1 e7 f8 	l.sw 0xfffffff8(r1),r28

  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
 550:	d8 02 18 00 	l.sb 0x0(r2),r3
 554:	18 40 00 80 	l.movhi r2,0x80
 558:	9c 80 00 0f 	l.addi r4,r0,0xf
 55c:	a8 62 00 04 	l.ori r3,r2,0x4
void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
{
 560:	9c 21 ff d4 	l.addi r1,r1,0xffffffd4

  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
 564:	dc 03 20 00 	l.sh 0x0(r3),r4
  DEBUG_FUNC_IN();

    unsigned char n;
    unsigned char ocr[4];

    SPI_slow();     // set slow clock
 568:	a8 62 00 1c 	l.ori r3,r2,0x1c
 56c:	9c 80 00 3f 	l.addi r4,r0,0x3f
 570:	d4 03 20 00 	l.sw 0x0(r3),r4
    DisableCard();  // CS = 1
 574:	a8 62 00 20 	l.ori r3,r2,0x20
 578:	9c 80 00 10 	l.addi r4,r0,0x10
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
 57c:	a8 42 00 24 	l.ori r2,r2,0x24

    unsigned char n;
    unsigned char ocr[4];

    SPI_slow();     // set slow clock
    DisableCard();  // CS = 1
 580:	d4 03 20 00 	l.sw 0x0(r3),r4
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
 584:	9c 60 00 00 	l.addi r3,r0,0x0
 588:	9c 80 00 ff 	l.addi r4,r0,0xff
 58c:	d4 02 20 00 	l.sw 0x0(r2),r4
 590:	9c 63 00 01 	l.addi r3,r3,0x1
 594:	84 a2 00 00 	l.lwz r5,0x0(r2)
 598:	a4 63 00 ff 	l.andi r3,r3,0xff
 59c:	bc 23 00 0a 	l.sfnei r3,0xa
 5a0:	13 ff ff fb 	l.bf 58c <main+0x70>
 5a4:	15 00 00 00 	l.nop 0x0
    TIMER_wait(20);  // 20ms delay
 5a8:	18 40 00 80 	l.movhi r2,0x80
 5ac:	9c 60 00 00 	l.addi r3,r0,0x0
 5b0:	a8 42 00 18 	l.ori r2,r2,0x18
 5b4:	d4 02 18 00 	l.sw 0x0(r2),r3
 5b8:	a8 62 00 00 	l.ori r3,r2,0x0
 5bc:	84 83 00 00 	l.lwz r4,0x0(r3)
 5c0:	bc a4 00 13 	l.sfleui r4,0x13
 5c4:	13 ff ff fe 	l.bf 5bc <main+0xa0>
 5c8:	18 40 00 80 	l.movhi r2,0x80
    EnableCard();
 5cc:	a8 62 00 20 	l.ori r3,r2,0x20
 5d0:	9c 80 00 11 	l.addi r4,r0,0x11

    CardType = CARDTYPE_NONE;

    for(n=0; n<16; n++) {
 5d4:	9d c0 00 00 	l.addi r14,r0,0x0
    SPI_slow();     // set slow clock
    DisableCard();  // CS = 1
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
    TIMER_wait(20);  // 20ms delay
    EnableCard();
 5d8:	d4 03 20 00 	l.sw 0x0(r3),r4

    CardType = CARDTYPE_NONE;
 5dc:	18 60 00 44 	l.movhi r3,0x44
 5e0:	9c 80 00 00 	l.addi r4,r0,0x0
 5e4:	a8 63 02 21 	l.ori r3,r3,0x221

    for(n=0; n<16; n++) {
      TIMER_wait(1);
 5e8:	a8 42 00 18 	l.ori r2,r2,0x18
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
    TIMER_wait(20);  // 20ms delay
    EnableCard();

    CardType = CARDTYPE_NONE;
 5ec:	d8 03 20 00 	l.sb 0x0(r3),r4

    for(n=0; n<16; n++) {
      TIMER_wait(1);
 5f0:	9c 60 00 00 	l.addi r3,r0,0x0
 5f4:	d4 02 18 00 	l.sw 0x0(r2),r3
 5f8:	84 62 00 00 	l.lwz r3,0x0(r2)
 5fc:	bc 03 00 00 	l.sfeqi r3,0x0
 600:	13 ff ff fe 	l.bf 5f8 <main+0xdc>
 604:	9c 60 00 40 	l.addi r3,r0,0x40
      if (MMC_Command(CMD0, 0) == 0x01) break; // try to send CMD0 multiple times
 608:	07 ff fe e4 	l.jal 198 <MMC_Command>
 60c:	9c 80 00 00 	l.addi r4,r0,0x0
 610:	bc 0b 00 01 	l.sfeqi r11,0x1
 614:	10 00 00 08 	l.bf 634 <main+0x118>
 618:	9d ce 00 01 	l.addi r14,r14,0x1
    TIMER_wait(20);  // 20ms delay
    EnableCard();

    CardType = CARDTYPE_NONE;

    for(n=0; n<16; n++) {
 61c:	a5 ce 00 ff 	l.andi r14,r14,0xff
 620:	bc 2e 00 10 	l.sfnei r14,0x10
 624:	13 ff ff f4 	l.bf 5f4 <main+0xd8>
 628:	9c 60 00 00 	l.addi r3,r0,0x0
 62c:	00 00 01 7c 	l.j c1c <main+0x700>
 630:	15 00 00 00 	l.nop 0x0
}

//// timer ////
unsigned long GetTimer(unsigned long offset)
{
  unsigned long systimer = TIMER_get();
 634:	85 c2 00 00 	l.lwz r14,0x0(r2)
  systimer = systimer<< 16;
  systimer += offset << 16;
 638:	18 80 0f a0 	l.movhi r4,0xfa0

//// timer ////
unsigned long GetTimer(unsigned long offset)
{
  unsigned long systimer = TIMER_get();
  systimer = systimer<< 16;
 63c:	b9 ce 00 10 	l.slli r14,r14,0x10
    }
    if (n<16) // got CMD0 IDLE response
    { // idle state
        //timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
 640:	18 40 00 44 	l.movhi r2,0x44
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
 644:	9c 60 00 48 	l.addi r3,r0,0x48
  systimer += offset << 16;
 648:	e1 ce 20 00 	l.add r14,r14,r4
    }
    if (n<16) // got CMD0 IDLE response
    { // idle state
        //timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
 64c:	a8 42 02 1c 	l.ori r2,r2,0x21c
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
 650:	9c 80 01 aa 	l.addi r4,r0,0x1aa
 654:	07 ff fe d1 	l.jal 198 <MMC_Command>
 658:	d4 02 70 00 	l.sw 0x0(r2),r14
 65c:	bc 2b 00 01 	l.sfnei r11,0x1
 660:	10 00 00 44 	l.bf 770 <main+0x254>
 664:	9c 60 00 77 	l.addi r3,r0,0x77
        {   // SDHC card
            for (n = 0; n < 4; n++)
                ocr[n] = SPI(0xFF); // get the rest of R7 response
 668:	18 80 00 80 	l.movhi r4,0x80
    { // idle state
        //timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
 66c:	a8 41 00 00 	l.ori r2,r1,0x0

void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
 670:	9e 01 00 04 	l.addi r16,r1,0x4
 674:	a8 61 00 00 	l.ori r3,r1,0x0
        {   // SDHC card
            for (n = 0; n < 4; n++)
                ocr[n] = SPI(0xFF); // get the rest of R7 response
 678:	a8 84 00 24 	l.ori r4,r4,0x24
 67c:	9c a0 00 ff 	l.addi r5,r0,0xff
 680:	d4 04 28 00 	l.sw 0x0(r4),r5
 684:	84 c4 00 00 	l.lwz r6,0x0(r4)
 688:	d8 03 30 00 	l.sb 0x0(r3),r6
 68c:	9c 63 00 01 	l.addi r3,r3,0x1
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
        {   // SDHC card
            for (n = 0; n < 4; n++)
 690:	e4 23 80 00 	l.sfne r3,r16
 694:	13 ff ff fb 	l.bf 680 <main+0x164>
 698:	15 00 00 00 	l.nop 0x0
                ocr[n] = SPI(0xFF); // get the rest of R7 response
            if (ocr[2] == 0x01 && ocr[3] == 0xAA)
 69c:	8c 61 00 02 	l.lbz r3,0x2(r1)
 6a0:	bc 23 00 01 	l.sfnei r3,0x1
 6a4:	10 00 00 33 	l.bf 770 <main+0x254>
 6a8:	9c 60 00 77 	l.addi r3,r0,0x77
 6ac:	8c 61 00 03 	l.lbz r3,0x3(r1)
 6b0:	bc 03 00 aa 	l.sfeqi r3,0xaa
 6b4:	0c 00 00 2f 	l.bnf 770 <main+0x254>
 6b8:	9c 60 00 77 	l.addi r3,r0,0x77
}


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
 6bc:	00 00 00 24 	l.j 74c <main+0x230>
 6c0:	1a 40 00 80 	l.movhi r18,0x80
                //printf("SDHC card detected\r");
                while (!CheckTimer(timeout))
                { // now we must wait until CMD41 returns 0 (or timeout elapses)
                    if (MMC_Command(CMD55, 0) == 0x01)
                    { // CMD55 must precede any ACMD command
                        if (MMC_Command(CMD41, 1 << 30) == 0x00) // ACMD41 with HCS bit
 6c4:	07 ff fe b5 	l.jal 198 <MMC_Command>
 6c8:	9c 60 00 69 	l.addi r3,r0,0x69
 6cc:	bc 2b 00 00 	l.sfnei r11,0x0
 6d0:	10 00 00 20 	l.bf 750 <main+0x234>
 6d4:	a8 8b 00 00 	l.ori r4,r11,0x0
                        { // initialization completed
                            if (MMC_Command(CMD58, 0) == 0x00)
 6d8:	07 ff fe b0 	l.jal 198 <MMC_Command>
 6dc:	9c 60 00 7a 	l.addi r3,r0,0x7a
 6e0:	bc 2b 00 00 	l.sfnei r11,0x0
 6e4:	10 00 00 14 	l.bf 734 <main+0x218>
 6e8:	18 60 00 80 	l.movhi r3,0x80
                            { // check CCS (Card Capacity Status) bit in the OCR
                                for (n = 0; n < 4; n++)
                                    ocr[n] = SPI(0xFF);
 6ec:	9c 80 00 ff 	l.addi r4,r0,0xff
 6f0:	a8 63 00 24 	l.ori r3,r3,0x24
 6f4:	d4 03 20 00 	l.sw 0x0(r3),r4
 6f8:	84 a3 00 00 	l.lwz r5,0x0(r3)
 6fc:	d8 02 28 00 	l.sb 0x0(r2),r5
 700:	9c 42 00 01 	l.addi r2,r2,0x1
                    { // CMD55 must precede any ACMD command
                        if (MMC_Command(CMD41, 1 << 30) == 0x00) // ACMD41 with HCS bit
                        { // initialization completed
                            if (MMC_Command(CMD58, 0) == 0x00)
                            { // check CCS (Card Capacity Status) bit in the OCR
                                for (n = 0; n < 4; n++)
 704:	e4 22 80 00 	l.sfne r2,r16
 708:	13 ff ff fb 	l.bf 6f4 <main+0x1d8>
 70c:	15 00 00 00 	l.nop 0x0
                                    ocr[n] = SPI(0xFF);

                                CardType = (ocr[0] & 0x40) ? CARDTYPE_SDHC : CARDTYPE_SD; // if CCS set then the card is SDHC compatible
 710:	8c 61 00 00 	l.lbz r3,0x0(r1)
 714:	a4 63 00 40 	l.andi r3,r3,0x40
 718:	bc 03 00 00 	l.sfeqi r3,0x0
 71c:	10 00 00 03 	l.bf 728 <main+0x20c>
 720:	9c 40 00 02 	l.addi r2,r0,0x2
 724:	9c 40 00 03 	l.addi r2,r0,0x3
 728:	18 60 00 44 	l.movhi r3,0x44
 72c:	a8 63 02 21 	l.ori r3,r3,0x221
 730:	d8 03 10 00 	l.sb 0x0(r3),r2
                            }
                            //printf("CMD58 (READ_OCR) failed!\r");
                            //DisableCard();

                            // set appropriate SPI speed
                            SPI_fast();
 734:	18 40 00 80 	l.movhi r2,0x80
 738:	9c 60 00 01 	l.addi r3,r0,0x1
 73c:	a8 42 00 1c 	l.ori r2,r2,0x1c
 740:	d4 02 18 00 	l.sw 0x0(r2),r3
                                //printf("CMD16 (SET_BLOCKLEN) failed!\r");
                            //DisableCard();

                            // set appropriate SPI speed
                            SPI_fast();
                            return(CardType);
 744:	00 00 00 25 	l.j 7d8 <main+0x2bc>
 748:	18 40 00 44 	l.movhi r2,0x44
 74c:	aa 52 00 18 	l.ori r18,r18,0x18
 750:	84 72 00 00 	l.lwz r3,0x0(r18)
  systimer = systimer<< 16;
 754:	b8 63 00 10 	l.slli r3,r3,0x10
  time -= systimer;
 758:	e0 6e 18 02 	l.sub r3,r14,r3
  if(time & 0x80000000) return(1);
 75c:	bd 83 00 00 	l.sfltsi r3,0x0
 760:	0c 00 01 c1 	l.bnf e64 <main+0x948>
 764:	9c 60 00 77 	l.addi r3,r0,0x77
 768:	00 00 01 2d 	l.j c1c <main+0x700>
 76c:	15 00 00 00 	l.nop 0x0
                return(CARDTYPE_NONE);
            }
        }

        // it's not an SDHC card
        if (MMC_Command(CMD55, 0) == 0x01)
 770:	07 ff fe 8a 	l.jal 198 <MMC_Command>
 774:	9c 80 00 00 	l.addi r4,r0,0x0
 778:	bc 2b 00 01 	l.sfnei r11,0x1
 77c:	10 00 01 28 	l.bf c1c <main+0x700>
 780:	9c 60 00 69 	l.addi r3,r0,0x69
        { // CMD55 accepted so it's an SD card (or Kingston 128 MB MMC)
            if (MMC_Command(CMD41, 0) <= 0x01)
 784:	07 ff fe 85 	l.jal 198 <MMC_Command>
 788:	9c 80 00 00 	l.addi r4,r0,0x0
 78c:	bc ab 00 01 	l.sfleui r11,0x1
 790:	0c 00 01 23 	l.bnf c1c <main+0x700>
 794:	15 00 00 00 	l.nop 0x0
}


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
 798:	00 00 00 17 	l.j 7f4 <main+0x2d8>
 79c:	1a 00 00 80 	l.movhi r16,0x80
                //printf("timeout:%08X\r",GetTimer(0));
                while (!CheckTimer(timeout))
                { // now we must wait until CMD41 returns 0 (or timeout elapses)
                    if (MMC_Command(CMD55, 0) == 0x01)
                    { // CMD55 must precede any ACMD command
                        if (MMC_Command(CMD41, 0) == 0x00)
 7a0:	9c 60 00 69 	l.addi r3,r0,0x69
 7a4:	07 ff fe 7d 	l.jal 198 <MMC_Command>
 7a8:	9c 80 00 00 	l.addi r4,r0,0x0
 7ac:	bc 2b 00 00 	l.sfnei r11,0x0
 7b0:	10 00 00 14 	l.bf 800 <main+0x2e4>
 7b4:	9c 60 00 50 	l.addi r3,r0,0x50
                        { // initialization completed

                            if (MMC_Command(CMD16, 512) != 0x00) //set block length
 7b8:	07 ff fe 78 	l.jal 198 <MMC_Command>
 7bc:	9c 80 02 00 	l.addi r4,r0,0x200
 7c0:	bc 0b 00 00 	l.sfeqi r11,0x0
 7c4:	10 00 00 04 	l.bf 7d4 <main+0x2b8>
 7c8:	18 40 00 80 	l.movhi r2,0x80
                                //printf("CMD16 (SET_BLOCKLEN) failed!\r");
                            //DisableCard();

                            // set appropriate SPI speed
                            SPI_fast();
 7cc:	a8 42 00 1c 	l.ori r2,r2,0x1c
 7d0:	d4 02 70 00 	l.sw 0x0(r2),r14
                            return(CardType);
 7d4:	18 40 00 44 	l.movhi r2,0x44
 7d8:	a8 42 02 21 	l.ori r2,r2,0x221
 7dc:	8c 42 00 00 	l.lbz r2,0x0(r2)
  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
  if (!MMC_Init()) FatalError();
 7e0:	bc 22 00 00 	l.sfnei r2,0x0
 7e4:	10 00 00 10 	l.bf 824 <main+0x308>
 7e8:	9c 60 00 08 	l.addi r3,r0,0x8
 7ec:	00 00 01 0c 	l.j c1c <main+0x700>
 7f0:	15 00 00 00 	l.nop 0x0
  systimer = systimer<< 16;
  time -= systimer;
 7f4:	18 40 00 44 	l.movhi r2,0x44
}


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
 7f8:	aa 10 00 18 	l.ori r16,r16,0x18
  systimer = systimer<< 16;
  time -= systimer;
 7fc:	a8 42 02 1c 	l.ori r2,r2,0x21c
}


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
 800:	84 70 00 00 	l.lwz r3,0x0(r16)
  systimer = systimer<< 16;
  time -= systimer;
 804:	84 82 00 00 	l.lwz r4,0x0(r2)


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
  systimer = systimer<< 16;
 808:	b8 63 00 10 	l.slli r3,r3,0x10
  time -= systimer;
 80c:	e0 64 18 02 	l.sub r3,r4,r3
  if(time & 0x80000000) return(1);
 810:	bd 83 00 00 	l.sfltsi r3,0x0
 814:	0c 00 01 9b 	l.bnf e80 <main+0x964>
 818:	9c 60 00 77 	l.addi r3,r0,0x77
 81c:	00 00 01 00 	l.j c1c <main+0x700>
 820:	15 00 00 00 	l.nop 0x0

  // find drive
  LEDS(led=0x8);
 824:	18 40 00 44 	l.movhi r2,0x44
 828:	a8 42 02 18 	l.ori r2,r2,0x218
 82c:	9c 80 00 08 	l.addi r4,r0,0x8
 830:	d8 02 18 00 	l.sb 0x0(r2),r3
 834:	18 40 00 80 	l.movhi r2,0x80

// FindDrive() checks if a card is present and contains FAT formatted primary partition
unsigned char FindDrive(void)
{
	unsigned long boot_sector;              // partition boot sector
    buffered_fat_index = -1;
 838:	9c 60 ff ff 	l.addi r3,r0,0xffffffff
 83c:	a8 42 00 04 	l.ori r2,r2,0x4
 840:	dc 02 20 00 	l.sh 0x0(r2),r4
 844:	18 40 00 44 	l.movhi r2,0x44
	fat32=0;

    if (!MMC_Read(0, sector_buffer)) // read MBR
 848:	18 80 00 44 	l.movhi r4,0x44

// FindDrive() checks if a card is present and contains FAT formatted primary partition
unsigned char FindDrive(void)
{
	unsigned long boot_sector;              // partition boot sector
    buffered_fat_index = -1;
 84c:	a8 42 02 48 	l.ori r2,r2,0x248
	fat32=0;

    if (!MMC_Read(0, sector_buffer)) // read MBR
 850:	a8 84 00 00 	l.ori r4,r4,0x0

// FindDrive() checks if a card is present and contains FAT formatted primary partition
unsigned char FindDrive(void)
{
	unsigned long boot_sector;              // partition boot sector
    buffered_fat_index = -1;
 854:	d4 02 18 00 	l.sw 0x0(r2),r3
	fat32=0;
 858:	18 40 00 44 	l.movhi r2,0x44
 85c:	9c 60 00 00 	l.addi r3,r0,0x0
 860:	a8 42 02 08 	l.ori r2,r2,0x208

    if (!MMC_Read(0, sector_buffer)) // read MBR
 864:	07 ff fe 98 	l.jal 2c4 <MMC_Read>
 868:	d4 02 18 00 	l.sw 0x0(r2),r3
 86c:	bc 0b 00 00 	l.sfeqi r11,0x0
 870:	10 00 00 eb 	l.bf c1c <main+0x700>
 874:	9c 60 00 01 	l.addi r3,r0,0x1
        return(0);

	boot_sector=0;
	partitioncount=1;
 878:	18 40 00 44 	l.movhi r2,0x44
 87c:	a8 42 02 44 	l.ori r2,r2,0x244

	// If we can identify a filesystem on block 0 we don't look for partitions
    if (compare((const char*)&sector_buffer[0x36], "FAT16   ",8)==0) // check for FAT16
 880:	18 80 00 00 	l.movhi r4,0x0

    if (!MMC_Read(0, sector_buffer)) // read MBR
        return(0);

	boot_sector=0;
	partitioncount=1;
 884:	d4 02 18 00 	l.sw 0x0(r2),r3

	// If we can identify a filesystem on block 0 we don't look for partitions
    if (compare((const char*)&sector_buffer[0x36], "FAT16   ",8)==0) // check for FAT16
 888:	18 60 00 44 	l.movhi r3,0x44
 88c:	a8 84 0e 9c 	l.ori r4,r4,0xe9c
 890:	a8 63 00 36 	l.ori r3,r3,0x36
 894:	07 ff fe d7 	l.jal 3f0 <compare>
 898:	9c a0 00 08 	l.addi r5,r0,0x8
 89c:	bc 2b 00 00 	l.sfnei r11,0x0
 8a0:	10 00 00 03 	l.bf 8ac <main+0x390>
 8a4:	18 60 00 44 	l.movhi r3,0x44
		partitioncount=0;
 8a8:	d4 02 58 00 	l.sw 0x0(r2),r11
    if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8)==0) // check for FAT32
 8ac:	18 80 00 00 	l.movhi r4,0x0
 8b0:	a8 63 00 52 	l.ori r3,r3,0x52
 8b4:	a8 84 0e a5 	l.ori r4,r4,0xea5
 8b8:	07 ff fe ce 	l.jal 3f0 <compare>
 8bc:	9c a0 00 08 	l.addi r5,r0,0x8
 8c0:	bc 2b 00 00 	l.sfnei r11,0x0
 8c4:	10 00 00 05 	l.bf 8d8 <main+0x3bc>
 8c8:	18 40 00 44 	l.movhi r2,0x44
		partitioncount=0;
 8cc:	a8 42 02 44 	l.ori r2,r2,0x244
 8d0:	d4 02 58 00 	l.sw 0x0(r2),r11

	if(partitioncount)
 8d4:	18 40 00 44 	l.movhi r2,0x44
 8d8:	a8 42 02 44 	l.ori r2,r2,0x244
 8dc:	85 c2 00 00 	l.lwz r14,0x0(r2)
 8e0:	bc 0e 00 00 	l.sfeqi r14,0x0
 8e4:	10 00 00 1a 	l.bf 94c <main+0x430>
 8e8:	18 60 00 44 	l.movhi r3,0x44
	{
		// We have at least one partition, parse the MBR.
		struct MasterBootRecord *mbr=(struct MasterBootRecord *)sector_buffer;

		boot_sector = mbr->Partition[0].startlba;
 8ec:	18 40 00 44 	l.movhi r2,0x44
 8f0:	a8 42 00 00 	l.ori r2,r2,0x0
 8f4:	95 c2 01 c6 	l.lhz r14,0x1c6(r2)
 8f8:	94 62 01 c8 	l.lhz r3,0x1c8(r2)
 8fc:	b9 ce 00 10 	l.slli r14,r14,0x10
		if(mbr->Signature==0x55aa)
 900:	94 42 01 fe 	l.lhz r2,0x1fe(r2)
 904:	bc 22 55 aa 	l.sfnei r2,0x55aa
 908:	10 00 00 06 	l.bf 920 <main+0x404>
 90c:	e1 c3 70 04 	l.or r14,r3,r14
				boot_sector=SwapBBBB(mbr->Partition[0].startlba);
 910:	07 ff fd f9 	l.jal f4 <SwapBBBB>
 914:	a8 6e 00 00 	l.ori r3,r14,0x0
 918:	00 00 00 06 	l.j 930 <main+0x414>
 91c:	a9 cb 00 00 	l.ori r14,r11,0x0
		else if(mbr->Signature!=0xaa55)
 920:	a8 80 aa 55 	l.ori r4,r0,0xaa55
 924:	e4 22 20 00 	l.sfne r2,r4
 928:	10 00 00 bd 	l.bf c1c <main+0x700>
 92c:	15 00 00 00 	l.nop 0x0
		{
				BootPrint("No partition signature found\n");
				return(0);
		}
		if (!MMC_Read(boot_sector, sector_buffer)) // read discriptor
 930:	18 80 00 44 	l.movhi r4,0x44
 934:	a8 6e 00 00 	l.ori r3,r14,0x0
 938:	07 ff fe 63 	l.jal 2c4 <MMC_Read>
 93c:	a8 84 00 00 	l.ori r4,r4,0x0
 940:	bc 0b 00 00 	l.sfeqi r11,0x0
 944:	10 00 00 b6 	l.bf c1c <main+0x700>
 948:	18 60 00 44 	l.movhi r3,0x44
		    return(0);
		BootPrint("Read boot sector from first partition\n");
	}

    if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8)==0) // check for FAT16
 94c:	18 80 00 00 	l.movhi r4,0x0
 950:	a8 63 00 52 	l.ori r3,r3,0x52
 954:	a8 84 0e a5 	l.ori r4,r4,0xea5
 958:	07 ff fe a6 	l.jal 3f0 <compare>
 95c:	9c a0 00 08 	l.addi r5,r0,0x8
 960:	bc 2b 00 00 	l.sfnei r11,0x0
 964:	10 00 00 07 	l.bf 980 <main+0x464>
 968:	18 60 00 44 	l.movhi r3,0x44
		fat32=1;
 96c:	18 40 00 44 	l.movhi r2,0x44
 970:	9c 60 00 01 	l.addi r3,r0,0x1
 974:	a8 42 02 08 	l.ori r2,r2,0x208
 978:	00 00 00 0a 	l.j 9a0 <main+0x484>
 97c:	d4 02 18 00 	l.sw 0x0(r2),r3
	else if (compare((const char*)&sector_buffer[0x36], "FAT16   ",8)!=0) // check for FAT32
 980:	18 80 00 00 	l.movhi r4,0x0
 984:	a8 63 00 36 	l.ori r3,r3,0x36
 988:	a8 84 0e 9c 	l.ori r4,r4,0xe9c
 98c:	07 ff fe 99 	l.jal 3f0 <compare>
 990:	9c a0 00 08 	l.addi r5,r0,0x8
 994:	bc 2b 00 00 	l.sfnei r11,0x0
 998:	10 00 00 a1 	l.bf c1c <main+0x700>
 99c:	15 00 00 00 	l.nop 0x0
	{
        printf("Unsupported partition type!\r");
		return(0);
	}

    if (sector_buffer[510] != 0x55 || sector_buffer[511] != 0xaa)  // check signature
 9a0:	18 40 00 44 	l.movhi r2,0x44
 9a4:	a8 42 00 00 	l.ori r2,r2,0x0
 9a8:	8c 62 01 fe 	l.lbz r3,0x1fe(r2)
 9ac:	bc 23 00 55 	l.sfnei r3,0x55
 9b0:	10 00 00 9b 	l.bf c1c <main+0x700>
 9b4:	15 00 00 00 	l.nop 0x0
 9b8:	8c 62 01 ff 	l.lbz r3,0x1ff(r2)
 9bc:	bc 23 00 aa 	l.sfnei r3,0xaa
 9c0:	10 00 00 97 	l.bf c1c <main+0x700>
 9c4:	15 00 00 00 	l.nop 0x0
        return(0);

    // check for near-jump or short-jump opcode
    if (sector_buffer[0] != 0xe9 && sector_buffer[0] != 0xeb)
 9c8:	8c 42 00 00 	l.lbz r2,0x0(r2)
 9cc:	bc 02 00 eb 	l.sfeqi r2,0xeb
 9d0:	10 00 00 04 	l.bf 9e0 <main+0x4c4>
 9d4:	bc 22 00 e9 	l.sfnei r2,0xe9
 9d8:	10 00 00 91 	l.bf c1c <main+0x700>
 9dc:	15 00 00 00 	l.nop 0x0
        return(0);

    // check if blocksize is really 512 bytes
    if (sector_buffer[11] != 0x00 || sector_buffer[12] != 0x02)
 9e0:	18 40 00 44 	l.movhi r2,0x44
 9e4:	a8 42 00 00 	l.ori r2,r2,0x0
 9e8:	8c 62 00 0b 	l.lbz r3,0xb(r2)
 9ec:	bc 23 00 00 	l.sfnei r3,0x0
 9f0:	10 00 00 8b 	l.bf c1c <main+0x700>
 9f4:	15 00 00 00 	l.nop 0x0
 9f8:	8c 62 00 0c 	l.lbz r3,0xc(r2)
 9fc:	bc 23 00 02 	l.sfnei r3,0x2
 a00:	10 00 00 87 	l.bf c1c <main+0x700>
 a04:	18 60 00 44 	l.movhi r3,0x44
        return(0);

    // get cluster_size
    cluster_size = sector_buffer[13];
 a08:	8e 82 00 0d 	l.lbz r20,0xd(r2)
 a0c:	a8 63 02 00 	l.ori r3,r3,0x200

    // calculate cluster mask
    cluster_mask = cluster_size - 1;
 a10:	9c 94 ff ff 	l.addi r4,r20,0xffffffff
    // check if blocksize is really 512 bytes
    if (sector_buffer[11] != 0x00 || sector_buffer[12] != 0x02)
        return(0);

    // get cluster_size
    cluster_size = sector_buffer[13];
 a14:	d4 03 a0 00 	l.sw 0x0(r3),r20

    // calculate cluster mask
    cluster_mask = cluster_size - 1;
 a18:	18 60 00 44 	l.movhi r3,0x44

    fat_start = boot_sector + sector_buffer[0x0E] + (sector_buffer[0x0F] << 8); // reserved sector count before FAT table (usually 32 for FAT32)
	fat_number = sector_buffer[0x10];
 a1c:	8e 42 00 10 	l.lbz r18,0x10(r2)

    // get cluster_size
    cluster_size = sector_buffer[13];

    // calculate cluster mask
    cluster_mask = cluster_size - 1;
 a20:	a8 63 02 04 	l.ori r3,r3,0x204
 a24:	d4 03 20 00 	l.sw 0x0(r3),r4

    fat_start = boot_sector + sector_buffer[0x0E] + (sector_buffer[0x0F] << 8); // reserved sector count before FAT table (usually 32 for FAT32)
 a28:	8c 62 00 0f 	l.lbz r3,0xf(r2)
 a2c:	8c 82 00 0e 	l.lbz r4,0xe(r2)
 a30:	b8 63 00 08 	l.slli r3,r3,0x8
 a34:	e0 63 20 00 	l.add r3,r3,r4
 a38:	e1 c3 70 00 	l.add r14,r3,r14
 a3c:	18 60 00 44 	l.movhi r3,0x44
 a40:	a8 63 02 24 	l.ori r3,r3,0x224
 a44:	d4 03 70 00 	l.sw 0x0(r3),r14
	fat_number = sector_buffer[0x10];
 a48:	18 60 00 44 	l.movhi r3,0x44
 a4c:	a8 63 02 38 	l.ori r3,r3,0x238
 a50:	d4 03 90 00 	l.sw 0x0(r3),r18

    if (fat32)
 a54:	18 60 00 44 	l.movhi r3,0x44
 a58:	a8 63 02 08 	l.ori r3,r3,0x208
 a5c:	86 03 00 00 	l.lwz r16,0x0(r3)
 a60:	bc 10 00 00 	l.sfeqi r16,0x0
 a64:	10 00 00 38 	l.bf b44 <main+0x628>
 a68:	a8 92 00 00 	l.ori r4,r18,0x0
    {
        if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8) != 0) // check file system type
 a6c:	18 80 00 00 	l.movhi r4,0x0
 a70:	9c 62 00 52 	l.addi r3,r2,0x52
 a74:	a8 84 0e a5 	l.ori r4,r4,0xea5
 a78:	07 ff fe 5e 	l.jal 3f0 <compare>
 a7c:	9c a0 00 08 	l.addi r5,r0,0x8
 a80:	bc 2b 00 00 	l.sfnei r11,0x0
 a84:	10 00 00 66 	l.bf c1c <main+0x700>
 a88:	18 60 00 44 	l.movhi r3,0x44
            return(0);

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
 a8c:	b8 94 00 04 	l.slli r4,r20,0x4
 a90:	a8 63 02 3c 	l.ori r3,r3,0x23c
 a94:	d4 03 20 00 	l.sw 0x0(r3),r4
        root_directory_size = cluster_size; // root directory size in sectors
 a98:	18 60 00 44 	l.movhi r3,0x44
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
 a9c:	8c 82 00 25 	l.lbz r4,0x25(r2)
    {
        if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8) != 0) // check file system type
            return(0);

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
        root_directory_size = cluster_size; // root directory size in sectors
 aa0:	a8 63 02 34 	l.ori r3,r3,0x234
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
 aa4:	b8 84 00 08 	l.slli r4,r4,0x8
    {
        if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8) != 0) // check file system type
            return(0);

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
        root_directory_size = cluster_size; // root directory size in sectors
 aa8:	d4 03 a0 00 	l.sw 0x0(r3),r20
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
 aac:	8c 62 00 26 	l.lbz r3,0x26(r2)
 ab0:	b8 63 00 10 	l.slli r3,r3,0x10
 ab4:	e0 64 18 00 	l.add r3,r4,r3
 ab8:	8c 82 00 24 	l.lbz r4,0x24(r2)
 abc:	e0 63 20 00 	l.add r3,r3,r4
 ac0:	8c 82 00 27 	l.lbz r4,0x27(r2)
 ac4:	b8 84 00 18 	l.slli r4,r4,0x18
 ac8:	e0 63 20 00 	l.add r3,r3,r4
 acc:	18 80 00 44 	l.movhi r4,0x44
 ad0:	a8 84 02 40 	l.ori r4,r4,0x240
 ad4:	d4 04 18 00 	l.sw 0x0(r4),r3
        data_start = fat_start + (fat_number * fat_size);
 ad8:	07 ff fd 5c 	l.jal 48 <__mulsi3>
 adc:	a8 92 00 00 	l.ori r4,r18,0x0
 ae0:	18 60 00 44 	l.movhi r3,0x44
 ae4:	e1 ce 58 00 	l.add r14,r14,r11
 ae8:	a8 63 02 28 	l.ori r3,r3,0x228
        root_directory_cluster = sector_buffer[0x2C] + (sector_buffer[0x2D] << 8) + (sector_buffer[0x2E] << 16) + ((sector_buffer[0x2F] & 0x0F) << 24);
 aec:	8c 82 00 2d 	l.lbz r4,0x2d(r2)
            return(0);

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
        root_directory_size = cluster_size; // root directory size in sectors
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
        data_start = fat_start + (fat_number * fat_size);
 af0:	d4 03 70 00 	l.sw 0x0(r3),r14
        root_directory_cluster = sector_buffer[0x2C] + (sector_buffer[0x2D] << 8) + (sector_buffer[0x2E] << 16) + ((sector_buffer[0x2F] & 0x0F) << 24);
 af4:	8c 62 00 2e 	l.lbz r3,0x2e(r2)
 af8:	b8 84 00 08 	l.slli r4,r4,0x8
 afc:	b8 63 00 10 	l.slli r3,r3,0x10
 b00:	e0 64 18 00 	l.add r3,r4,r3
 b04:	8c 82 00 2c 	l.lbz r4,0x2c(r2)
 b08:	8c 42 00 2f 	l.lbz r2,0x2f(r2)
 b0c:	a4 42 00 0f 	l.andi r2,r2,0xf
 b10:	e0 63 20 00 	l.add r3,r3,r4
 b14:	b8 42 00 18 	l.slli r2,r2,0x18
        root_directory_start = (root_directory_cluster - 2) * cluster_size + data_start;
 b18:	a8 94 00 00 	l.ori r4,r20,0x0

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
        root_directory_size = cluster_size; // root directory size in sectors
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
        data_start = fat_start + (fat_number * fat_size);
        root_directory_cluster = sector_buffer[0x2C] + (sector_buffer[0x2D] << 8) + (sector_buffer[0x2E] << 16) + ((sector_buffer[0x2F] & 0x0F) << 24);
 b1c:	e0 63 10 00 	l.add r3,r3,r2
 b20:	18 40 00 44 	l.movhi r2,0x44
 b24:	a8 42 02 2c 	l.ori r2,r2,0x22c
 b28:	d4 02 18 00 	l.sw 0x0(r2),r3
        root_directory_start = (root_directory_cluster - 2) * cluster_size + data_start;
 b2c:	9c 63 ff fe 	l.addi r3,r3,0xfffffffe
 b30:	07 ff fd 46 	l.jal 48 <__mulsi3>
 b34:	18 40 00 44 	l.movhi r2,0x44
 b38:	a8 42 02 30 	l.ori r2,r2,0x230
 b3c:	00 00 00 21 	l.j bc0 <main+0x6a4>
 b40:	e1 ce 58 00 	l.add r14,r14,r11
    }
    else
    {
        // calculate drive's parameters from bootsector, first up is size of directory
        dir_entries = sector_buffer[17] + (sector_buffer[18] << 8);
 b44:	8e 82 00 12 	l.lbz r20,0x12(r2)
 b48:	8c 62 00 11 	l.lbz r3,0x11(r2)
 b4c:	ba 94 00 08 	l.slli r20,r20,0x8
 b50:	e2 94 18 00 	l.add r20,r20,r3
 b54:	18 60 00 44 	l.movhi r3,0x44
 b58:	a8 63 02 3c 	l.ori r3,r3,0x23c
 b5c:	d4 03 a0 00 	l.sw 0x0(r3),r20
        root_directory_size = ((dir_entries << 5) + 511) >> 9;
 b60:	ba 94 00 05 	l.slli r20,r20,0x5
 b64:	18 60 00 44 	l.movhi r3,0x44
 b68:	9e 94 01 ff 	l.addi r20,r20,0x1ff
 b6c:	a8 63 02 34 	l.ori r3,r3,0x234
 b70:	ba 94 00 49 	l.srli r20,r20,0x9
 b74:	d4 03 a0 00 	l.sw 0x0(r3),r20

        // calculate start of FAT,size of FAT and number of FAT's
        fat_size = sector_buffer[22] + (sector_buffer[23] << 8);
 b78:	8c 62 00 17 	l.lbz r3,0x17(r2)
 b7c:	8c 42 00 16 	l.lbz r2,0x16(r2)
 b80:	b8 63 00 08 	l.slli r3,r3,0x8
 b84:	e0 63 10 00 	l.add r3,r3,r2
 b88:	18 40 00 44 	l.movhi r2,0x44
 b8c:	a8 42 02 40 	l.ori r2,r2,0x240
 b90:	d4 02 18 00 	l.sw 0x0(r2),r3

        // calculate start of directory
        root_directory_start = fat_start + (fat_number * fat_size);
 b94:	07 ff fd 2d 	l.jal 48 <__mulsi3>
 b98:	18 40 00 44 	l.movhi r2,0x44
 b9c:	a8 42 02 30 	l.ori r2,r2,0x230
 ba0:	e1 ce 58 00 	l.add r14,r14,r11
 ba4:	d4 02 70 00 	l.sw 0x0(r2),r14
        root_directory_cluster = 0; // unused
 ba8:	18 40 00 44 	l.movhi r2,0x44

        // calculate start of data
        data_start = root_directory_start + root_directory_size;
 bac:	e1 ce a0 00 	l.add r14,r14,r20
        // calculate start of FAT,size of FAT and number of FAT's
        fat_size = sector_buffer[22] + (sector_buffer[23] << 8);

        // calculate start of directory
        root_directory_start = fat_start + (fat_number * fat_size);
        root_directory_cluster = 0; // unused
 bb0:	a8 42 02 2c 	l.ori r2,r2,0x22c
 bb4:	d4 02 80 00 	l.sw 0x0(r2),r16

        // calculate start of data
        data_start = root_directory_start + root_directory_size;
 bb8:	18 40 00 44 	l.movhi r2,0x44
 bbc:	a8 42 02 28 	l.ori r2,r2,0x228
 bc0:	d4 02 70 00 	l.sw 0x0(r2),r14
  if (!FindDrive()) FatalError();

  // open file
  LEDS(led=0x3);
 bc4:	18 40 00 44 	l.movhi r2,0x44
 bc8:	9c 60 00 03 	l.addi r3,r0,0x3
 bcc:	a8 42 02 18 	l.ori r2,r2,0x218
 bd0:	9c 80 00 03 	l.addi r4,r0,0x3
 bd4:	d8 02 18 00 	l.sb 0x0(r2),r3
 bd8:	18 40 00 80 	l.movhi r2,0x80
    unsigned long  iDirectorySector;     // current sector of directory entries table
    unsigned long  iDirectoryCluster;    // start cluster of subdirectory or FAT32 root directory
    unsigned long  iEntry;               // entry index in directory cluster or FAT16 root directory
    unsigned long  nEntries;             // number of entries per cluster or FAT16 root directory size

	buffered_fat_index=-1;
 bdc:	9c 60 ff ff 	l.addi r3,r0,0xffffffff
 be0:	a8 42 00 04 	l.ori r2,r2,0x4

    iDirectoryCluster = root_directory_cluster;
    iDirectorySector = root_directory_start;
    nEntries = fat32 ?  cluster_size << 4 : root_directory_size << 4; // 16 entries per sector
 be4:	bc 30 00 00 	l.sfnei r16,0x0
 be8:	dc 02 20 00 	l.sh 0x0(r2),r4
    unsigned long  iDirectorySector;     // current sector of directory entries table
    unsigned long  iDirectoryCluster;    // start cluster of subdirectory or FAT32 root directory
    unsigned long  iEntry;               // entry index in directory cluster or FAT16 root directory
    unsigned long  nEntries;             // number of entries per cluster or FAT16 root directory size

	buffered_fat_index=-1;
 bec:	18 40 00 44 	l.movhi r2,0x44
 bf0:	a8 42 02 48 	l.ori r2,r2,0x248
 bf4:	d4 02 18 00 	l.sw 0x0(r2),r3

    iDirectoryCluster = root_directory_cluster;
 bf8:	18 40 00 44 	l.movhi r2,0x44
 bfc:	a8 42 02 2c 	l.ori r2,r2,0x22c
 c00:	86 42 00 00 	l.lwz r18,0x0(r2)
    iDirectorySector = root_directory_start;
 c04:	18 40 00 44 	l.movhi r2,0x44
 c08:	a8 42 02 30 	l.ori r2,r2,0x230
    nEntries = fat32 ?  cluster_size << 4 : root_directory_size << 4; // 16 entries per sector
 c0c:	10 00 00 06 	l.bf c24 <main+0x708>
 c10:	85 c2 00 00 	l.lwz r14,0x0(r2)
 c14:	00 00 00 07 	l.j c30 <main+0x714>
 c18:	18 40 00 44 	l.movhi r2,0x44
  LEDS(led=0xf);
  if (!MMC_Init()) FatalError();

  // find drive
  LEDS(led=0x8);
  if (!FindDrive()) FatalError();
 c1c:	07 ff fd 1a 	l.jal 84 <FatalError>
 c20:	15 00 00 00 	l.nop 0x0
 c24:	18 40 00 44 	l.movhi r2,0x44
 c28:	00 00 00 03 	l.j c34 <main+0x718>
 c2c:	a8 42 02 00 	l.ori r2,r2,0x200
 c30:	a8 42 02 34 	l.ori r2,r2,0x234
 c34:	87 02 00 00 	l.lwz r24,0x0(r2)

//            if (fat32 ? (iDirectoryCluster & 0x0FFFFFF8) == 0x0FFFFFF8 : (iDirectoryCluster & 0xFFF8) == 0xFFF8) // check if end of cluster chain
            if ((iDirectoryCluster & 0x0FFFFFF8) == 0x0FFFFFF8) // check if end of cluster chain
                 break; // no more clusters in chain

            iDirectorySector = data_start + cluster_size * (iDirectoryCluster - 2); // calculate first sector address of the new cluster
 c38:	1b 40 00 44 	l.movhi r26,0x44
 c3c:	1a c0 00 44 	l.movhi r22,0x44

	buffered_fat_index=-1;

    iDirectoryCluster = root_directory_cluster;
    iDirectorySector = root_directory_start;
    nEntries = fat32 ?  cluster_size << 4 : root_directory_size << 4; // 16 entries per sector
 c40:	bb 18 00 04 	l.slli r24,r24,0x4
}


unsigned char FileOpen(fileTYPE *file, const char *name)
{
    DIRENTRY      *pEntry = 0;        // pointer to current entry in sector buffer
 c44:	9c 40 00 00 	l.addi r2,r0,0x0

//            if (fat32 ? (iDirectoryCluster & 0x0FFFFFF8) == 0x0FFFFFF8 : (iDirectoryCluster & 0xFFF8) == 0xFFF8) // check if end of cluster chain
            if ((iDirectoryCluster & 0x0FFFFFF8) == 0x0FFFFFF8) // check if end of cluster chain
                 break; // no more clusters in chain

            iDirectorySector = data_start + cluster_size * (iDirectoryCluster - 2); // calculate first sector address of the new cluster
 c48:	ab 5a 02 00 	l.ori r26,r26,0x200
 c4c:	aa d6 02 28 	l.ori r22,r22,0x228
    iDirectorySector = root_directory_start;
    nEntries = fat32 ?  cluster_size << 4 : root_directory_size << 4; // 16 entries per sector

    while (1)
    {
        for (iEntry = 0; iEntry < nEntries; iEntry++)
 c50:	00 00 00 44 	l.j d60 <main+0x844>
 c54:	9e 80 00 00 	l.addi r20,r0,0x0
        {
            if ((iEntry & 0x0F) == 0) // first entry in sector, load the sector
 c58:	bc 23 00 00 	l.sfnei r3,0x0
 c5c:	10 00 00 0a 	l.bf c84 <main+0x768>
 c60:	18 80 00 44 	l.movhi r4,0x44
            {
				printf("Reading directory sector %d\n",iDirectorySector);
                MMC_Read(iDirectorySector++, sector_buffer); // root directory is linear
 c64:	a8 6e 00 00 	l.ori r3,r14,0x0
 c68:	9f 8e 00 01 	l.addi r28,r14,0x1
 c6c:	a8 84 00 00 	l.ori r4,r4,0x0
 c70:	07 ff fd 95 	l.jal 2c4 <MMC_Read>
 c74:	18 40 00 44 	l.movhi r2,0x44
                pEntry = (DIRENTRY*)sector_buffer;
 c78:	a8 42 00 00 	l.ori r2,r2,0x0
        for (iEntry = 0; iEntry < nEntries; iEntry++)
        {
            if ((iEntry & 0x0F) == 0) // first entry in sector, load the sector
            {
				printf("Reading directory sector %d\n",iDirectorySector);
                MMC_Read(iDirectorySector++, sector_buffer); // root directory is linear
 c7c:	00 00 00 03 	l.j c88 <main+0x76c>
 c80:	a9 dc 00 00 	l.ori r14,r28,0x0
                pEntry = (DIRENTRY*)sector_buffer;
            }
            else
                pEntry++;
 c84:	9c 42 00 20 	l.addi r2,r2,0x20


            if (pEntry->Name[0] != SLOT_EMPTY && pEntry->Name[0] != SLOT_DELETED) // valid entry??
 c88:	8c 62 00 00 	l.lbz r3,0x0(r2)
 c8c:	bc 03 00 e5 	l.sfeqi r3,0xe5
 c90:	10 00 00 33 	l.bf d5c <main+0x840>
 c94:	bc 03 00 00 	l.sfeqi r3,0x0
 c98:	10 00 00 31 	l.bf d5c <main+0x840>
 c9c:	15 00 00 00 	l.nop 0x0
            {
                if (!(pEntry->Attributes & (ATTR_VOLUME | ATTR_DIRECTORY))) // not a volume nor directory
 ca0:	8c 62 00 0b 	l.lbz r3,0xb(r2)
 ca4:	a4 63 00 18 	l.andi r3,r3,0x18
 ca8:	bc 23 00 00 	l.sfnei r3,0x0
 cac:	10 00 00 2c 	l.bf d5c <main+0x840>
 cb0:	18 80 00 00 	l.movhi r4,0x0
                {
                    if (compare((const char*)pEntry->Name, name,11) == 0)
 cb4:	a8 62 00 00 	l.ori r3,r2,0x0
 cb8:	a8 84 0e ae 	l.ori r4,r4,0xeae
 cbc:	07 ff fd cd 	l.jal 3f0 <compare>
 cc0:	9c a0 00 0b 	l.addi r5,r0,0xb
 cc4:	bc 2b 00 00 	l.sfnei r11,0x0
 cc8:	10 00 00 26 	l.bf d60 <main+0x844>
 ccc:	9e 94 00 01 	l.addi r20,r20,0x1
 cd0:	9e 94 ff ff 	l.addi r20,r20,0xffffffff
                    {
                        file->size = SwapBBBB(pEntry->FileSize); 		// for 68000
 cd4:	07 ff fd 08 	l.jal f4 <SwapBBBB>
 cd8:	84 62 00 1c 	l.lwz r3,0x1c(r2)
 cdc:	18 60 00 44 	l.movhi r3,0x44
                        file->cluster = SwapBB(pEntry->StartCluster) + (fat32 ? (SwapBB(pEntry->HighCluster) & 0x0FFF) << 16 : 0);
 ce0:	bc 10 00 00 	l.sfeqi r16,0x0
            {
                if (!(pEntry->Attributes & (ATTR_VOLUME | ATTR_DIRECTORY))) // not a volume nor directory
                {
                    if (compare((const char*)pEntry->Name, name,11) == 0)
                    {
                        file->size = SwapBBBB(pEntry->FileSize); 		// for 68000
 ce4:	a8 63 02 0c 	l.ori r3,r3,0x20c
 ce8:	d4 03 58 04 	l.sw 0x4(r3),r11
                        file->cluster = SwapBB(pEntry->StartCluster) + (fat32 ? (SwapBB(pEntry->HighCluster) & 0x0FFF) << 16 : 0);
 cec:	94 62 00 1a 	l.lhz r3,0x1a(r2)
 cf0:	b8 83 00 08 	l.slli r4,r3,0x8
 cf4:	b8 63 00 48 	l.srli r3,r3,0x8
 cf8:	e0 64 18 04 	l.or r3,r4,r3
 cfc:	10 00 00 08 	l.bf d1c <main+0x800>
 d00:	a4 63 ff ff 	l.andi r3,r3,0xffff
 d04:	94 42 00 14 	l.lhz r2,0x14(r2)
 d08:	ba 02 00 08 	l.slli r16,r2,0x8
 d0c:	b8 42 00 48 	l.srli r2,r2,0x8
 d10:	e2 10 10 04 	l.or r16,r16,r2
 d14:	a6 10 0f ff 	l.andi r16,r16,0xfff
 d18:	ba 10 00 10 	l.slli r16,r16,0x10
 d1c:	19 c0 00 44 	l.movhi r14,0x44
 d20:	e2 10 18 00 	l.add r16,r16,r3
 d24:	a9 ce 02 0c 	l.ori r14,r14,0x20c
                        file->sector = 0;
 d28:	9c 40 00 00 	l.addi r2,r0,0x0
int LoadFile(const char *fn, unsigned char *buf)
{
	if(FileOpen(&file,fn))
	{
		putserial("Opened file, loading...\n");
		int imgsize=(file.size+511)/512;
 d2c:	9d 6b 01 ff 	l.addi r11,r11,0x1ff

		while(c<imgsize)
		{
			unsigned long sb;

			sb = data_start;                         // start of data in partition
 d30:	1a 40 00 44 	l.movhi r18,0x44
			sb += cluster_size * (file.cluster-2);  // cluster offset
 d34:	1b 00 00 44 	l.movhi r24,0x44
			sb += sector & cluster_mask;      // sector offset in cluster
 d38:	1a c0 00 44 	l.movhi r22,0x44
                if (!(pEntry->Attributes & (ATTR_VOLUME | ATTR_DIRECTORY))) // not a volume nor directory
                {
                    if (compare((const char*)pEntry->Name, name,11) == 0)
                    {
                        file->size = SwapBBBB(pEntry->FileSize); 		// for 68000
                        file->cluster = SwapBB(pEntry->StartCluster) + (fat32 ? (SwapBB(pEntry->HighCluster) & 0x0FFF) << 16 : 0);
 d3c:	d4 0e 80 08 	l.sw 0x8(r14),r16
                        file->sector = 0;
 d40:	d4 0e 10 00 	l.sw 0x0(r14),r2
int LoadFile(const char *fn, unsigned char *buf)
{
	if(FileOpen(&file,fn))
	{
		putserial("Opened file, loading...\n");
		int imgsize=(file.size+511)/512;
 d44:	bb 4b 00 49 	l.srli r26,r11,0x9
 d48:	1a 00 00 40 	l.movhi r16,0x40

		while(c<imgsize)
		{
			unsigned long sb;

			sb = data_start;                         // start of data in partition
 d4c:	aa 52 02 28 	l.ori r18,r18,0x228
			sb += cluster_size * (file.cluster-2);  // cluster offset
 d50:	ab 18 02 00 	l.ori r24,r24,0x200
			sb += sector & cluster_mask;      // sector offset in cluster
 d54:	00 00 00 2f 	l.j e10 <main+0x8f4>
 d58:	aa d6 02 04 	l.ori r22,r22,0x204
    iDirectorySector = root_directory_start;
    nEntries = fat32 ?  cluster_size << 4 : root_directory_size << 4; // 16 entries per sector

    while (1)
    {
        for (iEntry = 0; iEntry < nEntries; iEntry++)
 d5c:	9e 94 00 01 	l.addi r20,r20,0x1
 d60:	e4 94 c0 00 	l.sfltu r20,r24
 d64:	13 ff ff bd 	l.bf c58 <main+0x73c>
 d68:	a4 74 00 0f 	l.andi r3,r20,0xf
                    }
                }
            }
        }

        if (fat32) // subdirectory is a linked cluster chain
 d6c:	bc 10 00 00 	l.sfeqi r16,0x0
 d70:	10 00 00 2b 	l.bf e1c <main+0x900>
 d74:	15 00 00 00 	l.nop 0x0
        {
            iDirectoryCluster = GetCluster(iDirectoryCluster); // get next cluster in chain
 d78:	07 ff fd ae 	l.jal 430 <GetCluster>
 d7c:	a8 72 00 00 	l.ori r3,r18,0x0
			printf("GetFATLink returned %d\n",iDirectoryCluster);

//            if (fat32 ? (iDirectoryCluster & 0x0FFFFFF8) == 0x0FFFFFF8 : (iDirectoryCluster & 0xFFF8) == 0xFFF8) // check if end of cluster chain
            if ((iDirectoryCluster & 0x0FFFFFF8) == 0x0FFFFFF8) // check if end of cluster chain
 d80:	18 80 0f ff 	l.movhi r4,0xfff
 d84:	a8 84 ff f8 	l.ori r4,r4,0xfff8
 d88:	e0 6b 20 03 	l.and r3,r11,r4
 d8c:	18 80 0f ff 	l.movhi r4,0xfff
 d90:	a8 84 ff f8 	l.ori r4,r4,0xfff8
 d94:	e4 03 20 00 	l.sfeq r3,r4
 d98:	10 00 00 21 	l.bf e1c <main+0x900>
 d9c:	aa 4b 00 00 	l.ori r18,r11,0x0
                 break; // no more clusters in chain

            iDirectorySector = data_start + cluster_size * (iDirectoryCluster - 2); // calculate first sector address of the new cluster
 da0:	9c 6b ff fe 	l.addi r3,r11,0xfffffffe
 da4:	07 ff fc a9 	l.jal 48 <__mulsi3>
 da8:	84 9a 00 00 	l.lwz r4,0x0(r26)
 dac:	85 d6 00 00 	l.lwz r14,0x0(r22)
 db0:	03 ff ff a8 	l.j c50 <main+0x734>
 db4:	e1 cb 70 00 	l.add r14,r11,r14
		while(c<imgsize)
		{
			unsigned long sb;

			sb = data_start;                         // start of data in partition
			sb += cluster_size * (file.cluster-2);  // cluster offset
 db8:	84 6e 00 08 	l.lwz r3,0x8(r14)

		while(c<imgsize)
		{
			unsigned long sb;

			sb = data_start;                         // start of data in partition
 dbc:	86 92 00 00 	l.lwz r20,0x0(r18)
			sb += cluster_size * (file.cluster-2);  // cluster offset
 dc0:	84 98 00 00 	l.lwz r4,0x0(r24)
 dc4:	07 ff fc a1 	l.jal 48 <__mulsi3>
 dc8:	9c 63 ff fe 	l.addi r3,r3,0xfffffffe
 dcc:	e1 6b a0 00 	l.add r11,r11,r20
			sb += sector & cluster_mask;      // sector offset in cluster
 dd0:	86 96 00 00 	l.lwz r20,0x0(r22)

			if (!MMC_Read(sb, buf)) // read sector from drive
 dd4:	a8 90 00 00 	l.ori r4,r16,0x0
		{
			unsigned long sb;

			sb = data_start;                         // start of data in partition
			sb += cluster_size * (file.cluster-2);  // cluster offset
			sb += sector & cluster_mask;      // sector offset in cluster
 dd8:	e0 62 a0 03 	l.and r3,r2,r20

			if (!MMC_Read(sb, buf)) // read sector from drive
 ddc:	07 ff fd 3a 	l.jal 2c4 <MMC_Read>
 de0:	e0 6b 18 00 	l.add r3,r11,r3
 de4:	bc 0b 00 00 	l.sfeqi r11,0x0
 de8:	10 00 00 0d 	l.bf e1c <main+0x900>
 dec:	9c 42 00 01 	l.addi r2,r2,0x1
				return(0);

			++sector;

		    // cluster's boundary crossed?
    		if((sector&cluster_mask) == 0)
 df0:	e2 82 a0 03 	l.and r20,r2,r20
 df4:	bc 34 00 00 	l.sfnei r20,0x0
 df8:	10 00 00 05 	l.bf e0c <main+0x8f0>
 dfc:	15 00 00 00 	l.nop 0x0
		    {
				file.cluster=GetCluster(file.cluster);
 e00:	07 ff fd 8c 	l.jal 430 <GetCluster>
 e04:	84 6e 00 08 	l.lwz r3,0x8(r14)
 e08:	d4 0e 58 08 	l.sw 0x8(r14),r11
		    }

			buf+=512;
 e0c:	9e 10 02 00 	l.addi r16,r16,0x200
		putserial("Opened file, loading...\n");
		int imgsize=(file.size+511)/512;
		int c=0;
		int sector=0;

		while(c<imgsize)
 e10:	e5 82 d0 00 	l.sflts r2,r26
 e14:	13 ff ff e9 	l.bf db8 <main+0x89c>
 e18:	15 00 00 00 	l.nop 0x0
    FileRead(&ft, ram+(i*512));
    FileNextSector(&ft);
  }
#endif
  // jump to RAM firmware
  LEDS(led=0x0);
 e1c:	18 40 00 44 	l.movhi r2,0x44
 e20:	9c 60 00 00 	l.addi r3,r0,0x0
 e24:	a8 42 02 18 	l.ori r2,r2,0x218
 e28:	9c 80 00 00 	l.addi r4,r0,0x0
 e2c:	d8 02 18 00 	l.sb 0x0(r2),r3
 e30:	18 40 00 80 	l.movhi r2,0x80
 e34:	a8 62 00 04 	l.ori r3,r2,0x4
  DisableCard();
 e38:	a8 42 00 20 	l.ori r2,r2,0x20
    FileRead(&ft, ram+(i*512));
    FileNextSector(&ft);
  }
#endif
  // jump to RAM firmware
  LEDS(led=0x0);
 e3c:	dc 03 20 00 	l.sh 0x0(r3),r4
  DisableCard();
 e40:	9c 60 00 10 	l.addi r3,r0,0x10
 e44:	d4 02 18 00 	l.sw 0x0(r2),r3

//// sys jump() ////
void sys_jump(unsigned long addr)
{
//  disable_ints();
  __asm__("l.sw  0x4(r1),r9");
 e48:	d4 01 48 04 	l.sw 0x4(r1),r9
  __asm__("l.jalr  %0" : : "r" (addr));
 e4c:	18 40 00 40 	l.movhi r2,0x40
 e50:	a8 42 00 04 	l.ori r2,r2,0x4
 e54:	48 00 10 00 	l.jalr r2
  __asm__("l.nop");
 e58:	15 00 00 00 	l.nop 0x0
 e5c:	00 00 00 00 	l.j e5c <main+0x940>
 e60:	15 00 00 00 	l.nop 0x0
            if (ocr[2] == 0x01 && ocr[3] == 0xAA)
            { // the card can work at 2.7-3.6V
                //printf("SDHC card detected\r");
                while (!CheckTimer(timeout))
                { // now we must wait until CMD41 returns 0 (or timeout elapses)
                    if (MMC_Command(CMD55, 0) == 0x01)
 e64:	07 ff fc cd 	l.jal 198 <MMC_Command>
 e68:	9c 80 00 00 	l.addi r4,r0,0x0
 e6c:	bc 0b 00 01 	l.sfeqi r11,0x1
 e70:	13 ff fe 15 	l.bf 6c4 <main+0x1a8>
 e74:	18 80 40 00 	l.movhi r4,0x4000
 e78:	03 ff ff 69 	l.j c1c <main+0x700>
 e7c:	15 00 00 00 	l.nop 0x0
            { // SD card detected - wait for the end of initialization
                //printf("SD card detected\r");
                //printf("timeout:%08X\r",GetTimer(0));
                while (!CheckTimer(timeout))
                { // now we must wait until CMD41 returns 0 (or timeout elapses)
                    if (MMC_Command(CMD55, 0) == 0x01)
 e80:	07 ff fc c6 	l.jal 198 <MMC_Command>
 e84:	9c 80 00 00 	l.addi r4,r0,0x0
 e88:	bc 0b 00 01 	l.sfeqi r11,0x1
 e8c:	13 ff fe 45 	l.bf 7a0 <main+0x284>
 e90:	a9 cb 00 00 	l.ori r14,r11,0x0
 e94:	03 ff ff 62 	l.j c1c <main+0x700>
 e98:	15 00 00 00 	l.nop 0x0

Disassembly of section .rodata:

00000e9c <__data_end-0x43f164>:
 e9c:	46 41 54 31 	l.jr r10
 ea0:	36 20 20 20 	.word 0x36202020
 ea4:	00 46 41 54 	l.j 11913f4 <__stack+0xd313f8>
 ea8:	33 32 20 20 	.word 0x33322020
 eac:	20 00 44 45 	l.sys 0x4445
 eb0:	31 5f 42 4f 	.word 0x315f424f
 eb4:	4f 54 42 49 	l.maci r20,0x4249
 eb8:	4e 00 00 00 	l.maci r0,0x0

Disassembly of section .bss:

00440000 <__bss_start>:
	...

00440200 <cluster_size.875>:
  440200:	00 00 00 00 	l.j 440200 <cluster_size.875>

00440204 <cluster_mask.876>:
  440204:	00 00 00 00 	l.j 440204 <cluster_mask.876>

00440208 <fat32.877>:
  440208:	00 00 00 00 	l.j 440208 <fat32.877>

0044020c <file.893>:
	...

00440218 <led.895>:
	...

00440219 <crc.4459>:
  440219:	00 00 00 00 	l.j 440219 <crc.4459>

0044021c <timeout.4460>:
  44021c:	00 00 00 00 	l.j 44021c <timeout.4460>

00440220 <response.4461>:
	...

00440221 <CardType.4462>:
  440221:	00 00 00 00 	l.j 440221 <CardType.4462>

00440224 <fat_start.5399>:
  440224:	00 00 00 00 	l.j 440224 <fat_start.5399>

00440228 <data_start.5400>:
  440228:	00 00 00 00 	l.j 440228 <data_start.5400>

0044022c <root_directory_cluster.5401>:
  44022c:	00 00 00 00 	l.j 44022c <root_directory_cluster.5401>

00440230 <root_directory_start.5402>:
  440230:	00 00 00 00 	l.j 440230 <root_directory_start.5402>

00440234 <root_directory_size.5403>:
  440234:	00 00 00 00 	l.j 440234 <root_directory_size.5403>

00440238 <fat_number.5404>:
  440238:	00 00 00 00 	l.j 440238 <fat_number.5404>

0044023c <dir_entries.5407>:
  44023c:	00 00 00 00 	l.j 44023c <dir_entries.5407>

00440240 <fat_size.5408>:
  440240:	00 00 00 00 	l.j 440240 <fat_size.5408>

00440244 <partitioncount.5410>:
  440244:	00 00 00 00 	l.j 440244 <partitioncount.5410>

00440248 <buffered_fat_index.5411>:
  440248:	00 00 00 00 	l.j 440248 <buffered_fat_index.5411>

Disassembly of section .stack:

0044024c <_stack-0x1000>:
	...

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11 01 25 	l.j 4440494 <__stack+0x3fe0498>
   4:	0e 13 0b 03 	l.bnf f84c2c10 <__stack+0xf8062c14>
   8:	0e 1b 0e 11 	l.bnf f86c384c <__stack+0xf8263850>
   c:	01 12 01 10 	l.j 448044c <__stack+0x4020450>
  10:	06 00 00 02 	l.jal f8000018 <__stack+0xf7ba001c>
  14:	24 00 0b 0b 	l.rfe 
  18:	3e 0b 03 0e 	.word 0x3e0b030e
  1c:	00 00 03 16 	l.j c74 <main+0x758>
  20:	00 03 0e 3a 	l.j c3908 <__ram_length+0xa3908>
  24:	0b 3b 0b 49 	.word 0x0b3b0b49
  28:	13 00 00 04 	l.bf fc000038 <__stack+0xfbba003c>
  2c:	24 00 0b 0b 	l.rfe 
  30:	3e 0b 03 08 	.word 0x3e0b0308
  34:	00 00 05 01 	l.j 1438 <__rom_length+0x38>
  38:	01 49 13 01 	l.j 5244c3c <__stack+0x4de4c40>
  3c:	13 00 00 06 	l.bf fc000054 <__stack+0xfbba0058>
  40:	21 00 49 13 	l.trap 0x4913
  44:	2f 0b 00 00 	.word 0x2f0b0000
  48:	07 21 00 49 	l.jal fc84016c <__stack+0xfc3e0170>
  4c:	13 2f 05 00 	l.bf fcbc144c <__stack+0xfc761450>
  50:	00 08 13 01 	l.j 204c54 <__ram_length+0x1e4c54>
  54:	0b 0b 3a 0b 	.word 0x0b0b3a0b
  58:	3b 0b 01 13 	.word 0x3b0b0113
  5c:	00 00 09 0d 	l.j 2490 <__rom_length+0x1090>
  60:	00 03 0e 3a 	l.j c3948 <__ram_length+0xa3948>
  64:	0b 3b 0b 49 	.word 0x0b3b0b49
  68:	13 38 0a 00 	l.bf fce02868 <__stack+0xfc9a286c>
  6c:	00 0a 13 01 	l.j 284c70 <__ram_length+0x264c70>
  70:	03 0e 0b 0b 	l.j fc382c9c <__stack+0xfbf22ca0>
  74:	3a 0b 3b 0b 	.word 0x3a0b3b0b
  78:	01 13 00 00 	l.j 44c0078 <__stack+0x406007c>
  7c:	0b 13 01 03 	.word 0x0b130103
  80:	0e 0b 05 3a 	l.bnf f82c1568 <__stack+0xf7e6156c>
// fatal error
void FatalError(void)
{
  DEBUG_FUNC_IN();

  DisableCard();
  84:	0b 3b 0b 01 	.word 0x0b3b0b01
  88:	13 00 00 0c 	l.bf fc0000b8 <__stack+0xfbba00bc>
  8c:	17 01 0b 05 	.word 0x17010b05
}


// fatal error
void FatalError(void)
{
  90:	3a 0b 3b 0b 	.word 0x3a0b3b0b
  DEBUG_FUNC_IN();

  DisableCard();
  94:	01 13 00 00 	l.j 44c0094 <__stack+0x4060098>
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  98:	0d 0d 00 03 	l.bnf 43400a4 <__stack+0x3ee00a8>
}


// fatal error
void FatalError(void)
{
  9c:	0e 3a 0b 3b 	l.bnf f8e82d88 <__stack+0xf8a22d8c>
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  a0:	0b 49 13 00 	.word 0x0b491300
  a4:	00 0e 2e 01 	l.j 38b8a8 <__ram_length+0x36b8a8>

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  a8:	03 0e 3a 0b 	l.j fc38e8d4 <__stack+0xfbf2e8d8>
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  ac:	3b 0b 27 0c 	.word 0x3b0b270c
  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
  b0:	49 13 20 0b 	l.jalr r4

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  b4:	01 13 00 00 	l.j 44c00b4 <__stack+0x40600b8>
  b8:	0f 05 00 03 	l.bnf fc1400c4 <__stack+0xfbce00c8>
  bc:	0e 3a 0b 3b 	l.bnf f8e82da8 <__stack+0xf8a22dac>
  c0:	0b 49 13 00 	.word 0x0b491300
  c4:	00 10 34 00 	l.j 40d0c4 <__ram_length+0x3ed0c4>
  c8:	03 0e 3a 0b 	l.j fc38e8f4 <__stack+0xfbf2e8f8>
    LEDS(0x0);
  cc:	3b 0b 49 13 	.word 0x3b0b4913
    TIMER_wait(200);
  d0:	00 00 11 05 	l.j 44e4 <__rom_length+0x30e4>
  d4:	00 03 08 3a 	l.j c21bc <__ram_length+0xa21bc>
  d8:	0b 3b 0b 49 	.word 0x0b3b0b49
  dc:	13 00 00 12 	l.bf fc000124 <__stack+0xfbba0128>
  e0:	2e 01 03 0e 	.word 0x2e01030e
  e4:	3a 0b 3b 05 	.word 0x3a0b3b05
    LEDS(led);
  e8:	27 0c 49 13 	l.rfe 
  }
  ec:	20 0b 01 13 	.word 0x200b0113
  f0:	00 00 13 05 	l.j 4d04 <__rom_length+0x3904>

#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
  f4:	00 03 08 3a 	l.j c21dc <__ram_length+0xa21dc>
  f8:	0b 3b 05 49 	.word 0x0b3b0549


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  fc:	13 00 00 14 	l.bf fc00014c <__stack+0xfbba0150>
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
 100:	0b 01 00 00 	.word 0x0b010000
 104:	15 34 00 03 	l.nop 0x3
 108:	0e 3a 0b 3b 	l.bnf f8e82df4 <__stack+0xf8a22df8>
 10c:	05 49 13 00 	l.jal 5244d0c <__stack+0x4de4d10>
 110:	00 16 34 00 	l.j 58d110 <__stack+0x12d114>


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
 114:	03 08 3a 0b 	l.j fc20e940 <__stack+0xfbdae944>
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
 118:	3b 05 49 13 	.word 0x3b054913
 11c:	00 00 17 0f 	l.j 5d58 <__rom_length+0x4958>
}
 120:	00 0b 0b 49 	l.j 2c2e44 <__ram_length+0x2a2e44>
 124:	13 00 00 18 	l.bf fc000184 <__stack+0xfbba0188>
 128:	26 00 49 13 	l.rfe 
 12c:	00 00 19 2e 	l.j 65e4 <__rom_length+0x51e4>
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 130:	01 03 0e 3a 	l.j 40c3a18 <__stack+0x3c63a1c>
 134:	0b 3b 0b 27 	.word 0x0b3b0b27
 138:	0c 20 0b 01 	l.bnf 802d3c <__stack+0x3a2d40>
 13c:	13 00 00 1a 	l.bf fc0001a4 <__stack+0xfbba01a8>
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
 140:	2e 00 03 0e 	.word 0x2e00030e
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
    crc <<= 1;
 144:	3a 0b 3b 0b 	.word 0x3a0b3b0b
    if (c & 0x80)   crc ^= 0x09;
 148:	27 0c 11 01 	l.rfe 
 14c:	12 01 40 06 	l.bf f8050164 <__stack+0xf7bf0168>
 150:	00 00 1b 2e 	l.j 6e08 <__rom_length+0x5a08>
 154:	01 03 0e 3a 	l.j 40c3a3c <__stack+0x3c63a40>
    if (crc & 0x80) crc ^= 0x09;
 158:	0b 3b 0b 27 	.word 0x0b3b0b27
 15c:	0c 49 13 11 	l.bnf 1244da0 <__stack+0xde4da4>
 160:	01 12 01 40 	l.j 4480660 <__stack+0x4020664>
 164:	06 01 13 00 	l.jal f8044d64 <__stack+0xf7be4d68>
 168:	00 1c 05 00 	l.j 701568 <__stack+0x2a156c>
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 16c:	03 08 3a 0b 	l.j fc20e998 <__stack+0xfbdae99c>
 170:	3b 0b 49 13 	.word 0x3b0b4913
 174:	02 06 00 00 	l.j f8180174 <__stack+0xf7d20178>
 178:	1d 2e 01 03 	.word 0x1d2e0103
 17c:	0e 3a 0b 3b 	l.bnf f8e82e68 <__stack+0xf8a22e6c>
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
    if (crc & 0x80) crc ^= 0x09;
    c <<= 1;
 180:	05 27 0c 11 	l.jal 49c31c4 <__stack+0x45631c8>
 184:	01 12 01 40 	l.j 4480684 <__stack+0x4020688>
 188:	0a 01 13 00 	.word 0x0a011300
 18c:	00 1e 05 00 	l.j 78158c <__stack+0x321590>
  }

  DEBUG_FUNC_OUT();
}
 190:	03 08 3a 0b 	l.j fc20e9bc <__stack+0xfbdae9c0>
 194:	3b 05 49 13 	.word 0x3b054913
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 198:	02 06 00 00 	l.j f8180198 <__stack+0xf7d2019c>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 19c:	1f 34 00 03 	.word 0x1f340003
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1a0:	08 3a 0b 3b 	.word 0x083a0b3b
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 1a4:	05 49 13 02 	l.jal 5244dac <__stack+0x4de4db0>
 1a8:	06 00 00 20 	l.jal f8000228 <__stack+0xf7ba022c>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1ac:	34 00 03 08 	.word 0x34000308
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 1b0:	3a 0b 3b 0b 	.word 0x3a0b3b0b
  SPI(0xFF); // flush SPI-bus
 1b4:	49 13 02 06 	l.jalr r0
 1b8:	00 00 21 05 	l.j 85cc <__rom_length+0x71cc>
 1bc:	00 03 0e 3a 	l.j c3aa4 <__ram_length+0xa3aa4>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1c0:	0b 3b 0b 49 	.word 0x0b3b0b49
 1c4:	13 02 06 00 	l.bf fc0819c4 <__stack+0xfbc219c8>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus
 1c8:	00 22 34 00 	l.j 88d1c8 <__stack+0x42d1cc>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1cc:	03 08 3a 0b 	l.j fc20e9f8 <__stack+0xfbdae9fc>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus
 1d0:	3b 0b 49 13 	.word 0x3b0b4913

  SPI(cmd);
 1d4:	00 00 23 2e 	l.j 8e8c <__rom_length+0x7a8c>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1d8:	01 03 0e 3a 	l.j 40c3ac0 <__stack+0x3c63ac4>
  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus

  SPI(cmd);
 1dc:	0b 3b 0b 27 	.word 0x0b3b0b27
  MMC_CRC(cmd);
 1e0:	0c 49 13 11 	l.bnf 1244e24 <__stack+0xde4e28>
 1e4:	01 12 01 40 	l.j 44806e4 <__stack+0x40206e8>

  c = (unsigned char)(arg >> 24);
 1e8:	0a 01 13 00 	.word 0x0a011300
  SPI(c);
 1ec:	00 24 05 00 	l.j 9015ec <__stack+0x4a15f0>
 1f0:	03 08 3a 0b 	l.j fc20ea1c <__stack+0xfbdaea20>
  MMC_CRC(c);
 1f4:	3b 0b 49 13 	.word 0x3b0b4913
 1f8:	02 0a 00 00 	l.j f82801f8 <__stack+0xf7e201fc>

  c = (unsigned char)(arg >> 16);
 1fc:	25 1d 01 31 	l.rfe 
 200:	13 11 01 12 	l.bf fc440648 <__stack+0xfbfe064c>
  SPI(c);
 204:	01 58 0b 59 	l.j 5602f68 <__stack+0x51a2f6c>
 208:	0b 00 00 26 	.word 0x0b000026
  MMC_CRC(c);
 20c:	05 00 31 13 	l.jal 400c658 <__stack+0x3bac65c>
 210:	02 06 00 00 	l.j f8180210 <__stack+0xf7d20214>

  c = (unsigned char)(arg >> 8);
 214:	27 2e 01 3f 	l.rfe 
 218:	0c 03 0e 3a 	l.bnf c3b00 <__ram_length+0xa3b00>
  SPI(c);
 21c:	0b 3b 0b 27 	.word 0x0b3b0b27
 220:	0c 11 01 12 	l.bnf 440668 <__bss_end+0x41c>
  MMC_CRC(c);
 224:	01 40 06 01 	l.j 5001a28 <__stack+0x4ba1a2c>
 228:	13 00 00 28 	l.bf fc0002c8 <__stack+0xfbba02cc>

  c = (unsigned char)(arg);
 22c:	34 00 03 08 	.word 0x34000308
  SPI(c);
 230:	3a 0b 3b 0b 	.word 0x3a0b3b0b
 234:	49 13 1c 06 	l.jalr r3
  MMC_CRC(c);
 238:	00 00 29 1d 	l.j a6ac <__rom_length+0x92ac>
 23c:	01 31 13 52 	l.j 4c44f84 <__stack+0x47e4f88>

  crc <<= 1;
 240:	01 55 06 58 	l.j 5541ba0 <__stack+0x50e1ba4>
 244:	0b 59 0b 01 	.word 0x0b590b01
  crc++;
 248:	13 00 00 2a 	l.bf fc0002f0 <__stack+0xfbba02f4>
 24c:	0b 01 55 06 	.word 0x0b015506
 250:	00 00 2b 34 	l.j af20 <__rom_length+0x9b20>
  SPI(crc);
 254:	00 31 13 02 	l.j c44e5c <__stack+0x7e4e60>
 258:	06 00 00 2c 	l.jal f8000308 <__stack+0xf7ba030c>

  unsigned char Ncr = 100;  // Ncr = 0..8 (SD) / 1..8 (MMC)
 25c:	34 00 31 13 	.word 0x34003113
  do {
    response = SPI(0xFF); // get response
 260:	02 0a 00 00 	l.j f8280260 <__stack+0xf7e20264>
 264:	2d 1d 01 31 	.word 0x2d1d0131
 268:	13 11 01 12 	l.bf fc4406b0 <__stack+0xfbfe06b4>
  } while (response == 0xFF && Ncr--);
 26c:	01 58 0b 59 	l.j 5602fd0 <__stack+0x51a2fd4>
 270:	0b 01 13 00 	.word 0x0b011300
 274:	00 2e 0b 01 	l.j b82e78 <__stack+0x722e7c>
 278:	11 01 12 01 	l.bf 4044a7c <__stack+0x3be4a80>
 27c:	00 00 2f 1d 	l.j bef0 <__rom_length+0xaaf0>
 280:	01 31 13 52 	l.j 4c44fc8 <__stack+0x47e4fcc>
 284:	01 55 06 58 	l.j 5541be4 <__stack+0x50e1be8>
 288:	0b 59 05 01 	.word 0x0b590501
 28c:	13 00 00 30 	l.bf fc00034c <__stack+0xfbba0350>
 290:	1d 01 31 13 	.word 0x1d013113
 294:	11 01 12 01 	l.bf 4044a98 <__stack+0x3be4a9c>
 298:	58 0b 59 05 	.word 0x580b5905
 29c:	01 13 00 00 	l.j 44c029c <__stack+0x40602a0>
 2a0:	31 1d 01 31 	.word 0x311d0131
 2a4:	13 11 01 12 	l.bf fc4406ec <__stack+0xfbfe06f0>

  return response;

  DEBUG_FUNC_OUT();
}
 2a8:	01 58 0b 59 	l.j 560300c <__stack+0x51a3010>
 2ac:	05 00 00 32 	l.jal 4000374 <__stack+0x3ba0378>
 2b0:	34 00 03 0e 	.word 0x3400030e
 2b4:	3a 0b 3b 0b 	.word 0x3a0b3b0b
 2b8:	49 13 3f 0c 	l.jalr r7
 2bc:	3c 0c 00 00 	.word 0x3c0c0000
 2c0:	33 34 00 03 	.word 0x33340003
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2c4:	0e 3a 0b 3b 	l.bnf f8e82fb0 <__stack+0xf8a22fb4>
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2c8:	05 49 13 3f 	l.jal 5244fc4 <__stack+0x4de4fc8>
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2cc:	0c 3c 0c 00 	l.bnf f032cc <__stack+0xaa32d0>
 2d0:	00 34 34 00 	l.j d0d2d0 <__stack+0x8ad2d4>
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2d4:	03 08 3a 0b 	l.j fc20eb00 <__stack+0xfbdaeb04>
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2d8:	3b 0b 49 13 	.word 0x3b0b4913
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2dc:	3f 0c 3c 0c 	.word 0x3f0c3c0c
 2e0:	00 00 35 34 	l.j d7b0 <__rom_length+0xc3b0>
 2e4:	00 03 0e 3a 	l.j c3bcc <__ram_length+0xa3bcc>
 2e8:	0b 3b 0b 49 	.word 0x0b3b0b49
    lba = lba << 9; // otherwise convert sector adddress to byte address
 2ec:	13 1c 0b 00 	l.bf fc702eec <__stack+0xfc2a2ef0>
  }

  //EnableCard();

  if (MMC_Command(CMD17, lba)) {
 2f0:	00 36 34 00 	l.j d8d2f0 <__stack+0x92d2f4>
 2f4:	03 0e 3a 0b 	l.j fc38eb20 <__stack+0xfbf2eb24>
 2f8:	3b 0b 49 13 	.word 0x3b0b4913
    //printf("CMD17 (READ_BLOCK): invalid response 0x%02X (lba=%lu)\r", response, lba);
    //DisableCard();
    return(0);
 2fc:	02 0a 00 00 	l.j f82802fc <__stack+0xf7e20300>
    lba = lba << 9; // otherwise convert sector adddress to byte address
  }

  //EnableCard();

  if (MMC_Command(CMD17, lba)) {
 300:	37 34 00 03 	.word 0x37340003
 304:	0e 3a 0b 3b 	l.bnf f8e82ff0 <__stack+0xf8a22ff4>
 308:	05 49 13 02 	l.jal 5244f10 <__stack+0x4de4f14>
    //DisableCard();
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
 30c:	0a 00 00 38 	.word 0x0a000038
  while ((SPI(0xFF)) != 0xFE) {
 310:	34 00 03 08 	.word 0x34000308
    //DisableCard();
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
 314:	3a 0b 3b 0b 	.word 0x3a0b3b0b
 318:	49 13 02 0a 	l.jalr r0
  while ((SPI(0xFF)) != 0xFE) {
 31c:	Address 0x0000031c is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00 00 0b 36 	l.j 2cd8 <__rom_length+0x18d8>
   4:	00 02 00 00 	l.j 80004 <__ram_length+0x60004>
   8:	00 00 04 01 	l.j 100c <__data_rom+0x150>
   c:	00 00 01 41 	l.j 510 <GetCluster+0xe0>
  10:	01 00 00 03 	l.j 400001c <__stack+0x3ba0020>
  14:	2f 00 00 00 	.word 0x2f000000
  18:	49 00 00 00 	l.jalr r0
  1c:	84 00 00 0e 	l.lwz r0,0xe(r0)
  20:	9c 00 00 00 	l.addi r0,r0,0x0
  24:	00 02 01 06 	l.j 8043c <__ram_length+0x6043c>
  28:	00 00 02 36 	l.j 900 <main+0x3e4>
  2c:	02 02 05 00 	l.j f808142c <__stack+0xf7c21430>
  30:	00 00 b4 02 	l.j 2d038 <__ram_length+0xd038>
  34:	04 05 00 00 	l.jal 140034 <__ram_length+0x120034>
  38:	01 9a 02 08 	l.j 6680858 <__stack+0x622085c>
  3c:	05 00 00 01 	l.jal 4000040 <__stack+0x3ba0044>
  40:	95 02 01 08 	l.lhz r8,0x108(r2)
  44:	00 00 02 34 	l.j 914 <main+0x3f8>
  48:	03 00 00 02 	l.j fc000050 <__stack+0xfbba0054>
  4c:	86 06 31 00 	l.lwz r16,0x3100(r6)
  50:	00 00 53 02 	l.j 14c58 <__rom_length+0x13858>
  54:	02 07 00 00 	l.j f81c0054 <__stack+0xf7d60058>
  58:	02 c1 03 00 	l.j fb040c58 <__stack+0xfabe0c5c>
  5c:	00 02 6d 06 	l.j 9b474 <__ram_length+0x7b474>
  60:	34 00 00 00 	.word 0x34000000
  64:	65 02 04 07 	.word 0x65020407
  68:	00 00 02 50 	l.j 9a8 <main+0x48c>
  6c:	02 08 07 00 	l.j f8201c6c <__stack+0xf7da1c70>
  70:	00 02 4b 04 	l.j 92c80 <__ram_length+0x72c80>
  74:	04 05 69 6e 	l.jal 15a62c <__ram_length+0x13a62c>
  78:	74 00 02 04 	l.cust2 
  7c:	07 00 00 02 	l.jal fc000084 <__stack+0xfbba0088>
  80:	55 05 00 00 	.word 0x55050000
// fatal error
void FatalError(void)
{
  DEBUG_FUNC_IN();

  DisableCard();
  84:	00 41 00 00 	l.j 1040084 <__stack+0xbe0088>
  88:	00 91 06 00 	l.j 2441888 <__stack+0x1fe188c>
  8c:	00 00 65 07 	l.j 194a8 <__rom_length+0x180a8>
}


// fatal error
void FatalError(void)
{
  90:	00 05 00 00 	l.j 140090 <__ram_length+0x120090>
  DEBUG_FUNC_IN();

  DisableCard();
  94:	00 41 00 00 	l.j 1040094 <__stack+0xbe0098>
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  98:	00 a2 07 00 	l.j 2881c98 <__stack+0x2421c9c>
}


// fatal error
void FatalError(void)
{
  9c:	00 00 65 01 	l.j 194a0 <__rom_length+0x180a0>
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  a0:	bd 00 05 00 	.word 0xbd000500
  a4:	00 00 41 00 	l.j 104a4 <__rom_length+0xf0a4>

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  a8:	00 00 b2 06 	l.j 2c8c0 <__ram_length+0xc8c0>
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  ac:	00 00 00 65 	l.j 240 <MMC_Command+0xa8>
  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
  b0:	02 00 05 00 	l.j f80014b0 <__stack+0xf7ba14b4>

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  b4:	00 00 53 00 	l.j 14cb4 <__rom_length+0x138b4>
  b8:	00 00 c2 06 	l.j 308d0 <__ram_length+0x108d0>
  bc:	00 00 00 65 	l.j 250 <MMC_Command+0xb8>
  c0:	ff 00 05 00 	l.cust8 
  c4:	00 00 65 00 	l.j 194c4 <__rom_length+0x180c4>
  c8:	00 00 d2 06 	l.j 348e0 <__ram_length+0x148e0>
    LEDS(0x0);
  cc:	00 00 00 65 	l.j 260 <MMC_Command+0xc8>
    TIMER_wait(200);
  d0:	7f 00 03 00 	l.cust4 
  d4:	00 02 6d 06 	l.j 9b4ec <__ram_length+0x7b4ec>
  d8:	34 00 00 00 	.word 0x34000000
  dc:	65 03 00 00 	.word 0x65030000
  e0:	02 86 06 31 	l.j fa1819a4 <__stack+0xf9d219a8>
  e4:	00 00 00 53 	l.j 230 <MMC_Command+0x98>
    LEDS(led);
  e8:	03 00 00 02 	l.j fc0000f0 <__stack+0xfbba00f4>
  }
  ec:	6d 06 34 00 	.word 0x6d063400
  f0:	00 00 65 03 	l.j 194fc <__rom_length+0x180fc>

#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
  f4:	00 00 02 6d 	l.j aa8 <main+0x58c>
  f8:	06 34 00 00 	l.jal f8d000f8 <__stack+0xf88a00fc>


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  fc:	00 65 08 0c 	l.j 194212c <__stack+0x14e2130>
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
 100:	07 07 00 00 	l.jal fc1c0100 <__stack+0xfbd60104>
 104:	01 31 09 00 	l.j 4c42504 <__stack+0x47e2508>
 108:	00 02 d9 07 	l.j b6524 <__ram_length+0x96524>
 10c:	09 00 00 00 	.word 0x09000000
 110:	65 02 23 00 	.word 0x65022300


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
 114:	09 00 00 01 	.word 0x09000001
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
 118:	0e 07 0a 00 	l.bnf f81c2918 <__stack+0xf7d6291c>
 11c:	00 00 65 02 	l.j 19524 <__rom_length+0x18124>
}
 120:	23 04 09 00 	.word 0x23040900
 124:	00 00 97 07 	l.j 25d40 <__ram_length+0x5d40>
 128:	0b 00 00 00 	.word 0x0b000000
 12c:	65 02 23 08 	.word 0x65022308
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 130:	00 03 00 00 	l.j c0130 <__ram_length+0xa0130>
 134:	02 20 07 0c 	l.j f8801d64 <__stack+0xf83a1d68>
 138:	00 00 00 fe 	l.j 530 <main+0x14>
 13c:	0a 00 00 02 	.word 0x0a000002
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
 140:	b2 10 07 0e 	l.muli r16,r16,0x70e
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
    crc <<= 1;
 144:	00 00 01 73 	l.j 710 <main+0x1f4>
    if (c & 0x80)   crc ^= 0x09;
 148:	09 00 00 00 	.word 0x09000000
 14c:	00 07 10 00 	l.j 1c414c <__ram_length+0x1a414c>
 150:	00 00 81 02 	l.j 20558 <__ram_length+0x558>
 154:	23 00 09 00 	.word 0x23000900
    if (crc & 0x80) crc ^= 0x09;
 158:	00 01 81 07 	l.j 60574 <__ram_length+0x40574>
 15c:	11 00 00 00 	l.bf 400015c <__stack+0x3ba0160>
 160:	65 02 23 08 	.word 0x65022308
 164:	09 00 00 03 	.word 0x09000003
 168:	3d 07 12 00 	.word 0x3d071200
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 16c:	00 00 65 02 	l.j 19574 <__rom_length+0x18174>
 170:	23 0c 00 0b 	.word 0x230c000b
 174:	00 00 03 e5 	l.j 1108 <__data_rom+0x24c>
 178:	02 00 07 15 	l.j f8001dcc <__stack+0xf7ba1dd0>
 17c:	00 00 01 ad 	l.j 830 <main+0x314>
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
    if (crc & 0x80) crc ^= 0x09;
    c <<= 1;
 180:	09 00 00 01 	.word 0x09000001
 184:	d4 07 17 00 	l.sw 0x700(r7),r2
 188:	00 00 91 02 	l.j 24590 <__ram_length+0x4590>
 18c:	23 00 09 00 	.word 0x23000900
  }

  DEBUG_FUNC_OUT();
}
 190:	00 01 18 07 	l.j 461ac <__ram_length+0x261ac>
 194:	18 00 00 01 	l.movhi r0,0x1
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 198:	ad 03 23 be 	l.xori r8,r3,0x23be
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 19c:	03 09 00 00 	l.j fc24019c <__stack+0xfbde01a0>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1a0:	03 08 07 19 	l.j fc201e04 <__stack+0xfbda1e08>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 1a4:	00 00 00 53 	l.j 2f0 <MMC_Read+0x2c>
 1a8:	03 23 fe 03 	l.j fc8ff9b4 <__stack+0xfc49f9b8>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1ac:	00 05 00 00 	l.j 1401ac <__ram_length+0x1201ac>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 1b0:	01 3c 00 00 	l.j 4f001b0 <__stack+0x4aa01b4>
  SPI(0xFF); // flush SPI-bus
 1b4:	01 bd 06 00 	l.j 6f419b4 <__stack+0x6ae19b8>
 1b8:	00 00 65 03 	l.j 195c4 <__rom_length+0x181c4>
 1bc:	00 08 20 07 	l.j 2081d8 <__ram_length+0x1e81d8>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1c0:	1f 00 00 02 	.word 0x1f000002
 1c4:	7c 09 00 00 	l.cust4 
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus
 1c8:	00 e1 07 21 	l.j 3841e4c <__stack+0x33e1e50>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1cc:	00 00 00 81 	l.j 3d0 <MMC_Read+0x10c>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus
 1d0:	02 23 00 09 	l.j f88c01f4 <__stack+0xf84601f8>

  SPI(cmd);
 1d4:	00 00 03 a7 	l.j 1070 <__data_rom+0x1b4>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1d8:	07 25 00 00 	l.jal fc9401d8 <__stack+0xfc4e01dc>
  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus

  SPI(cmd);
 1dc:	00 a2 02 23 	l.j 2880a68 <__stack+0x2420a6c>
  MMC_CRC(cmd);
 1e0:	08 09 00 00 	.word 0x08090000
 1e4:	01 8a 07 26 	l.j 6281e7c <__stack+0x5e21e80>

  c = (unsigned char)(arg >> 24);
 1e8:	00 00 00 41 	l.j 2ec <MMC_Read+0x28>
  SPI(c);
 1ec:	02 23 0b 09 	l.j f88c2e10 <__stack+0xf8462e14>
 1f0:	00 00 00 aa 	l.j 498 <GetCluster+0x68>
  MMC_CRC(c);
 1f4:	07 2f 00 00 	l.jal fcbc01f4 <__stack+0xfc7601f8>
 1f8:	00 41 02 23 	l.j 1040a84 <__stack+0xbe0a88>

  c = (unsigned char)(arg >> 16);
 1fc:	0c 09 00 00 	l.bnf 2401fc <__ram_length+0x2201fc>
 200:	02 e0 07 32 	l.j fb801ec8 <__stack+0xfb3a1ecc>
  SPI(c);
 204:	00 00 00 41 	l.j 308 <MMC_Read+0x44>
 208:	02 23 0d 09 	l.j f88c362c <__stack+0xf8463630>
  MMC_CRC(c);
 20c:	00 00 03 b1 	l.j 10d0 <__data_rom+0x214>
 210:	07 33 00 00 	l.jal fccc0210 <__stack+0xfc860214>

  c = (unsigned char)(arg >> 8);
 214:	00 53 02 23 	l.j 14c0aa0 <__stack+0x1060aa4>
 218:	0e 09 00 00 	l.bnf f8240218 <__stack+0xf7de021c>
  SPI(c);
 21c:	03 d1 07 34 	l.j ff441eec <__stack+0xfefe1ef0>
 220:	00 00 00 53 	l.j 36c <MMC_Read+0xa8>
  MMC_CRC(c);
 224:	02 23 10 09 	l.j f88c4248 <__stack+0xf846424c>
 228:	00 00 02 62 	l.j bb0 <main+0x694>

  c = (unsigned char)(arg);
 22c:	07 35 00 00 	l.jal fcd4022c <__stack+0xfc8e0230>
  SPI(c);
 230:	00 53 02 23 	l.j 14c0abc <__stack+0x1060ac0>
 234:	12 09 00 00 	l.bf f8240234 <__stack+0xf7de0238>
  MMC_CRC(c);
 238:	01 35 07 36 	l.j 4d41f10 <__stack+0x48e1f14>
 23c:	00 00 00 53 	l.j 388 <MMC_Read+0xc4>

  crc <<= 1;
 240:	02 23 14 09 	l.j f88c5264 <__stack+0xf8465268>
 244:	00 00 03 70 	l.j 1004 <__data_rom+0x148>
  crc++;
 248:	07 37 00 00 	l.jal fcdc0248 <__stack+0xfc96024c>
 24c:	00 53 02 23 	l.j 14c0ad8 <__stack+0x1060adc>
 250:	16 09 00 00 	.word 0x16090000
  SPI(crc);
 254:	03 45 07 38 	l.j fd141f34 <__stack+0xfcce1f38>
 258:	00 00 00 53 	l.j 3a4 <MMC_Read+0xe0>

  unsigned char Ncr = 100;  // Ncr = 0..8 (SD) / 1..8 (MMC)
 25c:	02 23 18 09 	l.j f88c6280 <__stack+0xf8466284>
  do {
    response = SPI(0xFF); // get response
 260:	00 00 01 59 	l.j 7c4 <main+0x2a8>
 264:	07 39 00 00 	l.jal fce40264 <__stack+0xfc9e0268>
 268:	00 53 02 23 	l.j 14c0af4 <__stack+0x1060af8>
  } while (response == 0xFF && Ncr--);
 26c:	1a 09 00 00 	l.macrc r16
 270:	03 12 07 3a 	l.j fc481f58 <__stack+0xfc021f5c>
 274:	00 00 00 65 	l.j 408 <compare+0x18>
 278:	02 23 1c 00 	l.j f88c7278 <__stack+0xf846727c>
 27c:	03 00 00 00 	l.j fc00027c <__stack+0xfbba0280>
 280:	2c 07 3b 00 	.word 0x2c073b00
 284:	00 01 bd 0c 	l.j 6f6b4 <__ram_length+0x4f6b4>
 288:	02 00 07 3d 	l.j f8001f7c <__stack+0xf7ba1f80>
 28c:	00 00 02 a7 	l.j d28 <main+0x80c>
 290:	0d 00 00 03 	l.bnf 400029c <__stack+0x3ba02a0>
 294:	61 07 3e 00 	.word 0x61073e00
 298:	00 00 b2 0d 	l.j 2cacc <__ram_length+0xcacc>
 29c:	00 00 01 a3 	l.j 928 <main+0x40c>
 2a0:	07 3f 00 00 	l.jal fcfc02a0 <__stack+0xfcb602a4>
 2a4:	00 c2 00 03 	l.j 30802b0 <__stack+0x2c202b4>

  return response;

  DEBUG_FUNC_OUT();
}
 2a8:	00 00 02 fe 	l.j ea0 <main+0x984>
 2ac:	07 40 00 00 	l.jal fd0002ac <__stack+0xfcba02b0>
 2b0:	02 87 03 00 	l.j fa1c0eb0 <__stack+0xf9d60eb4>
 2b4:	00 02 86 06 	l.j a1acc <__ram_length+0x81acc>
 2b8:	31 00 00 00 	.word 0x31000000
 2bc:	53 03 00 00 	.word 0x53030000
 2c0:	02 6d 06 34 	l.j f9b41b90 <__stack+0xf96e1b94>
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2c4:	00 00 00 65 	l.j 458 <GetCluster+0x28>
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2c8:	0e 00 00 00 	l.bnf f80002c8 <__stack+0xf7ba02cc>
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2cc:	40 05 2c 01 	.word 0x40052c01
 2d0:	00 00 00 65 	l.j 464 <GetCluster+0x34>
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2d4:	01 00 00 02 	l.j 40002dc <__stack+0x3ba02e0>
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2d8:	f0 0f 00 00 	l.cust5 r0,r15,r0,0x0,0x0
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2dc:	01 c5 05 2c 	l.j 714178c <__stack+0x6ce1790>
 2e0:	00 00 00 65 	l.j 474 <GetCluster+0x44>
 2e4:	10 00 00 03 	l.bf 2f0 <MMC_Read+0x2c>
 2e8:	dc 05 2e 00 	l.sh 0x600(r5),r5
    lba = lba << 9; // otherwise convert sector adddress to byte address
 2ec:	00 00 65 00 	l.j 196ec <__rom_length+0x182ec>
  }

  //EnableCard();

  if (MMC_Command(CMD17, lba)) {
 2f0:	0e 00 00 00 	l.bnf f80002f0 <__stack+0xf7ba02f4>
 2f4:	35 05 35 01 	.word 0x35053501
 2f8:	00 00 00 65 	l.j 48c <GetCluster+0x5c>
    //printf("CMD17 (READ_BLOCK): invalid response 0x%02X (lba=%lu)\r", response, lba);
    //DisableCard();
    return(0);
 2fc:	01 00 00 03 	l.j 4000308 <__stack+0x3ba030c>
    lba = lba << 9; // otherwise convert sector adddress to byte address
  }

  //EnableCard();

  if (MMC_Command(CMD17, lba)) {
 300:	18 0f 00 00 	l.macrc r0
 304:	02 9a 05 35 	l.j fa6817d8 <__stack+0xfa2217dc>
 308:	00 00 00 65 	l.j 49c <GetCluster+0x6c>
    //DisableCard();
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
 30c:	10 00 00 03 	l.bf 318 <MMC_Read+0x54>
  while ((SPI(0xFF)) != 0xFE) {
 310:	dc 05 37 00 	l.sh 0x700(r5),r6
    //DisableCard();
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
 314:	00 00 65 00 	l.j 19714 <__rom_length+0x18314>
 318:	0e 00 00 02 	l.bnf f8000320 <__stack+0xf7ba0324>
  while ((SPI(0xFF)) != 0xFE) {
 31c:	76 02 2b 01 	l.cust2 
 320:	00 00 02 b2 	l.j de8 <main+0x8cc>
 324:	01 00 00 03 	l.j 4000330 <__stack+0x3ba0334>
 328:	33 11 69 00 	.word 0x33116900
    if (timeout++ >= 1000000) { // we can't wait forever
 32c:	02 2b 00 00 	l.j f8ac032c <__stack+0xf8660330>
 330:	00 dd 00 12 	l.j 3740378 <__stack+0x32e037c>
 334:	00 00 00 d3 	l.j 680 <main+0x164>
 338:	04 01 44 01 	l.jal 5133c <__ram_length+0x3133c>
 33c:	00 00 00 73 	l.j 508 <GetCluster+0xd8>
 340:	01 00 00 03 	l.j 400034c <__stack+0x3ba0350>
      //printf("CMD17 (READ_BLOCK): no data token! (lba=%lu)\r", lba);
      //DisableCard();
      return(0);
 344:	8e 13 66 6e 	l.lbz r16,0x666e(r19)
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
    if (timeout++ >= 1000000) { // we can't wait forever
 348:	00 04 01 44 	l.j 100858 <__ram_length+0xe0858>
 34c:	00 00 03 8e 	l.j 1184 <__data_rom+0x2c8>
 350:	13 62 75 66 	l.bf fd89d8e8 <__stack+0xfd43d8ec>
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 354:	00 04 01 44 	l.j 100864 <__ram_length+0xe0864>
 358:	00 00 03 a0 	l.j 11d8 <__data_rom+0x31c>
 35c:	14 15 00 00 	.word 0x14150000
 360:	01 cc 04 01 	l.j 7301364 <__stack+0x6ea1368>
 364:	49 00 00 00 	l.jalr r0
 368:	73 16 63 00 	l.cust1 
  DEBUG_FUNC_OUT();
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
 36c:	04 01 4a 00 	l.jal 52b6c <__ram_length+0x32b6c>
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 370:	00 00 73 15 	l.j 1cfc4 <__rom_length+0x1bbc4>
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
    *(pReadBuffer++) = SPI(0xFF);
 374:	00 00 02 d9 	l.j ed8 <__data_rom+0x1c>
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 378:	04 01 4b 00 	l.jal 52f78 <__ram_length+0x32f78>
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
    *(pReadBuffer++) = SPI(0xFF);
 37c:	00 00 73 14 	l.j 1cfcc <__rom_length+0x1bbcc>
 380:	16 73 62 00 	.word 0x16736200
 384:	04 01 4f 00 	l.jal 53f84 <__ram_length+0x33f84>
 388:	00 00 65 00 	l.j 19788 <__rom_length+0x18388>
 38c:	00 00 17 04 	l.j 5f9c <__rom_length+0x4b9c>
 390:	00 00 03 94 	l.j 11e0 <__data_rom+0x324>
    *(pReadBuffer++) = SPI(0xFF);
 394:	18 00 00 03 	l.movhi r0,0x3
 398:	99 02 01 06 	l.lhs r8,0x106(r2)
 39c:	00 00 02 3d 	l.j c90 <main+0x774>
    *(pReadBuffer++) = SPI(0xFF);
 3a0:	17 04 00 00 	.word 0x17040000
 3a4:	00 41 19 00 	l.j 10467a4 <__stack+0xbe67a8>
 3a8:	00 03 85 05 	l.j e17bc <__ram_length+0xc17bc>
    *(pReadBuffer++) = SPI(0xFF);
 3ac:	68 01 01 00 	.word 0x68010100
 3b0:	00 03 bf 0f 	l.j effec <__ram_length+0xcffec>
 3b4:	00 00 02 f9 	l.j f98 <__data_rom+0xdc>
  DEBUG_FUNC_OUT();
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
 3b8:	05 68 00 00 	l.jal 5a003b8 <__stack+0x55a03bc>
      //DisableCard();
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
 3bc:	00 65 00 0e 	l.j 19403f4 <__stack+0x14e03f8>
 3c0:	00 00 03 67 	l.j 115c <__data_rom+0x2a0>
 3c4:	04 de 01 00 	l.jal 37807c4 <__stack+0x33207c8>
    *(pReadBuffer++) = SPI(0xFF);
    *(pReadBuffer++) = SPI(0xFF);
    *(pReadBuffer++) = SPI(0xFF);
  }

  SPI(0xFF); // read CRC lo byte
 3c8:	00 00 41 01 	l.j 107cc <__rom_length+0xf3cc>
 3cc:	00 00 04 1e 	l.j 1444 <__rom_length+0x44>
  SPI(0xFF); // read CRC hi byte
 3d0:	0f 00 00 01 	l.bnf fc0003d4 <__stack+0xfbba03d8>
 3d4:	13 04 de 00 	l.bf fc137bd4 <__stack+0xfbcd7bd8>

  //DisableCard();
  return(1);
 3d8:	00 04 1e 0f 	l.j 107c14 <__ram_length+0xe7c14>

  DEBUG_FUNC_OUT();
}
 3dc:	00 00 02 11 	l.j c20 <main+0x704>
 3e0:	04 de 00 00 	l.jal 37803e0 <__stack+0x33203e4>
 3e4:	03 8e 10 00 	l.j fe3843e4 <__stack+0xfdf243e8>
 3e8:	00 03 36 04 	l.j cdbf8 <__ram_length+0xadbf8>
 3ec:	e0 00 00 04 	l.or r0,r0,r0


int compare(const char *s1, const char *s2,int b)
{
	int i;
	for(i=0;i<b;++i)
 3f0:	24 10 00 00 	l.rfe 
 3f4:	02 00 04 e1 	l.j f8001778 <__stack+0xf7ba177c>
#define printf(...)
#define putserial(x)
#define BootPrint(x) puts(x);


int compare(const char *s1, const char *s2,int b)
 3f8:	00 00 00 65 	l.j 58c <main+0x70>
{
	int i;
	for(i=0;i<b;++i)
	{
		if(*s1++!=*s2++)
 3fc:	10 00 00 01 	l.bf 400 <compare+0x10>
 400:	b3 04 e2 00 	l.muli r24,r4,0xffffe200
 404:	00 00 65 10 	l.j 19844 <__rom_length+0x18444>
 408:	00 00 01 66 	l.j 9a0 <main+0x484>
 40c:	04 e3 00 00 	l.jal 38c040c <__stack+0x3460410>


int compare(const char *s1, const char *s2,int b)
{
	int i;
	for(i=0;i<b;++i)
 410:	00 65 10 00 	l.j 1944410 <__stack+0x14e4414>
 414:	00 02 f0 04 	l.j bc424 <__ram_length+0x9c424>
 418:	e4 00 00 00 	l.sfeq r0,r0
	{
		if(*s1++!=*s2++)
			return(1);
	}
	return(0);
 41c:	65 00 17 04 	.word 0x65001704
 420:	00 00 01 31 	l.j 8e4 <main+0x3c8>
{
	int i;
	for(i=0;i<b;++i)
	{
		if(*s1++!=*s2++)
			return(1);
 424:	17 04 00 00 	.word 0x17040000
	}
	return(0);
}
 428:	02 7c 1a 00 	l.j f9f06c28 <__stack+0xf9aa6c2c>
 42c:	00 03 24 01 	l.j c9430 <__ram_length+0xa9430>
    return(1);
}


int GetCluster(int cluster)
{
 430:	53 01 00 00 	.word 0x53010000
	int i;
	uint32_t sb;
    if (fat32)
 434:	00 84 00 00 	l.j 2100434 <__stack+0x1ca0438>
    return(1);
}


int GetCluster(int cluster)
{
 438:	00 f4 00 00 	l.j 3d00438 <__stack+0x38a043c>
 43c:	00 00 1b 00 	l.j 703c <__rom_length+0x5c3c>
 440:	00 03 1b 02 	l.j c7048 <__ram_length+0xa7048>
 444:	25 01 00 00 	l.rfe 
	int i;
	uint32_t sb;
    if (fat32)
 448:	02 bd 00 00 	l.j faf40448 <__stack+0xfaae044c>
 44c:	00 f4 00 00 	l.j 3d0044c <__stack+0x38a0450>
 450:	01 30 00 00 	l.j 4c00450 <__stack+0x47a0454>
 454:	00 20 00 00 	l.j 800454 <__stack+0x3a0458>
 458:	04 68 1c 69 	l.jal 1a075fc <__stack+0x15a7600>
    {
        sb = cluster >> 7; // calculate sector number containing FAT-link
 45c:	00 02 25 00 	l.j 8985c <__ram_length+0x6985c>
        i = cluster & 0x7F; // calculate link offsset within sector
 460:	00 00 e8 00 	l.j 3a460 <__ram_length+0x1a460>
 464:	00 00 40 00 	l.j 10464 <__rom_length+0xf064>
    }
    else
    {
        sb = cluster >> 8; // calculate sector number containing FAT-link
 468:	1d 00 00 01 	.word 0x1d000001
        i = cluster & 0xFF; // calculate link offsset within sector
 46c:	6d 03 01 13 	.word 0x6d030113
    }

    // read sector of FAT if not already in the buffer
    if (sb != buffered_fat_index)
 470:	01 00 00 01 	l.j 4000474 <__stack+0x3ba0478>
 474:	30 00 00 01 	.word 0x30000001
 478:	98 02 71 00 	l.lhs r0,0x7100(r2)
 47c:	00 00 04 9d 	l.j 16f0 <__rom_length+0x2f0>
 480:	1e 63 00 03 	.word 0x1e630003
 484:	01 13 00 00 	l.j 44c0484 <__stack+0x4060488>
    {
        if (!MMC_Read(fat_start + sb, (unsigned char*)&fat_buffer))
 488:	00 41 00 00 	l.j 1040488 <__stack+0xbe048c>
 48c:	00 53 1f 69 	l.j 14c8230 <__stack+0x1068234>
 490:	00 03 01 17 	l.j c08ec <__ram_length+0xa08ec>
 494:	00 00 00 41 	l.j 598 <main+0x7c>
 498:	00 00 00 84 	l.j 6a8 <main+0x18c>
 49c:	00 1b 00 00 	l.j 6c049c <__stack+0x2604a0>
 4a0:	01 75 03 e7 	l.j 5d4143c <__stack+0x58e1440>
 4a4:	01 00 00 00 	l.j 40004a4 <__stack+0x3ba04a8>
 4a8:	41 00 00 01 	.word 0x41000001
            return(0);

        // remember current buffer index
        buffered_fat_index = sb;
 4ac:	98 00 00 02 	l.lhs r0,0x2(r0)
    }
    i = fat32 ? SwapBBBB(fat_buffer.fat32[i]) & 0x0FFFFFFF : SwapBB(fat_buffer.fat16[i]); // get FAT link for 68000 
 4b0:	c4 00 00 00 	.word 0xc4000000
 4b4:	a3 00 00 04 	l.addic r24,r0,0x4
 4b8:	f5 1c 63 6d 	l.cust6 
 4bc:	64 00 03 e7 	.word 0x640003e7
 4c0:	00 00 00 41 	l.j 5c4 <main+0xa8>
 4c4:	00 00 00 c3 	l.j 7d0 <main+0x2b4>
 4c8:	1c 61 72 67 	.word 0x1c617267
 4cc:	00 03 e7 00 	l.j fa0cc <__ram_length+0xda0cc>
 4d0:	00 00 65 00 	l.j 198d0 <__rom_length+0x184d0>
 4d4:	00 00 d6 20 	l.j 35d54 <__ram_length+0x15d54>
 4d8:	63 00 03 eb 	.word 0x630003eb
 4dc:	00 00 00 41 	l.j 5e0 <main+0xc4>
 4e0:	00 00 00 f4 	l.j 8b0 <main+0x394>
 4e4:	1f 4e 63 72 	.word 0x1f4e6372
 4e8:	00 03 01 07 	l.j c0904 <__ram_length+0xa0904>
 4ec:	00 00 00 41 	l.j 5f0 <main+0xd4>


uint16_t SwapBB(uint16_t i)
{
  return ((i&0x00ff)<<8) | ((i&0xff00)>>8);
 4f0:	00 00 01 28 	l.j 990 <main+0x474>
 4f4:	00 1b 00 00 	l.j 6c04f4 <__stack+0x2604f8>
 4f8:	00 ca 03 b9 	l.j 32813dc <__stack+0x2e213e0>
 4fc:	01 00 00 00 	l.j 40004fc <__stack+0x3ba0500>
	return(i);
}
 500:	41 00 00 02 	.word 0x41000002
 504:	c4 00 00 03 	.word 0xc4000003
 508:	f0 00 00 01 	l.cust5 r0,r0,r0,0x0,0x1
 50c:	62 00 00 05 	.word 0x62000005
 510:	39 1c 6c 62 	.word 0x391c6c62
 514:	61 00 03 b9 	.word 0x610003b9
 518:	00 00 00 65 	l.j 6ac <main+0x190>
void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
{
 51c:	00 00 01 82 	l.j b24 <main+0x608>

  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
 520:	21 00 00 00 	l.trap 0x0
 524:	be 03 b9 00 	.word 0xbe03b900
 528:	00 03 a0 00 	l.j e8528 <__ram_length+0xc8528>
void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
{
 52c:	00 01 ab 22 	l.j 6b1b4 <__ram_length+0x4b1b4>
 530:	69 00 03 bd 	.word 0x690003bd
 534:	00 00 00 65 	l.j 6c8 <main+0x1ac>
 538:	00 23 00 00 	l.j 8c0538 <__stack+0x46053c>
 53c:	03 59 04 53 	l.j fd641688 <__stack+0xfd1e168c>
 540:	01 00 00 00 	l.j 4000540 <__stack+0x3ba0544>
 544:	73 00 00 03 	l.cust1 
 548:	f0 00 00 04 	l.cust5 r0,r0,r0,0x0,0x4
 54c:	30 02 71 00 	.word 0x30027100

  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
 550:	00 00 05 89 	l.j 1b74 <__rom_length+0x774>
 554:	1c 73 31 00 	.word 0x1c733100
 558:	04 53 00 00 	l.jal 14c0558 <__stack+0x106055c>
 55c:	03 8e 00 00 	l.j fe38055c <__stack+0xfdf20560>
void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
{
 560:	02 06 1c 73 	l.j f818772c <__stack+0xf7d27730>

  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
 564:	32 00 04 53 	.word 0x32000453
  DEBUG_FUNC_IN();

    unsigned char n;
    unsigned char ocr[4];

    SPI_slow();     // set slow clock
 568:	00 00 03 8e 	l.j 13a0 <__data_rom+0x4e4>
 56c:	00 00 02 19 	l.j dd0 <main+0x8b4>
 570:	24 62 00 04 	l.rfe 
    DisableCard();  // CS = 1
 574:	53 00 00 00 	.word 0x53000000
 578:	73 01 55 20 	l.cust1 
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
 57c:	69 00 04 55 	.word 0x69000455

    unsigned char n;
    unsigned char ocr[4];

    SPI_slow();     // set slow clock
    DisableCard();  // CS = 1
 580:	00 00 00 73 	l.j 74c <main+0x230>
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
 584:	00 00 02 2c 	l.j e34 <main+0x918>
 588:	00 1b 00 00 	l.j 6c0588 <__stack+0x26058c>
 58c:	02 8f 04 c1 	l.j fa3c1890 <__stack+0xf9f61894>
 590:	01 00 00 00 	l.j 4000590 <__stack+0x3ba0594>
 594:	73 00 00 04 	l.cust1 
 598:	30 00 00 05 	.word 0x30000005
 59c:	1c 00 00 02 	.word 0x1c000002
 5a0:	56 00 00 05 	.word 0x56000005
 5a4:	e9 21 00 00 	.word 0xe9210000
    TIMER_wait(20);  // 20ms delay
 5a8:	00 97 04 c1 	l.j 25c18ac <__stack+0x21618b0>
 5ac:	00 00 00 73 	l.j 778 <main+0x25c>
 5b0:	00 00 02 76 	l.j f88 <__data_rom+0xcc>
 5b4:	20 69 00 04 	.word 0x20690004
 5b8:	c3 00 00 00 	l.mtspr r0,r0,0xc000
 5bc:	73 00 00 02 	l.cust1 
 5c0:	89 20 73 62 	l.lws r9,0x7362(r0)
 5c4:	00 04 c4 00 	l.j 1315c4 <__ram_length+0x1115c4>
 5c8:	00 02 bd 00 	l.j af9c8 <__ram_length+0x8f9c8>
    EnableCard();
 5cc:	00 02 b2 25 	l.j ace60 <__ram_length+0x8ce60>
 5d0:	00 00 03 18 	l.j 1230 <__data_rom+0x374>

    CardType = CARDTYPE_NONE;

    for(n=0; n<16; n++) {
 5d4:	00 00 04 f0 	l.j 1994 <__rom_length+0x594>
    SPI_slow();     // set slow clock
    DisableCard();  // CS = 1
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
    TIMER_wait(20);  // 20ms delay
    EnableCard();
 5d8:	00 00 04 fc 	l.j 19c8 <__rom_length+0x5c8>

    CardType = CARDTYPE_NONE;
 5dc:	04 d9 26 00 	l.jal 3649ddc <__stack+0x31e9de0>
 5e0:	00 03 29 00 	l.j ca9e0 <__ram_length+0xaa9e0>
 5e4:	00 02 d0 00 	l.j b45e4 <__ram_length+0x945e4>

    for(n=0; n<16; n++) {
      TIMER_wait(1);
 5e8:	00 0e 00 00 	l.j 3805e8 <__ram_length+0x3605e8>
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
    TIMER_wait(20);  // 20ms delay
    EnableCard();

    CardType = CARDTYPE_NONE;
 5ec:	03 c8 03 30 	l.j ff2012ac <__stack+0xfeda12b0>

    for(n=0; n<16; n++) {
      TIMER_wait(1);
 5f0:	01 00 00 00 	l.j 40005f0 <__stack+0x3ba05f4>
 5f4:	41 01 00 00 	.word 0x41010000
 5f8:	06 0f 22 6e 	l.jal f83c8fb0 <__stack+0xf7f68fb4>
 5fc:	00 03 34 00 	l.j cd5fc <__ram_length+0xad5fc>
 600:	00 00 41 22 	l.j 10a88 <__rom_length+0xf688>
 604:	6f 63 72 00 	.word 0x6f637200
      if (MMC_Command(CMD0, 0) == 0x01) break; // try to send CMD0 multiple times
 608:	03 35 00 00 	l.j fcd40608 <__stack+0xfc8e060c>
 60c:	06 0f 00 05 	l.jal f83c0620 <__stack+0xf7f60624>
 610:	00 00 00 41 	l.j 714 <main+0x1f8>
 614:	00 00 06 1f 	l.j 1e90 <__rom_length+0xa90>
 618:	06 00 00 00 	l.jal f8000618 <__stack+0xf7ba061c>
    TIMER_wait(20);  // 20ms delay
    EnableCard();

    CardType = CARDTYPE_NONE;

    for(n=0; n<16; n++) {
 61c:	65 03 00 0e 	.word 0x6503000e
 620:	00 00 01 a9 	l.j cc4 <main+0x7a8>
 624:	04 60 01 00 	l.jal 1800a24 <__stack+0x13a0a28>
 628:	00 00 41 01 	l.j 10a2c <__rom_length+0xf62c>
 62c:	00 00 06 49 	l.j 1f50 <__rom_length+0xb50>
 630:	10 00 00 02 	l.bf 638 <main+0x11c>
}

//// timer ////
unsigned long GetTimer(unsigned long offset)
{
  unsigned long systimer = TIMER_get();
 634:	d4 04 62 00 	l.sw 0x200(r4),r12
  systimer = systimer<< 16;
  systimer += offset << 16;
 638:	00 00 65 14 	l.j 19a88 <__rom_length+0x18688>

//// timer ////
unsigned long GetTimer(unsigned long offset)
{
  unsigned long systimer = TIMER_get();
  systimer = systimer<< 16;
 63c:	22 6d 62 72 	.word 0x226d6272
    }
    if (n<16) // got CMD0 IDLE response
    { // idle state
        //timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
 640:	00 04 75 00 	l.j 11da40 <__ram_length+0xfda40>
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
 644:	00 06 49 00 	l.j 192a44 <__ram_length+0x172a44>
  systimer += offset << 16;
 648:	00 17 04 00 	l.j 5c1648 <__stack+0x16164c>
    }
    if (n<16) // got CMD0 IDLE response
    { // idle state
        //timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
 64c:	00 01 73 27 	l.j 5d2e8 <__ram_length+0x3d2e8>
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
 650:	01 00 00 00 	l.j 4000650 <__stack+0x3ba0654>
 654:	dc 01 2a 01 	l.sh 0x201(r1),r5
 658:	00 00 05 1c 	l.j 1ac8 <__rom_length+0x6c8>
 65c:	00 00 0e 9c 	l.j 40cc <__rom_length+0x2ccc>
 660:	00 00 02 e3 	l.j 11ec <__data_rom+0x330>
 664:	00 00 08 62 	l.j 27ec <__rom_length+0x13ec>
        {   // SDHC card
            for (n = 0; n < 4; n++)
                ocr[n] = SPI(0xFF); // get the rest of R7 response
 668:	28 72 61 6d 	lv.srl.h r3,r18,r12
    { // idle state
        //timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
 66c:	00 01 2f 00 	l.j 4c26c <__ram_length+0x2c26c>

void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
 670:	00 03 a0 00 	l.j e8670 <__ram_length+0xc8670>
 674:	40 00 00 29 	.word 0x40000029
        {   // SDHC card
            for (n = 0; n < 4; n++)
                ocr[n] = SPI(0xFF); // get the rest of R7 response
 678:	00 00 05 e9 	l.j 1e1c <__rom_length+0xa1c>
 67c:	00 00 05 68 	l.j 1c1c <__rom_length+0x81c>
 680:	00 00 00 00 	l.j 680 <main+0x164>
 684:	01 33 00 00 	l.j 4cc0684 <__stack+0x4860688>
 688:	07 2a 2a 00 	l.jal fca8ae88 <__stack+0xfc62ae8c>
 68c:	00 00 20 2b 	l.j 8738 <__rom_length+0x7338>
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
        {   // SDHC card
            for (n = 0; n < 4; n++)
 690:	00 00 05 fa 	l.j 1e78 <__rom_length+0xa78>
 694:	00 00 03 03 	l.j 12a0 <__data_rom+0x3e4>
 698:	2c 00 00 06 	.word 0x2c000006
                ocr[n] = SPI(0xFF); // get the rest of R7 response
            if (ocr[2] == 0x01 && ocr[3] == 0xAA)
 69c:	03 02 91 54 	l.j fc0a4bec <__stack+0xfbc44bf0>
 6a0:	2d 00 00 02 	.word 0x2d000002
 6a4:	f0 00 00 07 	l.cust5 r0,r0,r0,0x0,0x7
 6a8:	f4 00 00 08 	l.cust6 
 6ac:	24 03 7a 00 	l.rfe 
 6b0:	00 06 d0 26 	l.j 1b4748 <__ram_length+0x194748>
 6b4:	00 00 03 01 	l.j 12b8 <__data_rom+0x3fc>
 6b8:	00 00 03 2d 	l.j 136c <__data_rom+0x4b0>
}


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
 6bc:	2e 00 00 07 	.word 0x2e000007
 6c0:	f4 00 00 08 	l.cust6 
                //printf("SDHC card detected\r");
                while (!CheckTimer(timeout))
                { // now we must wait until CMD41 returns 0 (or timeout elapses)
                    if (MMC_Command(CMD55, 0) == 0x01)
                    { // CMD55 must precede any ACMD command
                        if (MMC_Command(CMD41, 1 << 30) == 0x00) // ACMD41 with HCS bit
 6c4:	24 2b 00 00 	l.rfe 
 6c8:	03 0c 00 00 	l.j fc3006c8 <__stack+0xfbea06cc>
 6cc:	03 65 00 00 	l.j fd9406cc <__stack+0xfd4e06d0>
 6d0:	29 00 00 02 	.word 0x29000002
 6d4:	c8 00 00 06 	lf.rem.s r0,r0,r0
                        { // initialization completed
                            if (MMC_Command(CMD58, 0) == 0x00)
 6d8:	34 00 00 00 	.word 0x34000000
 6dc:	40 03 48 00 	.word 0x40034800
 6e0:	00 06 fc 26 	l.j 1bf778 <__ram_length+0x19f778>
 6e4:	00 00 02 d9 	l.j 1248 <__data_rom+0x38c>
 6e8:	00 00 03 87 	l.j 1504 <__rom_length+0x104>
                            { // check CCS (Card Capacity Status) bit in the OCR
                                for (n = 0; n < 4; n++)
                                    ocr[n] = SPI(0xFF);
 6ec:	2a 00 00 00 	.word 0x2a000000
 6f0:	58 2b 00 00 	.word 0x582b0000
 6f4:	02 e4 00 00 	l.j fb9006f4 <__stack+0xfb4a06f8>
 6f8:	03 ab 00 00 	l.j feac06f8 <__stack+0xfe6606fc>
 6fc:	25 00 00 02 	l.rfe 
 700:	f0 00 00 07 	l.cust5 r0,r0,r0,0x0,0x7
                    { // CMD55 must precede any ACMD command
                        if (MMC_Command(CMD41, 1 << 30) == 0x00) // ACMD41 with HCS bit
                        { // initialization completed
                            if (MMC_Command(CMD58, 0) == 0x00)
                            { // check CCS (Card Capacity Status) bit in the OCR
                                for (n = 0; n < 4; n++)
 704:	4c 00 00 07 	l.maci r0,0x7
 708:	70 03 51 26 	l.cust1 
 70c:	00 00 03 01 	l.j 1310 <__data_rom+0x454>
                                    ocr[n] = SPI(0xFF);

                                CardType = (ocr[0] & 0x40) ? CARDTYPE_SDHC : CARDTYPE_SD; // if CCS set then the card is SDHC compatible
 710:	00 00 03 ea 	l.j 16b8 <__rom_length+0x2b8>
 714:	2e 00 00 07 	.word 0x2e000007
 718:	4c 00 00 07 	l.maci r0,0x7
 71c:	70 2b 00 00 	l.cust1 
 720:	03 0c 00 00 	l.j fc300720 <__stack+0xfbea0724>
 724:	04 1a 00 00 	l.jal 680724 <__stack+0x220728>
 728:	00 00 29 00 	l.j ab28 <__rom_length+0x9728>
 72c:	00 06 1f 00 	l.j 18832c <__ram_length+0x16832c>
 730:	00 08 38 00 	l.j 20e730 <__ram_length+0x1ee730>
                            }
                            //printf("CMD58 (READ_OCR) failed!\r");
                            //DisableCard();

                            // set appropriate SPI speed
                            SPI_fast();
 734:	00 00 70 01 	l.j 1c738 <__rom_length+0x1b338>
 738:	37 00 00 07 	.word 0x37000007
 73c:	60 2a 00 00 	.word 0x602a0000
 740:	00 90 2b 00 	l.j 240b340 <__stack+0x1fab344>
                                //printf("CMD16 (SET_BLOCKLEN) failed!\r");
                            //DisableCard();

                            // set appropriate SPI speed
                            SPI_fast();
                            return(CardType);
 744:	00 06 30 00 	l.j 18c744 <__ram_length+0x16c744>
 748:	00 04 3c 2e 	l.j 10f800 <__ram_length+0xef800>
 74c:	00 00 08 ec 	l.j 2afc <__rom_length+0x16fc>
 750:	00 00 09 4c 	l.j 2c80 <__rom_length+0x1880>
  systimer = systimer<< 16;
 754:	2b 00 00 06 	.word 0x2b000006
  time -= systimer;
 758:	3c 00 00 04 	.word 0x3c000004
  if(time & 0x80000000) return(1);
 75c:	7c 00 00 00 	l.cust4 
 760:	29 00 00 03 	.word 0x29000003
 764:	33 00 00 0b 	.word 0x3300000b
 768:	dc 00 00 00 	l.sh 0x0(r0),r0
 76c:	b0 01 3b 00 	l.muli r0,r1,0x3b00
                return(CARDTYPE_NONE);
            }
        }

        // it's not an SDHC card
        if (MMC_Command(CMD55, 0) == 0x01)
 770:	00 08 48 26 	l.j 212808 <__ram_length+0x1f2808>
 774:	00 00 03 50 	l.j 14b4 <__rom_length+0xb4>
 778:	00 00 04 94 	l.j 19c8 <__rom_length+0x5c8>
 77c:	26 00 00 03 	l.rfe 
 780:	45 00 00 04 	l.jr r0
        { // CMD55 accepted so it's an SD card (or Kingston 128 MB MMC)
            if (MMC_Command(CMD41, 0) <= 0x01)
 784:	d2 2f 00 00 	l.sd 0xffff8800(r15),r0
 788:	03 bf 00 00 	l.j fefc0788 <__stack+0xfeb6078c>
 78c:	0b dc 00 00 	.word 0x0bdc0000
 790:	00 e0 04 01 	l.j 3801794 <__stack+0x33a1798>
 794:	46 00 00 08 	l.jr r0
}


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
 798:	17 26 00 00 	.word 0x17260000
 79c:	03 db 00 00 	l.j ff6c079c <__stack+0xff2607a0>
                //printf("timeout:%08X\r",GetTimer(0));
                while (!CheckTimer(timeout))
                { // now we must wait until CMD41 returns 0 (or timeout elapses)
                    if (MMC_Command(CMD55, 0) == 0x01)
                    { // CMD55 must precede any ACMD command
                        if (MMC_Command(CMD41, 0) == 0x00)
 7a0:	04 fa 2a 00 	l.jal 3e8afa0 <__stack+0x3a2afa4>
 7a4:	00 01 20 2b 	l.j 48850 <__ram_length+0x28850>
 7a8:	00 00 03 e6 	l.j 1740 <__rom_length+0x340>
 7ac:	00 00 05 22 	l.j 1c34 <__rom_length+0x834>
 7b0:	2b 00 00 03 	.word 0x2b000003
 7b4:	f1 00 00 05 	l.cust5 r8,r0,r0,0x0,0x5
                        { // initialization completed

                            if (MMC_Command(CMD16, 512) != 0x00) //set block length
 7b8:	7e 2b 00 00 	l.cust4 
 7bc:	03 fc 00 00 	l.j fff007bc <__stack+0xffaa07c0>
 7c0:	05 cc 2b 00 	l.jal 730b3c0 <__stack+0x6eab3c4>
 7c4:	00 04 07 00 	l.j 1023c4 <__ram_length+0xe23c4>
 7c8:	00 06 0f 2b 	l.j 184474 <__ram_length+0x164474>
                                //printf("CMD16 (SET_BLOCKLEN) failed!\r");
                            //DisableCard();

                            // set appropriate SPI speed
                            SPI_fast();
 7cc:	00 00 04 12 	l.j 1814 <__rom_length+0x414>
 7d0:	00 00 06 39 	l.j 20b4 <__rom_length+0xcb4>
                            return(CardType);
 7d4:	26 00 00 03 	l.rfe 
 7d8:	d0 00 00 06 	l.sd 0x6(r0),r0
 7dc:	57 30 00 00 	.word 0x57300000
  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
  if (!MMC_Init()) FatalError();
 7e0:	03 18 00 00 	l.j fc6007e0 <__stack+0xfc1a07e4>
 7e4:	0c f0 00 00 	l.bnf 3c007e4 <__stack+0x37a07e8>
 7e8:	0c fc 04 01 	l.bnf 3f017ec <__stack+0x3aa17f0>
 7ec:	01 00 00 07 	l.j 4000808 <__stack+0x3ba080c>
 7f0:	fb 26 00 00 	l.cust7 
  systimer = systimer<< 16;
  time -= systimer;
 7f4:	03 29 00 00 	l.j fca407f4 <__stack+0xfc5e07f8>
}


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
 7f8:	06 7f 00 31 	l.jal f9fc08bc <__stack+0xf9b608c0>
  systimer = systimer<< 16;
  time -= systimer;
 7fc:	00 00 03 18 	l.j 145c <__rom_length+0x5c>
}


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
 800:	00 00 0d 08 	l.j 3c20 <__rom_length+0x2820>
  systimer = systimer<< 16;
  time -= systimer;
 804:	00 00 0d 14 	l.j 3c54 <__rom_length+0x2854>


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
  systimer = systimer<< 16;
 808:	04 01 01 26 	l.jal 40ca0 <__ram_length+0x20ca0>
  time -= systimer;
 80c:	00 00 03 29 	l.j 14b0 <__rom_length+0xb0>
  if(time & 0x80000000) return(1);
 810:	00 00 06 92 	l.j 2258 <__rom_length+0xe58>
 814:	00 00 00 2a 	l.j 8bc <main+0x3a0>
 818:	00 00 01 60 	l.j d98 <main+0x87c>
 81c:	2b 00 00 03 	.word 0x2b000003
 820:	5d 00 00 06 	.word 0x5d000006

  // find drive
  LEDS(led=0x8);
 824:	a5 2b 00 00 	l.andi r9,r11,0x0
 828:	03 69 00 00 	l.j fda40828 <__stack+0xfd5e082c>
 82c:	06 c3 2b 00 	l.jal fb0cb42c <__stack+0xfac6b430>
 830:	00 03 73 00 	l.j dd430 <__ram_length+0xbd430>
 834:	00 06 d7 2a 	l.j 1b64dc <__ram_length+0x1964dc>

// FindDrive() checks if a card is present and contains FAT formatted primary partition
unsigned char FindDrive(void)
{
	unsigned long boot_sector;              // partition boot sector
    buffered_fat_index = -1;
 838:	00 00 01 80 	l.j e38 <main+0x91c>
 83c:	2b 00 00 03 	.word 0x2b000003
 840:	80 00 00 07 	l.ld r0,0x7(r0)
 844:	0c 00 00 00 	l.bnf 844 <main+0x328>
	fat32=0;

    if (!MMC_Read(0, sector_buffer)) // read MBR
 848:	25 00 00 03 	l.rfe 

// FindDrive() checks if a card is present and contains FAT formatted primary partition
unsigned char FindDrive(void)
{
	unsigned long boot_sector;              // partition boot sector
    buffered_fat_index = -1;
 84c:	a6 00 00 0e 	l.andi r16,r0,0xe
	fat32=0;

    if (!MMC_Read(0, sector_buffer)) // read MBR
 850:	48 00 00 0e 	l.jalr r0

// FindDrive() checks if a card is present and contains FAT formatted primary partition
unsigned char FindDrive(void)
{
	unsigned long boot_sector;              // partition boot sector
    buffered_fat_index = -1;
 854:	64 01 49 26 	.word 0x64014926
	fat32=0;
 858:	00 00 03 b3 	l.j 1724 <__rom_length+0x324>
 85c:	00 00 07 50 	l.j 259c <__rom_length+0x119c>
 860:	00 00 05 00 	l.j 1c60 <__rom_length+0x860>

    if (!MMC_Read(0, sector_buffer)) // read MBR
 864:	00 00 41 00 	l.j 10c64 <__rom_length+0xf864>
 868:	00 08 73 07 	l.j 21d484 <__ram_length+0x1fd484>
 86c:	00 00 00 65 	l.j a00 <main+0x4e4>
 870:	01 ff 00 32 	l.j 7fc0938 <__stack+0x7b6093c>
 874:	00 00 01 dd 	l.j fe8 <__data_rom+0x12c>
        return(0);

	boot_sector=0;
	partitioncount=1;
 878:	07 47 00 00 	l.jal fd1c0878 <__stack+0xfcd6087c>
 87c:	08 62 01 01 	.word 0x08620101

	// If we can identify a filesystem on block 0 we don't look for partitions
    if (compare((const char*)&sector_buffer[0x36], "FAT16   ",8)==0) // check for FAT16
 880:	32 00 00 01 	.word 0x32000001

    if (!MMC_Read(0, sector_buffer)) // read MBR
        return(0);

	boot_sector=0;
	partitioncount=1;
 884:	06 07 49 00 	l.jal f81d2c84 <__stack+0xf7d72c88>

	// If we can identify a filesystem on block 0 we don't look for partitions
    if (compare((const char*)&sector_buffer[0x36], "FAT16   ",8)==0) // check for FAT16
 888:	00 00 7a 01 	l.j 1f08c <__rom_length+0x1dc8c>
 88c:	01 32 00 00 	l.j 4c8088c <__stack+0x4820890>
 890:	03 8e 07 4a 	l.j fe3825b8 <__stack+0xfdf225bc>
 894:	00 00 00 65 	l.j a28 <main+0x50c>
 898:	01 01 32 00 	l.j 404d098 <__stack+0x3bed09c>
 89c:	00 01 a3 07 	l.j 694b8 <__ram_length+0x494b8>
 8a0:	4b 00 00 00 	l.jalr r0
 8a4:	7a 01 01 32 	l.cust3 
		partitioncount=0;
 8a8:	00 00 02 16 	l.j 1100 <__data_rom+0x244>
    if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8)==0) // check for FAT32
 8ac:	04 37 00 00 	l.jal dc08ac <__stack+0x9608b0>
 8b0:	00 65 01 01 	l.j 1940cb4 <__stack+0x14e0cb8>
 8b4:	32 00 00 02 	.word 0x32000002
 8b8:	29 04 38 00 	.word 0x29043800
 8bc:	00 00 65 01 	l.j 19cc0 <__rom_length+0x188c0>
 8c0:	01 32 00 00 	l.j 4c808c0 <__stack+0x48208c4>
 8c4:	00 e6 04 39 	l.j 39819a8 <__stack+0x35219ac>
 8c8:	00 00 00 65 	l.j a5c <main+0x540>
		partitioncount=0;
 8cc:	01 01 32 00 	l.j 404d0cc <__stack+0x3bed0d0>
 8d0:	00 01 eb 04 	l.j 7b4e0 <__ram_length+0x5b4e0>

	if(partitioncount)
 8d4:	3a 00 00 00 	.word 0x3a000000
 8d8:	65 01 01 32 	.word 0x65010132
 8dc:	00 00 00 09 	l.j 900 <main+0x3e4>
 8e0:	04 3b 00 00 	l.jal ec08e0 <__stack+0xa608e4>
 8e4:	00 65 01 01 	l.j 1940ce8 <__stack+0x14e0cec>
 8e8:	32 00 00 01 	.word 0x32000001
	{
		// We have at least one partition, parse the MBR.
		struct MasterBootRecord *mbr=(struct MasterBootRecord *)sector_buffer;

		boot_sector = mbr->Partition[0].startlba;
 8ec:	22 04 3c 00 	.word 0x22043c00
 8f0:	00 00 7a 01 	l.j 1f0f4 <__rom_length+0x1dcf4>
 8f4:	01 32 00 00 	l.j 4c808f4 <__stack+0x48208f8>
 8f8:	03 bc 04 3f 	l.j fef019f4 <__stack+0xfeaa19f8>
 8fc:	00 00 00 7a 	l.j ae4 <main+0x5c8>
		if(mbr->Signature==0x55aa)
 900:	01 01 32 00 	l.j 404d100 <__stack+0x3bed104>
 904:	00 02 42 04 	l.j 91114 <__ram_length+0x71114>
 908:	40 00 00 00 	.word 0x40000000
 90c:	65 01 01 32 	.word 0x65010132
				boot_sector=SwapBBBB(mbr->Partition[0].startlba);
 910:	00 00 00 1d 	l.j 984 <main+0x468>
 914:	04 47 00 00 	l.jal 11c0914 <__stack+0xd60918>
 918:	00 73 01 01 	l.j 1cc0d1c <__stack+0x1860d20>
 91c:	32 00 00 02 	.word 0x32000002
		else if(mbr->Signature!=0xaa55)
 920:	9f 04 4a 00 	l.addi r24,r4,0x4a00
 924:	00 00 65 01 	l.j 19d28 <__rom_length+0x18928>
 928:	01 33 00 00 	l.j 4cc0928 <__stack+0x486092c>
 92c:	01 13 04 01 	l.j 44c1930 <__stack+0x4061934>
		{
				BootPrint("No partition signature found\n");
				return(0);
		}
		if (!MMC_Read(boot_sector, sector_buffer)) // read discriptor
 930:	42 00 00 01 	.word 0x42000001
 934:	31 01 01 34 	.word 0x31010134
 938:	63 72 63 00 	.word 0x63726300
 93c:	03 24 00 00 	l.j fc90093c <__stack+0xfc4a0940>
 940:	00 41 01 01 	l.j 1040d44 <__stack+0xbe0d48>
 944:	32 00 00 01 	.word 0x32000001
 948:	2d 03 25 00 	.word 0x2d032500
		    return(0);
		BootPrint("Read boot sector from first partition\n");
	}

    if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8)==0) // check for FAT16
 94c:	00 00 65 01 	l.j 19d50 <__rom_length+0x18950>
 950:	01 32 00 00 	l.j 4c80950 <__stack+0x4820954>
 954:	03 50 03 26 	l.j fd4015ec <__stack+0xfcfa15f0>
 958:	00 00 00 41 	l.j a5c <main+0x540>
 95c:	01 01 32 00 	l.j 404d15c <__stack+0x3bed160>
 960:	00 02 7d 03 	l.j 9fd6c <__ram_length+0x7fd6c>
 964:	27 00 00 00 	l.rfe 
 968:	41 01 01 32 	.word 0x41010132
		fat32=1;
 96c:	00 00 03 9b 	l.j 17d8 <__rom_length+0x3d8>
 970:	05 53 00 00 	l.jal 54c0970 <__stack+0x5060974>
 974:	09 78 01 01 	.word 0x09780101
 978:	17 04 00 00 	.word 0x17040000
 97c:	00 73 32 00 	l.j 1ccd17c <__stack+0x186d180>
	else if (compare((const char*)&sector_buffer[0x36], "FAT16   ",8)!=0) // check for FAT32
 980:	00 03 7b 05 	l.j df594 <__ram_length+0xbf594>
 984:	54 00 00 09 	.word 0x54000009
 988:	78 01 01 35 	l.cust3 
 98c:	00 00 00 9f 	l.j c08 <main+0x6ec>
 990:	05 55 00 00 	l.jal 5540990 <__stack+0x50e0994>
 994:	09 78 00 10 	.word 0x09780010
 998:	00 00 00 fd 	l.j d8c <main+0x870>
 99c:	01 23 00 00 	l.j 48c099c <__stack+0x44609a0>
	{
        printf("Unsupported partition type!\r");
		return(0);
	}

    if (sector_buffer[510] != 0x55 || sector_buffer[511] != 0xaa)  // check signature
 9a0:	09 a2 18 00 	.word 0x09a21800
 9a4:	00 03 8e 34 	l.j e4274 <__ram_length+0xc4274>
 9a8:	6c 65 64 00 	.word 0x6c656400
 9ac:	01 24 00 00 	l.j 49009ac <__stack+0x44a09b0>
 9b0:	03 99 01 01 	l.j fe640db4 <__stack+0xfe1e0db8>
 9b4:	36 00 00 01 	.word 0x36000001
 9b8:	dd 04 42 00 	l.sh 0x4200(r4),r8
 9bc:	00 08 62 05 	l.j 2191d0 <__ram_length+0x1f91d0>
 9c0:	03 00 44 00 	l.j fc0119c0 <__stack+0xfbbb19c4>
 9c4:	00 36 00 00 	l.j d809c4 <__stack+0x9209c8>
        return(0);

    // check for near-jump or short-jump opcode
    if (sector_buffer[0] != 0xe9 && sector_buffer[0] != 0xeb)
 9c8:	01 06 04 3d 	l.j 4181abc <__stack+0x3d21ac0>
 9cc:	00 00 00 7a 	l.j bb4 <main+0x698>
 9d0:	05 03 00 44 	l.jal 40c0ae0 <__stack+0x3c60ae4>
 9d4:	02 00 36 00 	l.j f800e1d4 <__stack+0xf7bae1d8>
 9d8:	00 03 8e 04 	l.j e41e8 <__ram_length+0xc41e8>
 9dc:	3e 00 00 00 	.word 0x3e000000
        return(0);

    // check if blocksize is really 512 bytes
    if (sector_buffer[11] != 0x00 || sector_buffer[12] != 0x02)
 9e0:	65 05 03 00 	.word 0x65050300
 9e4:	44 02 04 36 	l.jr r0
 9e8:	00 00 01 a3 	l.j 1074 <__data_rom+0x1b8>
 9ec:	04 36 00 00 	l.jal d809ec <__stack+0x9209f0>
 9f0:	00 7a 05 03 	l.j 1e81dfc <__stack+0x1a21e00>
 9f4:	00 44 02 08 	l.j 1101214 <__stack+0xca1218>
 9f8:	37 00 00 01 	.word 0x37000001
 9fc:	13 04 01 42 	l.bf fc100f04 <__stack+0xfbca0f08>
 a00:	00 00 01 31 	l.j ec4 <__data_rom+0x8>
 a04:	05 03 00 44 	l.jal 40c0b14 <__stack+0x3c60b18>
        return(0);

    // get cluster_size
    cluster_size = sector_buffer[13];
 a08:	02 0c 38 6c 	l.j f830ebb8 <__stack+0xf7eaebbc>
 a0c:	65 64 00 01 	.word 0x65640001

    // calculate cluster mask
    cluster_mask = cluster_size - 1;
 a10:	24 00 00 03 	l.rfe 
    // check if blocksize is really 512 bytes
    if (sector_buffer[11] != 0x00 || sector_buffer[12] != 0x02)
        return(0);

    // get cluster_size
    cluster_size = sector_buffer[13];
 a14:	99 05 03 00 	l.lhs r8,0x300(r5)

    // calculate cluster mask
    cluster_mask = cluster_size - 1;
 a18:	44 02 18 32 	l.jr r3

    fat_start = boot_sector + sector_buffer[0x0E] + (sector_buffer[0x0F] << 8); // reserved sector count before FAT table (usually 32 for FAT32)
	fat_number = sector_buffer[0x10];
 a1c:	00 00 03 9b 	l.j 1888 <__rom_length+0x488>

    // get cluster_size
    cluster_size = sector_buffer[13];

    // calculate cluster mask
    cluster_mask = cluster_size - 1;
 a20:	05 53 00 00 	l.jal 54c0a20 <__stack+0x5060a24>
 a24:	09 78 01 01 	.word 0x09780101

    fat_start = boot_sector + sector_buffer[0x0E] + (sector_buffer[0x0F] << 8); // reserved sector count before FAT table (usually 32 for FAT32)
 a28:	32 00 00 03 	.word 0x32000003
 a2c:	7b 05 54 00 	l.cust3 
 a30:	00 09 78 01 	l.j 25ea34 <__ram_length+0x23ea34>
 a34:	01 38 63 72 	l.j 4e197fc <__stack+0x49b9800>
 a38:	63 00 03 24 	.word 0x63000324
 a3c:	00 00 00 41 	l.j b40 <main+0x624>
 a40:	05 03 00 44 	l.jal 40c0b50 <__stack+0x3c60b54>
 a44:	02 19 36 00 	l.j f864e244 <__stack+0xf81ee248>
	fat_number = sector_buffer[0x10];
 a48:	00 01 2d 03 	l.j 4be54 <__ram_length+0x2be54>
 a4c:	25 00 00 00 	l.rfe 
 a50:	65 05 03 00 	.word 0x65050300

    if (fat32)
 a54:	44 02 1c 36 	l.jr r3
 a58:	00 00 03 50 	l.j 1798 <__rom_length+0x398>
 a5c:	03 26 00 00 	l.j fc980a5c <__stack+0xfc520a60>
 a60:	00 41 05 03 	l.j 1041e6c <__stack+0xbe1e70>
 a64:	00 44 02 20 	l.j 11012e4 <__stack+0xca12e8>
 a68:	36 00 00 02 	.word 0x36000002
    {
        if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8) != 0) // check file system type
 a6c:	7d 03 27 00 	l.cust4 
 a70:	00 00 41 05 	l.j 10e84 <__rom_length+0xfa84>
 a74:	03 00 44 02 	l.j fc011a7c <__stack+0xfbbb1a80>
 a78:	21 10 00 00 	.word 0x21100000
 a7c:	00 eb 04 32 	l.j 3ac1b44 <__stack+0x3661b48>
 a80:	00 00 00 7a 	l.j c68 <main+0x74c>
 a84:	10 00 00 00 	l.bf a84 <main+0x568>
 a88:	8b 04 33 00 	l.lws r24,0x3300(r4)
            return(0);

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
 a8c:	00 00 7a 36 	l.j 1f364 <__rom_length+0x1df64>
 a90:	00 00 02 16 	l.j 12e8 <__data_rom+0x42c>
 a94:	04 37 00 00 	l.jal dc0a94 <__stack+0x960a98>
        root_directory_size = cluster_size; // root directory size in sectors
 a98:	00 65 05 03 	l.j 1941ea4 <__stack+0x14e1ea8>
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
 a9c:	00 44 02 24 	l.j 110132c <__stack+0xca1330>
    {
        if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8) != 0) // check file system type
            return(0);

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
        root_directory_size = cluster_size; // root directory size in sectors
 aa0:	36 00 00 02 	.word 0x36000002
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
 aa4:	29 04 38 00 	.word 0x29043800
    {
        if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8) != 0) // check file system type
            return(0);

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
        root_directory_size = cluster_size; // root directory size in sectors
 aa8:	00 00 65 05 	l.j 19ebc <__rom_length+0x18abc>
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
 aac:	03 00 44 02 	l.j fc011ab4 <__stack+0xfbbb1ab8>
 ab0:	28 36 00 00 	.word 0x28360000
 ab4:	00 e6 04 39 	l.j 3981b98 <__stack+0x3521b9c>
 ab8:	00 00 00 65 	l.j c4c <main+0x730>
 abc:	05 03 00 44 	l.jal 40c0bcc <__stack+0x3c60bd0>
 ac0:	02 2c 36 00 	l.j f8b0e2c0 <__stack+0xf86ae2c4>
 ac4:	00 01 eb 04 	l.j 7b6d4 <__ram_length+0x5b6d4>
 ac8:	3a 00 00 00 	.word 0x3a000000
 acc:	65 05 03 00 	.word 0x65050300
 ad0:	44 02 30 36 	l.jr r6
 ad4:	00 00 00 09 	l.j af8 <main+0x5dc>
        data_start = fat_start + (fat_number * fat_size);
 ad8:	04 3b 00 00 	l.jal ec0ad8 <__stack+0xa60adc>
 adc:	00 65 05 03 	l.j 1941ee8 <__stack+0x14e1eec>
 ae0:	00 44 02 34 	l.j 11013b0 <__stack+0xca13b4>
 ae4:	36 00 00 01 	.word 0x36000001
 ae8:	22 04 3c 00 	.word 0x22043c00
        root_directory_cluster = sector_buffer[0x2C] + (sector_buffer[0x2D] << 8) + (sector_buffer[0x2E] << 16) + ((sector_buffer[0x2F] & 0x0F) << 24);
 aec:	00 00 7a 05 	l.j 1f300 <__rom_length+0x1df00>
            return(0);

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
        root_directory_size = cluster_size; // root directory size in sectors
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
        data_start = fat_start + (fat_number * fat_size);
 af0:	03 00 44 02 	l.j fc011af8 <__stack+0xfbbb1afc>
        root_directory_cluster = sector_buffer[0x2C] + (sector_buffer[0x2D] << 8) + (sector_buffer[0x2E] << 16) + ((sector_buffer[0x2F] & 0x0F) << 24);
 af4:	38 36 00 00 	.word 0x38360000
 af8:	03 bc 04 3f 	l.j fef01bf4 <__stack+0xfeaa1bf8>
 afc:	00 00 00 7a 	l.j ce4 <main+0x7c8>
 b00:	05 03 00 44 	l.jal 40c0c10 <__stack+0x3c60c14>
 b04:	02 3c 36 00 	l.j f8f0e304 <__stack+0xf8aae308>
 b08:	00 02 42 04 	l.j 91318 <__ram_length+0x71318>
 b0c:	40 00 00 00 	.word 0x40000000
 b10:	65 05 03 00 	.word 0x65050300
 b14:	44 02 40 36 	l.jr r8
        root_directory_start = (root_directory_cluster - 2) * cluster_size + data_start;
 b18:	00 00 00 1d 	l.j b8c <main+0x670>

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
        root_directory_size = cluster_size; // root directory size in sectors
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
        data_start = fat_start + (fat_number * fat_size);
        root_directory_cluster = sector_buffer[0x2C] + (sector_buffer[0x2D] << 8) + (sector_buffer[0x2E] << 16) + ((sector_buffer[0x2F] & 0x0F) << 24);
 b1c:	04 47 00 00 	l.jal 11c0b1c <__stack+0xd60b20>
 b20:	00 73 05 03 	l.j 1cc1f2c <__stack+0x1861f30>
 b24:	00 44 02 44 	l.j 1101434 <__stack+0xca1438>
 b28:	36 00 00 02 	.word 0x36000002
        root_directory_start = (root_directory_cluster - 2) * cluster_size + data_start;
 b2c:	9f 04 4a 00 	l.addi r24,r4,0x4a00
 b30:	00 00 65 05 	l.j 19f44 <__rom_length+0x18b44>
 b34:	03 00 44 02 	l.j fc011b3c <__stack+0xfbbb1b40>
 b38:	Address 0x00000b38 is out of bounds.


Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00 00 0b 70 	l.j 2dc0 <__rom_length+0x19c0>
   4:	00 02 00 00 	l.j 80004 <__ram_length+0x60004>
   8:	00 a4 01 01 	l.j 290040c <__stack+0x24a0410>
   c:	f6 f5 0a 00 	l.cust6 
  10:	01 01 01 01 	l.j 4040414 <__stack+0x3be0418>
  14:	00 00 00 01 	l.j 18 <_reset+0x14>
  18:	2f 6f 70 74 	.word 0x2f6f7074
  1c:	2f 6f 72 33 	.word 0x2f6f7233
  20:	32 2d 65 6c 	.word 0x322d656c
  24:	66 2d 31 2e 	.word 0x662d312e
  28:	30 72 63 31 	.word 0x30726331
  2c:	2f 62 69 6e 	.word 0x2f62696e
  30:	2f 2e 2e 2f 	.word 0x2f2e2e2f
  34:	6c 69 62 2f 	.word 0x6c69622f
  38:	67 63 63 2f 	.word 0x6763632f
  3c:	6f 72 33 32 	.word 0x6f723332
  40:	2d 65 6c 66 	.word 0x2d656c66
  44:	2f 34 2e 35 	.word 0x2f342e35
  48:	2e 31 2d 6f 	.word 0x2e312d6f
  4c:	72 33 32 2d 	l.cust1 
  50:	31 2e 30 72 	.word 0x312e3072
  54:	63 34 2f 69 	.word 0x63342f69
  58:	6e 63 6c 75 	.word 0x6e636c75
  5c:	64 65 00 00 	.word 0x64650000
  60:	6d 61 69 6e 	.word 0x6d61696e
  64:	2e 63 00 00 	.word 0x2e630000
  68:	00 00 73 77 	l.j 1ce44 <__rom_length+0x1ba44>
  6c:	61 70 2e 63 	.word 0x61702e63
  70:	00 00 00 00 	l.j 70 <__mulsi3+0x28>
  74:	6d 6d 63 2e 	.word 0x6d6d632e
  78:	63 00 00 00 	.word 0x63000000
  7c:	00 66 61 74 	l.j 199864c <__stack+0x1538650>
  80:	2e 63 00 00 	.word 0x2e630000
// fatal error
void FatalError(void)
{
  DEBUG_FUNC_IN();

  DisableCard();
  84:	00 00 68 61 	l.j 1a208 <__rom_length+0x18e08>
  88:	72 64 77 61 	l.cust1 
  8c:	72 65 2e 63 	l.cust1 
}


// fatal error
void FatalError(void)
{
  90:	00 00 00 00 	l.j 90 <FatalError+0xc>
  DEBUG_FUNC_IN();

  DisableCard();
  94:	73 74 64 69 	l.cust1 
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  98:	6e 74 2d 67 	.word 0x6e742d67
}


// fatal error
void FatalError(void)
{
  9c:	63 63 2e 68 	.word 0x63632e68
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  a0:	00 01 00 00 	l.j 400a0 <__ram_length+0x200a0>
  a4:	66 61 74 2e 	.word 0x6661742e

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  a8:	68 00 00 00 	.word 0x68000000
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  ac:	00 00 00 05 	l.j c0 <FatalError+0x3c>
  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
  b0:	02 00 00 00 	l.j f80000b0 <__stack+0xf7ba00b4>

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  b4:	84 67 00 05 	l.lwz r3,0x5(r7)
  b8:	02 00 00 00 	l.j f80000b8 <__stack+0xf7ba00bc>
  bc:	84 17 00 05 	l.lwz r0,0x5(r23)
  c0:	02 00 00 00 	l.j f80000c0 <__stack+0xf7ba00c4>
  c4:	90 11 00 05 	l.lbs r0,0x5(r17)
  c8:	02 00 00 00 	l.j f80000c8 <__stack+0xf7ba00cc>
    LEDS(0x0);
  cc:	94 17 00 05 	l.lhz r0,0x5(r23)
    TIMER_wait(200);
  d0:	02 00 00 00 	l.j f80000d0 <__stack+0xf7ba00d4>
  d4:	98 1b 00 05 	l.lhs r0,0x5(r27)
  d8:	02 00 00 00 	l.j f80000d8 <__stack+0xf7ba00dc>
  dc:	9c 0a 00 05 	l.addi r0,r10,0x5
  e0:	02 00 00 00 	l.j f80000e0 <__stack+0xf7ba00e4>
  e4:	a0 1e 00 05 	l.addic r0,r30,0x5
    LEDS(led);
  e8:	02 00 00 00 	l.j f80000e8 <__stack+0xf7ba00ec>
  }
  ec:	a8 11 00 05 	l.ori r0,r17,0x5
  f0:	02 00 00 00 	l.j f80000f0 <__stack+0xf7ba00f4>

#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
  f4:	ac 17 00 05 	l.xori r0,r23,0x5
  f8:	02 00 00 00 	l.j f80000f8 <__stack+0xf7ba00fc>


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  fc:	b0 12 00 05 	l.muli r0,r18,0x5
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
 100:	02 00 00 00 	l.j f8000100 <__stack+0xf7ba0104>
 104:	b4 13 00 05 	l.mfspr r0,r19,0x5
 108:	02 00 00 00 	l.j f8000108 <__stack+0xf7ba010c>
 10c:	bc 01 00 05 	l.sfeqi r1,0x5
 110:	02 00 00 00 	l.j f8000110 <__stack+0xf7ba0114>


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
 114:	cc 15 00 05 	.word 0xcc150005
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
 118:	02 00 00 00 	l.j f8000118 <__stack+0xf7ba011c>
 11c:	d0 15 00 05 	l.sd 0x5(r21),r0
}
 120:	02 00 00 00 	l.j f8000120 <__stack+0xf7ba0124>
 124:	d8 01 00 05 	l.sb 0x5(r1),r0
 128:	02 00 00 00 	l.j f8000128 <__stack+0xf7ba012c>
 12c:	e8 15 00 05 	.word 0xe8150005
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 130:	02 00 00 00 	l.j f8000130 <__stack+0xf7ba0134>
 134:	ec 15 00 05 	.word 0xec150005
 138:	02 00 00 00 	l.j f8000138 <__stack+0xf7ba013c>
 13c:	f4 04 02 03 	l.cust6 
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
 140:	47 01 00 05 	l.jr r0
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
    crc <<= 1;
 144:	02 00 00 00 	l.j f8000144 <__stack+0xf7ba0148>
    if (c & 0x80)   crc ^= 0x09;
 148:	f4 15 00 05 	l.cust6 
 14c:	02 00 00 00 	l.j f800014c <__stack+0xf7ba0150>
 150:	fc 13 00 05 	l.cust8 
 154:	02 00 00 01 	l.j f8000158 <__stack+0xf7ba015c>
    if (crc & 0x80) crc ^= 0x09;
 158:	00 15 00 05 	l.j 54016c <__stack+0xe0170>
 15c:	02 00 00 01 	l.j f8000160 <__stack+0xf7ba0164>
 160:	14 13 00 05 	.word 0x14130005
 164:	02 00 00 01 	l.j f8000168 <__stack+0xf7ba016c>
 168:	18 15 00 05 	.word 0x18150005
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 16c:	02 00 00 01 	l.j f8000170 <__stack+0xf7ba0174>
 170:	20 15 00 05 	.word 0x20150005
 174:	02 00 00 01 	l.j f8000178 <__stack+0xf7ba017c>
 178:	30 04 03 03 	.word 0x30040303
 17c:	ec 01 01 00 	.word 0xec010100
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
    if (crc & 0x80) crc ^= 0x09;
    c <<= 1;
 180:	05 02 00 00 	l.jal 4080180 <__stack+0x3c20184>
 184:	01 30 19 00 	l.j 4c06584 <__stack+0x47a6588>
 188:	05 02 00 00 	l.jal 4080188 <__stack+0x3c2018c>
 18c:	01 40 16 00 	l.j 500598c <__stack+0x4ba5990>
  }

  DEBUG_FUNC_OUT();
}
 190:	05 02 00 00 	l.jal 4080190 <__stack+0x3c20194>
 194:	01 44 13 00 	l.j 5104d94 <__stack+0x4ca4d98>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 198:	05 02 00 00 	l.jal 4080198 <__stack+0x3c2019c>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 19c:	01 48 15 00 	l.j 520559c <__stack+0x4da55a0>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1a0:	05 02 00 00 	l.jal 40801a0 <__stack+0x3c201a4>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 1a4:	01 54 01 00 	l.j 55005a4 <__stack+0x50a05a8>
 1a8:	05 02 00 00 	l.jal 40801a8 <__stack+0x3c201ac>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1ac:	01 58 15 00 	l.j 56055ac <__stack+0x51a55b0>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 1b0:	05 02 00 00 	l.jal 40801b0 <__stack+0x3c201b4>
  SPI(0xFF); // flush SPI-bus
 1b4:	01 68 01 00 	l.j 5a005b4 <__stack+0x55a05b8>
 1b8:	05 02 00 00 	l.jal 40801b8 <__stack+0x3c201bc>
 1bc:	01 6c 11 00 	l.j 5b045bc <__stack+0x56a45c0>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1c0:	05 02 00 00 	l.jal 40801c0 <__stack+0x3c201c4>
 1c4:	01 80 18 00 	l.j 60061c4 <__stack+0x5ba61c8>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus
 1c8:	05 02 00 00 	l.jal 40801c8 <__stack+0x3c201cc>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1cc:	01 90 18 00 	l.j 64061cc <__stack+0x5fa61d0>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus
 1d0:	05 02 00 00 	l.jal 40801d0 <__stack+0x3c201d4>

  SPI(cmd);
 1d4:	01 98 03 47 	l.j 6600ef0 <__stack+0x61a0ef4>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1d8:	01 00 05 02 	l.j 40015e0 <__stack+0x3ba15e4>
  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus

  SPI(cmd);
 1dc:	00 00 01 9c 	l.j 84c <main+0x330>
  MMC_CRC(cmd);
 1e0:	19 00 05 02 	l.movhi r8,0x502
 1e4:	00 00 01 a0 	l.j 864 <main+0x348>

  c = (unsigned char)(arg >> 24);
 1e8:	0f 00 05 02 	l.bnf fc0015f0 <__stack+0xfbba15f4>
  SPI(c);
 1ec:	00 00 01 a4 	l.j 87c <main+0x360>
 1f0:	19 00 05 02 	l.movhi r8,0x502
  MMC_CRC(c);
 1f4:	00 00 01 ac 	l.j 8a4 <main+0x388>
 1f8:	0f 00 05 02 	l.bnf fc001600 <__stack+0xfbba1604>

  c = (unsigned char)(arg >> 16);
 1fc:	00 00 01 b0 	l.j 8bc <main+0x3a0>
 200:	19 00 05 02 	l.movhi r8,0x502
  SPI(c);
 204:	00 00 01 b4 	l.j 8d4 <main+0x3b8>
 208:	15 00 05 02 	l.nop 0x502
  MMC_CRC(c);
 20c:	00 00 01 c0 	l.j 90c <main+0x3f0>
 210:	0e 00 05 02 	l.bnf f8001618 <__stack+0xf7ba161c>

  c = (unsigned char)(arg >> 8);
 214:	00 00 01 c8 	l.j 934 <main+0x418>
 218:	1a 00 05 02 	l.movhi r16,0x502
  SPI(c);
 21c:	00 00 01 cc 	l.j 94c <main+0x430>
 220:	0e 00 05 02 	l.bnf f8001628 <__stack+0xf7ba162c>
  MMC_CRC(c);
 224:	00 00 01 d0 	l.j 964 <main+0x448>
 228:	1a 00 05 02 	l.movhi r16,0x502

  c = (unsigned char)(arg);
 22c:	00 00 01 d4 	l.j 97c <main+0x460>
  SPI(c);
 230:	16 00 05 02 	.word 0x16000502
 234:	00 00 01 d8 	l.j 994 <main+0x478>
  MMC_CRC(c);
 238:	0c 00 05 02 	l.bnf 1640 <__rom_length+0x240>
 23c:	00 00 01 dc 	l.j 9ac <main+0x490>

  crc <<= 1;
 240:	1c 00 05 02 	.word 0x1c000502
 244:	00 00 01 e0 	l.j 9c4 <main+0x4a8>
  crc++;
 248:	15 00 05 02 	l.nop 0x502
 24c:	00 00 01 e8 	l.j 9ec <main+0x4d0>
 250:	16 00 05 02 	.word 0x16000502
  SPI(crc);
 254:	00 00 01 ec 	l.j a04 <main+0x4e8>
 258:	15 00 05 02 	l.nop 0x502

  unsigned char Ncr = 100;  // Ncr = 0..8 (SD) / 1..8 (MMC)
 25c:	00 00 01 f4 	l.j a2c <main+0x510>
  do {
    response = SPI(0xFF); // get response
 260:	15 00 05 02 	l.nop 0x502
 264:	00 00 01 fc 	l.j a54 <main+0x538>
 268:	16 00 05 02 	.word 0x16000502
  } while (response == 0xFF && Ncr--);
 26c:	00 00 02 04 	l.j a7c <main+0x560>
 270:	15 00 05 02 	l.nop 0x502
 274:	00 00 02 0c 	l.j aa4 <main+0x588>
 278:	15 00 05 02 	l.nop 0x502
 27c:	00 00 02 14 	l.j acc <main+0x5b0>
 280:	16 00 05 02 	.word 0x16000502
 284:	00 00 02 1c 	l.j af4 <main+0x5d8>
 288:	15 00 05 02 	l.nop 0x502
 28c:	00 00 02 24 	l.j b1c <main+0x600>
 290:	15 00 05 02 	l.nop 0x502
 294:	00 00 02 2c 	l.j b44 <main+0x628>
 298:	16 00 05 02 	.word 0x16000502
 29c:	00 00 02 30 	l.j b5c <main+0x640>
 2a0:	15 00 05 02 	l.nop 0x502
 2a4:	00 00 02 38 	l.j b84 <main+0x668>

  return response;

  DEBUG_FUNC_OUT();
}
 2a8:	15 00 05 02 	l.nop 0x502
 2ac:	00 00 02 40 	l.j bac <main+0x690>
 2b0:	16 00 05 02 	.word 0x16000502
 2b4:	00 00 02 48 	l.j bd4 <main+0x6b8>
 2b8:	15 00 05 02 	l.nop 0x502
 2bc:	00 00 02 54 	l.j c0c <main+0x6f0>
 2c0:	15 00 05 02 	l.nop 0x502
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2c4:	00 00 02 5c 	l.j c34 <main+0x718>
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2c8:	16 00 05 02 	.word 0x16000502
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2cc:	00 00 02 60 	l.j c4c <main+0x730>
 2d0:	16 00 05 02 	.word 0x16000502
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2d4:	00 00 02 6c 	l.j c84 <main+0x768>
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2d8:	15 00 05 02 	l.nop 0x502
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2dc:	00 00 02 78 	l.j cbc <main+0x7a0>
 2e0:	01 00 05 02 	l.j 40016e8 <__stack+0x3ba16ec>
 2e4:	00 00 02 88 	l.j d04 <main+0x7e8>
 2e8:	01 00 05 02 	l.j 40016f0 <__stack+0x3ba16f4>
    lba = lba << 9; // otherwise convert sector adddress to byte address
 2ec:	00 00 02 90 	l.j d2c <main+0x810>
  }

  //EnableCard();

  if (MMC_Command(CMD17, lba)) {
 2f0:	01 00 05 02 	l.j 40016f8 <__stack+0x3ba16fc>
 2f4:	00 00 02 a8 	l.j d94 <main+0x878>
 2f8:	19 00 05 02 	l.movhi r8,0x502
    //printf("CMD17 (READ_BLOCK): invalid response 0x%02X (lba=%lu)\r", response, lba);
    //DisableCard();
    return(0);
 2fc:	00 00 02 c4 	l.j e0c <main+0x8f0>
    lba = lba << 9; // otherwise convert sector adddress to byte address
  }

  //EnableCard();

  if (MMC_Command(CMD17, lba)) {
 300:	03 ab 7f 01 	l.j feadff04 <__stack+0xfe67ff08>
 304:	00 05 02 00 	l.j 140b04 <__ram_length+0x120b04>
 308:	00 02 c8 19 	l.j b236c <__ram_length+0x9236c>
    //DisableCard();
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
 30c:	00 05 02 00 	l.j 140b0c <__ram_length+0x120b0c>
  while ((SPI(0xFF)) != 0xFE) {
 310:	00 02 cc 0f 	l.j b334c <__ram_length+0x9334c>
    //DisableCard();
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
 314:	00 05 02 00 	l.j 140b14 <__ram_length+0x120b14>
 318:	00 02 d4 19 	l.j b537c <__ram_length+0x9537c>
  while ((SPI(0xFF)) != 0xFE) {
 31c:	00 05 02 00 	l.j 140b1c <__ram_length+0x120b1c>
 320:	00 02 d8 0f 	l.j b635c <__ram_length+0x9635c>
 324:	00 05 02 00 	l.j 140b24 <__ram_length+0x120b24>
 328:	00 02 dc 19 	l.j b738c <__ram_length+0x9738c>
    if (timeout++ >= 1000000) { // we can't wait forever
 32c:	00 05 02 00 	l.j 140b2c <__ram_length+0x120b2c>
 330:	00 02 ec 15 	l.j bb384 <__ram_length+0x9b384>
 334:	00 05 02 00 	l.j 140b34 <__ram_length+0x120b34>
 338:	00 02 f0 19 	l.j bc39c <__ram_length+0x9c39c>
 33c:	00 05 02 00 	l.j 140b3c <__ram_length+0x120b3c>
 340:	00 02 fc 17 	l.j bf39c <__ram_length+0x9f39c>
      //printf("CMD17 (READ_BLOCK): no data token! (lba=%lu)\r", lba);
      //DisableCard();
      return(0);
 344:	00 05 02 00 	l.j 140b44 <__ram_length+0x120b44>
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
    if (timeout++ >= 1000000) { // we can't wait forever
 348:	00 03 00 11 	l.j c038c <__ram_length+0xa038c>
 34c:	00 05 02 00 	l.j 140b4c <__ram_length+0x120b4c>
 350:	00 03 0c 1b 	l.j c33bc <__ram_length+0xa33bc>
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 354:	00 05 02 00 	l.j 140b54 <__ram_length+0x120b54>
 358:	00 03 10 15 	l.j c43ac <__ram_length+0xa43ac>
 35c:	00 05 02 00 	l.j 140b5c <__ram_length+0x120b5c>
 360:	00 03 14 13 	l.j c53ac <__ram_length+0xa53ac>
 364:	00 05 02 00 	l.j 140b64 <__ram_length+0x120b64>
 368:	00 03 1c 15 	l.j c73bc <__ram_length+0xa73bc>
  DEBUG_FUNC_OUT();
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
 36c:	00 05 02 00 	l.j 140b6c <__ram_length+0x120b6c>
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 370:	00 03 2c 15 	l.j cb3c4 <__ram_length+0xab3c4>
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
    *(pReadBuffer++) = SPI(0xFF);
 374:	00 05 02 00 	l.j 140b74 <__ram_length+0x120b74>
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 378:	00 03 44 17 	l.j d13d4 <__ram_length+0xb13d4>
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
    *(pReadBuffer++) = SPI(0xFF);
 37c:	00 05 02 00 	l.j 140b7c <__ram_length+0x120b7c>
 380:	00 03 48 11 	l.j d23c4 <__ram_length+0xb23c4>
 384:	00 05 02 00 	l.j 140b84 <__ram_length+0x120b84>
 388:	00 03 54 13 	l.j d53d4 <__ram_length+0xb53d4>
 38c:	00 05 02 00 	l.j 140b8c <__ram_length+0x120b8c>
 390:	00 03 68 01 	l.j da394 <__ram_length+0xba394>
    *(pReadBuffer++) = SPI(0xFF);
 394:	00 05 02 00 	l.j 140b94 <__ram_length+0x120b94>
 398:	00 03 6c 03 	l.j db3a4 <__ram_length+0xbb3a4>
 39c:	6c 01 00 05 	.word 0x6c010005
    *(pReadBuffer++) = SPI(0xFF);
 3a0:	02 00 00 03 	l.j f80003ac <__stack+0xf7ba03b0>
 3a4:	70 28 00 05 	l.cust1 
 3a8:	02 00 00 03 	l.j f80003b4 <__stack+0xf7ba03b8>
    *(pReadBuffer++) = SPI(0xFF);
 3ac:	74 1d 00 05 	l.cust2 
 3b0:	02 00 00 03 	l.j f80003bc <__stack+0xf7ba03c0>
 3b4:	78 0b 00 05 	l.cust3 
  DEBUG_FUNC_OUT();
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
 3b8:	02 00 00 03 	l.j f80003c4 <__stack+0xf7ba03c8>
      //DisableCard();
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
 3bc:	7c 1d 00 05 	l.cust4 
 3c0:	02 00 00 03 	l.j f80003cc <__stack+0xf7ba03d0>
 3c4:	84 01 00 05 	l.lwz r0,0x5(r1)
    *(pReadBuffer++) = SPI(0xFF);
    *(pReadBuffer++) = SPI(0xFF);
    *(pReadBuffer++) = SPI(0xFF);
  }

  SPI(0xFF); // read CRC lo byte
 3c8:	02 00 00 03 	l.j f80003d4 <__stack+0xf7ba03d8>
 3cc:	94 15 00 05 	l.lhz r0,0x5(r21)
  SPI(0xFF); // read CRC hi byte
 3d0:	02 00 00 03 	l.j f80003dc <__stack+0xf7ba03e0>
 3d4:	a0 15 00 05 	l.addic r0,r21,0x5

  //DisableCard();
  return(1);
 3d8:	02 00 00 03 	l.j f80003e4 <__stack+0xf7ba03e8>

  DEBUG_FUNC_OUT();
}
 3dc:	ac 15 00 05 	l.xori r0,r21,0x5
 3e0:	02 00 00 03 	l.j f80003ec <__stack+0xf7ba03f0>
 3e4:	b8 03 60 01 	l.slli r0,r3,0x1
 3e8:	00 05 02 00 	l.j 140be8 <__ram_length+0x120be8>
 3ec:	00 03 bc 30 	l.j ef4ac <__ram_length+0xcf4ac>


int compare(const char *s1, const char *s2,int b)
{
	int i;
	for(i=0;i<b;++i)
 3f0:	00 05 02 00 	l.j 140bf0 <__ram_length+0x120bf0>
 3f4:	00 03 c8 1b 	l.j f2460 <__ram_length+0xd2460>
#define printf(...)
#define putserial(x)
#define BootPrint(x) puts(x);


int compare(const char *s1, const char *s2,int b)
 3f8:	00 05 02 00 	l.j 140bf8 <__ram_length+0x120bf8>
{
	int i;
	for(i=0;i<b;++i)
	{
		if(*s1++!=*s2++)
 3fc:	00 03 d0 15 	l.j f4450 <__ram_length+0xd4450>
 400:	00 05 02 00 	l.j 140c00 <__ram_length+0x120c00>
 404:	00 03 d8 17 	l.j f6460 <__ram_length+0xd6460>
 408:	00 05 02 00 	l.j 140c08 <__ram_length+0x120c08>
 40c:	00 03 dc 17 	l.j f7468 <__ram_length+0xd7468>


int compare(const char *s1, const char *s2,int b)
{
	int i;
	for(i=0;i<b;++i)
 410:	00 05 02 00 	l.j 140c10 <__ram_length+0x120c10>
 414:	00 03 f0 04 	l.j fc424 <__ram_length+0xdc424>
 418:	04 03 f1 7e 	l.jal fca10 <__ram_length+0xdca10>
	{
		if(*s1++!=*s2++)
			return(1);
	}
	return(0);
 41c:	01 00 05 02 	l.j 4001824 <__stack+0x3ba1828>
 420:	00 00 03 f0 	l.j 13e0 <__data_rom+0x524>
{
	int i;
	for(i=0;i<b;++i)
	{
		if(*s1++!=*s2++)
			return(1);
 424:	16 00 05 02 	.word 0x16000502
	}
	return(0);
}
 428:	00 00 03 f8 	l.j 1408 <__rom_length+0x8>
 42c:	11 00 05 02 	l.bf 4001834 <__stack+0x3ba1838>
    return(1);
}


int GetCluster(int cluster)
{
 430:	00 00 03 fc 	l.j 1420 <__rom_length+0x20>
	int i;
	uint32_t sb;
    if (fat32)
 434:	19 00 05 02 	l.movhi r8,0x502
    return(1);
}


int GetCluster(int cluster)
{
 438:	00 00 04 10 	l.j 1478 <__rom_length+0x78>
 43c:	12 00 05 02 	l.bf f8001844 <__stack+0xf7ba1848>
 440:	00 00 04 1c 	l.j 14b0 <__rom_length+0xb0>
 444:	19 00 05 02 	l.movhi r8,0x502
	int i;
	uint32_t sb;
    if (fat32)
 448:	00 00 04 24 	l.j 14d8 <__rom_length+0xd8>
 44c:	12 00 05 02 	l.bf f8001854 <__stack+0xf7ba1858>
 450:	00 00 04 28 	l.j 14f0 <__rom_length+0xf0>
 454:	17 00 05 02 	.word 0x17000502
 458:	00 00 04 30 	l.j 1518 <__rom_length+0x118>
    {
        sb = cluster >> 7; // calculate sector number containing FAT-link
 45c:	7a 00 05 02 	l.cust3 
        i = cluster & 0x7F; // calculate link offsset within sector
 460:	00 00 04 34 	l.j 1530 <__rom_length+0x130>
 464:	17 00 05 02 	.word 0x17000502
    }
    else
    {
        sb = cluster >> 8; // calculate sector number containing FAT-link
 468:	00 00 04 38 	l.j 1548 <__rom_length+0x148>
        i = cluster & 0xFF; // calculate link offsset within sector
 46c:	11 00 05 02 	l.bf 4001874 <__stack+0x3ba1878>
    }

    // read sector of FAT if not already in the buffer
    if (sb != buffered_fat_index)
 470:	00 00 04 48 	l.j 1590 <__rom_length+0x190>
 474:	17 00 05 02 	.word 0x17000502
 478:	00 00 04 4c 	l.j 15a8 <__rom_length+0x1a8>
 47c:	01 00 05 02 	l.j 4001884 <__stack+0x3ba1888>
 480:	00 00 04 5c 	l.j 15f0 <__rom_length+0x1f0>
 484:	16 00 05 02 	.word 0x16000502
    {
        if (!MMC_Read(fat_start + sb, (unsigned char*)&fat_buffer))
 488:	00 00 04 60 	l.j 1608 <__rom_length+0x208>
 48c:	15 00 05 02 	l.nop 0x502
 490:	00 00 04 68 	l.j 1630 <__rom_length+0x230>
 494:	18 00 05 02 	l.movhi r0,0x502
 498:	00 00 04 6c 	l.j 1648 <__rom_length+0x248>
 49c:	15 00 05 02 	l.nop 0x502
 4a0:	00 00 04 70 	l.j 1660 <__rom_length+0x260>
 4a4:	18 00 05 02 	l.movhi r0,0x502
 4a8:	00 00 04 88 	l.j 16c8 <__rom_length+0x2c8>
            return(0);

        // remember current buffer index
        buffered_fat_index = sb;
 4ac:	16 00 05 02 	.word 0x16000502
    }
    i = fat32 ? SwapBBBB(fat_buffer.fat32[i]) & 0x0FFFFFFF : SwapBB(fat_buffer.fat16[i]); // get FAT link for 68000 
 4b0:	00 00 04 ac 	l.j 1760 <__rom_length+0x360>
 4b4:	18 00 05 02 	l.movhi r0,0x502
 4b8:	00 00 04 b0 	l.j 1778 <__rom_length+0x378>
 4bc:	16 00 05 02 	.word 0x16000502
 4c0:	00 00 04 bc 	l.j 17b0 <__rom_length+0x3b0>
 4c4:	01 00 05 02 	l.j 40018cc <__stack+0x3ba18d0>
 4c8:	00 00 04 e0 	l.j 1848 <__rom_length+0x448>
 4cc:	01 00 05 02 	l.j 40018d4 <__stack+0x3ba18d8>
 4d0:	00 00 04 f0 	l.j 1890 <__rom_length+0x490>
 4d4:	04 02 03 d4 	l.jal 81424 <__ram_length+0x61424>
 4d8:	7e 01 00 05 	l.cust4 
 4dc:	02 00 00 04 	l.j f80004ec <__stack+0xf7ba04f0>
 4e0:	fc 04 04 c0 	l.cust8 
 4e4:	00 05 02 00 	l.j 140ce4 <__ram_length+0x120ce4>
 4e8:	00 05 00 16 	l.j 140540 <__ram_length+0x120540>
 4ec:	00 05 02 00 	l.j 140cec <__ram_length+0x120cec>


uint16_t SwapBB(uint16_t i)
{
  return ((i&0x00ff)<<8) | ((i&0xff00)>>8);
 4f0:	00 05 1c 04 	l.j 147500 <__ram_length+0x127500>
 4f4:	01 03 d0 7e 	l.j 40f46ec <__stack+0x3c946f0>
 4f8:	01 00 05 02 	l.j 4001900 <__stack+0x3ba1904>
 4fc:	00 00 05 20 	l.j 197c <__rom_length+0x57c>
	return(i);
}
 500:	1b 00 05 02 	l.movhi r24,0x502
 504:	00 00 05 2c 	l.j 19b4 <__rom_length+0x5b4>
 508:	0d 00 05 02 	l.bnf 4001910 <__stack+0x3ba1914>
 50c:	00 00 05 50 	l.j 1a4c <__rom_length+0x64c>
 510:	1b 00 05 02 	l.movhi r24,0x502
 514:	00 00 05 60 	l.j 1a94 <__rom_length+0x694>
 518:	0d 00 05 02 	l.bnf 4001920 <__stack+0x3ba1924>
void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
{
 51c:	00 00 05 64 	l.j 1aac <__rom_length+0x6ac>

  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
 520:	1b 00 05 02 	l.movhi r24,0x502
 524:	00 00 05 68 	l.j 1ac4 <__rom_length+0x6c4>
 528:	04 03 19 00 	l.jal c6928 <__ram_length+0xa6928>
void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
{
 52c:	05 02 00 00 	l.jal 408052c <__stack+0x3c20530>
 530:	05 74 15 00 	l.jal 5d05930 <__stack+0x58a5934>
 534:	05 02 00 00 	l.jal 4080534 <__stack+0x3c20538>
 538:	05 7c 16 00 	l.jal 5f05d38 <__stack+0x5aa5d3c>
 53c:	05 02 00 00 	l.jal 408053c <__stack+0x3c20540>
 540:	05 80 12 00 	l.jal 6004d40 <__stack+0x5ba4d44>
 544:	05 02 00 00 	l.jal 4080544 <__stack+0x3c20548>
 548:	05 84 16 00 	l.jal 6105d48 <__stack+0x5ca5d4c>
 54c:	05 02 00 00 	l.jal 408054c <__stack+0x3c20550>

  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
 550:	05 a8 15 00 	l.jal 6a05950 <__stack+0x65a5954>
 554:	05 02 00 00 	l.jal 4080554 <__stack+0x3c20558>
 558:	05 cc 15 00 	l.jal 7305958 <__stack+0x6ea595c>
 55c:	05 02 00 00 	l.jal 408055c <__stack+0x3c20560>
void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
{
 560:	05 d4 18 00 	l.jal 7506560 <__stack+0x70a6564>

  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
 564:	05 02 00 00 	l.jal 4080564 <__stack+0x3c20568>
  DEBUG_FUNC_IN();

    unsigned char n;
    unsigned char ocr[4];

    SPI_slow();     // set slow clock
 568:	05 d8 10 00 	l.jal 7604568 <__stack+0x71a456c>
 56c:	05 02 00 00 	l.jal 408056c <__stack+0x3c20570>
 570:	05 dc 16 00 	l.jal 7705d70 <__stack+0x72a5d74>
    DisableCard();  // CS = 1
 574:	05 02 00 00 	l.jal 4080574 <__stack+0x3c20578>
 578:	05 e8 17 00 	l.jal 7a06178 <__stack+0x75a617c>
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
 57c:	05 02 00 00 	l.jal 408057c <__stack+0x3c20580>

    unsigned char n;
    unsigned char ocr[4];

    SPI_slow();     // set slow clock
    DisableCard();  // CS = 1
 580:	05 ec 11 00 	l.jal 7b04980 <__stack+0x76a4984>
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
 584:	05 02 00 00 	l.jal 4080584 <__stack+0x3c20588>
 588:	05 f0 17 00 	l.jal 7c06188 <__stack+0x77a618c>
 58c:	05 02 00 00 	l.jal 408058c <__stack+0x3c20590>
 590:	06 08 15 00 	l.jal f8205990 <__stack+0xf7da5994>
 594:	05 02 00 00 	l.jal 4080594 <__stack+0x3c20598>
 598:	06 1c 12 00 	l.jal f8704d98 <__stack+0xf82a4d9c>
 59c:	05 02 00 00 	l.jal 408059c <__stack+0x3c205a0>
 5a0:	06 34 04 05 	l.jal f8d015b4 <__stack+0xf88a15b8>
 5a4:	03 6e 01 00 	l.j fdb809a4 <__stack+0xfd7209a8>
    TIMER_wait(20);  // 20ms delay
 5a8:	05 02 00 00 	l.jal 40805a8 <__stack+0x3c205ac>
 5ac:	06 38 16 00 	l.jal f8e05dac <__stack+0xf89a5db0>
 5b0:	05 02 00 00 	l.jal 40805b0 <__stack+0x3c205b4>
 5b4:	06 3c 13 00 	l.jal f8f051b4 <__stack+0xf8aa51b8>
 5b8:	05 02 00 00 	l.jal 40805b8 <__stack+0x3c205bc>
 5bc:	06 40 04 03 	l.jal f90015c8 <__stack+0xf8ba15cc>
 5c0:	2d 00 05 02 	.word 0x2d000502
 5c4:	00 00 06 44 	l.j 1ed4 <__rom_length+0xad4>
 5c8:	16 00 05 02 	.word 0x16000502
    EnableCard();
 5cc:	00 00 06 48 	l.j 1eec <__rom_length+0xaec>
 5d0:	04 05 03 66 	l.jal 141368 <__ram_length+0x121368>

    CardType = CARDTYPE_NONE;

    for(n=0; n<16; n++) {
 5d4:	01 00 05 02 	l.j 40019dc <__stack+0x3ba19e0>
    SPI_slow();     // set slow clock
    DisableCard();  // CS = 1
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
    TIMER_wait(20);  // 20ms delay
    EnableCard();
 5d8:	00 00 06 4c 	l.j 1f08 <__rom_length+0xb08>

    CardType = CARDTYPE_NONE;
 5dc:	04 03 2c 00 	l.jal cb5dc <__ram_length+0xab5dc>
 5e0:	05 02 00 00 	l.jal 40805e0 <__stack+0x3c205e4>
 5e4:	06 50 16 00 	l.jal f9405de4 <__stack+0xf8fa5de8>

    for(n=0; n<16; n++) {
      TIMER_wait(1);
 5e8:	05 02 00 00 	l.jal 40805e8 <__stack+0x3c205ec>
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
    TIMER_wait(20);  // 20ms delay
    EnableCard();

    CardType = CARDTYPE_NONE;
 5ec:	06 68 17 00 	l.jal f9a061ec <__stack+0xf95a61f0>

    for(n=0; n<16; n++) {
      TIMER_wait(1);
 5f0:	05 02 00 00 	l.jal 40805f0 <__stack+0x3c205f4>
 5f4:	06 6c 11 00 	l.jal f9b049f4 <__stack+0xf96a49f8>
 5f8:	05 02 00 00 	l.jal 40805f8 <__stack+0x3c205fc>
 5fc:	06 70 04 01 	l.jal f9c01600 <__stack+0xf97a1604>
 600:	03 60 01 00 	l.j fd800a00 <__stack+0xfd3a0a04>
 604:	05 02 00 00 	l.jal 4080604 <__stack+0x3c20608>
      if (MMC_Command(CMD0, 0) == 0x01) break; // try to send CMD0 multiple times
 608:	06 78 04 03 	l.jal f9e01614 <__stack+0xf99a1618>
 60c:	37 00 05 02 	.word 0x37000502
 610:	00 00 06 90 	l.j 2050 <__rom_length+0xc50>
 614:	13 00 05 02 	l.bf fc001a1c <__stack+0xfbba1a20>
 618:	00 00 06 9c 	l.j 2088 <__rom_length+0xc88>
    TIMER_wait(20);  // 20ms delay
    EnableCard();

    CardType = CARDTYPE_NONE;

    for(n=0; n<16; n++) {
 61c:	16 00 05 02 	.word 0x16000502
 620:	00 00 06 bc 	l.j 2110 <__rom_length+0xd10>
 624:	04 05 03 69 	l.jal 1413c8 <__ram_length+0x1213c8>
 628:	01 00 05 02 	l.j 4001a30 <__stack+0x3ba1a34>
 62c:	00 00 06 c4 	l.j 213c <__rom_length+0xd3c>
 630:	04 03 32 00 	l.jal cce30 <__ram_length+0xace30>
}

//// timer ////
unsigned long GetTimer(unsigned long offset)
{
  unsigned long systimer = TIMER_get();
 634:	05 02 00 00 	l.jal 4080634 <__stack+0x3c20638>
  systimer = systimer<< 16;
  systimer += offset << 16;
 638:	06 d8 16 00 	l.jal fb605e38 <__stack+0xfb1a5e3c>

//// timer ////
unsigned long GetTimer(unsigned long offset)
{
  unsigned long systimer = TIMER_get();
  systimer = systimer<< 16;
 63c:	05 02 00 00 	l.jal 408063c <__stack+0x3c20640>
    }
    if (n<16) // got CMD0 IDLE response
    { // idle state
        //timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
 640:	06 ec 17 00 	l.jal fbb06240 <__stack+0xfb6a6244>
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
 644:	05 02 00 00 	l.jal 4080644 <__stack+0x3c20648>
  systimer += offset << 16;
 648:	07 04 13 00 	l.jal fc105248 <__stack+0xfbca524c>
    }
    if (n<16) // got CMD0 IDLE response
    { // idle state
        //timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
 64c:	05 02 00 00 	l.jal 408064c <__stack+0x3c20650>
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
 650:	07 10 17 00 	l.jal fc406250 <__stack+0xfbfa6254>
 654:	05 02 00 00 	l.jal 4080654 <__stack+0x3c20658>
 658:	07 34 1a 00 	l.jal fcd06e58 <__stack+0xfc8a6e5c>
 65c:	05 02 00 00 	l.jal 408065c <__stack+0x3c20660>
 660:	07 44 39 00 	l.jal fd10ea60 <__stack+0xfccaea64>
 664:	05 02 00 00 	l.jal 4080664 <__stack+0x3c20668>
        {   // SDHC card
            for (n = 0; n < 4; n++)
                ocr[n] = SPI(0xFF); // get the rest of R7 response
 668:	07 4c 04 05 	l.jal fd30167c <__stack+0xfcea1680>
    { // idle state
        //timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
 66c:	03 b0 7f 01 	l.j fec20270 <__stack+0xfe7c0274>

void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
 670:	00 05 02 00 	l.j 140e70 <__ram_length+0x120e70>
 674:	00 07 54 15 	l.j 1d56c8 <__ram_length+0x1b56c8>
        {   // SDHC card
            for (n = 0; n < 4; n++)
                ocr[n] = SPI(0xFF); // get the rest of R7 response
 678:	00 05 02 00 	l.j 140e78 <__ram_length+0x120e78>
 67c:	00 07 58 15 	l.j 1d66d0 <__ram_length+0x1b66d0>
 680:	00 05 02 00 	l.j 140e80 <__ram_length+0x120e80>
 684:	00 07 5c 15 	l.j 1d76d8 <__ram_length+0x1b76d8>
 688:	00 05 02 00 	l.j 140e88 <__ram_length+0x120e88>
 68c:	00 07 70 04 	l.j 1dc69c <__ram_length+0x1bc69c>
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
        {   // SDHC card
            for (n = 0; n < 4; n++)
 690:	03 4e 00 05 	l.j fd3806a4 <__stack+0xfcf206a8>
 694:	02 00 00 07 	l.j f80006b0 <__stack+0xf7ba06b4>
 698:	84 16 00 05 	l.lwz r0,0x5(r22)
                ocr[n] = SPI(0xFF); // get the rest of R7 response
            if (ocr[2] == 0x01 && ocr[3] == 0xAA)
 69c:	02 00 00 07 	l.j f80006b8 <__stack+0xf7ba06bc>
 6a0:	98 04 05 03 	l.lhs r0,0x503(r4)
 6a4:	41 01 00 05 	.word 0x41010005
 6a8:	02 00 00 07 	l.j f80006c4 <__stack+0xf7ba06c8>
 6ac:	a0 04 03 5b 	l.addic r0,r4,0x35b
 6b0:	00 05 02 00 	l.j 140eb0 <__ram_length+0x120eb0>
 6b4:	00 07 b8 17 	l.j 1ee710 <__ram_length+0x1ce710>
 6b8:	00 05 02 00 	l.j 140eb8 <__ram_length+0x120eb8>
}


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
 6bc:	00 07 cc 19 	l.j 1f3720 <__ram_length+0x1d3720>
 6c0:	00 05 02 00 	l.j 140ec0 <__ram_length+0x120ec0>
                //printf("SDHC card detected\r");
                while (!CheckTimer(timeout))
                { // now we must wait until CMD41 returns 0 (or timeout elapses)
                    if (MMC_Command(CMD55, 0) == 0x01)
                    { // CMD55 must precede any ACMD command
                        if (MMC_Command(CMD41, 1 << 30) == 0x00) // ACMD41 with HCS bit
 6c4:	00 07 d4 15 	l.j 1f5718 <__ram_length+0x1d5718>
 6c8:	00 05 02 00 	l.j 140ec8 <__ram_length+0x120ec8>
 6cc:	00 07 e0 04 	l.j 1f86dc <__ram_length+0x1d86dc>
 6d0:	01 03 ac 7f 	l.j 40eb8cc <__stack+0x3c8b8d0>
 6d4:	01 00 05 02 	l.j 4001adc <__stack+0x3ba1ae0>
                        { // initialization completed
                            if (MMC_Command(CMD58, 0) == 0x00)
 6d8:	00 00 07 f4 	l.j 26a8 <__rom_length+0x12a8>
 6dc:	04 05 1a 00 	l.jal 146edc <__ram_length+0x126edc>
 6e0:	05 02 00 00 	l.jal 40806e0 <__stack+0x3c206e4>
 6e4:	07 f8 12 00 	l.jal ffe04ee4 <__stack+0xff9a4ee8>
 6e8:	05 02 00 00 	l.jal 40806e8 <__stack+0x3c206ec>
                            { // check CCS (Card Capacity Status) bit in the OCR
                                for (n = 0; n < 4; n++)
                                    ocr[n] = SPI(0xFF);
 6ec:	07 fc 16 00 	l.jal fff05eec <__stack+0xffaa5ef0>
 6f0:	05 02 00 00 	l.jal 40806f0 <__stack+0x3c206f4>
 6f4:	08 00 12 00 	.word 0x08001200
 6f8:	05 02 00 00 	l.jal 40806f8 <__stack+0x3c206fc>
 6fc:	08 04 16 00 	.word 0x08041600
 700:	05 02 00 00 	l.jal 4080700 <__stack+0x3c20704>
                    { // CMD55 must precede any ACMD command
                        if (MMC_Command(CMD41, 1 << 30) == 0x00) // ACMD41 with HCS bit
                        { // initialization completed
                            if (MMC_Command(CMD58, 0) == 0x00)
                            { // check CCS (Card Capacity Status) bit in the OCR
                                for (n = 0; n < 4; n++)
 704:	08 08 13 00 	.word 0x08081300
 708:	05 02 00 00 	l.jal 4080708 <__stack+0x3c2070c>
 70c:	08 0c 15 00 	.word 0x080c1500
                                    ocr[n] = SPI(0xFF);

                                CardType = (ocr[0] & 0x40) ? CARDTYPE_SDHC : CARDTYPE_SD; // if CCS set then the card is SDHC compatible
 710:	05 02 00 00 	l.jal 4080710 <__stack+0x3c20714>
 714:	08 10 15 00 	.word 0x08101500
 718:	05 02 00 00 	l.jal 4080718 <__stack+0x3c2071c>
 71c:	08 24 04 01 	.word 0x08240401
 720:	10 00 05 02 	l.bf 1b28 <__rom_length+0x728>
 724:	00 00 08 38 	l.j 2804 <__rom_length+0x1404>
 728:	04 04 41 00 	l.jal 110b28 <__ram_length+0xf0b28>
 72c:	05 02 00 00 	l.jal 408072c <__stack+0x3c20730>
 730:	08 3c 04 01 	.word 0x083c0401
                            }
                            //printf("CMD58 (READ_OCR) failed!\r");
                            //DisableCard();

                            // set appropriate SPI speed
                            SPI_fast();
 734:	03 53 01 00 	l.j fd4c0b34 <__stack+0xfd060b38>
 738:	05 02 00 00 	l.jal 4080738 <__stack+0x3c2073c>
 73c:	08 44 04 04 	.word 0x08440404
 740:	41 00 05 02 	.word 0x41000502
                                //printf("CMD16 (SET_BLOCKLEN) failed!\r");
                            //DisableCard();

                            // set appropriate SPI speed
                            SPI_fast();
                            return(CardType);
 744:	00 00 08 48 	l.j 2864 <__rom_length+0x1464>
 748:	17 00 05 02 	.word 0x17000502
 74c:	00 00 08 4c 	l.j 287c <__rom_length+0x147c>
 750:	11 00 05 02 	l.bf 4001b58 <__stack+0x3ba1b5c>
  systimer = systimer<< 16;
 754:	00 00 08 50 	l.j 2894 <__rom_length+0x1494>
  time -= systimer;
 758:	17 00 05 02 	.word 0x17000502
  if(time & 0x80000000) return(1);
 75c:	00 00 08 54 	l.j 28ac <__rom_length+0x14ac>
 760:	11 00 05 02 	l.bf 4001b68 <__stack+0x3ba1b6c>
 764:	00 00 08 58 	l.j 28c4 <__rom_length+0x14c4>
 768:	15 00 05 02 	l.nop 0x502
 76c:	00 00 08 64 	l.j 28fc <__rom_length+0x14fc>
                return(CARDTYPE_NONE);
            }
        }

        // it's not an SDHC card
        if (MMC_Command(CMD55, 0) == 0x01)
 770:	16 00 05 02 	.word 0x16000502
 774:	00 00 08 78 	l.j 2954 <__rom_length+0x1554>
 778:	18 00 05 02 	l.movhi r0,0x502
 77c:	00 00 08 80 	l.j 297c <__rom_length+0x157c>
 780:	17 00 05 02 	.word 0x17000502
        { // CMD55 accepted so it's an SD card (or Kingston 128 MB MMC)
            if (MMC_Command(CMD41, 0) <= 0x01)
 784:	00 00 08 84 	l.j 2994 <__rom_length+0x1594>
 788:	11 00 05 02 	l.bf 4001b90 <__stack+0x3ba1b94>
 78c:	00 00 08 88 	l.j 29ac <__rom_length+0x15ac>
 790:	17 00 05 02 	.word 0x17000502
 794:	00 00 08 a8 	l.j 2a34 <__rom_length+0x1634>
}


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
 798:	15 00 05 02 	l.nop 0x502
 79c:	00 00 08 ac 	l.j 2a4c <__rom_length+0x164c>
                //printf("timeout:%08X\r",GetTimer(0));
                while (!CheckTimer(timeout))
                { // now we must wait until CMD41 returns 0 (or timeout elapses)
                    if (MMC_Command(CMD55, 0) == 0x01)
                    { // CMD55 must precede any ACMD command
                        if (MMC_Command(CMD41, 0) == 0x00)
 7a0:	15 00 05 02 	l.nop 0x502
 7a4:	00 00 08 cc 	l.j 2ad4 <__rom_length+0x16d4>
 7a8:	15 00 05 02 	l.nop 0x502
 7ac:	00 00 08 d4 	l.j 2afc <__rom_length+0x16fc>
 7b0:	16 00 05 02 	.word 0x16000502
 7b4:	00 00 08 ec 	l.j 2b64 <__rom_length+0x1764>
                        { // initialization completed

                            if (MMC_Command(CMD16, 512) != 0x00) //set block length
 7b8:	19 00 05 02 	l.movhi r8,0x502
 7bc:	00 00 09 00 	l.j 2bbc <__rom_length+0x17bc>
 7c0:	15 00 05 02 	l.nop 0x502
 7c4:	00 00 09 10 	l.j 2c04 <__rom_length+0x1804>
 7c8:	15 00 05 02 	l.nop 0x502
                                //printf("CMD16 (SET_BLOCKLEN) failed!\r");
                            //DisableCard();

                            // set appropriate SPI speed
                            SPI_fast();
 7cc:	00 00 09 20 	l.j 2c4c <__rom_length+0x184c>
 7d0:	15 00 05 02 	l.nop 0x502
                            return(CardType);
 7d4:	00 00 09 30 	l.j 2c94 <__rom_length+0x1894>
 7d8:	19 00 05 02 	l.movhi r8,0x502
 7dc:	00 00 09 4c 	l.j 2d0c <__rom_length+0x190c>
  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
  if (!MMC_Init()) FatalError();
 7e0:	19 00 05 02 	l.movhi r8,0x502
 7e4:	00 00 09 6c 	l.j 2d94 <__rom_length+0x1994>
 7e8:	15 00 05 02 	l.nop 0x502
 7ec:	00 00 09 80 	l.j 2dec <__rom_length+0x19ec>
 7f0:	15 00 05 02 	l.nop 0x502
  systimer = systimer<< 16;
  time -= systimer;
 7f4:	00 00 09 a0 	l.j 2e74 <__rom_length+0x1a74>
}


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
 7f8:	1a 00 05 02 	l.movhi r16,0x502
  systimer = systimer<< 16;
  time -= systimer;
 7fc:	00 00 09 c8 	l.j 2f1c <__rom_length+0x1b1c>
}


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
 800:	18 00 05 02 	l.movhi r0,0x502
  systimer = systimer<< 16;
  time -= systimer;
 804:	00 00 09 e0 	l.j 2f84 <__rom_length+0x1b84>


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
  systimer = systimer<< 16;
 808:	18 00 05 02 	l.movhi r0,0x502
  time -= systimer;
 80c:	00 00 0a 08 	l.j 302c <__rom_length+0x1c2c>
  if(time & 0x80000000) return(1);
 810:	18 00 05 02 	l.movhi r0,0x502
 814:	00 00 0a 10 	l.j 3054 <__rom_length+0x1c54>
 818:	17 00 05 02 	.word 0x17000502
 81c:	00 00 0a 14 	l.j 306c <__rom_length+0x1c6c>
 820:	11 00 05 02 	l.bf 4001c28 <__stack+0x3ba1c2c>

  // find drive
  LEDS(led=0x8);
 824:	00 00 0a 18 	l.j 3084 <__rom_length+0x1c84>
 828:	17 00 05 02 	.word 0x17000502
 82c:	00 00 0a 1c 	l.j 309c <__rom_length+0x1c9c>
 830:	17 00 05 02 	.word 0x17000502
 834:	00 00 0a 20 	l.j 30b4 <__rom_length+0x1cb4>

// FindDrive() checks if a card is present and contains FAT formatted primary partition
unsigned char FindDrive(void)
{
	unsigned long boot_sector;              // partition boot sector
    buffered_fat_index = -1;
 838:	11 00 05 02 	l.bf 4001c40 <__stack+0x3ba1c44>
 83c:	00 00 0a 28 	l.j 30dc <__rom_length+0x1cdc>
 840:	16 00 05 02 	.word 0x16000502
 844:	00 00 0a 48 	l.j 3164 <__rom_length+0x1d64>
	fat32=0;

    if (!MMC_Read(0, sector_buffer)) // read MBR
 848:	15 00 05 02 	l.nop 0x502

// FindDrive() checks if a card is present and contains FAT formatted primary partition
unsigned char FindDrive(void)
{
	unsigned long boot_sector;              // partition boot sector
    buffered_fat_index = -1;
 84c:	00 00 0a 54 	l.j 319c <__rom_length+0x1d9c>
	fat32=0;

    if (!MMC_Read(0, sector_buffer)) // read MBR
 850:	16 00 05 02 	.word 0x16000502

// FindDrive() checks if a card is present and contains FAT formatted primary partition
unsigned char FindDrive(void)
{
	unsigned long boot_sector;              // partition boot sector
    buffered_fat_index = -1;
 854:	00 00 0a 6c 	l.j 3204 <__rom_length+0x1e04>
	fat32=0;
 858:	16 00 05 02 	.word 0x16000502
 85c:	00 00 0a 8c 	l.j 328c <__rom_length+0x1e8c>
 860:	17 00 05 02 	.word 0x17000502

    if (!MMC_Read(0, sector_buffer)) // read MBR
 864:	00 00 0a 98 	l.j 32c4 <__rom_length+0x1ec4>
 868:	15 00 05 02 	l.nop 0x502
 86c:	00 00 0a 9c 	l.j 32dc <__rom_length+0x1edc>
 870:	15 00 05 02 	l.nop 0x502
 874:	00 00 0a a0 	l.j 32f4 <__rom_length+0x1ef4>
        return(0);

	boot_sector=0;
	partitioncount=1;
 878:	13 00 05 02 	l.bf fc001c80 <__stack+0xfbba1c84>
 87c:	00 00 0a a4 	l.j 330c <__rom_length+0x1f0c>

	// If we can identify a filesystem on block 0 we don't look for partitions
    if (compare((const char*)&sector_buffer[0x36], "FAT16   ",8)==0) // check for FAT16
 880:	15 00 05 02 	l.nop 0x502

    if (!MMC_Read(0, sector_buffer)) // read MBR
        return(0);

	boot_sector=0;
	partitioncount=1;
 884:	00 00 0a a8 	l.j 3324 <__rom_length+0x1f24>

	// If we can identify a filesystem on block 0 we don't look for partitions
    if (compare((const char*)&sector_buffer[0x36], "FAT16   ",8)==0) // check for FAT16
 888:	13 00 05 02 	l.bf fc001c90 <__stack+0xfbba1c94>
 88c:	00 00 0a ac 	l.j 333c <__rom_length+0x1f3c>
 890:	15 00 05 02 	l.nop 0x502
 894:	00 00 0a d8 	l.j 33f4 <__rom_length+0x1ff4>
 898:	15 00 05 02 	l.nop 0x502
 89c:	00 00 0a ec 	l.j 344c <__rom_length+0x204c>
 8a0:	15 00 05 02 	l.nop 0x502
 8a4:	00 00 0a f0 	l.j 3464 <__rom_length+0x2064>
		partitioncount=0;
 8a8:	13 00 05 02 	l.bf fc001cb0 <__stack+0xfbba1cb4>
    if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8)==0) // check for FAT32
 8ac:	00 00 0a f4 	l.j 347c <__rom_length+0x207c>
 8b0:	15 00 05 02 	l.nop 0x502
 8b4:	00 00 0b 18 	l.j 3514 <__rom_length+0x2114>
 8b8:	15 00 05 02 	l.nop 0x502
 8bc:	00 00 0b 1c 	l.j 352c <__rom_length+0x212c>
 8c0:	13 00 05 02 	l.bf fc001cc8 <__stack+0xfbba1ccc>
 8c4:	00 00 0b 2c 	l.j 3574 <__rom_length+0x2174>
 8c8:	15 00 05 02 	l.nop 0x502
		partitioncount=0;
 8cc:	00 00 0b 44 	l.j 35dc <__rom_length+0x21dc>
 8d0:	19 00 05 02 	l.movhi r8,0x502

	if(partitioncount)
 8d4:	00 00 0b 60 	l.j 3654 <__rom_length+0x2254>
 8d8:	15 00 05 02 	l.nop 0x502
 8dc:	00 00 0b 78 	l.j 36bc <__rom_length+0x22bc>
 8e0:	17 00 05 02 	.word 0x17000502
 8e4:	00 00 0b 94 	l.j 3734 <__rom_length+0x2334>
 8e8:	17 00 05 02 	.word 0x17000502
	{
		// We have at least one partition, parse the MBR.
		struct MasterBootRecord *mbr=(struct MasterBootRecord *)sector_buffer;

		boot_sector = mbr->Partition[0].startlba;
 8ec:	00 00 0b a8 	l.j 378c <__rom_length+0x238c>
 8f0:	15 00 05 02 	l.nop 0x502
 8f4:	00 00 0b ac 	l.j 37a4 <__rom_length+0x23a4>
 8f8:	17 00 05 02 	.word 0x17000502
 8fc:	00 00 0b b0 	l.j 37bc <__rom_length+0x23bc>
		if(mbr->Signature==0x55aa)
 900:	11 00 05 02 	l.bf 4001d08 <__stack+0x3ba1d0c>
 904:	00 00 0b b8 	l.j 37e4 <__rom_length+0x23e4>
 908:	17 00 05 02 	.word 0x17000502
 90c:	00 00 0b c4 	l.j 381c <__rom_length+0x241c>
				boot_sector=SwapBBBB(mbr->Partition[0].startlba);
 910:	04 01 03 80 	l.jal 41710 <__ram_length+0x21710>
 914:	7f 01 00 05 	l.cust4 
 918:	02 00 00 0b 	l.j f8000944 <__stack+0xf7ba0948>
 91c:	dc 04 04 c0 	l.sh 0x4c0(r4),r0
		else if(mbr->Signature!=0xaa55)
 920:	00 05 02 00 	l.j 141120 <__ram_length+0x121120>
 924:	00 0b e0 04 	l.j 2f8934 <__ram_length+0x2d8934>
 928:	01 03 d4 7e 	l.j 40f5b20 <__stack+0x3c95b24>
 92c:	01 00 05 02 	l.j 4001d34 <__stack+0x3ba1d38>
		{
				BootPrint("No partition signature found\n");
				return(0);
		}
		if (!MMC_Read(boot_sector, sector_buffer)) // read discriptor
 930:	00 00 0b e4 	l.j 38c0 <__rom_length+0x24c0>
 934:	04 04 c4 00 	l.jal 131934 <__ram_length+0x111934>
 938:	05 02 00 00 	l.jal 4080938 <__stack+0x3c2093c>
 93c:	0b e8 04 01 	.word 0x0be80401
 940:	03 d0 7e 01 	l.j ff420144 <__stack+0xfefc0148>
 944:	00 05 02 00 	l.j 141144 <__ram_length+0x121144>
 948:	00 0b ec 04 	l.j 2fb958 <__ram_length+0x2db958>
		    return(0);
		BootPrint("Read boot sector from first partition\n");
	}

    if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8)==0) // check for FAT16
 94c:	04 c0 00 05 	l.jal 3000960 <__stack+0x2ba0964>
 950:	02 00 00 0b 	l.j f800097c <__stack+0xf7ba0980>
 954:	f8 16 00 05 	l.cust7 
 958:	02 00 00 0c 	l.j f8000988 <__stack+0xf7ba098c>
 95c:	04 15 00 05 	l.jal 540970 <__stack+0xe0974>
 960:	02 00 00 0c 	l.j f8000990 <__stack+0xf7ba0994>
 964:	0c 15 00 05 	l.bnf 540978 <__stack+0xe097c>
 968:	02 00 00 0c 	l.j f8000998 <__stack+0xf7ba099c>
		fat32=1;
 96c:	1c 04 01 03 	.word 0x1c040103
 970:	cd 7e 01 00 	.word 0xcd7e0100
 974:	05 02 00 00 	l.jal 4080974 <__stack+0x3c20978>
 978:	0c 24 04 04 	l.bnf 901988 <__stack+0x4a198c>
 97c:	c7 00 05 02 	l.msb r0,r0
	else if (compare((const char*)&sector_buffer[0x36], "FAT16   ",8)!=0) // check for FAT32
 980:	00 00 0c 38 	l.j 3a60 <__rom_length+0x2660>
 984:	3f 00 05 02 	.word 0x3f000502
 988:	00 00 0c 40 	l.j 3a88 <__rom_length+0x2688>
 98c:	03 55 01 00 	l.j fd540d8c <__stack+0xfd0e0d90>
 990:	05 02 00 00 	l.jal 4080990 <__stack+0x3c20994>
 994:	0c 44 0a 00 	l.bnf 1103194 <__stack+0xca3198>
 998:	05 02 00 00 	l.jal 4080998 <__stack+0x3c2099c>
 99c:	0c 48 49 00 	l.bnf 1212d9c <__stack+0xdb2da0>
	{
        printf("Unsupported partition type!\r");
		return(0);
	}

    if (sector_buffer[510] != 0x55 || sector_buffer[511] != 0xaa)  // check signature
 9a0:	05 02 00 00 	l.jal 40809a0 <__stack+0x3c209a4>
 9a4:	0c 50 03 59 	l.bnf 1401708 <__stack+0xfa170c>
 9a8:	01 00 05 02 	l.j 4001db0 <__stack+0x3ba1db4>
 9ac:	00 00 0c 58 	l.j 3b0c <__rom_length+0x270c>
 9b0:	16 00 05 02 	.word 0x16000502
 9b4:	00 00 0c 64 	l.j 3b44 <__rom_length+0x2744>
 9b8:	17 00 05 02 	.word 0x17000502
 9bc:	00 00 0c 78 	l.j 3b9c <__rom_length+0x279c>
 9c0:	15 00 05 02 	l.nop 0x502
 9c4:	00 00 0c 7c 	l.j 3bb4 <__rom_length+0x27b4>
        return(0);

    // check for near-jump or short-jump opcode
    if (sector_buffer[0] != 0xe9 && sector_buffer[0] != 0xeb)
 9c8:	13 00 05 02 	l.bf fc001dd0 <__stack+0xfbba1dd4>
 9cc:	00 00 0c 84 	l.j 3bdc <__rom_length+0x27dc>
 9d0:	18 00 05 02 	l.movhi r0,0x502
 9d4:	00 00 0c 88 	l.j 3bf4 <__rom_length+0x27f4>
 9d8:	17 00 05 02 	.word 0x17000502
 9dc:	00 00 0c a0 	l.j 3c5c <__rom_length+0x285c>
        return(0);

    // check if blocksize is really 512 bytes
    if (sector_buffer[11] != 0x00 || sector_buffer[12] != 0x02)
 9e0:	16 00 05 02 	.word 0x16000502
 9e4:	00 00 0c b4 	l.j 3cb4 <__rom_length+0x28b4>
 9e8:	16 00 05 02 	.word 0x16000502
 9ec:	00 00 0c d4 	l.j 3d3c <__rom_length+0x293c>
 9f0:	16 00 05 02 	.word 0x16000502
 9f4:	00 00 0c e0 	l.j 3d74 <__rom_length+0x2974>
 9f8:	15 00 05 02 	l.nop 0x502
 9fc:	00 00 0c e4 	l.j 3d8c <__rom_length+0x298c>
 a00:	13 00 05 02 	l.bf fc001e08 <__stack+0xfbba1e0c>
 a04:	00 00 0c ec 	l.j 3db4 <__rom_length+0x29b4>
        return(0);

    // get cluster_size
    cluster_size = sector_buffer[13];
 a08:	15 00 05 02 	l.nop 0x502
 a0c:	00 00 0c f0 	l.j 3dcc <__rom_length+0x29cc>

    // calculate cluster mask
    cluster_mask = cluster_size - 1;
 a10:	04 02 03 ac 	l.jal 818c0 <__ram_length+0x618c0>
    // check if blocksize is really 512 bytes
    if (sector_buffer[11] != 0x00 || sector_buffer[12] != 0x02)
        return(0);

    // get cluster_size
    cluster_size = sector_buffer[13];
 a14:	7e 01 00 05 	l.cust4 

    // calculate cluster mask
    cluster_mask = cluster_size - 1;
 a18:	02 00 00 0c 	l.j f8000a48 <__stack+0xf7ba0a4c>

    fat_start = boot_sector + sector_buffer[0x0E] + (sector_buffer[0x0F] << 8); // reserved sector count before FAT table (usually 32 for FAT32)
	fat_number = sector_buffer[0x10];
 a1c:	fc 04 04 e8 	l.cust8 

    // get cluster_size
    cluster_size = sector_buffer[13];

    // calculate cluster mask
    cluster_mask = cluster_size - 1;
 a20:	00 05 02 00 	l.j 141220 <__ram_length+0x121220>
 a24:	00 0d 08 04 	l.j 342a34 <__ram_length+0x322a34>

    fat_start = boot_sector + sector_buffer[0x0E] + (sector_buffer[0x0F] << 8); // reserved sector count before FAT table (usually 32 for FAT32)
 a28:	02 03 ac 7e 	l.j f80ebc20 <__stack+0xf7c8bc24>
 a2c:	01 00 05 02 	l.j 4001e34 <__stack+0x3ba1e38>
 a30:	00 00 0d 14 	l.j 3e80 <__rom_length+0x2a80>
 a34:	04 04 e8 00 	l.jal 13aa34 <__ram_length+0x11aa34>
 a38:	05 02 00 00 	l.jal 4080a38 <__stack+0x3c20a3c>
 a3c:	0d 28 15 00 	l.bnf 4a05e3c <__stack+0x45a5e40>
 a40:	05 02 00 00 	l.jal 4080a40 <__stack+0x3c20a44>
 a44:	0d 2c 5b 00 	l.bnf 4b17644 <__stack+0x46b7648>
	fat_number = sector_buffer[0x10];
 a48:	05 02 00 00 	l.jal 4080a48 <__stack+0x3c20a4c>
 a4c:	0d 30 1c 00 	l.bnf 4c07a4c <__stack+0x47a7a50>
 a50:	05 02 00 00 	l.jal 4080a50 <__stack+0x3c20a54>

    if (fat32)
 a54:	0d 34 15 00 	l.bnf 4d05e54 <__stack+0x48a5e58>
 a58:	05 02 00 00 	l.jal 4080a58 <__stack+0x3c20a5c>
 a5c:	0d 38 15 00 	l.bnf 4e05e5c <__stack+0x49a5e60>
 a60:	05 02 00 00 	l.jal 4080a60 <__stack+0x3c20a64>
 a64:	0d 3c 03 ae 	l.bnf 4f0191c <__stack+0x4aa1920>
 a68:	7f 01 00 05 	l.cust4 
    {
        if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8) != 0) // check file system type
 a6c:	02 00 00 0d 	l.j f8000aa0 <__stack+0xf7ba0aa4>
 a70:	40 15 00 05 	.word 0x40150005
 a74:	02 00 00 0d 	l.j f8000aa8 <__stack+0xf7ba0aac>
 a78:	44 5b 00 05 	l.jr r0
 a7c:	02 00 00 0d 	l.j f8000ab0 <__stack+0xf7ba0ab4>
 a80:	4c 1c 00 05 	l.maci r28,0x5
 a84:	02 00 00 0d 	l.j f8000ab8 <__stack+0xf7ba0abc>
 a88:	50 15 00 05 	.word 0x50150005
            return(0);

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
 a8c:	02 00 00 0d 	l.j f8000ac0 <__stack+0xf7ba0ac4>
 a90:	54 15 00 05 	.word 0x54150005
 a94:	02 00 00 0d 	l.j f8000ac8 <__stack+0xf7ba0acc>
        root_directory_size = cluster_size; // root directory size in sectors
 a98:	5c 03 9b 7f 	.word 0x5c039b7f
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
 a9c:	01 00 05 02 	l.j 4001ea4 <__stack+0x3ba1ea8>
    {
        if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8) != 0) // check file system type
            return(0);

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
        root_directory_size = cluster_size; // root directory size in sectors
 aa0:	00 00 0d 6c 	l.j 4050 <__rom_length+0x2c50>
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
 aa4:	32 00 05 02 	.word 0x32000502
    {
        if (compare((const char*)&sector_buffer[0x52], "FAT32   ",8) != 0) // check file system type
            return(0);

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
        root_directory_size = cluster_size; // root directory size in sectors
 aa8:	00 00 0d 78 	l.j 4088 <__rom_length+0x2c88>
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
 aac:	16 00 05 02 	.word 0x16000502
 ab0:	00 00 0d 80 	l.j 40b0 <__rom_length+0x2cb0>
 ab4:	18 00 05 02 	l.movhi r0,0x502
 ab8:	00 00 0d a0 	l.j 4138 <__rom_length+0x2d38>
 abc:	17 00 05 02 	.word 0x17000502
 ac0:	00 00 0d b8 	l.j 41a0 <__rom_length+0x2da0>
 ac4:	51 00 05 02 	.word 0x51000502
 ac8:	00 00 0d bc 	l.j 41b8 <__rom_length+0x2db8>
 acc:	13 00 05 02 	l.bf fc001ed4 <__stack+0xfbba1ed8>
 ad0:	00 00 0d c0 	l.j 41d0 <__rom_length+0x2dd0>
 ad4:	15 00 05 02 	l.nop 0x502
        data_start = fat_start + (fat_number * fat_size);
 ad8:	00 00 0d d0 	l.j 4218 <__rom_length+0x2e18>
 adc:	15 00 05 02 	l.nop 0x502
 ae0:	00 00 0d d4 	l.j 4230 <__rom_length+0x2e30>
 ae4:	16 00 05 02 	.word 0x16000502
 ae8:	00 00 0d d8 	l.j 4248 <__rom_length+0x2e48>
        root_directory_cluster = sector_buffer[0x2C] + (sector_buffer[0x2D] << 8) + (sector_buffer[0x2E] << 16) + ((sector_buffer[0x2F] & 0x0F) << 24);
 aec:	12 00 05 02 	l.bf f8001ef4 <__stack+0xf7ba1ef8>
            return(0);

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
        root_directory_size = cluster_size; // root directory size in sectors
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
        data_start = fat_start + (fat_number * fat_size);
 af0:	00 00 0d dc 	l.j 4260 <__rom_length+0x2e60>
        root_directory_cluster = sector_buffer[0x2C] + (sector_buffer[0x2D] << 8) + (sector_buffer[0x2E] << 16) + ((sector_buffer[0x2F] & 0x0F) << 24);
 af4:	16 00 05 02 	.word 0x16000502
 af8:	00 00 0d f0 	l.j 42b8 <__rom_length+0x2eb8>
 afc:	1a 00 05 02 	l.movhi r16,0x502
 b00:	00 00 0e 00 	l.j 4300 <__rom_length+0x2f00>
 b04:	16 00 05 02 	.word 0x16000502
 b08:	00 00 0e 0c 	l.j 4338 <__rom_length+0x2f38>
 b0c:	17 00 05 02 	.word 0x17000502
 b10:	00 00 0e 10 	l.j 4350 <__rom_length+0x2f50>
 b14:	03 6d 01 00 	l.j fdb40f14 <__stack+0xfd6e0f18>
        root_directory_start = (root_directory_cluster - 2) * cluster_size + data_start;
 b18:	05 02 00 00 	l.jal 4080b18 <__stack+0x3c20b1c>

        dir_entries = cluster_size << 4; // total number of dir entries (16 entries per sector)
        root_directory_size = cluster_size; // root directory size in sectors
        fat_size = sector_buffer[0x24] + (sector_buffer[0x25] << 8) + (sector_buffer[0x26] << 16) + (sector_buffer[0x27] << 24);
        data_start = fat_start + (fat_number * fat_size);
        root_directory_cluster = sector_buffer[0x2C] + (sector_buffer[0x2D] << 8) + (sector_buffer[0x2E] << 16) + ((sector_buffer[0x2F] & 0x0F) << 24);
 b1c:	0e 1c 04 01 	l.bnf f8701b20 <__stack+0xf82a1b24>
 b20:	03 fa 7d 01 	l.j ffe9ff24 <__stack+0xffa3ff28>
 b24:	00 05 02 00 	l.j 141324 <__ram_length+0x121324>
 b28:	00 0e 38 15 	l.j 38eb7c <__ram_length+0x36eb7c>
        root_directory_start = (root_directory_cluster - 2) * cluster_size + data_start;
 b2c:	00 05 02 00 	l.j 14132c <__ram_length+0x12132c>
 b30:	00 0e 3c 13 	l.j 38fb7c <__ram_length+0x36fb7c>
 b34:	00 05 02 00 	l.j 141334 <__ram_length+0x121334>
 b38:	00 0e 40 15 	l.j 390b8c <__ram_length+0x370b8c>
 b3c:	00 05 02 00 	l.j 14133c <__ram_length+0x12133c>
 b40:	00 0e 48 04 	l.j 392b50 <__ram_length+0x372b50>
    }
    else
    {
        // calculate drive's parameters from bootsector, first up is size of directory
        dir_entries = sector_buffer[17] + (sector_buffer[18] << 8);
 b44:	05 37 00 05 	l.jal 4dc0b58 <__stack+0x4960b5c>
 b48:	02 00 00 0e 	l.j f8000b80 <__stack+0xf7ba0b84>
 b4c:	4c 15 00 05 	l.maci r21,0x5
 b50:	02 00 00 0e 	l.j f8000b88 <__stack+0xf7ba0b8c>
 b54:	58 15 00 05 	.word 0x58150005
 b58:	02 00 00 0e 	l.j f8000b90 <__stack+0xf7ba0b94>
 b5c:	64 04 03 03 	.word 0x64040303
        root_directory_size = ((dir_entries << 5) + 511) >> 9;
 b60:	66 01 00 05 	.word 0x66010005
 b64:	02 00 00 0e 	l.j f8000b9c <__stack+0xf7ba0ba0>
 b68:	80 3d 00 05 	l.ld r1,0x5(r29)
 b6c:	02 00 00 0e 	l.j f8000ba4 <__stack+0xf7ba0ba8>
 b70:	9c 00 01 01 	l.addi r0,r0,0x101
 b74:	00 00 00 19 	l.j bd8 <main+0x6bc>

        // calculate start of FAT,size of FAT and number of FAT's
        fat_size = sector_buffer[22] + (sector_buffer[23] << 8);
 b78:	00 02 00 00 	l.j 80b78 <__ram_length+0x60b78>
 b7c:	00 13 01 01 	l.j 4c0f80 <__stack+0x60f84>
 b80:	fb 0e 0d 00 	l.cust7 
 b84:	01 01 01 01 	l.j 4040f88 <__stack+0x3be0f8c>
 b88:	00 00 00 01 	l.j b8c <main+0x670>
 b8c:	00 00 01 00 	l.j f8c <__data_rom+0xd0>
	...

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	00 00 00 10 	l.j 40 <bss_init_end+0x4>
   4:	ff ff ff ff 	l.cust8 
   8:	01 00 01 7c 	l.j 40005f8 <__stack+0x3ba05fc>
   c:	23 0c 01 00 	.word 0x230c0100
  10:	09 23 09 00 	.word 0x09230900
  14:	00 00 00 14 	l.j 64 <__mulsi3+0x1c>
  18:	00 00 00 00 	l.j 18 <_reset+0x14>
  1c:	00 00 00 84 	l.j 22c <MMC_Command+0x94>
  20:	00 00 00 70 	l.j 1e0 <MMC_Command+0x48>
  24:	5c 0e 04 82 	.word 0x5c0e0482
  28:	01 00 00 00 	l.j 4000028 <__stack+0x3ba002c>
  2c:	00 00 00 14 	l.j 7c <__mulsi3+0x34>
  30:	00 00 00 00 	l.j 30 <bss_init_start+0x8>
  34:	00 00 00 f4 	l.j 404 <compare+0x14>
  38:	00 00 00 3c 	l.j 128 <SwapBBBB+0x34>
  3c:	4c 82 01 58 	l.maci r2,0x158
  40:	0e 04 00 00 	l.bnf f8100040 <__stack+0xf7ca0044>
  44:	00 00 00 0c 	l.j 74 <__mulsi3+0x2c>
  48:	00 00 00 00 	l.j 48 <__mulsi3>
  4c:	00 00 01 30 	l.j 50c <GetCluster+0xdc>
  50:	00 00 00 68 	l.j 1f0 <MMC_Command+0x58>
  54:	00 00 00 20 	l.j d4 <FatalError+0x50>
  58:	00 00 00 00 	l.j 58 <__mulsi3+0x10>
  5c:	00 00 01 98 	l.j 6bc <main+0x1a0>
  60:	00 00 01 2c 	l.j 510 <GetCluster+0xe0>
  64:	44 90 03 48 	l.jr r0
  68:	82 05 4c 92 	l.ld r16,0x4c92(r5)
  6c:	02 58 8e 04 	l.j f962387c <__stack+0xf91c3880>
  70:	89 01 54 0e 	l.lws r8,0x540e(r1)
  74:	14 00 00 00 	.word 0x14000000
  78:	00 00 00 14 	l.j c8 <FatalError+0x44>
  7c:	00 00 00 00 	l.j 7c <__mulsi3+0x34>
  80:	00 00 02 c4 	l.j b90 <main+0x674>
// fatal error
void FatalError(void)
{
  DEBUG_FUNC_IN();

  DisableCard();
  84:	00 00 01 2c 	l.j 534 <main+0x18>
  88:	58 0e 08 89 	.word 0x580e0889
  8c:	01 82 02 00 	l.j 608088c <__stack+0x5c20890>
}


// fatal error
void FatalError(void)
{
  90:	00 00 00 0c 	l.j c0 <FatalError+0x3c>
  DEBUG_FUNC_IN();

  DisableCard();
  94:	00 00 00 00 	l.j 94 <FatalError+0x10>
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  98:	00 00 03 f0 	l.j 1058 <__data_rom+0x19c>
}


// fatal error
void FatalError(void)
{
  9c:	00 00 00 40 	l.j 19c <MMC_Command+0x4>
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  a0:	00 00 00 1c 	l.j 110 <SwapBBBB+0x1c>
  a4:	00 00 00 00 	l.j a4 <FatalError+0x20>

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  a8:	00 00 04 30 	l.j 1168 <__data_rom+0x2ac>
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  ac:	00 00 00 ec 	l.j 45c <GetCluster+0x2c>
  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
  b0:	44 82 05 54 	l.jr r0

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  b4:	92 02 90 03 	l.lbs r16,0xffff9003(r2)
  b8:	8e 04 89 01 	l.lbz r16,0xffff8901(r4)
  bc:	4c 0e 14 00 	l.maci r14,0x1400
  c0:	00 00 00 28 	l.j 160 <MMC_CRC+0x30>
  c4:	00 00 00 00 	l.j c4 <FatalError+0x40>
  c8:	00 00 05 1c 	l.j 1538 <__rom_length+0x138>
    LEDS(0x0);
  cc:	00 00 09 80 	l.j 26cc <__rom_length+0x12cc>
    TIMER_wait(200);
  d0:	44 82 0a 02 	l.jr r1
  d4:	44 0e 2c 9c 	l.jr r5
  d8:	02 9a 03 98 	l.j fa680f38 <__stack+0xfa220f3c>
  dc:	04 96 05 94 	l.jal 258172c <__stack+0x2121730>
  e0:	06 92 07 90 	l.jal fa481f20 <__stack+0xfa021f24>
  e4:	08 8e 09 89 	.word 0x088e0989
    LEDS(led);
  e8:	01 00 00 00 	l.j 40000e8 <__stack+0x3ba00ec>

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00 00 00 00 	l.j 0 <__rom_start>
   4:	00 00 00 1c 	l.j 74 <__mulsi3+0x2c>
   8:	00 02 71 00 	l.j 9c408 <__ram_length+0x7c408>
   c:	00 00 00 1c 	l.j 7c <__mulsi3+0x34>
  10:	00 00 00 70 	l.j 1d0 <MMC_Command+0x38>
  14:	00 02 71 04 	l.j 9c424 <__ram_length+0x7c424>
	...
  20:	00 00 00 70 	l.j 1e0 <MMC_Command+0x48>
  24:	00 00 00 94 	l.j 274 <MMC_Command+0xdc>
  28:	00 02 71 00 	l.j 9c428 <__ram_length+0x7c428>
  2c:	00 00 00 94 	l.j 27c <MMC_Command+0xe4>
  30:	00 00 00 ac 	l.j 2e0 <MMC_Read+0x1c>
  34:	00 02 71 04 	l.j 9c444 <__ram_length+0x7c444>
	...
  40:	00 00 00 70 	l.j 200 <MMC_Command+0x68>
  44:	00 00 00 8c 	l.j 274 <MMC_Command+0xdc>
  48:	00 01 53 00 	l.j 54c48 <__ram_length+0x34c48>
	...
  54:	00 00 ac 00 	l.j 2b054 <__ram_length+0xb054>
  58:	00 00 bc 00 	l.j 2f058 <__ram_length+0xf058>
  5c:	01 53 00 00 	l.j 54c005c <__stack+0x5060060>
  60:	00 e8 00 00 	l.j 3a00060 <__stack+0x35a0064>
  64:	00 fc 00 05 	l.j 3f00078 <__stack+0x3aa007c>
  68:	73 00 31 24 	l.cust1 
  6c:	9f 00 00 01 	l.addi r24,r0,0x1
  70:	04 00 00 01 	l.jal 74 <__mulsi3+0x2c>
  74:	08 00 05 73 	.word 0x08000573
  78:	00 31 24 9f 	l.j c492f4 <__stack+0x7e92f8>
	...
// fatal error
void FatalError(void)
{
  DEBUG_FUNC_IN();

  DisableCard();
  84:	00 00 00 ac 	l.j 334 <MMC_Read+0x70>
  88:	00 00 00 bc 	l.j 378 <MMC_Read+0xb4>
  8c:	00 02 30 9f 	l.j 8c308 <__ram_length+0x6c308>
}


// fatal error
void FatalError(void)
{
  90:	00 00 00 f0 	l.j 450 <GetCluster+0x20>
  DEBUG_FUNC_IN();

  DisableCard();
  94:	00 00 01 14 	l.j 4e4 <GetCluster+0xb4>
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  98:	00 01 55 00 	l.j 55498 <__ram_length+0x35498>
	...
  a4:	00 01 14 00 	l.j 450a4 <__ram_length+0x250a4>

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  a8:	00 01 58 00 	l.j 560a8 <__ram_length+0x360a8>
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  ac:	02 71 00 00 	l.j f9c400ac <__stack+0xf97e00b0>
  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
  b0:	00 01 58 00 	l.j 560b0 <__ram_length+0x360b0>

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  b4:	00 02 40 00 	l.j 900b4 <__ram_length+0x700b4>
  b8:	02 71 14 00 	l.j f9c450b8 <__stack+0xf97e50bc>
	...
  c4:	00 01 14 00 	l.j 450c4 <__ram_length+0x250c4>
  c8:	00 01 63 00 	l.j 58cc8 <__ram_length+0x38cc8>
    LEDS(0x0);
  cc:	01 53 00 00 	l.j 54c00cc <__stack+0x50600d0>
	...
    TIMER_wait(200);
  d8:	01 14 00 00 	l.j 45000d8 <__stack+0x40a00dc>
  dc:	01 50 00 01 	l.j 54000e0 <__stack+0x4fa00e4>
  e0:	54 00 00 01 	.word 0x54000001
  e4:	50 00 00 02 	.word 0x50000002
    LEDS(led);
  e8:	34 00 01 5e 	.word 0x3400015e
	...

#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
  f4:	00 00 01 68 	l.j 694 <main+0x178>
  f8:	00 00 01 77 	l.j 6d4 <main+0x1b8>


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  fc:	00 01 53 00 	l.j 54cfc <__ram_length+0x34cfc>
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
 100:	00 01 80 00 	l.j 60100 <__ram_length+0x40100>
 104:	00 01 8f 00 	l.j 63d04 <__ram_length+0x43d04>
 108:	01 53 00 00 	l.j 54c0108 <__stack+0x506010c>
 10c:	01 98 00 00 	l.j 660010c <__stack+0x61a0110>
 110:	01 a7 00 01 	l.j 69c0114 <__stack+0x6560118>


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
 114:	53 00 00 01 	.word 0x53000001
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
 118:	ac 00 00 01 	l.xori r0,r0,0x1
 11c:	bb 00 01 53 	l.srli r24,r0,0x13
	...
}
 128:	00 00 01 d8 	l.j 888 <main+0x36c>
 12c:	00 00 01 dc 	l.j 89c <main+0x380>
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 130:	00 03 08 64 	l.j c22c0 <__ram_length+0xa22c0>
 134:	9f 00 00 01 	l.addi r24,r0,0x1
 138:	dc 00 00 02 	l.sh 0x2(r0),r0
 13c:	04 00 01 53 	l.jal 688 <main+0x16c>
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
 140:	00 00 02 04 	l.j 950 <main+0x434>
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
    crc <<= 1;
 144:	00 00 02 0c 	l.j 974 <main+0x458>
    if (c & 0x80)   crc ^= 0x09;
 148:	00 03 73 7f 	l.j dcf44 <__ram_length+0xbcf44>
 14c:	9f 00 00 02 	l.addi r24,r0,0x2
 150:	14 00 00 02 	.word 0x14000002
 154:	1c 00 03 73 	.word 0x1c000373
    if (crc & 0x80) crc ^= 0x09;
 158:	7f 9f 00 00 	l.cust4 
	...
 164:	02 40 00 00 	l.j f9000164 <__stack+0xf8ba0168>
 168:	02 58 00 02 	l.j f9600170 <__stack+0xf91a0174>
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 16c:	71 00 00 00 	l.cust1 
 170:	02 58 00 00 	l.j f9600170 <__stack+0xf91a0174>
 174:	03 6c 00 02 	l.j fdb0017c <__stack+0xfd6a0180>
 178:	71 08 00 00 	l.cust1 
	...
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
    if (crc & 0x80) crc ^= 0x09;
    c <<= 1;
 184:	02 40 00 00 	l.j f9000184 <__stack+0xf8ba0188>
 188:	02 48 00 01 	l.j f920018c <__stack+0xf8da0190>
 18c:	53 00 00 02 	.word 0x53000002
  }

  DEBUG_FUNC_OUT();
}
 190:	48 00 00 02 	l.jalr r0
 194:	6c 00 01 55 	.word 0x6c000155
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 198:	00 00 02 6c 	l.j b48 <main+0x62c>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 19c:	00 00 02 77 	l.j b78 <main+0x65c>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1a0:	00 01 55 00 	l.j 555a0 <__ram_length+0x355a0>
	...
 1ac:	00 02 40 00 	l.j 901ac <__ram_length+0x701ac>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 1b0:	00 02 68 00 	l.j 9a1b0 <__ram_length+0x7a1b0>
  SPI(0xFF); // flush SPI-bus
 1b4:	01 54 00 00 	l.j 55001b4 <__stack+0x50a01b8>
 1b8:	02 68 00 00 	l.j f9a001b8 <__stack+0xf95a01bc>
 1bc:	02 c0 00 01 	l.j fb0001c0 <__stack+0xfaba01c4>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1c0:	52 00 00 02 	.word 0x52000002
 1c4:	d0 00 00 03 	l.sd 0x3(r0),r0
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus
 1c8:	10 00 01 52 	l.bf 710 <main+0x1f4>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1cc:	00 00 03 10 	l.j e0c <main+0x8f0>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus
 1d0:	00 00 03 1c 	l.j e40 <main+0x924>

  SPI(cmd);
 1d4:	00 03 72 01 	l.j dc9d8 <__ram_length+0xbc9d8>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1d8:	9f 00 00 03 	l.addi r24,r0,0x3
  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus

  SPI(cmd);
 1dc:	1c 00 00 03 	.word 0x1c000003
  MMC_CRC(cmd);
 1e0:	28 00 03 72 	lv.sub.h r0,r0,r0
 1e4:	02 9f 00 00 	l.j fa7c01e4 <__stack+0xfa3601e8>

  c = (unsigned char)(arg >> 24);
 1e8:	03 28 00 00 	l.j fca001e8 <__stack+0xfc5a01ec>
  SPI(c);
 1ec:	03 38 00 03 	l.j fce001f8 <__stack+0xfc9a01fc>
 1f0:	72 03 9f 00 	l.cust1 
  MMC_CRC(c);
 1f4:	00 03 38 00 	l.j ce1f4 <__ram_length+0xae1f4>
 1f8:	00 03 4c 00 	l.j d31f8 <__ram_length+0xb31f8>

  c = (unsigned char)(arg >> 16);
 1fc:	01 52 00 00 	l.j 54801fc <__stack+0x5020200>
	...
  SPI(c);
 208:	03 6c 00 00 	l.j fdb00208 <__stack+0xfd6a020c>
  MMC_CRC(c);
 20c:	03 74 00 01 	l.j fdd00210 <__stack+0xfd8a0214>
 210:	53 00 00 00 	.word 0x53000000

  c = (unsigned char)(arg >> 8);
 214:	00 00 00 00 	l.j 214 <MMC_Command+0x7c>
 218:	00 00 00 03 	l.j 224 <MMC_Command+0x8c>
  SPI(c);
 21c:	6c 00 00 03 	.word 0x6c000003
 220:	74 00 01 54 	l.cust2 
	...
  MMC_CRC(c);

  c = (unsigned char)(arg);
 22c:	00 00 03 6c 	l.j fdc <__data_rom+0x120>
  SPI(c);
 230:	00 00 03 74 	l.j 1000 <__data_rom+0x144>
 234:	00 02 30 9f 	l.j 8c4b0 <__ram_length+0x6c4b0>
  MMC_CRC(c);
 238:	00 00 03 74 	l.j 1008 <__data_rom+0x14c>
 23c:	00 00 03 8c 	l.j 106c <__data_rom+0x1b0>

  crc <<= 1;
 240:	00 01 56 00 	l.j 55a40 <__ram_length+0x35a40>
 244:	00 03 8c 00 	l.j e3244 <__ram_length+0xc3244>
  crc++;
 248:	00 03 ac 00 	l.j eb248 <__ram_length+0xcb248>
 24c:	01 56 00 00 	l.j 558024c <__stack+0x5120250>
	...
  SPI(crc);
 258:	03 ac 00 00 	l.j feb00258 <__stack+0xfe6a025c>

  unsigned char Ncr = 100;  // Ncr = 0..8 (SD) / 1..8 (MMC)
 25c:	03 d0 00 02 	l.j ff400264 <__stack+0xfefa0268>
  do {
    response = SPI(0xFF); // get response
 260:	71 00 00 00 	l.cust1 
 264:	03 d0 00 00 	l.j ff400264 <__stack+0xfefa0268>
 268:	04 98 00 02 	l.jal 2600270 <__stack+0x21a0274>
  } while (response == 0xFF && Ncr--);
 26c:	71 14 00 00 	l.cust1 
	...
 278:	03 ac 00 00 	l.j feb00278 <__stack+0xfe6a027c>
 27c:	03 f8 00 01 	l.j ffe00280 <__stack+0xff9a0284>
 280:	53 00 00 00 	.word 0x53000000
 284:	00 00 00 00 	l.j 284 <MMC_Command+0xec>
 288:	00 00 00 03 	l.j 294 <MMC_Command+0xfc>
 28c:	dc 00 00 03 	l.sh 0x3(r0),r0
 290:	e4 00 01 52 	l.sfeq r0,r0
 294:	00 00 03 ec 	l.j 1244 <__data_rom+0x388>
 298:	00 00 04 3c 	l.j 1388 <__data_rom+0x4cc>
 29c:	00 01 52 00 	l.j 54a9c <__ram_length+0x34a9c>
 2a0:	00 04 5c 00 	l.j 1172a0 <__ram_length+0xf72a0>
 2a4:	00 04 60 00 	l.j 1182a4 <__ram_length+0xf82a4>

  return response;

  DEBUG_FUNC_OUT();
}
 2a8:	01 52 00 00 	l.j 54802a8 <__stack+0x50202ac>
	...
 2b4:	03 dc 00 00 	l.j ff7002b4 <__stack+0xff2a02b8>
 2b8:	03 e4 00 01 	l.j ff9002bc <__stack+0xff4a02c0>
 2bc:	5e 00 00 03 	.word 0x5e000003
 2c0:	e8 00 00 04 	.word 0xe8000004
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2c4:	8c 00 01 5e 	l.lbz r0,0x15e(r0)
	...
 2d0:	00 00 04 6c 	l.j 1480 <__rom_length+0x80>
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2d4:	00 00 04 74 	l.j 14a4 <__rom_length+0xa4>
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2d8:	00 01 52 00 	l.j 54ad8 <__ram_length+0x34ad8>
	...
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2e4:	00 04 98 00 	l.j 1262e4 <__ram_length+0x1062e4>
 2e8:	00 04 e0 00 	l.j 1382e8 <__ram_length+0x1182e8>
    lba = lba << 9; // otherwise convert sector adddress to byte address
 2ec:	02 71 00 00 	l.j f9c402ec <__stack+0xf97e02f0>
  }

  //EnableCard();

  if (MMC_Command(CMD17, lba)) {
 2f0:	00 04 e0 00 	l.j 1382f0 <__ram_length+0x1182f0>
 2f4:	00 0e 18 00 	l.j 3862f4 <__ram_length+0x3662f4>
 2f8:	02 71 2c 00 	l.j f9c4b2f8 <__stack+0xf97eb2fc>
	...
 304:	00 05 00 00 	l.j 140304 <__ram_length+0x120304>
 308:	00 05 08 00 	l.j 142308 <__ram_length+0x122308>
    //DisableCard();
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
 30c:	02 30 9f 00 	l.j f8c27f0c <__stack+0xf87c7f10>
  while ((SPI(0xFF)) != 0xFE) {
 310:	00 05 18 00 	l.j 146310 <__ram_length+0x126310>
    //DisableCard();
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
 314:	00 05 2c 00 	l.j 14b314 <__ram_length+0x12b314>
 318:	01 53 00 00 	l.j 54c0318 <__stack+0x506031c>
  while ((SPI(0xFF)) != 0xFE) {
 31c:	05 9c 00 00 	l.jal 670031c <__stack+0x62a0320>
 320:	05 b0 00 01 	l.jal 6c00324 <__stack+0x67a0328>
 324:	5e 00 00 00 	.word 0x5e000000
 328:	00 00 00 00 	l.j 328 <MMC_Read+0x64>
    if (timeout++ >= 1000000) { // we can't wait forever
 32c:	00 00 00 07 	l.j 348 <MMC_Read+0x84>
 330:	7c 00 00 07 	l.cust4 
 334:	80 00 05 03 	l.ld r0,0x503(r0)
 338:	00 44 02 1c 	l.j 1100ba8 <__stack+0xca0bac>
 33c:	00 00 07 80 	l.j 213c <__rom_length+0xd3c>
 340:	00 00 07 88 	l.j 2160 <__rom_length+0xd60>
      //printf("CMD17 (READ_BLOCK): no data token! (lba=%lu)\r", lba);
      //DisableCard();
      return(0);
 344:	00 0c 03 00 	l.j 300f44 <__ram_length+0x2e0f44>
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
    if (timeout++ >= 1000000) { // we can't wait forever
 348:	44 02 1c 06 	l.jr r3
 34c:	73 00 40 24 	l.cust1 
 350:	1c 9f 00 00 	.word 0x1c9f0000
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 354:	07 8c 00 00 	l.jal fe300354 <__stack+0xfdea0358>
 358:	07 a0 00 01 	l.jal fe80035c <__stack+0xfe3a0360>
 35c:	53 00 00 00 	.word 0x53000000
 360:	00 00 00 00 	l.j 360 <MMC_Read+0x9c>
 364:	00 00 00 07 	l.j 380 <MMC_Read+0xbc>
 368:	80 00 00 07 	l.ld r0,0x7(r0)
  DEBUG_FUNC_OUT();
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
 36c:	88 00 05 73 	l.lws r0,0x573(r0)
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 370:	00 40 24 9f 	l.j 10095ec <__stack+0xba95f0>
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
    *(pReadBuffer++) = SPI(0xFF);
 374:	00 00 07 88 	l.j 2194 <__rom_length+0xd94>
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 378:	00 00 07 8c 	l.j 21a8 <__rom_length+0xda8>
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
    *(pReadBuffer++) = SPI(0xFF);
 37c:	00 01 53 00 	l.j 54f7c <__ram_length+0x34f7c>
	...
 388:	00 05 b0 00 	l.j 16c388 <__ram_length+0x14c388>
 38c:	00 0b 98 00 	l.j 2e638c <__ram_length+0x2c638c>
 390:	04 0a 0f a0 	l.jal 284210 <__ram_length+0x264210>
    *(pReadBuffer++) = SPI(0xFF);
 394:	9f 00 00 0b 	l.addi r24,r0,0xb
 398:	a0 00 00 0e 	l.addic r0,r0,0xe
 39c:	18 00 04 0a 	l.movhi r0,0x40a
    *(pReadBuffer++) = SPI(0xFF);
 3a0:	0f a0 9f 00 	l.bnf fe827fa0 <__stack+0xfe3c7fa4>
	...
    *(pReadBuffer++) = SPI(0xFF);
 3ac:	00 05 b4 00 	l.j 16d3ac <__ram_length+0x14d3ac>
 3b0:	00 05 bc 00 	l.j 16f3b0 <__ram_length+0x14f3b0>
 3b4:	01 5e 00 00 	l.j 57803b4 <__stack+0x53203b8>
  DEBUG_FUNC_OUT();
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
 3b8:	05 bc 00 00 	l.jal 6f003b8 <__stack+0x6aa03bc>
      //DisableCard();
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
 3bc:	05 c8 00 01 	l.jal 72003c0 <__stack+0x6da03c4>
 3c0:	5e 00 00 05 	.word 0x5e000005
 3c4:	c8 00 00 07 	lf.madd.s r0,r0,r0
    *(pReadBuffer++) = SPI(0xFF);
    *(pReadBuffer++) = SPI(0xFF);
    *(pReadBuffer++) = SPI(0xFF);
  }

  SPI(0xFF); // read CRC lo byte
 3c8:	1c 00 01 5e 	.word 0x1c00015e
 3cc:	00 00 07 70 	l.j 218c <__rom_length+0xd8c>
  SPI(0xFF); // read CRC hi byte
 3d0:	00 00 07 7c 	l.j 21c0 <__rom_length+0xdc0>
 3d4:	00 01 5e 00 	l.j 57bd4 <__ram_length+0x37bd4>

  //DisableCard();
  return(1);
 3d8:	00 0d e0 00 	l.j 3783d8 <__ram_length+0x3583d8>

  DEBUG_FUNC_OUT();
}
 3dc:	00 0d fc 00 	l.j 37f3dc <__ram_length+0x35f3dc>
 3e0:	01 5e 00 00 	l.j 57803e0 <__stack+0x53203e4>
	...
 3ec:	06 cc 00 00 	l.jal fb3003ec <__stack+0xfaea03f0>


int compare(const char *s1, const char *s2,int b)
{
	int i;
	for(i=0;i<b;++i)
 3f0:	06 d0 00 01 	l.jal fb4003f4 <__stack+0xfafa03f8>
 3f4:	5e 00 00 06 	.word 0x5e000006
#define printf(...)
#define putserial(x)
#define BootPrint(x) puts(x);


int compare(const char *s1, const char *s2,int b)
 3f8:	d0 00 00 06 	l.sd 0x6(r0),r0
{
	int i;
	for(i=0;i<b;++i)
	{
		if(*s1++!=*s2++)
 3fc:	d4 00 08 7e 	l.sw 0x7e(r0),r1
 400:	00 73 00 40 	l.j 1cc0500 <__stack+0x1860504>
 404:	24 1c 9f 00 	l.rfe 
 408:	00 06 d8 00 	l.j 1b6408 <__ram_length+0x196408>
 40c:	00 06 ec 00 	l.j 1bb40c <__ram_length+0x19b40c>


int compare(const char *s1, const char *s2,int b)
{
	int i;
	for(i=0;i<b;++i)
 410:	01 53 00 00 	l.j 54c0410 <__stack+0x5060414>
	...
	{
		if(*s1++!=*s2++)
			return(1);
	}
	return(0);
 41c:	06 d0 00 00 	l.jal fb40041c <__stack+0xfafa0420>
 420:	06 d4 00 05 	l.jal fb500434 <__stack+0xfb0a0438>
{
	int i;
	for(i=0;i<b;++i)
	{
		if(*s1++!=*s2++)
			return(1);
 424:	73 00 40 24 	l.cust1 
	}
	return(0);
}
 428:	9f 00 00 06 	l.addi r24,r0,0x6
 42c:	d4 00 00 06 	l.sw 0x6(r0),r0
    return(1);
}


int GetCluster(int cluster)
{
 430:	d8 00 01 53 	l.sb 0x153(r0),r0
	...
 43c:	00 00 07 f4 	l.j 240c <__rom_length+0x100c>
 440:	00 00 08 80 	l.j 2640 <__rom_length+0x1240>
 444:	00 02 30 9f 	l.j 8c6c0 <__ram_length+0x6c6c0>
	int i;
	uint32_t sb;
    if (fat32)
 448:	00 00 08 80 	l.j 2648 <__rom_length+0x1248>
 44c:	00 00 08 94 	l.j 269c <__rom_length+0x129c>
 450:	00 01 5e 00 	l.j 57c50 <__ram_length+0x37c50>
 454:	00 08 94 00 	l.j 225454 <__ram_length+0x205454>
 458:	00 08 9c 00 	l.j 227458 <__ram_length+0x207458>
    {
        sb = cluster >> 7; // calculate sector number containing FAT-link
 45c:	01 5b 00 00 	l.j 56c045c <__stack+0x5260460>
        i = cluster & 0x7F; // calculate link offsset within sector
 460:	08 9c 00 00 	.word 0x089c0000
 464:	08 c8 00 01 	.word 0x08c80001
    }
    else
    {
        sb = cluster >> 8; // calculate sector number containing FAT-link
 468:	5e 00 00 08 	.word 0x5e000008
        i = cluster & 0xFF; // calculate link offsset within sector
 46c:	c8 00 00 09 	lf.sfne.s r0,r0
    }

    // read sector of FAT if not already in the buffer
    if (sb != buffered_fat_index)
 470:	b8 00 01 5e 	l.srli r0,r0,0x1e
	...
 47c:	00 00 08 68 	l.j 261c <__rom_length+0x121c>
 480:	00 00 08 c8 	l.j 27a0 <__rom_length+0x13a0>
 484:	00 06 03 00 	l.j 181084 <__ram_length+0x161084>
    {
        if (!MMC_Read(fat_start + sb, (unsigned char*)&fat_buffer))
 488:	44 00 00 9f 	l.jr r0
	...
 494:	00 00 0b 68 	l.j 3234 <__rom_length+0x1e34>
 498:	00 00 0b 98 	l.j 32f8 <__rom_length+0x1ef8>
 49c:	00 06 0c 00 	l.j 18349c <__ram_length+0x16349c>
 4a0:	40 00 00 9f 	.word 0x4000009f
 4a4:	00 00 0b a0 	l.j 3324 <__rom_length+0x1f24>
 4a8:	00 00 0d 34 	l.j 3978 <__rom_length+0x2578>
            return(0);

        // remember current buffer index
        buffered_fat_index = sb;
 4ac:	00 06 0c 00 	l.j 1834ac <__ram_length+0x1634ac>
    }
    i = fat32 ? SwapBBBB(fat_buffer.fat32[i]) & 0x0FFFFFFF : SwapBB(fat_buffer.fat16[i]); // get FAT link for 68000 
 4b0:	40 00 00 9f 	.word 0x4000009f
 4b4:	00 00 0d 34 	l.j 3984 <__rom_length+0x2584>
 4b8:	00 00 0d 8c 	l.j 3ae8 <__rom_length+0x26e8>
 4bc:	00 01 60 00 	l.j 584bc <__ram_length+0x384bc>
 4c0:	00 0d 8c 00 	l.j 3634c0 <__ram_length+0x3434c0>
 4c4:	00 0d 98 00 	l.j 3664c4 <__ram_length+0x3464c4>
 4c8:	01 60 00 00 	l.j 58004c8 <__stack+0x53a04cc>
	...
 4d4:	0b 68 00 00 	.word 0x0b680000
 4d8:	0b 98 00 06 	.word 0x0b980006
 4dc:	03 00 00 0e 	l.j fc000514 <__stack+0xfbba0518>
 4e0:	ae 9f 00 00 	l.xori r20,r31,0x0
 4e4:	0b a0 00 00 	.word 0x0ba00000
 4e8:	0d e0 00 06 	l.bnf 7800500 <__stack+0x73a0504>
 4ec:	03 00 00 0e 	l.j fc000524 <__stack+0xfbba0528>


uint16_t SwapBB(uint16_t i)
{
  return ((i&0x00ff)<<8) | ((i&0xff00)>>8);
 4f0:	ae 9f 00 00 	l.xori r20,r31,0x0
	...
 4fc:	0b 68 00 00 	.word 0x0b680000
	return(i);
}
 500:	0b 98 00 06 	.word 0x0b980006
 504:	03 00 00 0e 	l.j fc00053c <__stack+0xfbba0540>
 508:	ae 9f 00 00 	l.xori r20,r31,0x0
 50c:	0b a0 00 00 	.word 0x0ba00000
 510:	0d e0 00 06 	l.bnf 7800528 <__stack+0x73a052c>
 514:	03 00 00 0e 	l.j fc00054c <__stack+0xfbba0550>
 518:	ae 9f 00 00 	l.xori r20,r31,0x0
	...

  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
 524:	0b 68 00 00 	.word 0x0b680000
 528:	0b 98 00 02 	.word 0x0b980002
void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
{
 52c:	30 9f 00 00 	.word 0x309f0000
 530:	0b a0 00 00 	.word 0x0ba00000
 534:	0b cc 00 02 	.word 0x0bcc0002
 538:	30 9f 00 00 	.word 0x309f0000
 53c:	0b cc 00 00 	.word 0x0bcc0000
 540:	0b ec 00 01 	.word 0x0bec0001
 544:	52 00 00 0b 	.word 0x5200000b
 548:	f8 00 00 0c 	l.cust7 
 54c:	00 00 06 03 	l.j 1d58 <__rom_length+0x958>

  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
 550:	00 44 00 00 	l.j 1100550 <__stack+0xca0554>
 554:	9f 00 00 0c 	l.addi r24,r0,0xc
 558:	00 00 00 0c 	l.j 588 <main+0x6c>
 55c:	04 00 01 52 	l.jal aa4 <main+0x588>
void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
{
 560:	00 00 0c 04 	l.j 3570 <__rom_length+0x2170>

  // !!! a pointer to start of RAM
  unsigned char* ram = ((unsigned char *)0x400000);

  // initialize SD card
  LEDS(led=0xf);
 564:	00 00 0c 84 	l.j 3774 <__rom_length+0x2374>
  DEBUG_FUNC_IN();

    unsigned char n;
    unsigned char ocr[4];

    SPI_slow();     // set slow clock
 568:	00 01 52 00 	l.j 54d68 <__ram_length+0x34d68>
 56c:	00 0c d8 00 	l.j 33656c <__ram_length+0x31656c>
 570:	00 0d 34 00 	l.j 34d570 <__ram_length+0x32d570>
    DisableCard();  // CS = 1
 574:	01 52 00 00 	l.j 5480574 <__stack+0x5020578>
	...
 580:	0b 88 00 00 	.word 0x0b880000
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
 584:	0b 98 00 05 	.word 0x0b980005
 588:	03 00 44 02 	l.j fc011590 <__stack+0xfbbb1594>
 58c:	30 00 00 0b 	.word 0x3000000b
 590:	a0 00 00 0b 	l.addic r0,r0,0xb
 594:	e8 00 01 5e 	.word 0xe800015e
 598:	00 00 0b e8 	l.j 3538 <__rom_length+0x2138>
 59c:	00 00 0c 00 	l.j 359c <__rom_length+0x219c>
 5a0:	00 01 6c 00 	l.j 5b5a0 <__ram_length+0x3b5a0>
 5a4:	00 0c 00 00 	l.j 3005a4 <__ram_length+0x2e05a4>
    TIMER_wait(20);  // 20ms delay
 5a8:	00 0c 9c 00 	l.j 3275a8 <__ram_length+0x3075a8>
 5ac:	01 5e 00 00 	l.j 57805ac <__stack+0x53205b0>
 5b0:	0c d8 00 00 	l.bnf 36005b0 <__stack+0x31a05b4>
 5b4:	0d 2c 00 01 	l.bnf 4b005b8 <__stack+0x46a05bc>
 5b8:	5e 00 00 0d 	.word 0x5e00000d
 5bc:	2c 00 00 0d 	.word 0x2c00000d
 5c0:	34 00 01 5e 	.word 0x3400015e
	...
    EnableCard();
 5cc:	00 00 0b 80 	l.j 33cc <__rom_length+0x1fcc>
 5d0:	00 00 0b 98 	l.j 3430 <__rom_length+0x2030>

    CardType = CARDTYPE_NONE;

    for(n=0; n<16; n++) {
 5d4:	00 05 03 00 	l.j 1411d4 <__ram_length+0x1211d4>
    SPI_slow();     // set slow clock
    DisableCard();  // CS = 1
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
    TIMER_wait(20);  // 20ms delay
    EnableCard();
 5d8:	44 02 2c 00 	l.jr r5

    CardType = CARDTYPE_NONE;
 5dc:	00 0b a0 00 	l.j 2e85dc <__ram_length+0x2c85dc>
 5e0:	00 0c b0 00 	l.j 32c5e0 <__ram_length+0x30c5e0>
 5e4:	01 62 00 00 	l.j 58805e4 <__stack+0x54205e8>

    for(n=0; n<16; n++) {
      TIMER_wait(1);
 5e8:	0c d8 00 00 	l.bnf 36005e8 <__stack+0x31a05ec>
    //SPI(0xff);      // DI = 1
    for (n=0; n<10; n++) SPI(0xff); // 80 dummy clocks, DI = 1
    TIMER_wait(20);  // 20ms delay
    EnableCard();

    CardType = CARDTYPE_NONE;
 5ec:	0d 00 00 01 	l.bnf 40005f0 <__stack+0x3ba05f4>

    for(n=0; n<16; n++) {
      TIMER_wait(1);
 5f0:	62 00 00 0d 	.word 0x6200000d
 5f4:	00 00 00 0d 	l.j 628 <main+0x10c>
 5f8:	27 00 01 5b 	l.rfe 
 5fc:	00 00 0d 27 	l.j 3a98 <__rom_length+0x2698>
 600:	00 00 0d 34 	l.j 3ad0 <__rom_length+0x26d0>
 604:	00 01 62 00 	l.j 58e04 <__ram_length+0x38e04>
	...
      if (MMC_Command(CMD0, 0) == 0x01) break; // try to send CMD0 multiple times
 610:	00 0b cc 00 	l.j 2f3610 <__ram_length+0x2d3610>
 614:	00 0b d4 00 	l.j 2f5614 <__ram_length+0x2d5614>
 618:	02 30 9f 00 	l.j f8c28218 <__stack+0xf87c821c>
    TIMER_wait(20);  // 20ms delay
    EnableCard();

    CardType = CARDTYPE_NONE;

    for(n=0; n<16; n++) {
 61c:	00 0b d4 00 	l.j 2f561c <__ram_length+0x2d561c>
 620:	00 0c dc 00 	l.j 337620 <__ram_length+0x317620>
 624:	01 64 00 00 	l.j 5900624 <__stack+0x54a0628>
 628:	0c dc 00 00 	l.bnf 3700628 <__stack+0x32a062c>
 62c:	0d 34 00 01 	l.bnf 4d00630 <__stack+0x48a0634>
 630:	64 00 00 00 	.word 0x64000000
}

//// timer ////
unsigned long GetTimer(unsigned long offset)
{
  unsigned long systimer = TIMER_get();
 634:	00 00 00 00 	l.j 634 <main+0x118>
  systimer = systimer<< 16;
  systimer += offset << 16;
 638:	00 00 00 0b 	l.j 664 <main+0x148>

//// timer ////
unsigned long GetTimer(unsigned long offset)
{
  unsigned long systimer = TIMER_get();
  systimer = systimer<< 16;
 63c:	c0 00 00 0c 	l.mtspr r0,r0,0xc
    }
    if (n<16) // got CMD0 IDLE response
    { // idle state
        //timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
 640:	b4 00 01 68 	l.mfspr r0,r0,0x168
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
 644:	00 00 0c d8 	l.j 39a4 <__rom_length+0x25a4>
  systimer += offset << 16;
 648:	00 00 0d 34 	l.j 3b18 <__rom_length+0x2718>
    }
    if (n<16) // got CMD0 IDLE response
    { // idle state
        //timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
 64c:	00 01 68 00 	l.j 5a64c <__ram_length+0x3a64c>
	...
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
 658:	00 0b 68 00 	l.j 2da658 <__ram_length+0x2ba658>
 65c:	00 0b 98 00 	l.j 2e665c <__ram_length+0x2c665c>
 660:	06 03 00 44 	l.jal f80c0770 <__stack+0xf7c60774>
 664:	02 0c 9f 00 	l.j f8328264 <__stack+0xf7ec8268>
        {   // SDHC card
            for (n = 0; n < 4; n++)
                ocr[n] = SPI(0xFF); // get the rest of R7 response
 668:	00 0b a0 00 	l.j 2e8668 <__ram_length+0x2c8668>
    { // idle state
        //timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
 66c:	00 0d e0 00 	l.j 37866c <__ram_length+0x35866c>

void main(void) __attribute__ ((noreturn));
void FatalError(void) __attribute__ ((noreturn));


void main(void)
 670:	06 03 00 44 	l.jal f80c0780 <__stack+0xf7c60784>
 674:	02 0c 9f 00 	l.j f8328274 <__stack+0xf7ec8278>
	...
        {   // SDHC card
            for (n = 0; n < 4; n++)
                ocr[n] = SPI(0xFF); // get the rest of R7 response
 680:	00 0c 6c 00 	l.j 31b680 <__ram_length+0x2fb680>
 684:	00 0c 74 00 	l.j 31d684 <__ram_length+0x2fd684>
 688:	01 53 00 00 	l.j 54c0688 <__stack+0x506068c>
	...
        //printf("timeout:%08X\r",timeout);
        timeout = GetTimer(4000); // initialization timeout 4s
        //printf("timeout:%08X\r",timeout);
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
        {   // SDHC card
            for (n = 0; n < 4; n++)
 694:	0c 84 00 00 	l.bnf 2100694 <__stack+0x1ca0698>
 698:	0c 8c 00 01 	l.bnf 230069c <__stack+0x1ea06a0>
                ocr[n] = SPI(0xFF); // get the rest of R7 response
            if (ocr[2] == 0x01 && ocr[3] == 0xAA)
 69c:	52 00 00 00 	.word 0x52000000
 6a0:	00 00 00 00 	l.j 6a0 <main+0x184>
 6a4:	00 00 00 0c 	l.j 6d4 <main+0x1b8>
 6a8:	c4 00 00 0c 	.word 0xc400000c
 6ac:	d8 00 01 6a 	l.sb 0x16a(r0),r0
 6b0:	00 00 0d 34 	l.j 3b80 <__rom_length+0x2780>
 6b4:	00 00 0d 98 	l.j 3d14 <__rom_length+0x2914>
 6b8:	00 01 6a 00 	l.j 5aeb8 <__ram_length+0x3aeb8>
	...
                //printf("SDHC card detected\r");
                while (!CheckTimer(timeout))
                { // now we must wait until CMD41 returns 0 (or timeout elapses)
                    if (MMC_Command(CMD55, 0) == 0x01)
                    { // CMD55 must precede any ACMD command
                        if (MMC_Command(CMD41, 1 << 30) == 0x00) // ACMD41 with HCS bit
 6c4:	00 0c c4 00 	l.j 3316c4 <__ram_length+0x3116c4>
 6c8:	00 0c d8 00 	l.j 3366c8 <__ram_length+0x3166c8>
 6cc:	02 30 9f 00 	l.j f8c282cc <__stack+0xf87c82d0>
	...
                        { // initialization completed
                            if (MMC_Command(CMD58, 0) == 0x00)
 6d8:	00 0c c4 00 	l.j 3316d8 <__ram_length+0x3116d8>
 6dc:	00 0c d8 00 	l.j 3366dc <__ram_length+0x3166dc>
 6e0:	02 30 9f 00 	l.j f8c282e0 <__stack+0xf87c82e4>
 6e4:	00 0d 34 00 	l.j 34d6e4 <__ram_length+0x32d6e4>
 6e8:	00 0d 6c 00 	l.j 35b6e8 <__ram_length+0x33b6e8>
                            { // check CCS (Card Capacity Status) bit in the OCR
                                for (n = 0; n < 4; n++)
                                    ocr[n] = SPI(0xFF);
 6ec:	01 52 00 00 	l.j 54806ec <__stack+0x50206f0>
 6f0:	0d 6c 00 00 	l.bnf 5b006f0 <__stack+0x56a06f4>
 6f4:	0d 8c 00 01 	l.bnf 63006f8 <__stack+0x5ea06fc>
 6f8:	52 00 00 0d 	.word 0x5200000d
 6fc:	8c 00 00 0d 	l.lbz r0,0xd(r0)
 700:	98 00 01 52 	l.lhs r0,0x152(r0)
	...
                    { // CMD55 must precede any ACMD command
                        if (MMC_Command(CMD41, 1 << 30) == 0x00) // ACMD41 with HCS bit
                        { // initialization completed
                            if (MMC_Command(CMD58, 0) == 0x00)
                            { // check CCS (Card Capacity Status) bit in the OCR
                                for (n = 0; n < 4; n++)
 70c:	00 00 0d 3c 	l.j 3bfc <__rom_length+0x27fc>
                                    ocr[n] = SPI(0xFF);

                                CardType = (ocr[0] & 0x40) ? CARDTYPE_SDHC : CARDTYPE_SD; // if CCS set then the card is SDHC compatible
 710:	00 00 0d 47 	l.j 3c2c <__rom_length+0x282c>
 714:	00 05 03 00 	l.j 141314 <__ram_length+0x121314>
 718:	44 02 28 00 	l.jr r5
 71c:	00 0d 47 00 	l.j 35231c <__ram_length+0x33231c>
 720:	00 0d 4c 00 	l.j 353720 <__ram_length+0x333720>
 724:	01 64 00 00 	l.j 5900724 <__stack+0x54a0728>
 728:	0d 4c 00 00 	l.bnf 5300728 <__stack+0x4ea072c>
 72c:	0d 50 00 01 	l.bnf 5400730 <__stack+0x4fa0734>
 730:	5b 00 00 0d 	.word 0x5b00000d
                            }
                            //printf("CMD58 (READ_OCR) failed!\r");
                            //DisableCard();

                            // set appropriate SPI speed
                            SPI_fast();
 734:	50 00 00 0d 	.word 0x5000000d
 738:	5f 00 0d 72 	.word 0x5f000d72
 73c:	00 03 00 44 	l.j c084c <__ram_length+0xa084c>
 740:	02 04 06 1a 	l.j f8101fa8 <__stack+0xf7ca1fac>
                                //printf("CMD16 (SET_BLOCKLEN) failed!\r");
                            //DisableCard();

                            // set appropriate SPI speed
                            SPI_fast();
                            return(CardType);
 744:	7b 00 22 9f 	l.cust3 
	...
}


unsigned long CheckTimer(unsigned long time)
{
  unsigned long systimer = TIMER_get();
 750:	00 00 0d c4 	l.j 3e60 <__rom_length+0x2a60>
  systimer = systimer<< 16;
 754:	00 00 0d e0 	l.j 3ed4 <__rom_length+0x2ad4>
  time -= systimer;
 758:	00 06 0c 00 	l.j 183758 <__ram_length+0x163758>
  if(time & 0x80000000) return(1);
 75c:	40 00 04 9f 	.word 0x4000049f
	...

Disassembly of section .debug_pubnames:

00000000 <.debug_pubnames>:
   0:	00 00 00 17 	l.j 5c <__mulsi3+0x14>
   4:	00 02 00 00 	l.j 80004 <__ram_length+0x60004>
   8:	00 00 00 00 	l.j 8 <_reset+0x4>
   c:	0b 3a 00 00 	.word 0x0b3a0000
  10:	06 4f 6d 61 	l.jal f93db594 <__stack+0xf8f7b598>
  14:	69 6e 00 00 	.word 0x696e0000
  18:	Address 0x00000018 is out of bounds.


Disassembly of section .debug_pubtypes:

00000000 <.debug_pubtypes>:
   0:	00 00 00 c6 	l.j 318 <MMC_Read+0x54>
   4:	00 02 00 00 	l.j 80004 <__ram_length+0x60004>
   8:	00 00 00 00 	l.j 8 <_reset+0x4>
   c:	0b 3a 00 00 	.word 0x0b3a0000
  10:	00 48 75 69 	l.j 121d5b4 <__stack+0xdbd5b8>
  14:	6e 74 31 36 	.word 0x6e743136
  18:	5f 74 00 00 	.word 0x5f740000
  1c:	00 00 5a 75 	l.j 169f0 <__rom_length+0x155f0>
  20:	69 6e 74 33 	.word 0x696e7433
  24:	32 5f 74 00 	.word 0x325f7400
  28:	00 00 00 d2 	l.j 370 <MMC_Read+0xac>
  2c:	75 69 6e 74 	l.cust2 
  30:	33 32 5f 74 	.word 0x33325f74
  34:	00 00 00 00 	l.j 34 <bss_init_start+0xc>
  38:	dd 75 69 6e 	l.sh 0x596e(r21),r13
  3c:	74 31 36 5f 	l.cust2 
  40:	74 00 00 00 	l.cust2 
  44:	00 e8 75 69 	l.j 3a1d5e8 <__stack+0x35bd5ec>
  48:	6e 74 33 32 	.word 0x6e743332
  4c:	5f 74 00 00 	.word 0x5f740000
  50:	00 00 f3 75 	l.j 3ce24 <__ram_length+0x1ce24>
  54:	69 6e 74 33 	.word 0x696e7433
  58:	32 5f 74 00 	.word 0x325f7400
  5c:	00 00 01 31 	l.j 520 <main+0x4>
  60:	66 69 6c 65 	.word 0x66696c65
  64:	54 59 50 45 	.word 0x54595045
  68:	00 00 00 01 	l.j 6c <__mulsi3+0x24>
  6c:	3c 50 61 72 	.word 0x3c506172
  70:	74 69 74 69 	l.cust2 
  74:	6f 6e 45 6e 	.word 0x6f6e456e
  78:	74 72 79 00 	l.cust2 
  7c:	00 00 01 73 	l.j 648 <main+0x12c>
  80:	4d 61 73 74 	l.maci r1,0x7374
// fatal error
void FatalError(void)
{
  DEBUG_FUNC_IN();

  DisableCard();
  84:	65 72 42 6f 	.word 0x6572426f
  88:	6f 74 52 65 	.word 0x6f745265
  8c:	63 6f 72 64 	.word 0x636f7264
}


// fatal error
void FatalError(void)
{
  90:	00 00 00 02 	l.j 98 <FatalError+0x14>
  DEBUG_FUNC_IN();

  DisableCard();
  94:	7c 44 49 52 	l.cust4 
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  98:	45 4e 54 52 	l.jr r10
}


// fatal error
void FatalError(void)
{
  9c:	59 00 00 00 	.word 0x59000000
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  a0:	02 a7 46 41 	l.j fa9d19a4 <__stack+0xfa5719a8>
  a4:	54 42 55 46 	.word 0x54425546

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  a8:	46 45 52 00 	l.jr r10
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  ac:	00 00 02 b2 	l.j b74 <main+0x658>
  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
  b0:	75 69 6e 74 	l.cust2 

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  b4:	31 36 5f 74 	.word 0x31365f74
  b8:	00 00 00 02 	l.j c0 <FatalError+0x3c>
  bc:	bd 75 69 6e 	l.sfgesi r21,0x696e
  c0:	74 33 32 5f 	l.cust2 
  c4:	74 00 00 00 	l.cust2 
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	00 00 00 1c 	l.j 70 <__mulsi3+0x28>
   4:	00 02 00 00 	l.j 80004 <__ram_length+0x60004>
   8:	00 00 04 00 	l.j 1008 <__data_rom+0x14c>
   c:	00 00 00 00 	l.j c <_reset+0x8>
  10:	00 00 00 84 	l.j 220 <MMC_Command+0x88>
  14:	00 00 0e 18 	l.j 3874 <__rom_length+0x2474>
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	00 00 04 e4 	l.j 1390 <__data_rom+0x4d4>
   4:	00 00 07 5c 	l.j 1d74 <__rom_length+0x974>
   8:	00 00 0d e0 	l.j 3788 <__rom_length+0x2388>
   c:	00 00 0e 18 	l.j 386c <__rom_length+0x246c>
  10:	00 00 07 70 	l.j 1dd0 <__rom_length+0x9d0>
  14:	00 00 07 a0 	l.j 1e94 <__rom_length+0xa94>
	...
  20:	00 00 04 e4 	l.j 13b0 <__data_rom+0x4f4>
  24:	00 00 07 5c 	l.j 1d94 <__rom_length+0x994>
  28:	00 00 0d e0 	l.j 37a8 <__rom_length+0x23a8>
  2c:	00 00 0e 18 	l.j 388c <__rom_length+0x248c>
  30:	00 00 07 70 	l.j 1df0 <__rom_length+0x9f0>
  34:	00 00 07 a0 	l.j 1eb4 <__rom_length+0xab4>
	...
  40:	00 00 05 b0 	l.j 1700 <__rom_length+0x300>
  44:	00 00 05 bc 	l.j 1734 <__rom_length+0x334>
  48:	00 00 05 c4 	l.j 1758 <__rom_length+0x358>
  4c:	00 00 05 c8 	l.j 176c <__rom_length+0x36c>
	...
  58:	00 00 05 b0 	l.j 1718 <__rom_length+0x318>
  5c:	00 00 05 bc 	l.j 174c <__rom_length+0x34c>
  60:	00 00 05 c4 	l.j 1770 <__rom_length+0x370>
  64:	00 00 05 c8 	l.j 1784 <__rom_length+0x384>
	...
  70:	00 00 07 b4 	l.j 1f40 <__rom_length+0xb40>
  74:	00 00 07 b8 	l.j 1f54 <__rom_length+0xb54>
  78:	00 00 0b c0 	l.j 2f78 <__rom_length+0x1b78>
  7c:	00 00 0b c4 	l.j 2f8c <__rom_length+0x1b8c>
  80:	00 00 07 c0 	l.j 1f80 <__rom_length+0xb80>
// fatal error
void FatalError(void)
{
  DEBUG_FUNC_IN();

  DisableCard();
  84:	00 00 0b 40 	l.j 2d84 <__rom_length+0x1984>
	...
}


// fatal error
void FatalError(void)
{
  90:	00 00 07 b4 	l.j 1f60 <__rom_length+0xb60>
  DEBUG_FUNC_IN();

  DisableCard();
  94:	00 00 07 b8 	l.j 1f74 <__rom_length+0xb74>
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  98:	00 00 0b c0 	l.j 2f98 <__rom_length+0x1b98>
}


// fatal error
void FatalError(void)
{
  9c:	00 00 0b c4 	l.j 2fac <__rom_length+0x1bac>
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  a0:	00 00 07 c0 	l.j 1fa0 <__rom_length+0xba0>
  a4:	00 00 0b 40 	l.j 2da4 <__rom_length+0x19a4>
	...
  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
  b0:	00 00 0b 58 	l.j 2e10 <__rom_length+0x1a10>

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  b4:	00 00 0b 5c 	l.j 2e24 <__rom_length+0x1a24>
  b8:	00 00 0b c4 	l.j 2fc8 <__rom_length+0x1bc8>
  bc:	00 00 0d 98 	l.j 371c <__rom_length+0x231c>
  c0:	00 00 0b a0 	l.j 2f40 <__rom_length+0x1b40>
  c4:	00 00 0b c0 	l.j 2fc4 <__rom_length+0x1bc4>
  c8:	00 00 0b 68 	l.j 2e68 <__rom_length+0x1a68>
    LEDS(0x0);
  cc:	00 00 0b 98 	l.j 2f2c <__rom_length+0x1b2c>
    TIMER_wait(200);
  d0:	00 00 0b 60 	l.j 2e50 <__rom_length+0x1a50>
  d4:	00 00 0b 64 	l.j 2e64 <__rom_length+0x1a64>
	...
  e0:	00 00 0b 58 	l.j 2e40 <__rom_length+0x1a40>
  e4:	00 00 0b 5c 	l.j 2e54 <__rom_length+0x1a54>
    LEDS(led);
  e8:	00 00 0c d8 	l.j 3448 <__rom_length+0x2048>
  }
  ec:	00 00 0d 34 	l.j 35bc <__rom_length+0x21bc>
  f0:	00 00 0c b8 	l.j 33d0 <__rom_length+0x1fd0>

#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
  f4:	00 00 0c c0 	l.j 33f4 <__rom_length+0x1ff4>
  f8:	00 00 0b c4 	l.j 3008 <__rom_length+0x1c08>


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  fc:	00 00 0c a8 	l.j 339c <__rom_length+0x1f9c>
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
 100:	00 00 0b a0 	l.j 2f80 <__rom_length+0x1b80>
 104:	00 00 0b c0 	l.j 3004 <__rom_length+0x1c04>
 108:	00 00 0b 68 	l.j 2ea8 <__rom_length+0x1aa8>
 10c:	00 00 0b 98 	l.j 2f6c <__rom_length+0x1b6c>
 110:	00 00 0b 60 	l.j 2e90 <__rom_length+0x1a90>


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
 114:	00 00 0b 64 	l.j 2ea4 <__rom_length+0x1aa4>
	...
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
}
 120:	00 00 0b 58 	l.j 2e80 <__rom_length+0x1a80>
 124:	00 00 0b 5c 	l.j 2e94 <__rom_length+0x1a94>
 128:	00 00 0c d8 	l.j 3488 <__rom_length+0x2088>
 12c:	00 00 0d 34 	l.j 35fc <__rom_length+0x21fc>
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 130:	00 00 0c b8 	l.j 3410 <__rom_length+0x2010>
 134:	00 00 0c c0 	l.j 3434 <__rom_length+0x2034>
 138:	00 00 0b c4 	l.j 3048 <__rom_length+0x1c48>
 13c:	00 00 0c a8 	l.j 33dc <__rom_length+0x1fdc>
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
 140:	00 00 0b a0 	l.j 2fc0 <__rom_length+0x1bc0>
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
    crc <<= 1;
 144:	00 00 0b c0 	l.j 3044 <__rom_length+0x1c44>
    if (c & 0x80)   crc ^= 0x09;
 148:	00 00 0b 68 	l.j 2ee8 <__rom_length+0x1ae8>
 14c:	00 00 0b 98 	l.j 2fac <__rom_length+0x1bac>
 150:	00 00 0b 60 	l.j 2ed0 <__rom_length+0x1ad0>
 154:	00 00 0b 64 	l.j 2ee4 <__rom_length+0x1ae4>
	...
    if (crc & 0x80) crc ^= 0x09;
 160:	00 00 0c a8 	l.j 3400 <__rom_length+0x2000>
 164:	00 00 0c b8 	l.j 3444 <__rom_length+0x2044>
 168:	00 00 0d 34 	l.j 3638 <__rom_length+0x2238>
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 16c:	00 00 0d 98 	l.j 37cc <__rom_length+0x23cc>
 170:	00 00 0c c0 	l.j 3470 <__rom_length+0x2070>
 174:	00 00 0c d8 	l.j 34d4 <__rom_length+0x20d4>
	...
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
    if (crc & 0x80) crc ^= 0x09;
    c <<= 1;
 180:	00 00 0c ac 	l.j 3430 <__rom_length+0x2030>
 184:	00 00 0c b8 	l.j 3464 <__rom_length+0x2064>
 188:	00 00 0d 34 	l.j 3658 <__rom_length+0x2258>
 18c:	00 00 0d 8c 	l.j 37bc <__rom_length+0x23bc>
  }

  DEBUG_FUNC_OUT();
}
 190:	00 00 0c c8 	l.j 34b0 <__rom_length+0x20b0>
 194:	00 00 0c d8 	l.j 34f4 <__rom_length+0x20f4>
	...

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	67 65 6f 6d 	.word 0x67656f6d
   4:	65 74 72 79 	.word 0x65747279
   8:	00 72 6f 6f 	l.j 1c9bdc4 <__stack+0x183bdc8>
   c:	74 5f 64 69 	l.cust2 
  10:	72 65 63 74 	l.cust1 
  14:	6f 72 79 5f 	.word 0x6f72795f
  18:	73 69 7a 65 	l.cust1 
  1c:	00 70 61 72 	l.j 1c185e4 <__stack+0x17b85e8>
  20:	74 69 74 69 	l.cust2 
  24:	6f 6e 63 6f 	.word 0x6f6e636f
  28:	75 6e 74 00 	l.cust2 
  2c:	44 49 52 45 	l.jr r10
  30:	4e 54 52 59 	l.maci r20,0x5259
  34:	00 43 68 65 	l.j 10da1c8 <__stack+0xc7a1cc>
  38:	63 6b 54 69 	.word 0x636b5469
  3c:	6d 65 72 00 	.word 0x6d657200
  40:	47 65 74 54 	l.jr r14
  44:	69 6d 65 72 	.word 0x696d6572
  48:	00 2f 68 6f 	l.j bda204 <__stack+0x77a208>
  4c:	6d 65 2f 72 	.word 0x6d652f72
  50:	6f 6b 6b 2f 	.word 0x6f6b6b2f
  54:	44 72 6f 70 	l.jr r13
  58:	62 6f 78 2f 	.word 0x626f782f
  5c:	77 6f 72 6b 	l.cust2 
  60:	2f 65 6c 65 	.word 0x2f656c65
  64:	63 74 72 6f 	.word 0x6374726f
  68:	6e 69 63 73 	.word 0x6e696373
  6c:	2f 66 70 67 	.word 0x2f667067
  70:	61 2f 6d 69 	.word 0x612f6d69
  74:	6e 69 6d 69 	.word 0x6e696d69
  78:	67 2d 64 65 	.word 0x672d6465
  7c:	31 2f 66 77 	.word 0x312f6677
  80:	2f 63 74 72 	.word 0x2f637472
// fatal error
void FatalError(void)
{
  DEBUG_FUNC_IN();

  DisableCard();
  84:	6c 5f 62 6f 	.word 0x6c5f626f
  88:	6f 74 00 65 	.word 0x6f740065
  8c:	6e 74 72 69 	.word 0x6e747269
}


// fatal error
void FatalError(void)
{
  90:	65 73 5f 70 	.word 0x65735f70
  DEBUG_FUNC_IN();

  DisableCard();
  94:	65 72 5f 63 	.word 0x65725f63
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  98:	6c 75 73 74 	.word 0x6c757374
}


// fatal error
void FatalError(void)
{
  9c:	65 72 00 5f 	.word 0x6572005f
  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  a0:	5f 68 65 61 	.word 0x5f686561
  a4:	70 5f 63 75 	l.cust1 

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  a8:	72 00 4c 6f 	l.cust1 
    LEDS(0x0);
    TIMER_wait(200);
    LEDS(led);
  ac:	77 65 72 43 	l.cust2 
  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
    LEDS(0x0);
  b0:	61 73 65 00 	.word 0x61736500

  DisableCard();

  // loop forever
  while(1) {
    TIMER_wait(200);
  b4:	73 68 6f 72 	l.cust1 
  b8:	74 20 69 6e 	l.cust2 
  bc:	74 00 70 52 	l.cust2 
  c0:	65 61 64 42 	.word 0x65616442
  c4:	75 66 66 65 	l.cust2 
  c8:	72 00 4d 4d 	l.cust1 
    LEDS(0x0);
  cc:	43 5f 52 65 	.word 0x435f5265
    TIMER_wait(200);
  d0:	61 64 00 4c 	.word 0x6164004c
  d4:	6f 61 64 46 	.word 0x6f616446
  d8:	69 6c 65 00 	.word 0x696c6500
  dc:	6d 61 69 6e 	.word 0x6d61696e
  e0:	00 4e 61 6d 	l.j 1398694 <__stack+0xf38698>
  e4:	65 00 72 6f 	.word 0x6500726f
    LEDS(led);
  e8:	6f 74 5f 64 	.word 0x6f745f64
  }
  ec:	69 72 65 63 	.word 0x69726563
  f0:	74 6f 72 79 	l.cust2 

#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
  f4:	5f 63 6c 75 	.word 0x5f636c75
  f8:	73 74 65 72 	l.cust1 


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
  fc:	00 66 69 72 	l.j 199a6c4 <__stack+0x153a6c8>
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
 100:	6d 77 61 72 	.word 0x6d776172
 104:	65 00 63 6c 	.word 0x6500636c
 108:	75 73 74 65 	l.cust2 
 10c:	72 5f 73 69 	l.cust1 
 110:	7a 65 00 66 	l.cust3 


#ifndef SWAP_MACROS

uint32_t SwapBBBB(uint32_t i)
{
 114:	69 6c 65 00 	.word 0x696c6500
  return ((i&0x00ff0000)>>8) | ((i&0xff000000)>>24) | ((i&0x000000ff)<<24) | ((i&0x0000ff00)<<8);
 118:	50 61 72 74 	.word 0x50617274
 11c:	69 74 69 6f 	.word 0x6974696f
}
 120:	6e 00 66 61 	.word 0x6e006661
 124:	74 5f 6e 75 	l.cust2 
 128:	6d 62 65 72 	.word 0x6d626572
 12c:	00 74 69 6d 	l.j 1d1a6e0 <__stack+0x18ba6e4>
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 130:	65 6f 75 74 	.word 0x656f7574
 134:	00 48 69 67 	l.j 121a6d0 <__stack+0xdba6d4>
 138:	68 43 6c 75 	.word 0x68436c75
 13c:	73 74 65 72 	l.cust1 
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
 140:	00 47 4e 55 	l.j 11d3a94 <__stack+0xd73a98>
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
    crc <<= 1;
 144:	20 43 20 34 	.word 0x20432034
    if (c & 0x80)   crc ^= 0x09;
 148:	2e 35 2e 31 	.word 0x2e352e31
 14c:	2d 6f 72 33 	.word 0x2d6f7233
 150:	32 2d 31 2e 	.word 0x322d312e
 154:	30 72 63 34 	.word 0x30726334
    if (crc & 0x80) crc ^= 0x09;
 158:	00 53 74 61 	l.j 14dd2dc <__stack+0x107d2e0>
 15c:	72 74 43 6c 	l.cust1 
 160:	75 73 74 65 	l.cust2 
 164:	72 00 69 45 	l.cust1 
 168:	6e 74 72 79 	.word 0x6e747279
{
  DEBUG_FUNC_IN();

  unsigned char i;

  for (i = 0; i < 8; i++) {
 16c:	00 4d 4d 43 	l.j 1353678 <__stack+0xef367c>
 170:	5f 43 52 43 	.word 0x5f435243
 174:	00 4d 4d 43 	l.j 1353680 <__stack+0xef3684>
 178:	5f 43 6f 6d 	.word 0x5f436f6d
 17c:	6d 61 6e 64 	.word 0x6d616e64
    crc <<= 1;
    if (c & 0x80)   crc ^= 0x09;
    if (crc & 0x80) crc ^= 0x09;
    c <<= 1;
 180:	00 73 74 61 	l.j 1cdd304 <__stack+0x187d308>
 184:	72 74 6c 62 	l.cust1 
 188:	61 00 41 74 	.word 0x61004174
 18c:	74 72 69 62 	l.cust2 
  }

  DEBUG_FUNC_OUT();
}
 190:	75 74 65 73 	l.cust2 
 194:	00 6c 6f 6e 	l.j 1b1bf4c <__stack+0x16bbf50>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 198:	67 20 6c 6f 	.word 0x67206c6f
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 19c:	6e 67 20 69 	.word 0x6e672069
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1a0:	6e 74 00 66 	.word 0x6e740066
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 1a4:	61 74 33 32 	.word 0x61743332
 1a8:	00 46 69 6e 	l.j 119a760 <__stack+0xd3a764>
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1ac:	64 44 72 69 	.word 0x64447269
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
 1b0:	76 65 00 69 	l.cust2 
  SPI(0xFF); // flush SPI-bus
 1b4:	44 69 72 65 	l.jr r14
 1b8:	63 74 6f 72 	.word 0x63746f72
 1bc:	79 43 6c 75 	l.cust3 
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1c0:	73 74 65 72 	l.cust1 
 1c4:	00 6f 66 66 	l.j 1bd9b5c <__stack+0x1779b60>
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus
 1c8:	73 65 74 00 	l.cust1 
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1cc:	69 6d 67 73 	.word 0x696d6773
  DEBUG_FUNC_IN();

  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus
 1d0:	69 7a 65 00 	.word 0x697a6500

  SPI(cmd);
 1d4:	62 6f 6f 74 	.word 0x626f6f74
}


// MMC command
unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
 1d8:	63 6f 64 65 	.word 0x636f6465
  unsigned char c;

  crc = 0;
  SPI(0xFF); // flush SPI-bus

  SPI(cmd);
 1dc:	00 73 65 63 	l.j 1cd9768 <__stack+0x187976c>
  MMC_CRC(cmd);
 1e0:	74 6f 72 5f 	l.cust2 
 1e4:	62 75 66 66 	.word 0x62756666

  c = (unsigned char)(arg >> 24);
 1e8:	65 72 00 72 	.word 0x65720072
  SPI(c);
 1ec:	6f 6f 74 5f 	.word 0x6f6f745f
 1f0:	64 69 72 65 	.word 0x64697265
  MMC_CRC(c);
 1f4:	63 74 6f 72 	.word 0x63746f72
 1f8:	79 5f 73 74 	l.cust3 

  c = (unsigned char)(arg >> 16);
 1fc:	61 72 74 00 	.word 0x61727400
 200:	69 44 69 72 	.word 0x69446972
  SPI(c);
 204:	65 63 74 6f 	.word 0x6563746f
 208:	72 79 53 65 	l.cust1 
  MMC_CRC(c);
 20c:	63 74 6f 72 	.word 0x63746f72
 210:	00 6e 61 6d 	l.j 1b987c4 <__stack+0x17387c8>

  c = (unsigned char)(arg >> 8);
 214:	65 00 66 61 	.word 0x65006661
 218:	74 5f 73 74 	l.cust2 
  SPI(c);
 21c:	61 72 74 00 	.word 0x61727400
 220:	66 69 6c 65 	.word 0x66696c65
  MMC_CRC(c);
 224:	54 59 50 45 	.word 0x54595045
 228:	00 64 61 74 	l.j 19187f8 <__stack+0x14b87fc>

  c = (unsigned char)(arg);
 22c:	61 5f 73 74 	.word 0x615f7374
  SPI(c);
 230:	61 72 74 00 	.word 0x61727400
 234:	75 6e 73 69 	l.cust2 
  MMC_CRC(c);
 238:	67 6e 65 64 	.word 0x676e6564
 23c:	20 63 68 61 	.word 0x20636861

  crc <<= 1;
 240:	72 00 66 61 	l.cust1 
 244:	74 5f 73 69 	l.cust2 
  crc++;
 248:	7a 65 00 6c 	l.cust3 
 24c:	6f 6e 67 20 	.word 0x6f6e6720
 250:	6c 6f 6e 67 	.word 0x6c6f6e67
  SPI(crc);
 254:	20 75 6e 73 	.word 0x20756e73
 258:	69 67 6e 65 	.word 0x69676e65

  unsigned char Ncr = 100;  // Ncr = 0..8 (SD) / 1..8 (MMC)
 25c:	64 20 69 6e 	.word 0x6420696e
  do {
    response = SPI(0xFF); // get response
 260:	74 00 41 63 	l.cust2 
 264:	63 65 73 73 	.word 0x63657373
 268:	44 61 74 65 	l.jr r14
  } while (response == 0xFF && Ncr--);
 26c:	00 75 69 6e 	l.j 1d5a824 <__stack+0x18fa828>
 270:	74 33 32 5f 	l.cust2 
 274:	74 00 53 77 	l.cust2 
 278:	61 70 42 42 	.word 0x61704242
 27c:	00 43 61 72 	l.j 10d8844 <__stack+0xc78848>
 280:	64 54 79 70 	.word 0x64547970
 284:	65 00 75 69 	.word 0x65007569
 288:	6e 74 31 36 	.word 0x6e743136
 28c:	5f 74 00 47 	.word 0x5f740047
 290:	65 74 43 6c 	.word 0x6574436c
 294:	75 73 74 65 	l.cust2 
 298:	72 00 74 69 	l.cust1 
 29c:	6d 65 00 62 	.word 0x6d650062
 2a0:	75 66 66 65 	l.cust2 
 2a4:	72 65 64 5f 	l.cust1 

  return response;

  DEBUG_FUNC_OUT();
}
 2a8:	66 61 74 5f 	.word 0x6661745f
 2ac:	69 6e 64 65 	.word 0x696e6465
 2b0:	78 00 50 61 	l.cust3 
 2b4:	72 74 69 74 	l.cust1 
 2b8:	69 6f 6e 45 	.word 0x696f6e45
 2bc:	6e 74 72 79 	.word 0x6e747279
 2c0:	00 73 68 6f 	l.j 1cda47c <__stack+0x187a480>
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2c4:	72 74 20 75 	l.cust1 
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2c8:	6e 73 69 67 	.word 0x6e736967
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2cc:	6e 65 64 20 	.word 0x6e656420
 2d0:	69 6e 74 00 	.word 0x696e7400
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2d4:	62 6f 6f 74 	.word 0x626f6f74
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
 2d8:	5f 73 65 63 	.word 0x5f736563
  DEBUG_FUNC_IN();

  unsigned long i;

  if (CardType != CARDTYPE_SDHC) { // SDHC cards are addressed in sectors not bytes
 2dc:	74 6f 72 00 	l.cust2 
 2e0:	43 72 65 61 	.word 0x43726561
 2e4:	74 65 48 75 	l.cust2 
 2e8:	6e 64 72 65 	.word 0x6e647265
    lba = lba << 9; // otherwise convert sector adddress to byte address
 2ec:	64 74 68 00 	.word 0x64746800
  }

  //EnableCard();

  if (MMC_Command(CMD17, lba)) {
 2f0:	6e 45 6e 74 	.word 0x6e456e74
 2f4:	72 69 65 73 	l.cust1 
 2f8:	00 61 64 64 	l.j 1859488 <__stack+0x13f948c>
    //printf("CMD17 (READ_BLOCK): invalid response 0x%02X (lba=%lu)\r", response, lba);
    //DisableCard();
    return(0);
 2fc:	72 00 46 41 	l.cust1 
    lba = lba << 9; // otherwise convert sector adddress to byte address
  }

  //EnableCard();

  if (MMC_Command(CMD17, lba)) {
 300:	54 42 55 46 	.word 0x54425546
 304:	46 45 52 00 	l.jr r10
 308:	53 69 67 6e 	.word 0x5369676e
    //DisableCard();
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
 30c:	61 74 75 72 	.word 0x61747572
  while ((SPI(0xFF)) != 0xFE) {
 310:	65 00 46 69 	.word 0x65004669
    //DisableCard();
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
 314:	6c 65 53 69 	.word 0x6c655369
 318:	7a 65 00 53 	l.cust3 
  while ((SPI(0xFF)) != 0xFE) {
 31c:	77 61 70 42 	l.cust2 
 320:	42 42 42 00 	.word 0x42424200
 324:	46 61 74 61 	l.jr r14
 328:	6c 45 72 72 	.word 0x6c457272
    if (timeout++ >= 1000000) { // we can't wait forever
 32c:	6f 72 00 6d 	.word 0x6f72006d
 330:	61 69 6e 2e 	.word 0x61696e2e
 334:	63 00 70 45 	.word 0x63007045
 338:	6e 74 72 79 	.word 0x6e747279
 33c:	00 73 65 63 	l.j 1cd98c8 <__stack+0x18798cc>
 340:	74 6f 72 73 	l.cust2 
      //printf("CMD17 (READ_BLOCK): no data token! (lba=%lu)\r", lba);
      //DisableCard();
      return(0);
 344:	00 4d 6f 64 	l.j 135c0d4 <__stack+0xefc0d8>
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
    if (timeout++ >= 1000000) { // we can't wait forever
 348:	69 66 79 44 	.word 0x69667944
 34c:	61 74 65 00 	.word 0x61746500
 350:	72 65 73 70 	l.cust1 
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 354:	6f 6e 73 65 	.word 0x6f6e7365
 358:	00 63 6f 6d 	l.j 18dc10c <__stack+0x147c110>
 35c:	70 61 72 65 	l.cust1 
 360:	00 66 61 74 	l.j 1998930 <__stack+0x1538934>
 364:	31 36 00 46 	.word 0x31360046
 368:	69 6c 65 4f 	.word 0x696c654f
  DEBUG_FUNC_OUT();
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
 36c:	70 65 6e 00 	l.cust1 
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 370:	4d 6f 64 69 	l.maci r15,0x6469
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
    *(pReadBuffer++) = SPI(0xFF);
 374:	66 79 54 69 	.word 0x66795469
    return(0);
  }

  // now we are waiting for data token, it takes around 300us
  timeout = 0;
  while ((SPI(0xFF)) != 0xFE) {
 378:	6d 65 00 5f 	.word 0x6d65005f
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
    *(pReadBuffer++) = SPI(0xFF);
 37c:	68 65 61 70 	.word 0x68656170
 380:	5f 65 6e 64 	.word 0x5f656e64
 384:	00 73 79 73 	l.j 1cde950 <__stack+0x187e954>
 388:	5f 6a 75 6d 	.word 0x5f6a756d
 38c:	70 00 63 6c 	l.cust1 
 390:	75 73 74 65 	l.cust2 
    *(pReadBuffer++) = SPI(0xFF);
 394:	72 5f 6d 61 	l.cust1 
 398:	73 6b 00 5f 	l.cust1 
 39c:	68 65 61 70 	.word 0x68656170
    *(pReadBuffer++) = SPI(0xFF);
 3a0:	5f 73 74 61 	.word 0x5f737461
 3a4:	72 74 00 45 	l.cust1 
 3a8:	78 74 65 6e 	l.cust3 
    *(pReadBuffer++) = SPI(0xFF);
 3ac:	73 69 6f 6e 	l.cust1 
 3b0:	00 43 72 65 	l.j 10dcd44 <__stack+0xc7cd48>
 3b4:	61 74 65 54 	.word 0x61746554
  DEBUG_FUNC_OUT();
}


// Read single 512-byte block
unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
 3b8:	69 6d 65 00 	.word 0x696d6500
      //DisableCard();
      return(0);
    }
  }

  for (i = 0; i < 128; i++) {
 3bc:	64 69 72 5f 	.word 0x6469725f
 3c0:	65 6e 74 72 	.word 0x656e7472
 3c4:	69 65 73 00 	.word 0x69657300
    *(pReadBuffer++) = SPI(0xFF);
    *(pReadBuffer++) = SPI(0xFF);
    *(pReadBuffer++) = SPI(0xFF);
  }

  SPI(0xFF); // read CRC lo byte
 3c8:	4d 4d 43 5f 	l.maci r13,0x435f
 3cc:	49 6e 69 74 	l.jalr r13
  SPI(0xFF); // read CRC hi byte
 3d0:	00 43 72 65 	l.j 10dcd64 <__stack+0xc7cd68>
 3d4:	61 74 65 44 	.word 0x61746544

  //DisableCard();
  return(1);
 3d8:	61 74 65 00 	.word 0x61746500

  DEBUG_FUNC_OUT();
}
 3dc:	73 79 73 74 	l.cust1 
 3e0:	69 6d 65 72 	.word 0x696d6572
 3e4:	00 4d 61 73 	l.j 13589b0 <__stack+0xef89b4>
 3e8:	74 65 72 42 	l.cust2 
 3ec:	6f 6f 74 52 	.word 0x6f6f7452


int compare(const char *s1, const char *s2,int b)
{
	int i;
	for(i=0;i<b;++i)
 3f0:	65 63 6f 72 	.word 0x65636f72
 3f4:	Address 0x000003f4 is out of bounds.


Disassembly of section .comment:

00000000 <.comment>:
   0:	47 43 43 3a 	l.jr r8
   4:	20 28 4f 70 	.word 0x20284f70
   8:	65 6e 52 49 	.word 0x656e5249
   c:	53 43 20 33 	.word 0x53432033
  10:	32 2d 62 69 	.word 0x322d6269
  14:	74 20 74 6f 	l.cust2 
  18:	6f 6c 63 68 	.word 0x6f6c6368
  1c:	61 69 6e 20 	.word 0x61696e20
  20:	66 6f 72 20 	.word 0x666f7220
  24:	6f 72 33 32 	.word 0x6f723332
  28:	2d 65 6c 66 	.word 0x2d656c66
  2c:	20 28 62 75 	.word 0x20286275
  30:	69 6c 74 20 	.word 0x696c7420
  34:	32 30 31 31 	.word 0x32303131
  38:	30 34 31 30 	.word 0x30343130
  3c:	29 29 20 34 	lv.addu.b r9,r9,r4
  40:	2e 35 2e 31 	.word 0x2e352e31
  44:	2d 6f 72 33 	.word 0x2d6f7233
  48:	32 2d 31 2e 	.word 0x322d312e
  4c:	30 72 63 34 	.word 0x30726334
	...
