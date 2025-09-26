`timescale 1ns / 1ps
module buffer_ram_dp#( 
	parameter AW = 8, // Cantidad de bits  de la direccin 
	parameter DW = 3, // cantidad de Bits de los datos 
	parameter   imageFILE= "C:/Users/gabri/Documents/GitHub/lab06-2022-1-grupo03-22-1-os_melhores/hdl/scr/image.men")
	(  
	input  clk_w, 
	input  [AW-1: 0] addr_in, 
	input  [DW-1: 0] data_in,
	input  regwrite, 
	
	input  clk_r, 
	input [AW-1: 0] addr_out,
	output reg [DW-1: 0] data_out,
	input reset
	);

// Calcular el nmero de posiciones totales de memoria 
localparam NPOS = 2 ** AW; // Memoria

 reg [DW-1: 0] ram [0: NPOS-1]; 


//	 escritura  de la memoria port 1 
always @(posedge clk_w) begin 
       if (regwrite == 1) 
             ram[addr_in] <= data_in;
end

//	 Lectura  de la memoria port 2 
always @(posedge clk_r) begin 
		data_out <= ram[addr_out]; 
end


initial begin
	$readmemh(imageFILE, ram);
//	ram[0] = 0;
//	ram[1] = 12'b111111111111;
end


endmodule