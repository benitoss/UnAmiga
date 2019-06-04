#
# Copyright (c) 2015 Fabio Belavenuto & Victor Trucco
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY#  without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

CC = sdcc
AS = sdasz80
LD = sdcc
CP = copy
RM = rm -f
MKBIN = makebin
H2B = hex2bin
MIF = srec_cat

SDIR = src
IDIR = inc
ODIR = obj

CFLAGS = -mz80 --opt-code-size --fomit-frame-pointer -I$(IDIR) -I..
LDFLAGS = -mz80 --code-loc 0x6010 --data-loc 0 --no-std-crt0

_OBJS0 = crt0.rel boot.rel vdp.rel diskio.rel ffro.rel
OBJS0 = $(patsubst %,$(ODIR)/%,$(_OBJS0))


all:  boot.ihx 

boot.ihx: $(OBJS0)
	$(LD) $(LDFLAGS) -o $@ $(OBJS0)
	$(H2B) -e bin $@
	cp boot.bin update.fw


	
.PHONY: clean dir

dir:
	if not exist obj mkdir obj

clean:
	$(RM) $(ODIR)/* *.map *.lk *.lst *.noi *.fw *.ihx *.bin

$(ODIR)/crt0.rel: $(SDIR)/crt0.s
	$(AS) -o $@ $<

$(ODIR)/spi.rel: $(SDIR)/spi.s
	$(AS) -o $@ $<

$(ODIR)/%.rel: $(SDIR)/%.c 
	$(CC) $(CFLAGS) -c -o $@ $<

$(ODIR)/%.rel: $(SDIR)/ff/%.c 
	$(CC) $(CFLAGS) -c -o $@ $<

$(ODIR)/%.rel: $(SDIR)/ff/option/%.c
	$(CC) $(CFLAGS) -c -o $@ $<
