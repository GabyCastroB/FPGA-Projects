`timescale 1ns / 1ps
module testbench;

	reg[15:0] num;
	reg clk =1'b0;
	reg rst;
	
	wire[6:0] sseg;
	wire[3:0] an;
	

display utt(.num(num),.clk(clk),.rst(rst),.sseg(sseg),.an(an));

initial begin
	
	num = 4321; 
	clk = 0;
	rst = 1;
	#1;
	rst=0;
	
	
end

always begin
	forever begin
	clk=~clk;
	#0.0042;
	end
end 
initial begin: TEST_CASE
     $dumpfile("testbench.vcd");
     #(100) $finish;
end
endmodule