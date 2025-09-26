module dynamic_v(input rst,
 input clk_e, input [7:0] pp, output reg [1:0] an,
 output reg [3:0] bcd);

reg count =0;
always @(posedge clk_e or negedge rst) begin
		if(rst == 0) begin
			count<= 0;
			an<=2'b11; 
		end else begin 
			count<= count+1;
			//an<=2'b10; 
			case (count) 
				1'h0: begin bcd <= pp[3:0];   an<= 2'b10; end 
				1'h1: begin bcd <= pp[7:4];   an<= 2'b01; end
			endcase
		end
end


endmodule