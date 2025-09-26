`timescale 1ns / 1ps

module BCDtoSSeg_TB;
	
	reg[3:0] BCD;
	wire[6:0]Seg;

BCDtoSSeg uut(.BCD(BCD),.Seg(Seg));

initial begin
	BCD = 0; #0.1;
	BCD = 1; #0.1;
	BCD = 2; #0.1; 
	BCD = 3; #0.1;
	BCD = 4; #0.1;
	BCD = 5; #0.1;
	BCD = 6; #0.1;
	BCD = 7; #0.1;
	BCD = 8; #0.1;
	BCD = 9; #0.1;
	BCD = 10; #0.1;
	BCD = 11; #0.1;
	BCD = 12; #0.1;
	BCD = 13; #0.1;
	BCD = 14; #0.1;
	BCD = 15; #0.1;
	
end

initial begin: TEST_CASE
     $dumpfile("BCDtoSSeg_TB.vcd");
     #(2) $finish;
end
endmodule