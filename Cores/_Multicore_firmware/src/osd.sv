// A simple OSD implementation. Can be hooked up between a cores
// VGA output and the physical VGA pins

//Lot of ideas comes from osv.v and userio.v - miST project

module osd
(
	
	// OSDs pixel clock, should be synchronous to cores pixel clock to
	// avoid jitter.
	input        pclk,

	// SPI interface
	input        sck,
	input        ss,
	input        sdi,
	output  		 sdo,

	// VGA signals coming from core
	input  [4:0] red_in,
	input  [4:0] green_in,
	input  [4:0] blue_in,
	input        hs_in,
	input        vs_in,
	
	// VGA signals going to video connector
	output [4:0] red_out,
	output [4:0] green_out,
	output [4:0] blue_out,
	output        hs_out,
	output        vs_out,
	
	//external data in to the microcontroller
	input  [7:0] data_in,
	input [(8*STRLEN)-1:0] conf_str,
		
	//data pump to sram
	output        pump_active_o,
	output [18:0] sram_a_o,
	output [7:0]  sram_d_o,
	output        sram_we_n_o = 1'b1,
	
	output reg  [7:0] 	config_buffer_o[15:0]  // 15 bytes for general use
	

);


parameter STRLEN			=	0;
parameter OSD_X_OFFSET  = 10'd0;
parameter OSD_Y_OFFSET  = 10'd0;
parameter OSD_COLOR     = 3'd0;
parameter OSD_VISIBLE   = 2'b00;

localparam OSD_WIDTH   = 10'd256;
localparam OSD_HEIGHT  = 10'd128;

// *********************************************************************************
// spi client
// *********************************************************************************

reg        	osd_enable = OSD_VISIBLE[0];
reg  [7:0] 	osd_buffer[2047:0];  // the OSD buffer itself



reg [7:0]	ACK = 8'd75; // letter K - 0x4b
reg 		  	sdo_s;
reg  [4:0] 	cnt;
reg  [7:0] 	cmd;

reg  [4:0] 	color;

