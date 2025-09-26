module bintodec(input rst, input clk_db,
  input [15:0] num, output reg [15:0]num2);

integer i;
reg [3:0] count =4'b0000;
reg [15:0] resta=0;
always @(rst==1) begin//
resta<=num;
if(num>=15'b0010011100010000) begin
	if(resta>=15'b0010011100010000)begin
	resta<=resta-15'b0010011100010000;
	count<=count+1;
	end
	
end 
	num2[3:0]<=4'b0000;
	num2[7:4]<=4'b0001;
	num2[11:8]<=4'b0001;
	num2[15:12]<=count;
end
			

endmodule