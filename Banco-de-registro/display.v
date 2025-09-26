`timescale 1ns / 1ps
module display(
	input[2:0] readAddr1,
	input[2:0] readAddr2,
	input[2:0] writeAddr1,
	input[3:0] data,
	input clk,
	output [0:6] sseg,
	output [1:0] an,
	input rst,
	input rwrite
);

wire enable;
assign enable = cf[16]; 
wire [3:0] bcd;
//debe haber un modulo que convierta bcd a 7seg
BCDtoSSeg bcdsseg(.BCD(bcd), .SSeg(sseg));

//debe haber un modulo que haga de reloj
//module counter_clk(input clk, input rst, output reg [26:0] cfreq);
wire [26:0] cf;
counter_clk(.clk(clk), .rst(rst), .cfreq(cf));

//debe haber un modulo que haga la visualizacion dinamica
wire [3:0] o1;
wire [3:0] o2;
dynamic_v dv(.rst(rst), .clk_e(enable), .out1(o1), .out2(o2), .an(an), .bcd(bcd) );

//debe haber un modulo de banco de registro
BancoRegistro br(.addrRa(readAddr1), .addrRb(readAddr2), .addrW(writeAddr1), .datW(data),  
.RegWrite(rwrite), .rst(rst),.datOutRa(o1),.datOutRb(o2), .clk(clk));

endmodule