`timescale 1ns / 1ps

module tbl4;
	
	reg[2:0] readAddr1;
	reg[2:0] readAddr2;
	reg[2:0] writeAddr1;
	reg[3:0] data;
	reg clk =1'b0;
	wire [6:0] sseg;
	wire [1:0] an;
	reg rst;
	reg rwrite=1'b1;
	
display utt(.readAddr1(readAddr1),.readAddr2(readAddr2),.writeAddr1(writeAddr1),.data(data),.clk(clk),.sseg(sseg),.an(an),.rst(rst),.rwrite(rwrite));

initial begin

	
	data=4;
	rst = 0;
	#1;
	rst=1;
	#10

	// se leen los archivos inicializados 
	readAddr1=1;
	readAddr2=2;
	#40
	// se proceden a hacer la escritura y lectura 
	
	writeAddr1=1;
	rwrite = 0;
	#5
	rwrite= 1;
	data=5;
	#5
	writeAddr1=2;
	rwrite = 0;
	#5
	rwrite= 1;
	#40
	
	data=6;

	// se leen los archivos inicializados 
	readAddr1=3;
	readAddr2=4;
	#40
	// se proceden a hacer la escritura y lectura 
	
	writeAddr1=3;
	rwrite = 0;
	#5
	rwrite= 1;
	#5
	data=7;
	writeAddr1=4;
	rwrite = 0;
	#5
	rwrite= 1;
	#40
	
	data=8;

	// se leen los archivos inicializados 
	readAddr1=5;
	readAddr2=6;
	#40
	// se proceden a hacer la escritura y lectura 
	
	writeAddr1=5;
	rwrite = 0;
	#5
	rwrite= 1;
	#40

	rst = 0;
	#5
	rst= 1;

	
	
end

always begin
	forever begin
	clk=~clk;
	#0.0042;
	end
end 
initial begin: TEST_CASE
     $dumpfile("testbench.vcd");
     #(500) $finish;
end
endmodule