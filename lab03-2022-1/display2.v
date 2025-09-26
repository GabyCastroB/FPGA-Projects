`timescale 1ns / 1ps

module clk_test(input [15:0] num,output [0:6] sseg,output reg [3:0] an,
	 input rst,input clk, output clk_out);

	 
BCDtoSSeg bcdtosseg(.BCD(bcd), .SSeg(sseg));

assign frec=50000000;
assign frec_out=1/(0.016);
assign max_count=frec/(frec_out*2);

//reg [26:0] frec=50000000;
reg [3:0]bcd=0;
reg[22:0] count=0;
reg clk_out,clk;

initial begin 
	count =0;
	clk_out=0;
	an<=4'b1111; 
end

reg [1:0] count2 =0;

always@(posedge clk)_out begin

	if(count==(max_count))begin 

		clk_out=~clk_out;
		count=0;
		end
	else begin 
		count=count+1;
		an<=4'b1101; 
		case (count2) 
				2'h0: begin bcd <= num[3:0];   an<=4'b1110; end 
				2'h1: begin bcd <= num[7:4];   an<=4'b1101; end 
				2'h2: begin bcd <= num[11:8];  an<=4'b1011; end 
				2'h3: begin bcd <= num[15:12]; an<=4'b0111; end 
		endcase
	end
end
endmodule 