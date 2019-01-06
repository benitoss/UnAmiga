// ZXUNO port by DistWave (2016)
// fpganes
// Copyright (c) 2012-2013 Ludvig Strigeus
// This program is GPL Licensed. See COPYING for the full license.

`timescale 1ns / 1ps

module NES_TOP
(

  input CLOCK_50,
  
  // VGA
  output VGA_V, output VGA_H, output [9:0] VGA_R, output [9:0] VGA_G, output [9:0] VGA_B,
  
  output VGA_CLK,
	output VGA_BLANK,
	output VGA_SYNC,

  // Memory
//--  output ram_WE_n,          // Write Enable. WRITE when Low.
 //-- output [18:0] ram_a,
 //-- inout [7:0] ram_d,
 
 
 
   // Memory
 	output [17:0]	SRAM_ADDR,
	inout	[15:0] SRAM_DQ,
	output	SRAM_UB_N,
	output	SRAM_LB_N,
	output	SRAM_CE_N,
	output	SRAM_OE_N,
	output	SRAM_WE_N,
 

 
  output AUDIO_R,
  output AUDIO_L,
  input P_A,
  input P_tr,
  input P_U,
  input P_D,
  input P_L,
  input P_R,
  input PS2_CLK,
  input PS2_DAT,
  input SPI_MISO,
  output SPI_MOSI,
  output SPI_CLK,
  output SPI_CS,
  output led,
  
  output [6:0] HEX0,
  output [6:0] HEX1,
  output [6:0] HEX2,
  output [6:0] HEX3,
  output [6:0] HEX4,
  output [6:0] HEX5,
  output [6:0] HEX6,
  output [6:0] HEX7,
  
  output [17:0] LEDR,  
  output [7:0] LEDG,  
  
  inout I2C_SCLK,
inout	I2C_SDAT,
  

		  output AUD_XCK,
		  output AUD_BCLK,
		  output AUD_ADCLRCK ,
		input AUD_ADCDAT,
		  output AUD_DACLRCK,
		  output AUD_DACDAT

  
  //,
//input reset,
//input set,
//output [6:0] sseg_a_to_dp,	// cathode of seven segment display( a,b,c,d,e,f,g,dp )
//output [3:0] sseg_an			// anaode of seven segment display( AN3,AN2,AN1,AN0 )
  );

  wire osd_window;
  wire osd_pixel;
  wire [15:0] dipswitches;
  wire scanlines;
  wire hq_enable;
  wire border;
  
  assign scanlines = dipswitches[0];
  assign hq_enable = dipswitches[1];
  
  wire host_reset_n;
  wire host_reset_loader;
  wire host_divert_sdcard;
  wire host_divert_keyboard;
  wire host_select;
  wire host_start;
  
  reg boot_state = 1'b0;
 
  wire [31:0] bootdata;
  wire bootdata_req;
  reg bootdata_ack = 1'b0;
  
  wire AUD_MCLK;
  wire AUD_LRCK;
  wire AUD_SCK;
  wire AUD_SDIN;
  
  wire [3:0] vga_blue;
  wire [3:0] vga_green;
  wire [3:0] vga_red;
  
  wire vga_hsync;
  wire vga_vsync;
  wire [7:0] vga_osd_r;
  wire [7:0] vga_osd_g;
  wire [7:0] vga_osd_b;
  assign VGA_H = vga_hsync;
  assign VGA_V = vga_vsync;
  assign VGA_R[9:7] = vga_osd_r[7:5];
  assign VGA_G[9:7] = vga_osd_g[7:5];
  assign VGA_B[9:7] = vga_osd_b[7:5];
  
  assign VGA_CLK = clk;
  assign VGA_SYNC = vga_hsync & vga_vsync;
  assign VGA_BLANK = 1'b1;
	 

  assign led = loader_fail;
  
  wire clock_locked;
  wire clk;
  reg clk_loader;
  wire clk_gameloader;
  wire clk_fifo;

  wire clk_ctrl;
   wire clk_audio;
  reg[15:0] data;
  reg [7:0] loader_input;
    
  wire joypad_data;
  
  nes_clk clock_21mhz(
    .inclk0(CLOCK_50), 
	 .c0(clk), 
	 .c1(clk_ctrl), 
	 .c2(clk_audio),
	 /*.CLK_OUT3(clk4),*/ 
	 .LOCKED(clock_locked)
	);

/*  // NES Palette -> RGB332 conversion
  reg [14:0] pallut[0:63];
  //initial $readmemh("../../src/nes_palette.txt", pallut);
  initial begin
		pallut[0]  = 15'h3def;
		pallut[1]  = 15'h7c00;
		pallut[2]  = 15'h5c00;
		pallut[3]  = 15'h5ca8;
		pallut[4]  = 15'h4012;
		pallut[5]  = 15'h1015;
		pallut[6]  = 15'h0055;
		pallut[7]  = 15'h0051;
		pallut[8]  = 15'h00ca;
		pallut[9]  = 15'h01e0;
		pallut[10] = 15'h01a0;
		pallut[11] = 15'h0160;
		pallut[12] = 15'h2d00;
		pallut[13] = 15'h0000;
		pallut[14] = 15'h0000;
		pallut[15] = 15'h0000;
		pallut[16] = 15'h5ef7;
		pallut[17] = 15'h7de0;
		pallut[18] = 15'h7d60;
		pallut[19] = 15'h7d0d;
		pallut[20] = 15'h641b;
		pallut[21] = 15'h2c1c;
		pallut[22] = 15'h00ff;
		pallut[23] = 15'h097c;
		pallut[24] = 15'h01f5;
		pallut[25] = 15'h02e0;
		pallut[26] = 15'h02a0;
		pallut[27] = 15'h22a0;
		pallut[28] = 15'h4620;
		pallut[29] = 15'h0000;
		pallut[30] = 15'h0000;
		pallut[31] = 15'h0000;
		pallut[32] = 15'h7fff;
		pallut[33] = 15'h7ee7;
		pallut[34] = 15'h7e2d;
		pallut[35] = 15'h7df3;
		pallut[36] = 15'h7dff;
		pallut[37] = 15'h4d7f;
		pallut[38] = 15'h2dff;
		pallut[39] = 15'h229f;
		pallut[40] = 15'h02ff;
		pallut[41] = 15'h0ff7;
		pallut[42] = 15'h2b6b;
		pallut[43] = 15'h4feb;
		pallut[44] = 15'h6fa0;
		pallut[45] = 15'h3def;
		pallut[46] = 15'h0000;
		pallut[47] = 15'h0000;
		pallut[48] = 15'h7fff;
		pallut[49] = 15'h7f94;
		pallut[50] = 15'h7ef7;
		pallut[51] = 15'h7efb;
		pallut[52] = 15'h7eff;
		pallut[53] = 15'h629f;
		pallut[54] = 15'h5b5e;
		pallut[55] = 15'h579f;
		pallut[56] = 15'h3f7f;
		pallut[57] = 15'h3ffb;
		pallut[58] = 15'h5ff7;
		pallut[59] = 15'h6ff7;
		pallut[60] = 15'h7fe0;
		pallut[61] = 15'h7f7f;
		pallut[62] = 15'h0000;
		pallut[63] = 15'h0000;
  end
  */
  
    // NES Palette -> RGB332 conversion
  reg [14:0] pallut[0:63];
  //initial $readmemh("../../src/nes_palette.txt", pallut);
  always@(posedge clk) begin 
		pallut[0]  = 15'h3def;
		pallut[1]  = 15'h7c00;
		pallut[2]  = 15'h5c00;
		pallut[3]  = 15'h5ca8;
		pallut[4]  = 15'h4012;
		pallut[5]  = 15'h1015;
		pallut[6]  = 15'h0055;
		pallut[7]  = 15'h0051;
		pallut[8]  = 15'h00ca;
		pallut[9]  = 15'h01e0;
		pallut[10] = 15'h01a0;
		pallut[11] = 15'h0160;
		pallut[12] = 15'h2d00;
		pallut[13] = 15'h0000;
		pallut[14] = 15'h0000;
		pallut[15] = 15'h0000;
		pallut[16] = 15'h5ef7;
		pallut[17] = 15'h7de0;
		pallut[18] = 15'h7d60;
		pallut[19] = 15'h7d0d;
		pallut[20] = 15'h641b;
		pallut[21] = 15'h2c1c;
		pallut[22] = 15'h00ff;
		pallut[23] = 15'h097c;
		pallut[24] = 15'h01f5;
		pallut[25] = 15'h02e0;
		pallut[26] = 15'h02a0;
		pallut[27] = 15'h22a0;
		pallut[28] = 15'h4620;
		pallut[29] = 15'h0000;
		pallut[30] = 15'h0000;
		pallut[31] = 15'h0000;
		pallut[32] = 15'h7fff;
		pallut[33] = 15'h7ee7;
		pallut[34] = 15'h7e2d;
		pallut[35] = 15'h7df3;
		pallut[36] = 15'h7dff;
		pallut[37] = 15'h4d7f;
		pallut[38] = 15'h2dff;
		pallut[39] = 15'h229f;
		pallut[40] = 15'h02ff;
		pallut[41] = 15'h0ff7;
		pallut[42] = 15'h2b6b;
		pallut[43] = 15'h4feb;
		pallut[44] = 15'h6fa0;
		pallut[45] = 15'h3def;
		pallut[46] = 15'h0000;
		pallut[47] = 15'h0000;
		pallut[48] = 15'h7fff;
		pallut[49] = 15'h7f94;
		pallut[50] = 15'h7ef7;
		pallut[51] = 15'h7efb;
		pallut[52] = 15'h7eff;
		pallut[53] = 15'h629f;
		pallut[54] = 15'h5b5e;
		pallut[55] = 15'h579f;
		pallut[56] = 15'h3f7f;
		pallut[57] = 15'h3ffb;
		pallut[58] = 15'h5ff7;
		pallut[59] = 15'h6ff7;
		pallut[60] = 15'h7fe0;
		pallut[61] = 15'h7f7f;
		pallut[62] = 15'h0000;
		pallut[63] = 15'h0000;
  end
  
  
  
  wire [8:0] cycle;
  wire [8:0] scanline;
  wire [15:0] sample;
  wire [5:0] color;
  wire joypad_strobe;
  wire [1:0] joypad_clock;
  wire [21:0] memory_addr;
  wire memory_read_cpu, memory_read_ppu;
  wire memory_write;
  wire [7:0] memory_din_cpu, memory_din_ppu;
  wire [7:0] memory_dout;
  reg [7:0] joypad_bits, joypad_bits2;
  reg [1:0] last_joypad_clock;
  wire [31:0] dbgadr;

  wire [1:0] dbgctr;

  reg [1:0] nes_ce;

  reg [13:0] debugaddr;
  wire [7:0] debugdata;


 
  wire ram_WE_n;          // Write Enable. WRITE when Low.
  wire [18:0] ram_a;
  wire [7:0] from_sram;
  wire [7:0] to_sram;
  
  

  
	assign SRAM_CE_N	= 1'b0;				//-- sempre ativa
	assign SRAM_OE_N	= 1'b0;				//-- sempre ativa
	assign SRAM_WE_N	= ram_WE_n;
	assign SRAM_UB_N	= !ram_a[0];		//-- UB = 0 ativa bits 15..8
	assign SRAM_LB_N	= ram_a[0];			//-- LB = 0 ativa bits 7..0
	assign SRAM_ADDR	= ram_a[18:1];
	assign SRAM_DQ		= (ram_a[0] == 1'b0) ? {8'bZZZZZZZZ, to_sram}	: 	{to_sram, 8'bZZZZZZZZ };
   assign from_sram  = (ram_a[0] == 1'b0) ? SRAM_DQ[7:0]	: 	SRAM_DQ[15:8];
	
	
	  wire [7:0] dbg1;
	  wire [7:0] dbg2;
	  wire [7:0] dbg3;
	  wire [4:0] debugleds;
	
	
	SEG7_LUT seg7_7 (HEX7, loader_write_data[7:4]);
	SEG7_LUT seg7_6 (HEX6, loader_write_data[3:0] );
	SEG7_LUT seg7_5 (HEX5, dbg3[7:4]);
	SEG7_LUT seg7_4 (HEX4, dbg3[3:0]);
	SEG7_LUT seg7_3 (HEX3, { 1'b0, pallut[24][14:12]});
	SEG7_LUT seg7_2 (HEX2, pallut[24][11:8]);
	SEG7_LUT seg7_1 (HEX1, dbg1[7:4]);
	SEG7_LUT seg7_0 (HEX0, dbg1[3:0]);	
	

	
	assign LEDR[4:0] = debugleds;
	
	assign LEDR[5] = run_mem;
	assign LEDR[6] = !ram_WE_n;
	assign LEDR[7] = loader_write; // 1 durante a escrita da SRAM
	assign LEDR[8] = loader_done; // 1 depois do load
	assign LEDR[9] = loader_fail;
	assign LEDR[10] = loader_reset;
   assign LEDR[11] = reset_nes;
   assign LEDR[12] = run_nes;
	assign LEDR[13] = run_mem;

  
  wire [21:0] loader_addr;
  wire [7:0] loader_write_data;
  wire loader_reset = host_reset_loader;// &&  uart_loader_conf[0];
  wire loader_write;
  wire [31:0] mapper_flags;
  wire loader_done, loader_fail;
  wire empty_fifo;
  
  GameLoader loader(
    clk_gameloader, 
    loader_reset, 
	 loader_input, 
	 clk_loader,
	 loader_addr, 
	 loader_write_data, 
	 loader_write,
	 mapper_flags,
	 loader_done,
	 loader_fail
	);
	
	 
  wire [7:0] joystick1, joystick2;
  wire p_sel = !host_select;
  wire p_start = !host_start;
  assign joystick1 = {~P_R, ~P_L, ~P_D, ~P_U, ~p_start, ~p_sel, ~P_tr, ~P_A};
  
	
	always @(posedge clk) begin
    if (joypad_strobe) begin
      joypad_bits <= joystick2; //joystick1; //zerado por enquanto
      joypad_bits2 <= joystick2;
    end
    if (!joypad_clock[0] && last_joypad_clock[0])
      joypad_bits <= {1'b0, joypad_bits[7:1]};
    if (!joypad_clock[1] && last_joypad_clock[1])
      joypad_bits2 <= {1'b0, joypad_bits2[7:1]};
    last_joypad_clock <= joypad_clock;
  end

  wire reset_nes = (!host_reset_n || !loader_done);
  wire run_mem = (nes_ce == 0) && !reset_nes;
  wire run_nes = (nes_ce == 3) && !reset_nes;


  // NES is clocked at every 4th cycle.
  always @(posedge clk)
    nes_ce <= nes_ce + 1;
    
  NES nes(clk, reset_nes, run_nes,
          mapper_flags,
          sample, color,
          joypad_strobe, joypad_clock, {joypad_bits2[0], joypad_bits[0]},
          5'b11111,
          memory_addr,
          memory_read_cpu, memory_din_cpu,
          memory_read_ppu, memory_din_ppu,
          memory_write, memory_dout,
          cycle, scanline,
          dbgadr,
          dbgctr
   );

  // This is the memory controller to access the board's SRAM
  wire ram_busy;
  
  MemoryController memory(clk,
                          memory_read_cpu && run_mem, 
                          memory_read_ppu && run_mem,
                          memory_write && run_mem || loader_write,
                          loader_write ? loader_addr : memory_addr,
                          loader_write ? loader_write_data : memory_dout,
                          memory_din_cpu,
                          memory_din_ppu,
                          ram_busy,
								  
								  ram_WE_n,
                          ram_a,
                          from_sram,
	                       to_sram,
								  debugaddr,
								  dbg1,dbg2,dbg3
								  ,debugleds
								);
								  
  reg ramfail;
  always @(posedge clk) begin
    if (loader_reset)
      ramfail <= 0;
    else
      ramfail <= ram_busy && loader_write || ramfail;
  end

  wire [14:0] doubler_pixel;
  wire doubler_sync;
  wire [9:0] vga_hcounter, doubler_x;
  wire [9:0] vga_vcounter;
  
  VgaDriver vga(
		clk, 
		vga_hsync, 
		vga_vsync, 
		vga_red, 
		vga_green, 
		vga_blue, 
		vga_hcounter, 
		vga_vcounter, 
		doubler_x, 
		doubler_pixel, //pixel_in, //, 
		doubler_sync, 
		1'b0);
  
  wire [14:0] pixel_in = pallut[color];
  
  Hq2x hq2x(clk, pixel_in, !hq_enable, 
            scanline[8],        // reset_frame
            (cycle[8:3] == 42), // reset_line
            doubler_x,          // 0-511 for line 1, or 512-1023 for line 2.
            doubler_sync,       // new frame has just started
            doubler_pixel);     // pixel is outputted

	assign AUDIO_R = audio;
	assign AUDIO_L = audio;
   wire audio;
	
	sigma_delta_dac sigma_delta_dac (
        .DACout         (audio),
        .DACin          (sample[15:8]),
        .CLK            (clk),
        .RESET          (reset_nes)
	);
	
	
	
	Audio_WM8731 audioWM
	(
		.reset		(reset_nes),
		.clock		(clk_audio),     // 24 MHz
		.psg			(sample[15:8]),
		
		.i2s_xck			(AUD_XCK),
		.i2s_bclk		(AUD_BCLK),
		.i2s_adclrck	(AUD_ADCLRCK),
		.i2s_adcdat		(AUD_ADCDAT),
		.i2s_daclrck	(AUD_DACLRCK),
		.i2s_dacdat		(AUD_DACDAT),

		.i2c_sda			(I2C_SDAT),
		.i2c_scl			(I2C_SCLK),
		
		.feedback		( 1'b0 )
	);
	
	
	

wire [31:0] rom_size;

	CtrlModule control (
			.clk(clk_ctrl), 
			.reset_n(1'b1), 
			.vga_hsync(vga_hsync), 
			.vga_vsync(vga_vsync), 
			.osd_window(osd_window), 
			.osd_pixel(osd_pixel), 
			.ps2k_clk_in(PS2_CLK), 
			.ps2k_dat_in(PS2_DAT),
			.spi_miso(SPI_MISO), 
			.spi_mosi(SPI_MOSI), 
			.spi_clk(SPI_CLK), 
			.spi_cs(SPI_CS), 
			.dipswitches(dipswitches), 
			.size(rom_size), 
			.host_divert_sdcard(host_divert_sdcard), 
			.host_divert_keyboard(host_divert_keyboard), 
			.host_reset_n(host_reset_n), 
			.host_select(host_select), 
			.host_start(host_start),
			.host_reset_loader(host_reset_loader),
			.host_bootdata(bootdata), 
			.host_bootdata_req(bootdata_req), 
			.host_bootdata_ack(bootdata_ack)
	);
	
	OSD_Overlay osd (
			.clk(clk_ctrl),
			.red_in({vga_red, 4'b0000}),
			.green_in({vga_green, 4'b0000}),
			.blue_in({vga_blue, 4'b0000}),
			.window_in(1'b1),
			.hsync_in(vga_hsync),
			.osd_window_in(osd_window),
			.osd_pixel_in(osd_pixel),
			.red_out(vga_osd_r),
			.green_out(vga_osd_g),
			.blue_out(vga_osd_b),
			.window_out(),
			.scanline_ena(scanlines)
	);
/*
  SSEG_Driver debugboard ( .clk( clk ),
						  .reset( 1'b0 ), 
						  .data( data ),
						  .sseg( sseg_a_to_dp ), 
						  .an( sseg_an ) );
*/
reg write_fifo;
reg read_fifo;
wire full_fifo;
reg skip_fifo = 1'b0;
wire [7:0] dout_fifo;
reg [31:0] bytesloaded;

reg [12:0] counter_fifo;
assign clk_fifo = counter_fifo[7]; 
assign clk_gameloader = counter_fifo[6]; 

// fifo_loader loaderbuffer (
//        .wr_clk(clk_ctrl),
//        .rd_clk(clk_fifo), 
//			.din(bootdata), 
//			.wr_en(write_fifo), 
//			.rd_en(read_fifo), 
//			.dout(dout_fifo),
//			.full(full_fifo), 
//			.empty(empty_fifo)
// );



//bootdata entra OK No FIFO
//testado com o codigo abaixo
// ordem: 4e 45 53 1a
/*
   reg bootdata_flag = 1'b0;
    reg [31:0] dbgbootdata;
always@( posedge clk_ctrl )
begin

	if (write_fifo & !bootdata_flag) begin 
		dbgbootdata <= bootdata;
		bootdata_flag = 1'b1;
	 end 
end

	SEG7_LUT seg7_7 (HEX7, dbgbootdata[31:28]);
	SEG7_LUT seg7_6 (HEX6, dbgbootdata[27:24] );
	SEG7_LUT seg7_5 (HEX5, dbgbootdata[23:20]);
	SEG7_LUT seg7_4 (HEX4, dbgbootdata[19:16]);
	SEG7_LUT seg7_3 (HEX3, dbgbootdata[15:12]);
	SEG7_LUT seg7_2 (HEX2, dbgbootdata[11:8]);
	SEG7_LUT seg7_1 (HEX1, dbgbootdata[7:4]);
	SEG7_LUT seg7_0 (HEX0, dbgbootdata[3:0]);
*/

//saida do FIFO em dout_fifo
//testado com o codigo abaixo
// ordem: 1a 53 45 4e
/*
   reg [2:0] bootdata_flag = 3'b000;
    reg [7:0] dbgbootdata1;
	 reg [7:0] dbgbootdata2;
	 reg [7:0] dbgbootdata3;
	 reg [7:0] dbgbootdata4;

always@( posedge clk_fifo )
begin

	if (read_fifo && (bootdata_flag < 3'b100)) begin 
		
		if (bootdata_flag == 3'b000) begin dbgbootdata1 <= dout_fifo; end
		if (bootdata_flag == 3'b001) begin dbgbootdata2 <= dout_fifo; end
		if (bootdata_flag == 3'b010) begin dbgbootdata3 <= dout_fifo; end
		if (bootdata_flag == 3'b011) begin dbgbootdata4 <= dout_fifo; end
		
		
		bootdata_flag = bootdata_flag + 1;
	 end 
end

	SEG7_LUT seg7_7 (HEX7, dbgbootdata1[7:4]);
	SEG7_LUT seg7_6 (HEX6, dbgbootdata1[3:0]);
	SEG7_LUT seg7_5 (HEX5, dbgbootdata2[7:4]);
	SEG7_LUT seg7_4 (HEX4, dbgbootdata2[3:0]);
	SEG7_LUT seg7_3 (HEX3, dbgbootdata3[7:4]);
	SEG7_LUT seg7_2 (HEX2, dbgbootdata3[3:0]);
	SEG7_LUT seg7_1 (HEX1, dbgbootdata4[7:4]);
	SEG7_LUT seg7_0 (HEX0, dbgbootdata4[3:0]);
*/

//clock loader Ok
// ordem: 4e 45 53 1a
/*

   reg [2:0] bootdata_flag = 3'b000;
    reg [7:0] dbgbootdata1;
	 reg [7:0] dbgbootdata2;
	 reg [7:0] dbgbootdata3;
	 reg [7:0] dbgbootdata4;

always@( posedge clk_loader )
begin

	if (bootdata_flag < 3'b100) begin 
		
		if (bootdata_flag == 3'b000) begin dbgbootdata1 <= dout_fifo; end
		if (bootdata_flag == 3'b001) begin dbgbootdata2 <= dout_fifo; end
		if (bootdata_flag == 3'b010) begin dbgbootdata3 <= dout_fifo; end
		if (bootdata_flag == 3'b011) begin dbgbootdata4 <= dout_fifo; end
		
		
		bootdata_flag = bootdata_flag + 1;
	 end 
end

	SEG7_LUT seg7_7 (HEX7, dbgbootdata1[7:4]);
	SEG7_LUT seg7_6 (HEX6, dbgbootdata1[3:0]);
	SEG7_LUT seg7_5 (HEX5, dbgbootdata2[7:4]);
	SEG7_LUT seg7_4 (HEX4, dbgbootdata2[3:0]);
	SEG7_LUT seg7_3 (HEX3, dbgbootdata3[7:4]);
	SEG7_LUT seg7_2 (HEX2, dbgbootdata3[3:0]);
	SEG7_LUT seg7_1 (HEX1, dbgbootdata4[7:4]);
	SEG7_LUT seg7_0 (HEX0, dbgbootdata4[3:0]);
*/



fifo_loader loaderbuffer (
        .wrclk(clk_ctrl),
        .rdclk(clk_fifo), 
			.data({bootdata[7:0],bootdata[15:8],bootdata[23:16],bootdata[31:24]}),  //.data(bootdata), //acerto na ordem dos bytes
			.wrreq(write_fifo), 
			.rdreq(read_fifo), 
			.q(dout_fifo),
			.wrfull(full_fifo), 
			.rdempty(empty_fifo)
 );
 
always@( posedge clk_ctrl )
begin
	if (host_reset_loader == 1'b1) begin
		bootdata_ack <= 1'b0;
		boot_state <= 1'b0;
		write_fifo <= 1'b0;
		read_fifo <= 1'b0;
		skip_fifo <= 1'b0;
		bytesloaded <= 32'h00000000;
	end else begin
		if (dout_fifo == 8'h4E) skip_fifo <= 1'b1;

		case (boot_state)
		
			1'b0:
				if (bootdata_req == 1'b1) 
				begin
				
					if (full_fifo == 1'b0) 
					begin
						boot_state <= 1'b1;
						bootdata_ack <= 1'b1;
						write_fifo <= (bytesloaded < rom_size) ? 1'b1 : 1'b0;
					end 
					else read_fifo <= 1'b1;
					
				end else begin
					bootdata_ack <= 1'b0;
					end
					
			1'b1: 
 				begin
					if (write_fifo == 1'b1) begin
						write_fifo <= 1'b0;
						bytesloaded <= bytesloaded + 4;
					end
					boot_state <= 1'b0;
					bootdata_ack <= 1'b0;
				end
		endcase;
	end
end

always@( posedge clk )
begin
/*
   data <= debugdata;

	if (set == 1'b0)
		if (reset == 1'b1) debugaddr <= 14'b00000000000010;
      else debugaddr <= 14'b00000000000000;
	else 

    debugaddr <= 14'b00000000000001;
*/

//  if (reset == 1'b1)
//     data <= {3'b000, empty_fifo, 3'b000, full_fifo, 3'b000, clk_loader, 3'b000, skip_fifo};
//		data <= rom_size[19:4];

	counter_fifo <= counter_fifo + 1'b1;
	
	//clk_loader <= !clk_fifo && skip_fifo;
	clk_loader <= !clk_fifo && skip_fifo && read_fifo; //adicionado read_fifo pra sincronizar o clock
end

always@( posedge clk_loader)
begin
	loader_input <= dout_fifo;
//	data <= bytesloaded[19:4];
end
endmodule
