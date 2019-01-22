# NES (Nintendo Entertainment System)

This is a port of NES to the Altera Cyclone IV board of UnAmiga from the [Multicore 2](https://gitlab.com/victor.trucco/Multicore) of Victor Trucco.

**IMPORTANT:** This Core needs the SRAM addon from [Antonio Villena's store](https://www.antoniovillena.es/store/)

**UPDATED: The actual core has been updated to implement the Start and 
Select buttons in the Keyboard. Enjoy it**

This version is an open source based in fpganes port for ZXUNO (2016 DistWave)

Original readme:

#fpganes

This is the source code for my FPGA NES.
It's designed to run on the Nexys4 board and built with Xilinx ISE.
Use "loader" to download ROMS to it over the built-in UART.
"loader" also transmits joypad commands from my USB joypad
to the FPGA across UART. 

[NES](https://en.wikipedia.org/wiki/Nintendo_Entertainment_System) was a home video game console developed and manufactured by [Nintendo](https://en.wikipedia.org/wiki/Nintendo).

![alt text](https://upload.wikimedia.org/wikipedia/commons/8/82/NES-Console-Set.jpg)


License is Creative Commons by SA, except the cores that has its own license 
