
`timescale 1ns / 1ps

module testbenchLab5;
	
	reg rst;
	reg clk=1'b0;
	reg init;
	reg [3:0]A;
	reg [3:0]B;
	wire done;
	wire [0:6] sseg;
	wire [1:0] an;
	
	
mult utt(.rst(rst),.clk(clk),.init(init),.A(A),.B(B),.done(done),.sseg(sseg),.an(an));

initial begin
	

	A=4;
	B = 5;
	rst = 0;
	#1;
	rst=1;
	#5
	init = 0;
	#10;
	init = 1;
	#10;
	init = 0;

	
end

always begin
	forever begin
	clk=~clk;
	#0.0042;
	end
end 
initial begin: TEST_CASE
     $dumpfile("testbench.vcd");
     #(700) $finish;
end
endmodule