`timescale 1ns / 1ps
module display(
	input [15:0] num,
	input clk,
	output [0:6] sseg,
	output  [3:0] an,
	input rst
);



wire [26:0] cf;

wire enable;
assign enable = cf[16];
wire [3:0]bcd;
wire [15:0] num2;




//reg [15:8] num=16'h43;
//reg [7:0] num=16'h43;
 
BCDtoSSeg bcdtosseg(.BCD(bcd), .Seg(sseg));


//codigo modularizado en clk_impl
counter_clk cl(.clk(clk), .rst(rst), .cfreq(cf));


//codigo modularizado en bintodec
bintodec btod(.rst(rst), .num(num),.num2(num2),.clk_db(enable));


//codigo modularizado en freqDivisor
dynamic_v dv(.rst(rst), .clk_e(enable), .NUM(num2),
.an(an), .bcd(bcd) );



endmodule