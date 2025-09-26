module dynamic_v(
	//Para la FPGA
	input clk_e, input [15:0] num, output reg [0:3] an,output reg [3:0] bcd
	//Para la simulacion
	//input rst,input clk_e, input [15:0] u, input [15:0] d, input [15:0] c, input [15:0] m, output reg [0:3] an, output reg [3:0] bcd
	
	);

reg [1:0] count =0;
always @(posedge clk_e or negedge rst) begin//
		
			count<= count+1;

			case (count) 
				// Para la FPGA
				
				2'h0: begin bcd <= num[3:0];   an<=4'b1110; end
				//2'h0: begin bcd <= 4'b0001;   an<=4'b1110; end 
				2'h1: begin bcd <= num[7:4];   an<=4'b1101; end
				//2'h1: begin bcd <= 4'b0010;   an<=4'b1101; end	
				2'h2: begin bcd <= num[11:8];  an<=4'b1011; end 
				//2'h2: begin bcd <= 4'b0011;  an<=4'b1011; end 
				2'h3: begin bcd <= num[15:12]; an<=4'b0111; end 
				//2'h3: begin bcd <= 4'd0;; an<=4'b0111; end 
				
				//para la simulacion
				
				//2'h0: begin bcd <= u;   an<=4'b1110; end
				
				//2'h1: begin bcd <= d;   an<=4'b1101; end
					
				//2'h2: begin bcd <= c;  an<=4'b1011; end 
				
				//2'h3: begin bcd <= m; an<=4'b0111; end 
					
			endcase

end

endmodule