reg  [18:0] sram_addr_s =  { 19 {1'b1} }; // same as (others=>'1')
reg  [7:0]  sram_data_s;
reg  			sram_we_n_s;
reg  			pump_active_s = 1'b0;

reg  [7:0]  byte_cnt;   // counts bytes
	
	// SPI MODE 0 : incoming data on Rising, outgoing on Falling
	always@(negedge sck, posedge ss) 
	begin
	
		
				//each time the SS goes down, we will receive a command from the SPI master
				if (ss) // not selected
					begin
						sdo_s <= 1'bZ;
						byte_cnt <= 7'd0;
					end
				else
					begin
							
							if (cmd == 8'h10 ) //command 0x10 - send the data to the microcontroller
								sdo_s <= data_in[~cnt[2:0]];
								
							else if (cmd == 8'h00 ) //command 0x00 - ACK
								sdo_s <= ACK[~cnt[2:0]];
							
							else if (cmd == 8'h61 ) //command 0x61 - echo the pumped data
								sdo_s <= sram_data_s[~cnt[2:0]];			
					
					
							else if(cmd == 8'h14) //command 0x14 - reading config string
								begin
								
									if (STRLEN == 0) //if we dont have a str, just send the first byte as 00
										sdo_s <= 1'b0;
									else if(byte_cnt < STRLEN + 1 ) // returning a byte from string
										sdo_s <= conf_str[{STRLEN - byte_cnt,~cnt[2:0]}];
									else
										sdo_s <= 1'b0;
										
								end	
						
				
							if((cnt[2:0] == 7)&&(byte_cnt != 8'd255)) 
								byte_cnt <= byte_cnt + 8'd1;
							
					end
	end




// the OSD has its own SPI interface to the io controller
always@(posedge sck, posedge ss) 
begin

	reg [10:0] bcnt;
	reg  [7:0] sbuf;
	reg  [4:0] cnf_byte;

	
	//each time the SS goes down, we will receive a command from the SPI master
	if(ss) 
		begin
			cnt  <= 0;
			bcnt <= 0;
			sram_we_n_s <= 1'b1;
			cnf_byte <= 4'd15;
		end 
	else 
		begin
				sram_we_n_s <= 1'b1;
				
				sbuf <= {sbuf[6:0], sdi};

				// 0:7 is command, rest payload
				if (cnt < 15) cnt <= cnt + 1'd1; else 	cnt <= 8;

				if (cnt == 7) 
				begin
						cmd <= {sbuf[6:0], sdi};
					
						// lower three command bits are line address
						bcnt <= {sbuf[1:0], sdi, 8'h00};

						// command 0x40: OSDCMDENABLE, OSDCMDsdiSABLE
						if(sbuf[6:3] == 4'b0100) 
						begin
							osd_enable <= sdi;
							color <= OSD_COLOR;
						end
						
						// command 0x61: start the data streaming
						if(sbuf[6:0] == 7'b0110000 && sdi == 1'b1)
						begin
							pump_active_s <= 1'b1;
						end
						
						// command 0x62: end the data streaming
						if(sbuf[6:0] == 7'b0110001 && sdi == 1'b0)
						begin
							pump_active_s <= 1'b0;
						end
						
						// debug
						//if(sbuf[6:0] == 7'b0001010 && sdi == 1'b0)
						//begin
						//	osd_enable <= 1'b1;
						//	color <= 3'b100;
						//end
				end
				
				if(cnt == 15) 
				begin

						// command 0x20: OSDCMDWRITE
						if (cmd[7:3] == 5'b00100) 
						begin
								osd_buffer[bcnt] <={sbuf[7:1], sdi};
								bcnt <= bcnt + 1'd1;
						end
						
						// command 0x60: stores a configuration byte
						if (cmd == 8'h60)
						begin
								config_buffer_o[cnf_byte] <= {sbuf[6:0], sdi};
								cnf_byte <= cnf_byte - 1'd1;
								
								sram_addr_s =  { 19 {1'b1} }; // same as (others=>'1')
						end
						
						// command 0x61: Data Pump 8 bits
						if (cmd == 8'h61) 
						begin
								sram_addr_s <= sram_addr_s + 1'd1;
								sram_data_s <={sbuf[6:0], sdi};
								sram_we_n_s <= 1'b0;
						end
				end
		end
end

// *********************************************************************************
// video timing and sync polarity anaylsis
// *********************************************************************************

// horizontal counter
reg  [9:0] h_cnt;
reg  [9:0] hs_low, hs_high;
wire       hs_pol = hs_high < hs_low;
wire [9:0] dsp_width = hs_pol ? hs_low : hs_high;

// vertical counter
reg  [9:0] v_cnt;
reg  [9:0] vs_low, vs_high;
wire       vs_pol = vs_high < vs_low;
wire [9:0] dsp_height = vs_pol ? vs_low : vs_high;

wire doublescan = 1'b1;//(dsp_height>350); 

reg ce_pix;
always @(negedge pclk) begin
	integer cnt = 0;
	integer pixsz, pixcnt;
	reg hs;

	cnt <= cnt + 1;
	hs <= hs_in;

	pixcnt <= pixcnt + 1;
	if(pixcnt == pixsz) pixcnt <= 0;
	ce_pix <= !pixcnt;

	if(hs && ~hs_in) begin
		cnt    <= 0;
		pixsz  <= (cnt >> 9) - 1;
		pixcnt <= 0;
		ce_pix <= 1;
	end
end

always @(posedge pclk) begin
	reg hsD, hsD2;
	reg vsD, vsD2;

	if(ce_pix) begin
		// bring hs_in into local clock domain
		hsD <= hs_in;
		hsD2 <= hsD;

		// falling edge of hs_in
		if(!hsD && hsD2) begin	
			h_cnt <= 0;
			hs_high <= h_cnt;
		end

		// rising edge of hs_in
		else if(hsD && !hsD2) begin	
			h_cnt <= 0;
			hs_low <= h_cnt;
			v_cnt <= v_cnt + 1'd1;
		end else begin
			h_cnt <= h_cnt + 1'd1;
		end

		vsD <= vs_in;
		vsD2 <= vsD;

		// falling edge of vs_in
		if(!vsD && vsD2) begin	
			v_cnt <= 0;
			vs_high <= v_cnt;
		end

		// rising edge of vs_in
		else if(vsD && !vsD2) begin	
			v_cnt <= 0;
			vs_low <= v_cnt;
		end
	end
end

// area in which OSD is being sdisplayed
wire [9:0] h_osd_start = ((dsp_width - OSD_WIDTH)>> 1) + OSD_X_OFFSET;
wire [9:0] h_osd_end   = h_osd_start + OSD_WIDTH;
wire [9:0] v_osd_start = ((dsp_height- (OSD_HEIGHT<<doublescan))>> 1) + OSD_Y_OFFSET;
wire [9:0] v_osd_end   = v_osd_start + (OSD_HEIGHT<<doublescan);
wire [9:0] osd_hcnt    = h_cnt - h_osd_start + 1'd1;  // one pixel offset for osd_byte register
wire [9:0] osd_vcnt    = v_cnt - v_osd_start;

wire osd_de = osd_enable && 
              (hs_in != hs_pol) && (h_cnt >= h_osd_start) && (h_cnt < h_osd_end) &&
              (vs_in != vs_pol) && (v_cnt >= v_osd_start) && (v_cnt < v_osd_end);

reg  [7:0] osd_byte; 
always @(posedge pclk) if(ce_pix) osd_byte <= osd_buffer[{doublescan ? osd_vcnt[7:5] : osd_vcnt[6:4], osd_hcnt[7:0]}];

wire osd_pixel = osd_byte[doublescan ? osd_vcnt[4:2] : osd_vcnt[3:1]];

assign red_out 	= !osd_de ? red_in 	: {osd_pixel, color[2], red_in[3:1]};
assign green_out 	= !osd_de ? green_in : {osd_pixel, color[1], green_in[3:1]};
assign blue_out 	= !osd_de ? blue_in 	: {osd_pixel, color[0], blue_in[3:1]};

assign hs_out = hs_in;
assign vs_out = vs_in;

assign sdo = sdo_s;

//sram out
assign sram_a_o = sram_addr_s;
assign sram_d_o = sram_data_s;
assign sram_we_n_o = sram_we_n_s;
assign pump_active_o = pump_active_s;

endmodule