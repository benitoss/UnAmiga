/* ctrl_clk.v */
/* 2012, rok.krajnc@gmail.com */


module ctrl_clk (
  input  wire inclk0,
  output wire c0,
  output wire c1,
  output wire c2,
  output wire locked
);



ctrl_clk_altera ctrl_clk_i (
  .inclk0   (inclk0 ), // 50 de mi placa
  .c0       (c0     ), // 100
  .c1       (c1     ), // 50
  .c2       (c2     ), // 25
  .locked   (locked )
);



endmodule

