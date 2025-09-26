module dynamic_v(input rst,
 input clk_e, input [3:0] out1, input [3:0] out2, output reg [1:0] an,
 output reg [3:0] bcd);

reg count =0;
always @(posedge clk_e or negedge rst) begin
		if(rst==0) begin
			count <= 0;
			an<=2'b11; 
		end else begin 
			count<= count+1;
			case (count) 
				1'h0: begin bcd <= out1;   an<=2'b01; end 
				1'h1: begin bcd <= out2;   an<=2'b10; end
			endcase
		end
end


endmodule