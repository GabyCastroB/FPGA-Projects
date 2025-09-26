`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:19 11/04/2020
// Design Name: 
// Module Name:    test_VGA
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module test_VGA(
    input wire clk,           // board clock: 32 MHz quacho 100 MHz nexys4 
    input wire rst,         	// reset button

	// VGA input/output  
    output wire VGA_Hsync_n,  // horizontal sync output
    output wire VGA_Vsync_n,  // vertical sync output
    output wire VGA_R,	// 4-bit VGA red output
    output wire VGA_G,  // 4-bit VGA green output
    output wire VGA_B,  // 4-bit VGA blue output
    output wire prueba,  // 4-bit VGA blue output
    output wire prueba2  // 4-bit VGA blue output
 	
	// input/output
	
	
	//input wire bntr,
	//input wire bntl
		
);

// TAMAÑO DE visualización 
parameter CAM_SCREEN_X = 160;
parameter CAM_SCREEN_Y = 120;

localparam AW = 15; // LOG2(CAM_SCREEN_X*CAM_SCREEN_Y)
localparam DW = 3;

// El color es RGB 111
localparam RED_VGA =   3'b100;
localparam GREEN_VGA = 3'b010;
localparam BLUE_VGA =  3'b001;


// Clk 

reg clk25M;
assign prueba = VGA_Vsync_n;
assign prueba2 = clk25M;

// Conexión dual por ram

wire  [AW-1: 0] DP_RAM_addr_in;  
wire  [DW-1: 0] DP_RAM_data_in;
wire DP_RAM_regW;

reg  [AW-1: 0] DP_RAM_addr_out;  
	
// Conexión VGA Driver
wire [DW-1:0]data_mem;	   // Salida de dp_ram al driver VGA
wire [DW-1:0]data_RGB111;  // salida del driver VGA al puerto
wire [9:0]VGA_posX;		   // Determinar la pos de memoria que viene del VGA
wire [8:0]VGA_posY;		   // Determinar la pos de memoria que viene del VGA


assign VGA_R = data_RGB111[2];
assign VGA_G = data_RGB111[1];
assign VGA_B = data_RGB111[0];



always@(posedge clk) begin
	clk25M =~clk25M;
end

//assign clk25M=clk;



buffer_ram_dp #( AW,DW,"C:/Users/gabri/Documents/GitHub/lab06-2022-1-grupo03-22-1-os_melhores/hdl/scr/image.men")
	DP_RAM(  
	.clk_w(clk25M), 
	.addr_in(DP_RAM_addr_in), 
	.data_in(DP_RAM_data_in),
	.regwrite(DP_RAM_regW), 
	
	.clk_r(clk25M), 
	.addr_out(DP_RAM_addr_out),
	.data_out(data_mem)
	);
	


VGA_Driver640x480 VGA640x480
(
	.rst(~rst),
	.clk(clk25M), 				// 25MHz  para 60 hz de 640x480
	.pixelIn(data_mem), 		// entrada del valor de color  pixel RGB 444 
//	.pixelIn(GREEN_VGA), 		// entrada del valor de color  pixel RGB 444 
	.pixelOut(data_RGB111), // salida del valor pixel a la VGA 
	.Hsync_n(VGA_Hsync_n),	// señal de sincronizaciÓn en horizontal negada
	.Vsync_n(VGA_Vsync_n),	// señal de sincronizaciÓn en vertical negada 
	.posX(VGA_posX), 			// posición en horizontal del pixel siguiente
	.posY(VGA_posY) 			// posición en vertical  del pixel siguiente

);

 

always @ (VGA_posX, VGA_posY) begin
		if ((VGA_posX>CAM_SCREEN_X-1) || (VGA_posY>CAM_SCREEN_Y-1))
			DP_RAM_addr_out=19212;
		else
			DP_RAM_addr_out=VGA_posX+VGA_posY*CAM_SCREEN_Y;
end


//assign DP_RAM_addr_out=10000;

//
// FSM_game  juego(
//	 	.clk(clk25M),
//		.rst(rst),
//		.in1(btnr),
//		.in2(btnr),
//		.mem_px_addr(DP_RAM_addr_in),
//		.mem_px_data(DP_RAM_data_in),
//		.px_wr(DP_RAM_regW)
//   );
endmodule
