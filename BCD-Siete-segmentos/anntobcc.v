module anntobcc(
	input [15:0] ann,
	output  reg[15:0] u,
	output  reg[15:0] d,
	output reg[15:0] c,
	output reg[15:0] m
	);

reg [3:0] count =0;
always @(ann) begin
	
	m = ann/1000;
	c = (ann/100 - m*10);
	d = (ann/10 -m*100 -c*10);
	u = (ann-m*1000-c*100-d*10);
	
end

endmodule