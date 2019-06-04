// A simple system-on-a-chip (SoC) for the MiST
// (c) 2015 Till Harbaum

// VGA controller generating 160x100 pixles. The VGA mode ised is 640x400
// combining every 4 row and column

// http://tinyvga.com/vga-timing/640x400@70Hz

module no_hdmi (
   // pixel clock
   input  pclk,

	// output to screen
   output reg	hs,
   output reg 	vs,
   output reg pixel_o,
	output reg blank
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

// video memory 
reg vmem [160*8-1:0];

initial begin

	 // N -----------------------------
    vmem[0]   = 1'b0;
    vmem[1]   = 1'b1;
	 vmem[2]   = 1'b0;
    vmem[3]   = 1'b0;
	 vmem[4]   = 1'b0;
    vmem[5]   = 1'b0;
	 vmem[6]   = 1'b1;
    vmem[7]   = 1'b0;
	 
    vmem[160] = 1'b0;
    vmem[161] = 1'b1;
	 vmem[162] = 1'b1;
    vmem[163] = 1'b0;
	 vmem[164] = 1'b0;
    vmem[165] = 1'b0;
	 vmem[166] = 1'b1;
    vmem[167] = 1'b0;

    vmem[320] = 1'b0;
    vmem[321] = 1'b1;
	 vmem[322] = 1'b0;
    vmem[323] = 1'b1;
	 vmem[324] = 1'b0;
    vmem[325] = 1'b0;
	 vmem[326] = 1'b1;
    vmem[327] = 1'b0;

    vmem[480] = 1'b0;
    vmem[481] = 1'b1;
	 vmem[482] = 1'b0;
    vmem[483] = 1'b0;
	 vmem[484] = 1'b1;
    vmem[485] = 1'b0;
	 vmem[486] = 1'b1;
    vmem[487] = 1'b0;
	
    vmem[640] = 1'b0;
    vmem[641] = 1'b1;
	 vmem[642] = 1'b0;
    vmem[643] = 1'b0;
	 vmem[644] = 1'b0;
    vmem[645] = 1'b1;
	 vmem[646] = 1'b1;
    vmem[647] = 1'b0;

    vmem[800] = 1'b0;
    vmem[801] = 1'b1;
	 vmem[802] = 1'b0;
    vmem[803] = 1'b0;
	 vmem[804] = 1'b0;
    vmem[805] = 1'b0;
	 vmem[806] = 1'b1;
    vmem[807] = 1'b0;
	 
	 // N end ---------------------------
	 
	 // O -----------------------------
    vmem[8]  = 1'b0;
    vmem[9]  = 1'b0;
	 vmem[10] = 1'b1;
    vmem[11] = 1'b1;
	 vmem[12] = 1'b1;
    vmem[13] = 1'b1;
	 vmem[14] = 1'b0;
    vmem[15] = 1'b0;
	 
    vmem[168] = 1'b0;
    vmem[169] = 1'b1;
	 vmem[170] = 1'b0;
    vmem[171] = 1'b0;
	 vmem[172] = 1'b0;
    vmem[173] = 1'b0;
	 vmem[174] = 1'b1;
    vmem[175] = 1'b0;

    vmem[328] = 1'b0;
    vmem[329] = 1'b1;
	 vmem[330] = 1'b0;
    vmem[331] = 1'b0;
	 vmem[332] = 1'b0;
    vmem[333] = 1'b0;
	 vmem[334] = 1'b1;
    vmem[335] = 1'b0;

    vmem[488] = 1'b0;
    vmem[489] = 1'b1;
	 vmem[490] = 1'b0;
    vmem[491] = 1'b0;
	 vmem[492] = 1'b0;
    vmem[493] = 1'b0;
	 vmem[494] = 1'b1;
    vmem[495] = 1'b0;
	
    vmem[648] = 1'b0;
    vmem[649] = 1'b1;
	 vmem[650] = 1'b0;
    vmem[651] = 1'b0;
	 vmem[652] = 1'b0;
    vmem[653] = 1'b0;
	 vmem[654] = 1'b1;
    vmem[655] = 1'b0;

    vmem[808] = 1'b0;
    vmem[809] = 1'b0;
	 vmem[810] = 1'b1;
    vmem[811] = 1'b1;
	 vmem[812] = 1'b1;
    vmem[813] = 1'b1;
	 vmem[814] = 1'b0;
    vmem[815] = 1'b0;
	 
	 // O end ---------------------------
	 
	 // space -----------------------------
    vmem[16]  = 1'b0;
    vmem[17]  = 1'b0;
	 vmem[18]  = 1'b0;
    vmem[19]  = 1'b0;
	 vmem[20]  = 1'b0;
    vmem[21]  = 1'b0;
	 vmem[22]  = 1'b0;
    vmem[23]  = 1'b0;
	 
    vmem[176] = 1'b0;
    vmem[177] = 1'b0;
	 vmem[178] = 1'b0;
    vmem[179] = 1'b0;
	 vmem[180] = 1'b0;
    vmem[181] = 1'b0;
	 vmem[182] = 1'b0;
    vmem[183] = 1'b0;

    vmem[336] = 1'b0;
    vmem[337] = 1'b0;
	 vmem[338] = 1'b0;
    vmem[339] = 1'b0;
	 vmem[340] = 1'b0;
    vmem[341] = 1'b0;
	 vmem[342] = 1'b0;
    vmem[343] = 1'b0;

    vmem[496] = 1'b0;
    vmem[497] = 1'b0;
	 vmem[498] = 1'b0;
    vmem[499] = 1'b0;
	 vmem[500] = 1'b0;
    vmem[501] = 1'b0;
	 vmem[502] = 1'b0;
    vmem[503] = 1'b0;
	
    vmem[656] = 1'b0;
    vmem[657] = 1'b0;
	 vmem[658] = 1'b0;
    vmem[659] = 1'b0;
	 vmem[660] = 1'b0;
    vmem[661] = 1'b0;
	 vmem[662] = 1'b0;
    vmem[663] = 1'b0;

    vmem[816] = 1'b0;
    vmem[817] = 1'b0;
	 vmem[818] = 1'b0;
    vmem[819] = 1'b0;
	 vmem[820] = 1'b0;
    vmem[821] = 1'b0;
	 vmem[822] = 1'b0;
    vmem[823] = 1'b0;
	 
	 // space end ---------------------------
	 
	 // H -----------------------------
    vmem[24]  = 1'b0;
    vmem[25]  = 1'b1;
	 vmem[26]  = 1'b0;
    vmem[27]  = 1'b0;
	 vmem[28]  = 1'b0;
    vmem[29]  = 1'b0;
	 vmem[30]  = 1'b1;
    vmem[31]  = 1'b0;
	 
    vmem[184] = 1'b0;
    vmem[185] = 1'b1;
	 vmem[186] = 1'b0;
    vmem[187] = 1'b0;
	 vmem[188] = 1'b0;
    vmem[189] = 1'b0;
	 vmem[190] = 1'b1;
    vmem[191] = 1'b0;

    vmem[344] = 1'b0;
    vmem[345] = 1'b1;
	 vmem[346] = 1'b1;
    vmem[347] = 1'b1;
	 vmem[348] = 1'b1;
    vmem[349] = 1'b1;
	 vmem[350] = 1'b1;
    vmem[351] = 1'b0;

    vmem[504] = 1'b0;
    vmem[505] = 1'b1;
	 vmem[506] = 1'b0;
    vmem[507] = 1'b0;
	 vmem[508] = 1'b0;
    vmem[509] = 1'b0;
	 vmem[510] = 1'b1;
    vmem[511] = 1'b0;
	
    vmem[664] = 1'b0;
    vmem[665] = 1'b1;
	 vmem[666] = 1'b0;
    vmem[667] = 1'b0;
	 vmem[668] = 1'b0;
    vmem[669] = 1'b0;
	 vmem[670] = 1'b1;
    vmem[671] = 1'b0;

    vmem[824] = 1'b0;
    vmem[825] = 1'b1;
	 vmem[826] = 1'b0;
    vmem[827] = 1'b0;
	 vmem[828] = 1'b0;
    vmem[829] = 1'b0;
	 vmem[830] = 1'b1;
    vmem[831] = 1'b0;
	 
	 // H end ---------------------------
	 
	 // D -----------------------------
    vmem[32]  = 1'b0;
    vmem[33]  = 1'b1;
	 vmem[34]  = 1'b1;
    vmem[35]  = 1'b1;
	 vmem[36]  = 1'b1;
    vmem[37]  = 1'b1;
	 vmem[38]  = 1'b0;
    vmem[39]  = 1'b0;
	 
    vmem[192] = 1'b0;
    vmem[193] = 1'b1;
	 vmem[194] = 1'b0;
    vmem[195] = 1'b0;
	 vmem[196] = 1'b0;
    vmem[197] = 1'b0;
	 vmem[198] = 1'b1;
    vmem[199] = 1'b0;

    vmem[352] = 1'b0;
    vmem[353] = 1'b1;
	 vmem[354] = 1'b0;
    vmem[355] = 1'b0;
	 vmem[356] = 1'b0;
    vmem[357] = 1'b0;
	 vmem[358] = 1'b1;
    vmem[359] = 1'b0;

    vmem[512] = 1'b0;
    vmem[513] = 1'b1;
	 vmem[514] = 1'b0;
    vmem[515] = 1'b0;
	 vmem[516] = 1'b0;
    vmem[517] = 1'b0;
	 vmem[518] = 1'b1;
    vmem[519] = 1'b0;
	
    vmem[672] = 1'b0;
    vmem[673] = 1'b1;
	 vmem[674] = 1'b0;
    vmem[675] = 1'b0;
	 vmem[676] = 1'b0;
    vmem[677] = 1'b0;
	 vmem[678] = 1'b1;
    vmem[679] = 1'b0;

    vmem[832] = 1'b0;
    vmem[833] = 1'b1;
	 vmem[834] = 1'b1;
    vmem[835] = 1'b1;
	 vmem[836] = 1'b1;
    vmem[837] = 1'b1;
	 vmem[838] = 1'b0;
    vmem[839] = 1'b0;
	 
	 // D end ---------------------------
	 
	 // M -----------------------------
    vmem[40]  = 1'b0;
    vmem[41]  = 1'b1;
	 vmem[42]  = 1'b0;
    vmem[43]  = 1'b0;
	 vmem[44]  = 1'b0;
    vmem[45]  = 1'b0;
	 vmem[46]  = 1'b1;
    vmem[47]  = 1'b0;
	 
    vmem[200] = 1'b0;
    vmem[201] = 1'b1;
	 vmem[202] = 1'b1;
    vmem[203] = 1'b0;
	 vmem[204] = 1'b0;
    vmem[205] = 1'b1;
	 vmem[206] = 1'b1;
    vmem[207] = 1'b0;

    vmem[360] = 1'b0;
    vmem[361] = 1'b1;
	 vmem[362] = 1'b0;
    vmem[363] = 1'b1;
	 vmem[364] = 1'b1;
    vmem[365] = 1'b0;
	 vmem[366] = 1'b1;
    vmem[367] = 1'b0;

    vmem[520] = 1'b0;
    vmem[521] = 1'b1;
	 vmem[522] = 1'b0;
    vmem[523] = 1'b0;
	 vmem[524] = 1'b0;
    vmem[525] = 1'b0;
	 vmem[526] = 1'b1;
    vmem[527] = 1'b0;
	
    vmem[680] = 1'b0;
    vmem[681] = 1'b1;
	 vmem[682] = 1'b0;
    vmem[683] = 1'b0;
	 vmem[684] = 1'b0;
    vmem[685] = 1'b0;
	 vmem[686] = 1'b1;
    vmem[687] = 1'b0;

    vmem[840] = 1'b0;
    vmem[841] = 1'b1;
	 vmem[842] = 1'b0;
    vmem[843] = 1'b0;
	 vmem[844] = 1'b0;
    vmem[845] = 1'b0;
	 vmem[846] = 1'b1;
    vmem[847] = 1'b0;
	 
	 // M end ---------------------------
	 
	 // i -----------------------------
    vmem[48]  = 1'b0;
    vmem[49]  = 1'b1;
	 vmem[50]  = 1'b1;
    vmem[51]  = 1'b1;
	 vmem[52]  = 1'b1;
    vmem[53]  = 1'b1;
	 vmem[54]  = 1'b1;
    vmem[55]  = 1'b0;
	 
    vmem[208] = 1'b0;
    vmem[209] = 1'b0;
	 vmem[210] = 1'b0;
    vmem[211] = 1'b1;
	 vmem[212] = 1'b0;
    vmem[213] = 1'b0;
	 vmem[214] = 1'b0;
    vmem[215] = 1'b0;

    vmem[368] = 1'b0;
    vmem[369] = 1'b0;
	 vmem[370] = 1'b0;
    vmem[371] = 1'b1;
	 vmem[372] = 1'b0;
    vmem[373] = 1'b0;
	 vmem[374] = 1'b0;
    vmem[375] = 1'b0;

    vmem[528] = 1'b0;
    vmem[529] = 1'b0;
	 vmem[530] = 1'b0;
    vmem[531] = 1'b1;
	 vmem[532] = 1'b0;
    vmem[533] = 1'b0;
	 vmem[534] = 1'b0;
    vmem[535] = 1'b0;
	
    vmem[688] = 1'b0;
    vmem[689] = 1'b0;
	 vmem[690] = 1'b0;
    vmem[691] = 1'b1;
	 vmem[692] = 1'b0;
    vmem[693] = 1'b0;
	 vmem[694] = 1'b0;
    vmem[695] = 1'b0;

    vmem[848] = 1'b0;
    vmem[849] = 1'b1;
	 vmem[850] = 1'b1;
    vmem[851] = 1'b1;
	 vmem[852] = 1'b1;
    vmem[853] = 1'b1;
	 vmem[854] = 1'b1;
    vmem[855] = 1'b0;
	 
	 // I end ---------------------------
end


reg [13:0] video_counter;
//reg [7:0] pixel;


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
	
		blank <= 1'b0;	
	
		
	// increase video counter after each pixel
			if(h_cnt[1:0] == 2'd3) video_counter <= video_counter + 14'd1;
				


		if((v_cnt > 200) && (v_cnt < 240)) 
			
			pixel_o <= vmem[video_counter];               // read VRAM
		else
			pixel_o <= 1'b0;   // color outside visible area: black

		

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
			
		pixel_o <= 1'b0;   // color outside visible area: black
		blank <= 1'b1;
	end
end


endmodule
