Atari-800 emulation for Reverse-U16 board (http://zx-pk.ru/showthread.php?t=23528)
Ported from http://www.scrameta.net/ by AlSp (extmail _at_ alsp.net)

Please use:
	- syn/atari800core_u16_epcs16_ntsc.jic - for FPGA programming (NTSC mode emulation)
	- syn/atari800core_u16_epcs16_pal.jic  - for FPGA programming (PAL mode emulation)
	- vnc2/build/release/ReverseU16_VNC2.rom - for vnc2 programming
	- sd/* - sd card content

The keyboard is mapped to match an Atari 800XL physical layout(See below).

Special/console keys:
F5  - Help
F6  - Start
F7  - Select
F8  - Option
F9  - Reset
F10 - Cold start (clear base 64KB RAM and reset) 
F11 - Select drive 1 and cold start
		Left - up several lines
		Right - down several lines
		Up - up 1 line
		Down - down 1 line
		Enter - select
	Remember many titles require holding 'option' (F8)
	Select "DIR .." to go up a directory
	Select "DIR xxx" to go down a directory
F12 - System settings menu
	Turbo - system speed
		Left/right to select
		1x (default): is very compatible - speed closely matches original hardware ~1.7MHz
		2x: ~3.4MHz - less compatible
		4x: ~6.8MHz - less compatible
		8x/16x: 13MHz, 27MHZ - limited by SDRAM latency, not quicker than 4x yet.
	RAM
		Left/right to select
		64KB:  like 65XE
		128KB: like 130XE, 64KB ext ram, switchable by antic/cpu
		320KB(Compy shop)(default): 256KB ext ram, switchable by antic/cpu 
		320KB(Rambo): 256KB ext ram, both antic/cpu switch together
		576KB(Compy shop): 512KB ext ram, switchable by antic/cpu 
		576KB(Rambo): 512KB ext ram, both antic/cpu switch together
		1088KB: 1024KB ext ram, both antic/cpu switch together
		4160KB: - very imcompatible!
	ROM
		Enter: File selector
		Select a different system OS ROM - can by 16KB or 10KB
	Drive
		Left: Remove disk
		Right: File selector
		Enter: Put this disk in F1
	Cartridge
		Left: Remove cart
		Right: File selector
		Enter: Put this cart in

System ROM:
	Loaded from /atari800/rom/atarixl.rom

Basic:
	Loaded from /atari800/rom/ataribas.rom

Disk images:
	Default dir: /atari800/user
	Supported types: 
		.ATR - Atari disk image with header. single/medium/double density.
		.XFD - Atari disk image without header. 
		.XEX - Atari executable. A simple bootloader is loaded, not 100% compatible. 

Cartridges:
	Default dir: /atari800/user
	Supported types:
		.CAR - Atari 800 cartridge with header.
		NB .BIN files can be converted using various programs - e.g. Atari800WinPlus.

Important notes:
	When running Atari software a lot of programs need to have basic disable. Hold option when pressing reset.

Keyboard layout

The keyboard is mapped to match an Atari 800XL physical layout.  On a UK keyboard this means the layout is:
	Directly mapped:
		ESCAPE,F1-F4,BREAK,CONTROL,SHIFT
	By position:
		1234567890<>(DELETE)
		(TAB)QWERTYUIOP-=(RETURN)
		(CAPS)ASDFGHJKL;+*
		ZXCVBNM,./
	Other:
		Right alt = inverse video
		ScrLock  = activate turbo freezer emulation

Joysticks support
	Please use USB HID joysticks or Up,Down,Left,Up + Left Ctrl as first joystick and Num Pad ('0' is fire) as second


Features

* Acid 800 test pass
* 99% of software runs
* Version for PAL/NTSC VGA/SVIDEO
* Write support
* Drive emulation

Known issues

* ~1% of programs fail
* Keyboard layout board on UK PS2 keyboard, no remapping possible yet.
* Copymate write verify fails
* Entering menu during disk access may hang ZPU (used for drive emulation/menus)
* Sometimes keyboard input fails - need to power off/on the MCC.
* Hardware matches Atari very closely - including overscan corruption - this often shows up on VGA monitors.

Enjoy !

