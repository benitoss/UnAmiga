#include <stdio.h>
#include <dos.h>
#include <stdlib.h>

unsigned char i2csend(int cd) // returns 0 on error
{
	outport(4, cd);
	while(!(inportb(0x3da) & 0x40));
	outport(4, 0);
	while((cd = inportb(0x3da)) & 0x40);
	return !(cd & 4);
}

unsigned char WM8731SetReg(int reg, int value) // returns 1 if ok
{
	if(!i2csend(0x634)) return 0;
	if(!i2csend(0x400 | (reg<<1) | ((value >> 8) & 1))) return 0;
	return i2csend(0x500 | (value & 0xff));
}

void main()
{
	unsigned char ok;
	ok = WM8731SetReg(6, 0x70);   // 6(Power down control) = power up all except OUTPD
	ok &= WM8731SetReg(2, 0x170); // 2(Left Headphone Out) = both, vol=111_0000
	ok &= WM8731SetReg(4, 0x3a);  // 4(Analog Audio Path Control) = SIDETONE=1, BYPASS=1, DAC=on, enable mic mute
	ok &= WM8731SetReg(5, 0x0);	  // 5(Digital Audio Path Control) = Disable soft mute
	ok &= WM8731SetReg(8, 0x20);  // 8(Sampling Control) = 44.1Khz
	ok &= WM8731SetReg(7, 0x93);  // 7(Digital Audio Interface Format) = DSP mode, 16bit, LRP=1, invert BCLK
	ok &= WM8731SetReg(9, 0x1);   // 9(Active Control) = Active on
	ok &= WM8731SetReg(6, 0x60);  // 6(Power down control) = power up all including OUTPD
	printf(ok ? "OK\n" : "Error\n");
}