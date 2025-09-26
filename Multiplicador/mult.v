module mult(clk , rst , init , A , B, done, sseg, an);
  
  input rst;
  input clk;
  input init;
  input [3:0]A;
  input [3:0]B;
  output done;
  output [0:6] sseg;
  output [1:0] an;
  
  wire w_sh;
  wire w_reset;
  wire w_add;
  wire w_z;
  
  wire [7:0]w_A;
  wire [3:0] w_B;
  
  wire [4:0] bcd;
  wire [1:0] an;
  wire [7:0] pp;

  wire [26:0] cf;
  wire enable;
  assign enable = cf[10];


	counter_clk clock(.clk(clk), .rst(rst), .cfreq(cf));
	BCDtoSSeg bcdsseg(.BCD(bcd), .SSeg(sseg));
	 
	dynamic_v dv(.rst(rst), .clk_e(enable), .pp(pp), .an(an), .bcd(bcd) );


	rsr rsr0 (.clk(clk), .in_B(B) , .shift(w_sh) , .load(w_reset) , .s_B(w_B));
	lsr lsr0 (.clk(clk), .in_A(A) , .shift(w_sh) , .load(w_reset) , .s_A(w_A));
	comp comp0(.B(w_B), .z(w_z));
	acc acc0 (.clk(clk), .A(w_A) , .add(w_add), .reset(w_reset), .pp(pp));
	control_mult control0 (.clk(clk), .rst(rst) , .lsb_B(w_B[0]) , .init( ~init) , .z(w_z) , .done(done) , .sh(w_sh) , .reset(w_reset) , .add(w_add) );

endmodule