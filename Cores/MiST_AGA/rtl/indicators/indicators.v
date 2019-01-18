/* indicators.v */

module indicators (
  // system
  input  wire           clk,          // clock
  input  wire           rst,          // reset
  // inputs
  input wire  [  8-1:0] track,        // floppy track number
  input wire            f_wr,         // floppy fifo write
  input wire            f_rd,         // floppy fifo read
  input wire            h_wr,         // harddisk fifo write
  input wire            h_rd,         // harddisk fifo read
  input wire  [  4-1:0] status,       // control block slave status
  input wire  [  4-1:0] ctrl_status,  // control block reg-driven status
  input wire  [  4-1:0] sys_status,   // status from system
  input wire            fifo_full,
  output wire [  8-1:0] led      
);


// LEDs
reg [1:0] r0, r1, g0, g1;

always @ (posedge clk or posedge rst) begin
  if (rst) begin
    r0 <= #1 2'b00;
    r1 <= #1 2'b00;
    g0 <= #1 2'b00;
    g1 <= #1 2'b00;
  end else begin
    r0 <= #1 {r0[0], f_wr};
    r1 <= #1 {r1[0], h_wr};
//    g0 <= #1 {g0[0], f_rd};
//    g1 <= #1 {g1[0], h_rd};
    g0 <= #1 {g0[0], f_rd}; // pongo los leds de actividad de FD y HD juntos, tanto escritura como lectura
    g1 <= #1 {g1[0], h_rd}; // quedan asi--->   4=wr-hd  3=rd-hd  2=wr-fd  1=rd-fd
  end
end

wire r0_out, g0_out, r1_out, g1_out;

assign r0_out = |r0;
assign r1_out = |r1;
assign g0_out = |g0;
assign g1_out = |g1;

reg  [  4-1:0] ctrl_leds;
always @ (posedge clk, posedge rst) begin
  if (rst)
    ctrl_leds <= #1 4'b0;
  else
    ctrl_leds <= #1 ctrl_status;
end

// reducido por mi, dado que solo tenemos 3 leds
assign led = {ctrl_leds, 1'b0, fifo_full, g1_out, g0_out};
//assign led_r = {status,    sys_status, r1_out, r0_out};


endmodule

