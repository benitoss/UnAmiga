// (c) 2015 Till Harbaum 

module vga (
   // pixel clock
   input  pclk,

	// enable/disable scanlines
	input scanlines,
	
	// output to VGA screen
   output reg	hs,
   output reg 	vs,
   output [3:0] r,
   output [3:0] g,
   output [3:0] b,
	output reg blank
	
//	input [11:0] joy_i
);
					
// http://tinyvga.com/vga-timing
//VGA Signal 640 x 480 @ 60 Hz Industry standard timing
parameter H   = 640;    // width of visible area
parameter HFP = 16;     // unused time before hsync
parameter HS  = 96;     // width of hsync
parameter HBP = 48;     // unused time after hsync

parameter V   = 480;    // height of visible area
parameter VFP = 10;     // unused time before vsync
parameter VS  = 2;      // width of vsync
parameter VBP = 33;     // unused time after vsync

reg[9:0]  h_cnt;        // horizontal pixel counter
reg[9:0]  v_cnt;        // vertical pixel counter

// both counters count from the begin of the visibla area

// horizontal pixel counter
always@(posedge pclk) begin
	if(h_cnt==H+HFP+HS+HBP-1)   h_cnt <= 10'd0;
	else                        h_cnt <= h_cnt + 10'd1;

        // generate negative hsync signal
	if(h_cnt == H+HFP)    hs <= 1'b0;
	if(h_cnt == H+HFP+HS) hs <= 1'b1;
end

// veritical pixel counter
always@(posedge pclk) begin
        // the vertical counter is processed at the begin of each hsync
	if(h_cnt == H+HFP) begin
		if(v_cnt==VS+VBP+V+VFP-1)  v_cnt <= 10'd0; 
		else								v_cnt <= v_cnt + 10'd1;

               // generate positive vsync signal
 		if(v_cnt == V+VFP)    vs <= 1'b1;
		if(v_cnt == V+VFP+VS) vs <= 1'b0;
	end
end


reg [13:0] video_counter;
reg [7:0] pixel;


// read VRAM for video generation
always@(posedge pclk) begin
       // The video counter is being reset at the begin of each vsync.
        // Otherwise it's increased every fourth pixel in the visible area.
        // At the end of the first three of four lines the counter is
        // decreased by the total line length to display the same contents
        // for four lines so 100 different lines are displayed on the 400
        // VGA lines.

        // visible area?
	if((v_cnt < V) && (h_cnt < H)) begin
		// increase video counter after each pixel
		if(h_cnt[1:0] == 2'd3)
			video_counter <= video_counter + 14'd1;
		
	//	pixel <= 8'h00; //vmem[video_counter];               // read VRAM
		
		/* DEBUG
		// format MXYZ SACB RLDU
		if (joy_i[0]==1'b0) pixel = 8'b11100011;
		if (joy_i[1]==1'b0) pixel = 8'b11100100;
		if (joy_i[2]==1'b0) pixel = 8'b11101010;
		if (joy_i[3]==1'b0) pixel = 8'b11100000;
		
		if (joy_i[4]==1'b0) pixel = 8'b00000011;
		if (joy_i[5]==1'b0) pixel = 8'b00011100;
		if (joy_i[6]==1'b0) pixel = 8'b00011111;
		if (joy_i[7]==1'b0) pixel = 8'b00110011;
		
		if (joy_i[8]==1'b0)  pixel = 8'b10010010;
		if (joy_i[9]==1'b0)  pixel = 8'b10110110;
		if (joy_i[10]==1'b0) pixel = 8'b11011011;
		if (joy_i[11]==1'b0) pixel = 8'b11111111;
		*/
		
		
		
		
		blank <= 1'b0;
	end else begin
	        // video counter is manipulated at the end of a line outside
	        // the visible area
		if(h_cnt == H+HFP) begin
			// the video counter is reset at the begin of the vsync
		        // at the end of three of four lines it's decremented
		        // one line to repeat the same pixels over four display
		        //  lines
			if(v_cnt == V+VFP)
				video_counter <= 14'd0;
			else if((v_cnt < V) && (v_cnt[1:0] != 2'd3))
				video_counter <= video_counter - 14'd160;
		end
			
		pixel <= 8'h00;   // color outside visible area: black
		blank <= 1'b1;
	end
end

// split the 8 rgb bits into the three base colors. Every second line is
// darker when scanlines are enabled
wire scanline = scanlines && v_cnt[0];
assign r = (!scanline)?{ pixel[7:5],  1'b0 }:{ 1'b0, pixel[7:5] };
assign g = (!scanline)?{ pixel[4:2],  1'b0 }:{ 1'b0, pixel[4:2] };
assign b = (!scanline)?{ pixel[1:0],  2'b0 }:{ 1'b0, pixel[1:0] };

endmodule
