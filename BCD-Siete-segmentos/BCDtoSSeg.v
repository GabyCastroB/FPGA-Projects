module BCDtoSSeg(input [3:0] BCD, output reg[6:0] Seg);



always @ (*) begin 

	case (BCD) 
	//                abcdefg
	4'b0000: Seg = 7'b0000001; // "0"  
	4'b0001: Seg = 7'b1001111; // "1" 
	4'b0010: Seg = 7'b0010010; // "2" 
	4'b0011: Seg = 7'b0000110; // "3" 
	4'b0100: Seg = 7'b1001100; // "4" 
	4'b0101: Seg = 7'b0100100; // "5" 
	4'b0110: Seg = 7'b0100000; // "6" 
	4'b0111: Seg = 7'b0001111; // "7" 
	4'b1000: Seg = 7'b0000000; // "8"  
	4'b1001: Seg = 7'b0000100; // "9" 
	4'ha:     Seg = 7'b0001000; // "A"
	4'hb:     Seg = 7'b1100000; // "B"
	4'hc:     Seg = 7'b0110001; // "C"
	4'hd:     Seg = 7'b1000010; // "D"
	4'he:     Seg = 7'b0110000; // "E"
	4'hf:     Seg = 7'b0111000; // "F"
	default:  Seg = 7'b0000000; //off
	endcase
	end
endmodule