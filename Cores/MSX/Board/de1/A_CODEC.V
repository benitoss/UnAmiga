//Legal Notice: (C)2006 Altera Corporation. All rights reserved. Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

module a_codec (
	input	iCLK,           // 27 MHz
	input	[15:0]	iSL,    // left chanel
	input	[15:0]	iSR,    // right chanel
	output	reg	oAUD_XCK,
	output		oAUD_DATA,
	output	reg	oAUD_LRCK,
	output	reg	oAUD_BCK
	);				

parameter	REF_CLK		= 27000000;	// 27	MHz
parameter	SAMPLE_RATE	= 49632*2;	// 49.6	KHz (=27E6/2/272)
parameter	DATA_WIDTH	= 16;		// 16	Bits
parameter	CHANNEL_NUM	= 2;		// Dual Channel

//////////////////////////////////////////////////
//	Internal Registers and Wires /////////////////
reg	[3:0]	BCK_DIV;
reg	[4:0]	LRCK_DIV;
reg	[3:0]	SEL_Cont;

reg	[15:0]	sound_o;
//////////////////////////////////////////////////
////////////	AUD_XCK Generator  //////////////
// posedge -> from 0 to 1
always@(posedge iCLK)
begin
	oAUD_XCK <= ~oAUD_XCK;	   // iCLK/2 = 13.5 MHz
end
////////////	AUD_BCK Generator  //////////////
// posedge -> from 0 to 1
always@(posedge iCLK)
begin
	if(BCK_DIV >= REF_CLK/(SAMPLE_RATE*DATA_WIDTH*CHANNEL_NUM*2) - 1)
	begin
		BCK_DIV	 <= 0;
		oAUD_BCK <= ~oAUD_BCK;
	end
	else
		BCK_DIV	<= BCK_DIV+1;
end
//////////////////////////////////////////////////
////////////    AUD_LRCK Generator      //////////
//////////////////////////////////////////////////
// negedge -> from 1 to 0 
always@(negedge oAUD_BCK)
begin
	if(LRCK_DIV >= DATA_WIDTH+1)
	begin
		LRCK_DIV  <= 0;
		SEL_Cont  <= 0;
		oAUD_LRCK <= ~oAUD_LRCK;
		if (oAUD_LRCK)
			sound_o <= iSR;
		else
			sound_o <= iSL;
	end
	else
		LRCK_DIV <= LRCK_DIV+1;
	if (SEL_Cont < DATA_WIDTH-1)
		SEL_Cont <= SEL_Cont+1;
end
///////////////////////////////////////////////////////
////////     Sound OUT          ///////////////////////
///////////////////////////////////////////////////////
assign	oAUD_DATA = sound_o[~SEL_Cont];

endmodule
