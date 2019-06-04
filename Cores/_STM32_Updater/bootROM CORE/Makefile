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

CP = copy
RM = rm -f
CC = sdcc
AS = sdasz80
LD = sdcc
MKBIN = makebin
H2B = hex2bin
ROMGEN = romgen

SDIR = src
IDIR = inc
ODIR = obj

CFLAGS = -mz80 --opt-code-size --fomit-frame-pointer -I$(IDIR) -I..
LDFLAGS = -mz80 --code-loc 0x0100 --data-loc 0xF800 --no-std-crt0

_OBJS = crt0.rel main.rel mmc.rel fat.rel vdp.rel
OBJS = $(patsubst %,$(ODIR)/%,$(_OBJS))

all: loader

loader: loader.bin
	fillfile $< 16384
	$(ROMGEN) $< bootrom 14 a r > ../src/bootrom_CORE.vhd

loader.bin: loader.ihx

loader.ihx: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

.PHONY: clean dir

dir:
	if not exist obj mkdir obj

clean:
	$(RM) $(ODIR)/* *.map *.lk *.noi *.bin *.ihx *.mif

$(ODIR)/%.rel: $(SDIR)/%.s
	$(AS) -o $@ $<

$(ODIR)/%.rel: $(SDIR)/%.c 
	$(CC) $(CFLAGS) -c -o $@ $<

%.bin: %.ihx
	$(H2B) -e bin $<
