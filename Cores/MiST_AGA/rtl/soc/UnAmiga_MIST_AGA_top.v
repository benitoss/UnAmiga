/**************************************************/
/* minimig_de0_nan0_top.v                   		  */
/* Altera DE0 Nano FPGA Top File           		  */
/*                                         		  */
/* 2012, rok.krajnc@gmail.com               		  */
/* 2015, Stefan Kristiansson                		  */
/* 2018, Joseba Epalza <jepalza> UnAmiga MIST-AGA */
/**************************************************/



// jepalza: he anulado la mayoria de "defines"
`define MINIMIG_VIDEO_FILTER


module UnAmiga_MIST_AGA_top (
  // clock inputs
  input                 CLOCK_50,     // 50 MHz
  // push button inputs
  input       [    1:0] KEY,          // Pushbutton[1:0]
  // LED outputs
  output      [    2:0] LEDS,         // 2 led (azul-naranja) en nuestra boina, y uno (rojo) en plana fpga
  // altavoz piezoelectrico
  //output						PIEZO,
  // UART
  output                UART_TXD,     // UART Transmitter
  input                 UART_RXD,     // UART Receiver
  // PS2
  inout                 PS2_DAT,      // PS2 Keyboard Data
  inout                 PS2_CLK,      // PS2 Keyboard Clock
  inout                 PS2_MDAT,     // PS2 Mouse Data
  inout                 PS2_MCLK,     // PS2 Mouse Clock
  // VGA
  output                VGA_HS,       // VGA H_SYNC
  output                VGA_VS,       // VGA V_SYNC
  output      [  5:0]   VGA_R,        // VGA Red[7:0], mio 6 bits
  output      [  5:0]   VGA_G,        // VGA Green[7:0] mio 6 bits
  output      [  5:0]   VGA_B,        // VGA Blue[7:0] mio 6 bits
  // SD Card
  input                 SD_MISO,      // SD Card Data            - spi MISO
  output                SD_CS,        // SD Card Data 3          - spi CS
  output                SD_MOSI,      // SD Card Command Signal  - spi MOSI
  output                SD_CLK,       // SD Card Clock           - spi CLK
  // SDRAM
  inout       [ 15:0]   SDRAM_DQ,      // SDRAM Data bus 16 Bits
  output      [ 12:0]   SDRAM_A,       // SDRAM Address bus 12 Bits
  output                SDRAM_DQML,    // SDRAM Low-byte Data Mask
  output                SDRAM_DQMH,    // SDRAM High-byte Data Mask
  output                SDRAM_nWE,     // SDRAM Write Enable
  output                SDRAM_nCAS,    // SDRAM Column Address Strobe
  output                SDRAM_nRAS,    // SDRAM Row Address Strobe
  output                SDRAM_nCS,     // SDRAM Chip Select
  output      [  1:0]   SDRAM_BA,      // SDRAM Bank Address 0-1
  output                SDRAM_CLK,     // SDRAM Clock
  output                SDRAM_CKE,     // SDRAM Clock Enable
  // MANDOS
  input       [  6-1:0] JOYA,         // joystick port A
  input       [  6-1:0] JOYB,         // joystick port B
  // SONIDO
  output                AUDIO_L,      // sigma-delta DAC output left
  output                AUDIO_R       // sigma-delta DAC output right
);



////////////////////////////////////////
// internal signals                   //
////////////////////////////////////////

// clock
wire           pll_in_clk;
wire           clk_114;
wire           clk_28;
wire           clk_sdram;
wire           pll_locked;
wire           clk_7;
wire           clk7_en;
wire           c1;
wire           c3;
wire           cck;
wire [ 10-1:0] eclk;
wire           clk_50;

// reset
wire           pll_rst;
wire           sdctl_rst;
wire           rst_50;
wire           rst_minimig;
wire           rst_cpu;

// ctrl
wire           rom_status;
wire           ram_status;
wire           reg_status;
wire           dram_status;
wire           ctrl_txd;
wire           ctrl_rxd;
wire [ 23-1:0] dram_adr;
wire           dram_cs;
wire           dram_we;
wire [  4-1:0] dram_sel;
wire [ 32-1:0] dram_dat_w;
wire [ 32-1:0] dram_dat_r;
wire           dram_ack;
wire           dram_err;

// bridge
wire [ 23-1:0] bridge_adr;
wire           bridge_cs;
wire           bridge_we;
wire [  4-1:0] bridge_sel;
wire [ 32-1:0] bridge_dat_w;
wire [ 32-1:0] bridge_dat_r;
wire           bridge_ack;
wire           bridge_err;

// tg68
wire           tg68_rst;
wire [ 16-1:0] tg68_dat_in;
wire [ 16-1:0] tg68_dat_out;
wire [ 32-1:0] tg68_adr;
wire [  3-1:0] tg68_IPL;
wire           tg68_dtack;
wire           tg68_as;
wire           tg68_uds;
wire           tg68_lds;
wire           tg68_rw;
wire           tg68_ena7RD;
wire           tg68_ena7WR;
wire           tg68_enaWR;
wire [ 16-1:0] tg68_cout;
wire           tg68_cpuena;
wire [  4-1:0] cpu_config;
wire [  6-1:0] memcfg;
wire           vsync;
wire [ 32-1:0] tg68_cad;
wire [  6-1:0] tg68_cpustate;
wire           tg68_cdma;
wire           tg68_clds;
wire           tg68_cuds;
wire [ 32-1:0] tg68_VBR_out;

// minimig
wire           minimig_rst_out;
wire [ 16-1:0] ram_data;      // sram data bus
wire [ 16-1:0] ramdata_in;    // sram data bus in
wire [ 22-1:1] ram_address;   // sram address bus
wire           _ram_bhe;      // sram upper byte select
wire           _ram_ble;      // sram lower byte select
wire           _ram_we;       // sram write enable
wire           _ram_oe;       // sram output enable
wire           _15khz;        // scandoubler disable
wire           SDO;           // SPI data output

// RS232
wire           minimig_txd;
wire           minimig_rxd;

// host bus
wire           host_cs;
wire [ 24-1:0] host_adr;
wire           host_we;
wire [  2-1:0] host_bs;
wire [ 16-1:0] host_wdat;
wire [ 16-1:0] host_rdat;
wire           host_ack;

// sdram
wire           reset_out;
wire [  4-1:0] sdram_cs;
wire [  2-1:0] sdram_dqm;


// ctrl
wire [  4-1:0] SPI_CS_N;
wire           SPI_DI;
wire           rst_ext;
wire [  4-1:0] ctrl_cfg;
wire [  4-1:0] ctrl_status;
wire [  4-1:0] sys_status;
wire [  4-1:0] mem_status;

// uart
wire           uart_sel;





// //////////////////
// jepalza: version MIST AGA
wire           clk7n_en;

wire           turbochipram;
wire           turbokick;
wire           cache_inhibit;
wire [  4-1:0] tg68_CACR_out;
wire           tg68_ovr;
wire           tg68_nrst_out;

wire [ 48-1:0] chip48;        // memoria 48 bits para video AGA

// los indicadores de estado del MIST
// solo tenemos dos led mas el de placa fijo
wire           floppy_fwr;
wire           floppy_frd; // al led naranja
wire           hd_fwr;
wire           hd_frd; // al led azul






// //////////////////
// ajustes a mi placa

// para invertir el estado de los LEDS de mi placa (solo algunos)
wire [7:0] salida_led; // necesito 8 bits para el modulo, pero solo usamos 3 (por los tres led)

// ajuste para los colores de 8bits del MIST-AGA, a nuestra placa de 6bits
wire [7:0] VGA_R8;
wire [7:0] VGA_G8;
wire [7:0] VGA_B8;

////////////////////////////////////////
// toplevel assignments               //
////////////////////////////////////////

// UART
// uart_sel = 0 => minimig, uart_sel = 1 => or1k
assign uart_sel         = 1'b0; // 0=modo A500, 1=modo rs232 salida de datos minimig
assign UART_TXD         = uart_sel ? ctrl_txd : minimig_txd;
assign ctrl_rxd         = uart_sel ? UART_RXD : 1'b1;
assign minimig_rxd      = uart_sel ? 1'b1     : UART_RXD;

// SD card
assign SD_CS             = SPI_CS_N[0];

// SDRAM
assign SDRAM_CKE         = 1'b1;
assign SDRAM_CLK         = clk_sdram;
assign SDRAM_nCS         = sdram_cs[0];
assign SDRAM_DQML        = sdram_dqm[0];
assign SDRAM_DQMH        = sdram_dqm[1];

// ctrl
assign SPI_DI           = !SPI_CS_N[0] ? SD_MISO : SDO;
assign ctrl_cfg         = {1'b0, 1'b0, 1'b0, 1'b0};

// clock
assign pll_in_clk       = CLOCK_50;

// reset
assign rst_ext          = !KEY[0]; // boton reset externo
assign pll_rst          = rst_ext;
assign sdctl_rst        = pll_locked & !rst_ext; // 1+1=ok, no reset. cualquiera de los dos "0"=reset

// minimig (VGA scandoubler)
assign _15khz           = 1'b1; // fijo en modo VGA



////////////////////////////////////////
// modules                            //
////////////////////////////////////////

// estado del sistema, para enviar, tanto al MIST como a los indivadores
assign sys_status = {vsync, ~tg68_rst, minimig_rst_out, ~reset_out};
assign mem_status = {rom_status, ram_status, reg_status, dram_status};

// indicadores led, solo tenemos tres
indicators indicadores(
  .clk          (clk_7       ),
  .rst          (~pll_locked ),
  .track        (		        ), // variable 7:0 de nº de pista, sin uso
  .f_wr         (floppy_fwr  ), // escritura FD
  .f_rd         (floppy_frd  ), // lectura FD
  .h_wr         (hd_fwr      ), // escritura HD
  .h_rd         (hd_frd      ), // lectura HD
  .status       (mem_status  ), // sin uso, pero lo dejo para depuracion
  .ctrl_status  (ctrl_status ), // estado del modulo de arranque inicial CTRL_TOP
  .sys_status   (sys_status  ), // estado del sistema
  .fifo_full    (		  		  ), // estado del "buffer" fifo, si uso
  .led          (salida_led  )  // salida a LEDS
);
// al final, solo me quedo con 3: FIFO_FULL, HD y FD, que mezclan escritura y lectura en el modulo "indicators"
// los leds de nuestra placa los dejo sin invertir (son HD y FD) (1 encendido, 0 apagado), 
// pero el resto los invierto, para que el de la placa principal indique actividad del sistema (0 encendido, 1 apagado), 
assign LEDS = {~salida_led[2],salida_led[1:0]};
// nota de ultima hora: debido a que el PIN_M8 del LED de la FPGA es el mismo que el del UART, no se puede usar
// por lo que el indicador de sistema no tiene valided (LED[2])


//// control block ////
ctrl_top ctrl_top (
  // system
  .clk_in       (CLOCK_50         ),  // input 50MHz clock
  .rst_ext      (rst_ext          ),  // external reset input
  .clk_out      (clk_50           ),  // output 50MHz clock from internal PLL
  .rst_out      (rst_50           ),  // reset output from internal reset generator
  .rst_minimig  (rst_minimig      ),  // minimig reset output
  .rst_cpu      (rst_cpu          ),  // TG68K reset output
  // config
  .boot_sel     (1'b0             ),  // select FLASH boot location
  .ctrl_cfg     (ctrl_cfg         ),  // config for ctrl module
  // status
  .rom_status   (rom_status       ),  // ROM slave activity
  .reg_status   (reg_status       ),  // REG slave activity
  .dram_status  (dram_status      ),  // DRAM slave activity
  .ctrl_status  (ctrl_status      ),  // salida de estado de CTRL para llevar a los LED
  .sys_status   (sys_status		 ),  // SYS status input
  // DRAM interface
  .dram_adr     (dram_adr         ),
  .dram_cs      (dram_cs          ),
  .dram_we      (dram_we          ),
  .dram_sel     (dram_sel         ),
  .dram_dat_w   (dram_dat_w       ),
  .dram_dat_r   (dram_dat_r       ),
  .dram_ack     (dram_ack         ),
  .dram_err     (dram_err         ),
  // UART
  .uart_txd     (ctrl_txd         ),  // UART transmit output
  .uart_rxd     (ctrl_rxd         ),  // UART receive input
  // SPI
  .spi_cs_n     (SPI_CS_N         ),  // SPI chip select output
  .spi_clk      (SD_CLK           ),  // SPI clock
  .spi_do       (SD_MOSI          ),  // SPI data input
  .spi_di       (SPI_DI           )   // SPI data output
);


//// qmem async 32-to-32 bridge ////
qmem_bridge #(
  .MAW (23), // 23
  .MSW (4 ), // 4
  .MDW (32), // 32
  .SAW (23), // 23
  .SSW (4 ), // 4
  .SDW (32)  // 32
) qmem_bridge (
  // master
  .m_clk        (clk_50           ),
  .m_adr        (dram_adr         ),
  .m_cs         (dram_cs          ),
  .m_we         (dram_we          ),
  .m_sel        (dram_sel         ),
  .m_dat_w      (dram_dat_w       ),
  .m_dat_r      (dram_dat_r       ),
  .m_ack        (dram_ack         ),
  .m_err        (dram_err         ),
  // slave
  .s_clk        (clk_114          ),
  .s_adr        (bridge_adr       ),
  .s_cs         (bridge_cs        ),
  .s_we         (bridge_we        ),
  .s_sel        (bridge_sel       ),
  .s_dat_w      (bridge_dat_w     ),
  .s_dat_r      (bridge_dat_r     ),
  .s_ack        (bridge_ack       ),
  .s_err        (1'b0) // bridge_err       ) // anulado, no se usa
);


//// amiga clocks ////
amiga_clk amiga_clk (
  .rst          (pll_rst          ), // async reset input
  .clk_in       (pll_in_clk       ), // input clock     (50MHZ EN MI PLACA)
  .clk_114      (clk_114          ), // output clock c0 (114.750000MHz)
  .clk_sdram    (clk_sdram        ), // output clock c2 (114.750000MHz, -146.25 deg)
  .clk_28       (clk_28           ), // output clock c1 ( 28.687500MHz)
  .clk_7        (clk_7            ), // output clock 7  (  7.171875MHz)
  .clk7_en      (clk7_en          ), // output clock 7 enable (on 28MHz clock domain)
  .clk7n_en     (clk7n_en         ), // 7MHz negedge output clock enable (on 28MHz clock domain)
  .c1           (c1               ), // clk28m clock domain signal synchronous with clk signal
  .c3           (c3               ), // clk28m clock domain signal synchronous with clk signal delayed by 90 degrees
  .cck          (cck              ), // colour clock output (3.54 MHz)
  .eclk         (eclk             ), // 0.709379 MHz clock enable output (clk domain pulse)
  .locked       (pll_locked       )  // pll locked output
);

// jepalza, 68020? el del MIST, mejorado
TG68K tg68k (
  .clk          (clk_114          ),
  .reset        (tg68_rst         ),
  .clkena_in    (1'b1             ),
  .IPL          (tg68_IPL         ),
  .dtack        (tg68_dtack       ),
  .vpa          (1'b1             ),
  .ein          (1'b1             ),
  .addr         (tg68_adr         ),
  .data_read    (tg68_dat_in      ),
  .data_write   (tg68_dat_out     ),
  .as           (tg68_as          ),
  .uds          (tg68_uds         ),
  .lds          (tg68_lds         ),
  .rw           (tg68_rw          ),
  .e            (                 ),
  .vma          (                 ),
  .wrd          (                 ),
  .ena7RDreg    (tg68_ena7RD      ),
  .ena7WRreg    (tg68_ena7WR      ),
  .enaWRreg     (tg68_enaWR       ),
  .fromram      (tg68_cout        ),
  .ramready     (tg68_cpuena      ),
  .cpu          (cpu_config[1:0]  ),
	//
  .ramaddr      (tg68_cad         ),
  .cpustate     (tg68_cpustate    ),
  .nResetOut    (tg68_nrst_out    ),
  .skipFetch    (                 ),
  .cpuDMA       (tg68_cdma        ),
  .ramlds       (tg68_clds        ),
  .ramuds       (tg68_cuds        ),
  .VBR_out      (tg68_VBR_out     ),
  // nuevos en version 68020
  .turbochipram (turbochipram     ), // in
  .turbokick    (turbokick        ), // in
  .cache_inhibit(cache_inhibit    ), // out, hacia SDRAM
  .fastramcfg   ({&memcfg[5:4],memcfg[5:4]}), // IN , seleciona la FASTRAM:2 o 4mb estandar o 24 
  .CACR_out     (tg68_CACR_out    ), // out (buffer)
  .ovr          (tg68_ovr         ), // out
  // red, no implementada
  .eth_en       (1'b1),
  .sel_eth      (),
  .frometh      (16'd0),
  .ethready     (1'b0)
);

//// sdram desde minimig DE0-Nano, ampliada por jepalza para MIST
sdram_ctrl sdram (
  // sys
  .sysclk       (clk_114          ),
  .c_7m         (clk_7            ),
  .reset_in     (sdctl_rst        ),
  .cache_rst    (tg68_rst         ),
  .reset_out    (reset_out        ),
  .cache_ena    ( 1  ), // siempre fijo?
  // sdram
  .sdaddr       (SDRAM_A          ),
  .sd_cs        (sdram_cs         ),
  .ba           (SDRAM_BA         ),
  .sd_we        (SDRAM_nWE        ),
  .sd_ras       (SDRAM_nRAS       ),
  .sd_cas       (SDRAM_nCAS       ),
  .dqm          (sdram_dqm        ),
  .sdata        (SDRAM_DQ         ),
  // host
  .host_cs      (bridge_cs        ),
  .host_adr     ({bridge_adr[22], 2'b11, bridge_adr[21:0]}), // jepalza, antes 2'b00, ahora 11, para cargar en lo mas alto
  .host_we      (bridge_we        ),
  .host_bs      (bridge_sel       ),
  .host_wdat    (bridge_dat_w     ),
  .host_rdat    (bridge_dat_r     ),
  .host_ack     (bridge_ack       ),
  // chip
  .chipAddr     ({2'b00, ram_address[21:1]}),
  .chipL        (_ram_ble         ),
  .chipU        (_ram_bhe         ),
  .chipRW       (_ram_we          ),
  .chip_dma     (_ram_oe          ),
  .chipWR       (ram_data         ),
  .chipRD       (ramdata_in       ),
  .chip48       (chip48           ), // out, jepalza, para dar mas RAM al modo AGA
  // cpu
  .cpuAddr      (tg68_cad[24:1]   ),
  .cpustate     (tg68_cpustate    ),
  .cpuL         (tg68_clds        ),
  .cpuU         (tg68_cuds        ),
  .cpu_dma      (tg68_cdma        ),
  .cpuWR        (tg68_dat_out     ),
  .cpuRD        (tg68_cout        ),
  .enaWRreg     (tg68_enaWR       ),
  .ena7RDreg    (tg68_ena7RD      ),
  .ena7WRreg    (tg68_ena7WR      ),
  .cpuena       (tg68_cpuena      )
);



// jepalza, nuevo minimig, con soporte AGA, proviene del MIST, con partes adaptadas por mi
minimig minimig (
  //m68k pins
  .cpu_address  (tg68_adr[23:1]   ), // M68K address bus
  .cpu_data     (tg68_dat_in      ), // M68K data bus
  .cpudata_in   (tg68_dat_out     ), // M68K data in
  ._cpu_ipl     (tg68_IPL         ), // M68K interrupt request
  ._cpu_as      (tg68_as          ), // M68K address strobe
  ._cpu_uds     (tg68_uds         ), // M68K upper data strobe
  ._cpu_lds     (tg68_lds         ), // M68K lower data strobe
  .cpu_r_w      (tg68_rw          ), // M68K read / write
  ._cpu_dtack   (tg68_dtack       ), // M68K data acknowledge
  ._cpu_reset   (tg68_rst         ), // OUT M68K reset
  ._cpu_reset_in(tg68_nrst_out    ), // IN  M68K reset out
  .cpu_vbr      (tg68_VBR_out     ), // M68K VBR
  .ovr          (tg68_ovr         ), // NMI override address decoding
  //sram pins
  .ram_data     (ram_data         ), // SRAM data bus
  .ramdata_in   (ramdata_in       ), // SRAM data bus in
  .ram_address  (ram_address[21:1]), // SRAM address bus
  ._ram_bhe     (_ram_bhe         ), // SRAM upper byte select
  ._ram_ble     (_ram_ble         ), // SRAM lower byte select
  ._ram_we      (_ram_we          ), // SRAM write enable
  ._ram_oe      (_ram_oe          ), // SRAM output enable
  .chip48       (chip48           ), // input big chipram read
  //system  pins
  .rst_ext      (rst_minimig      ), // in reset from ctrl block
  .rst_out      (minimig_rst_out  ), // ''out'' (añadido por JEPALZA) minimig reset status
  .clk          (clk_28           ), // in desde clk principal clock c1 ( 28.687500MHz)
  .clk7_en      (clk7_en          ), // in 7MHz clock enable
  .clk7n_en     (clk7n_en         ), // in 7MHz negedge clock enable
  .c1           (c1               ), // in clk28m clock domain signal synchronous with clk signal
  .c3           (c3               ), // in clk28m clock domain signal synchronous with clk signal delayed by 90 degrees
  .cck          (cck              ), // in colour clock output (3.54 MHz)
  .eclk         (eclk             ), // in 0.709379 MHz clock enable output (clk domain pulse)
  //rs232 pins
  .rxd          (minimig_rxd),//UART_RX          ),  // RS232 receive, jepalza, para poder desviar TX-RX
  .txd          (minimig_txd),//UART_TX          ),  // RS232 send
  .cts          (1'b0             ),  // RS232 clear to send
  .rts          (                 ),  // RS232 request to send
  //I/O
  ._joy1        (JOYA             ),  // joystick 1 [fire4,fire3,fire2,fire,up,down,left,right] (default mouse port)
  ._joy2        (JOYB             ),  // joystick 2 [fire4,fire3,fire2,fire,up,down,left,right] (default joystick port)
  .mouse_btn1   (1'b1             ), // mouse button 1
  .mouse_btn2   (1'b1             ), // mouse button 2
  // todo esto solo es para el SPI del MIST, lo anulo
  .mouse_btn         (), // todo anulado
  .kbd_mouse_data    (),
  .kbd_mouse_type    (),
  .kbd_mouse_strobe  (),
  .kms_level    	 (),
  //
  ._15khz       (_15khz           ),  // scandoubler disable
  .pwrled       (),//led              ),  // power led
  .msdat        (PS2_MDAT         ),  // PS2 mouse data
  .msclk        (PS2_MCLK         ),  // PS2 mouse clk
  .kbddat       (PS2_DAT          ),  // PS2 keyboard data
  .kbdclk       (PS2_CLK          ),  // PS2 keyboard clk
  //host controller interface (SPI), jepalza, las cinco lineas MIST cambiadas
  ._scs         (SPI_CS_N[3:1]    ),//{SPI_SS4,SPI_SS3,SPI_SS2}  ),  // SPI chip select
  .direct_sdi   (SD_MISO          ),//SPI_DO           ),  // SD Card direct in  SPI_SDO
  .sdi          (SD_MOSI          ),//SPI_DI           ),  // SPI data input
  .sdo          (SDO              ),//minimig_sdo      ),  // SPI data output
  .sck          (SD_CLK           ),//SPI_SCK          ),  // SPI clock
  //video
  ._hsync       (VGA_HS),   // horizontal sync
  ._vsync       (VGA_VS),   // vertical sync
  .red          (VGA_R8 ),  // red
  .green        (VGA_G8 ),  // green
  .blue         (VGA_B8 ),  // blue
  //audio
  .left         (AUDIO_L          ),  // audio bitstream left
  .right        (AUDIO_R          ),  // audio bitstream right
  .ldata        (                 ),  // left DAC data
  .rdata        (                 ),  // right DAC data
  //user i/o
  .cpu_config   (cpu_config       ), // out CPU config
  .memcfg       (memcfg           ), // out memory config
  .turbochipram (turbochipram     ), // out turbo chipRAM
  .turbokick    (turbokick        ), // out turbo kickstart
  .init_b       (vsync            ), // out (jepalza) vertical sync for MCU (sync OSD update), necesario para nuestro OSD
  // salidas de estados del MIST, para los led de nuestra placa
  .fifo_full    (                 ), 
  .trackdisp    (		             ), // floppy track number, variable 7:0 para indicar nº de pista, pero sin uso
  .secdisp      (                 ), // sector
  .floppy_fwr   (floppy_fwr       ), // floppy fifo writing
  .floppy_frd   (floppy_frd       ), // floppy fifo reading
  .hd_fwr       (hd_fwr           ), // hd fifo writing
  .hd_frd       (hd_frd           )  // hd fifo  ading
);

assign VGA_R = VGA_R8[7:2] ; // me quedo con los 6 bits altos
assign VGA_G = VGA_G8[7:2] ; // para llegar a los de 
assign VGA_B = VGA_B8[7:2] ; // nuestra placa

endmodule
