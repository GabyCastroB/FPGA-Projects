# lab05-Buffer de memoria y configutación test VGA

## Nombres de integrantes

### Diddier Alexander Hilarion Beltran
### Gabriela María Castro Beltrán
### Daniel Pineda

## Resumen


## Palabras claves
Verilog, tablas de verdad, compuertas lógicas, bit, FPGA, BCD, memoria, dirreción, registro, multiplexor
# Introdución

## VGA
Abreviación para Video Graphics Adapter o Video Graphics Array, VGA es un estándar popular para pantallas desarrollado por IBM e introducido en 1987. VGA provee una resolución de 640 x 480 con una tasa de refresco de 60Hz y 16 colores en simultaneo. VGA utiliza señales analogas lo que significa que es capaz de mostrar resoluciones bajas unicamente.


## Análisis del código

A continuación de encontrara el código que cada módulo a utilizar, junto con su explicación.

## Módulo test_VGA
Este modulo es el principal, en este se definen ciertos parametros como la profundidad del color o el tamaño de palabra especificos a nuestra combinación de placa de desarrollo y monitor. 

```python
`timescale 1ns / 1ps

module test_VGA(
    input wire clk,           // board clock: 32 MHz quacho 100 MHz nexys4 
    input wire rst,         	// reset button

	// VGA input/output  
    output wire VGA_Hsync_n,  // horizontal sync output
    output wire VGA_Vsync_n,  // vertical sync output
    output wire VGA_R,	// 4-bit VGA red output
    output wire VGA_G,  // 4-bit VGA green output
    output wire VGA_B,  // 4-bit VGA blue output
 // output wire clkout,   
 	
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
//assign clkout=clk;


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
```
## Módulo buffer de memoria
Este modulo se encarga de poner en memoria la imágen deseada, esto lo hace en tiempo de sintetización y las funciones de lectura y escritura lo hace en tiempo de ejecución.

```python
`timescale 1ns / 1ps

module buffer_ram_dp#( 
	parameter AW = 15, // Cantidad de bits  de la direccin 
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
	$readmemb(imageFILE, ram);
//	ram[0] = 0;
//	ram[1] = 3'b111;
end


endmodule
```

## Módulo VGA_driver
Este modulo se encarga de hacer de manera adecuada para nuestro monitor el control de la señal, es decir se encarga de enviar las señales de sincronización tanto vertical y horizontal en el momento adecuado así como de enviar a la frecuencia para el monitor usado las señales correspondientes al RGB111.

```python
module VGA_Driver640x480 (
	input rst,
	input clk, 				// 25MHz  para 60 hz de 640x480
	input  [2:0] pixelIn, 	// entrada del valor de color  pixel 
	output  [2:0] pixelOut, // salida del valor pixel a la VGA 
	output  Hsync_n,		// seÃ±al de sincronizaciÃ³n en horizontal negada
	output  Vsync_n,		// seÃ±al de sincronizaciÃ³n en vertical negada 
	output  [9:0] posX, 	// posicion en horizontal del pixel siguiente
	output  [8:0] posY 		// posicion en vertical  del pixel siguiente
);

localparam SCREEN_X = 640; 	// tamaño de la pantalla visible en horizontal 
localparam FRONT_PORCH_X =16;  
localparam SYNC_PULSE_X = 96;
localparam BACK_PORCH_X = 48;
localparam TOTAL_SCREEN_X = SCREEN_X+FRONT_PORCH_X+SYNC_PULSE_X+BACK_PORCH_X; 	// total pixel pantalla en horizontal 


localparam SCREEN_Y = 480; 	// tamaño de la pantalla visible en Vertical 
localparam FRONT_PORCH_Y =10;  
localparam SYNC_PULSE_Y = 2;
localparam BACK_PORCH_Y = 33;
localparam TOTAL_SCREEN_Y = SCREEN_Y+FRONT_PORCH_Y+SYNC_PULSE_Y+BACK_PORCH_Y; 	// total pixel pantalla en Vertical 


reg  [9:0] countX;
reg  [8:0] countY;

assign posX    = countX;
assign posY    = countY;

assign pixelOut = (countX<SCREEN_X) ? (pixelIn ) : (3'b000) ;

assign Hsync_n = ~((countX>=SCREEN_X+FRONT_PORCH_X) && (countX<SCREEN_X+SYNC_PULSE_X+FRONT_PORCH_X)); 
assign Vsync_n = ~((countY>=SCREEN_Y+FRONT_PORCH_Y) && (countY<SCREEN_Y+FRONT_PORCH_Y+SYNC_PULSE_Y));


always @(posedge clk) begin
	if (rst) begin
		countX <= TOTAL_SCREEN_X- 10; /*para la simulación sea mas rapido*/
		countY <= TOTAL_SCREEN_Y-4;/*para la simulación sea mas rapido*/
	end
	else begin 
		if (countX >= (TOTAL_SCREEN_X)) begin
			countX <= 0;
			if (countY >= (TOTAL_SCREEN_Y)) begin
				countY <= 0;
			end 
			else begin
				countY <= countY + 1;
			end
		end 
		else begin
			countX <= countX + 1;
			countY <= countY;
		end
	end
end

endmodule
```
## Simulación

```python
`timescale 10ns / 1ns

module test_VGA_TB;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire VGA_Hsync_n;
	wire VGA_Vsync_n;
	wire VGA_R;
	wire VGA_G;
	wire VGA_B;
   wire bntr;
	wire bntl;
	wire clkout;

	// Instantiate the Unit Under Test (UUT)
	test_VGA uut (
		.clk(clk), 
		.rst(rst), 
		.VGA_Hsync_n(VGA_Hsync_n), 
		.VGA_Vsync_n(VGA_Vsync_n), 
		.VGA_R(VGA_R), 
		.VGA_G(VGA_G), 
		.VGA_B(VGA_B),
		.bntr(bntr),
		.bntl(bntr),
		.clkout(clkout)
	
	);
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		#200;
		rst = 0;
	end

	always #2 clk  = ~clk;
	
	
	reg [9:0]line_cnt=0;
	reg [9:0]row_cnt=0;
	
	
	// log para cargar de archivo/
	integer f;
	initial begin
      f = $fopen("file_test_vga.txt","w");
   end
	
	reg clk_w =0;
	always #1 clk_w  = ~clk_w;
	
	//ecsritura de log para cargar se cargados en https://ericeastwood.com/lab/vga-simulator
	initial forever begin
	@(posedge clk_w)
		$fwrite(f,"%0t ps: %b %b %b00 %b00 %b0 \n",$time,VGA_Hsync_n, VGA_Vsync_n,VGA_R,VGA_G,VGA_B);
		$display("%0t ps: %b %b %b %b %b\n",$time,VGA_Hsync_n, VGA_Vsync_n, VGA_R,VGA_G,VGA_B);
		
	end
	
endmodule
```
![Resultado txt de la simulación](https://github.com/unal-edigital1-lab/lab06-2022-1-grupo03-22-1-os_melhores/blob/main/2022-06-29.png)
![Simulación en VGA simulator](https://github.com/unal-edigital1-lab/lab06-2022-1-grupo03-22-1-os_melhores/blob/main/simulacion_vga.png)

## Vídeo de funcionamiento
[![VGA](http://img.youtube.com/vi/_ERBDA4_DH0/0.jpg)](https://www.youtube.com/embed/_ERBDA4_DH0 "VGA")
## Conclusión
El uso de la VGA  es un acercamiento al la aplicación real de todo lo aprendido, implementa tanto la visualización y banco de registros y además muestra el uso de un periferico a lo usuado usualmente.

Es importante tener en cuenta el tamaño o longitud de los registros al momento de implementar o instanciar los objetos, un tamaño grande para un registro de menor numero de bits causará problemas al momento de implementar todas las instancias.




## Bibliografía
1.	Floyd. Fundamentos de Sistemas Digitales 9 Edicion. Pearson Educacion; 2007.
