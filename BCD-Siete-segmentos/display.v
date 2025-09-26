`timescale 1ns / 1ps
module display(
	input [15:0] num,
	input clk,
	input rst,
	
	output [0:6] sseg,
	output  [3:0] an
	
);

wire [26:0] cf;

wire enable;

//Para la FPGA 
assign enable = cf[16];
//para la simulacion
//assign enable = cf[10];
wire [3:0]bcd;

//reg [15:8] num=16'h43;
//reg [7:0] num=16'h43;
 
BCDtoSSeg bcdtosseg(.BCD(bcd), .Seg(sseg));

//codigo modularizado en clk_impl
counter_clk cl(.clk(clk), .rst(rst), .cfreq(cf));

//para la simulacion
//wire [15:0]u; 
//wire [15:0]d; 
//wire [15:0]c; 
//wire [15:0]m; 

<<<<<<< HEAD
=======
//anntobcc atb(.ann(num),.u(u),.d(d),.c(c),.m(m));
//dynamic_v dv(.rst(rst), .clk_e(enable), .u(u),.d(d),.c(c),.m(m),.an(an), .bcd(bcd) );


//codigo modularizado en freqDivisor

dynamic_v dv(.rst(rst), .clk_e(enable), .num(num),.an(an), .bcd(bcd) );



>>>>>>> c50d3fb96174643d6122ecbb4bebbab79d85f437
endmodule