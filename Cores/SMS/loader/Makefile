CC = zcc
LD = zcc

CFLAGS = +sms #-DDEBUG #-DDEBUG_FAT

C_FILES=main.c sd.c fat.c
OBJECT_FILES=$(C_FILES:%.c=%.o)

all: boot.sms

boot.sms: fat.c sd.c main.c 
	zcc +sms  sd.c fat.c main.c -o boot.sms -m
	echo boot.map boot.sym
	.\mif.bat

boot.o: $(OBJECT_FILES)
	$(LD) $(CFLAGS) $(OBJECT_FILES) -o $@ -m

%.o: %.c
	$(CC) $(CFLAGS) -c $<

crt0.opt: crt0.asm
	cp $< $@










clean:
	rm -f *.o *.opt boot.map zcc_opt.def
	rm -f *.mem vram.bin boot.sms

