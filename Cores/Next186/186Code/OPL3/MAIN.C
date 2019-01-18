#include "ymf262.h"
//#include <stdio.h>
//#include <stdlib.h>
//#include <string.h>
#include <sys.h>
#define printf(x) //puts(x)

#define READY 1
#define QEMPTY 2


/*
void rpi(int i, char first, char radix)
{
	if(i<0) { putchar('-'), i = -i; }
	if(i) rpi(i / radix, 0, radix); 
	if(i || first) 
	{
		radix = i%radix;
		putchar(radix + (radix>9 ? '7' : '0'));
	}
}

void pi(int i, char radix){ rpi(i, 1, radix); }
*/

int main()
{
	uint8_t c;
//	*(unsigned char*)0x81 = 0xc9;
//	asm("ld sp, 0000h");
	OPL3ResetChip();

	while(1)
	{
		c = inp(0);
		if((c & 3) == READY) OPL3Write((c >> 2) & 3, inp(1));
		
	}
	
//	asm("rst 0");
}
