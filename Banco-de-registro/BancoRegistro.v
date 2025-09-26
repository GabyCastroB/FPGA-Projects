`timescale 1ns / 1ps

module BancoRegistro #(      		 //   #( Parametros
         parameter BIT_ADDR = 3,  //   BIT_ADDR Número de bit para la dirección
         parameter BIT_DATO = 4  //  BIT_DATO  Número de bit para el dato
	)
	(
    input [BIT_ADDR-1:0] addrRa,//addrRa y addrB son direcciones que se configurarán 
    input [BIT_ADDR-1:0] addrRb,//con un dip switch y son las direcciones a mostrar en el 7 segmentos

    
	output reg [BIT_DATO-1:0] datOutRa,//datOutRa y datOutRb son los registros que se actualizan cada 
	output reg [BIT_DATO-1:0] datOutRb,//vez que hay un cambio en las direcciones 
    
	input [BIT_ADDR:0] addrW,//addrW es la direccion de 3 bits donde se escribirá el dato nuevo
    input [BIT_DATO-1:0] datW,//datW es el dato establecido con el dip switch para ser escrito en 
    //el banco de registro.
    
	input RegWrite,//este wire es el que se monitorea para cambio de flanco para proceder a escribir
    input clk,
    input rst
    );

// La cantdiad de registros es igual a: 
localparam NREG = 2 ** BIT_ADDR;//8
  
//configiración del banco de registro 
reg [BIT_DATO-1: 0] breg [NREG-1:0];//el primer conjunto entre llaves indica el tamaño de palabra
//el segundo conjunto indica el número de registros a crear.

always @(posedge clk) begin//siempre que haya un cambio en reloj se actualizan los registros de salida
//con el fin de tener actualizada la información que va al 7 segmentos.
 datOutRa <= breg[addrRa];
 datOutRb <= breg[addrRb];
end

reg [BIT_ADDR:0] i;
always @(negedge RegWrite or negedge rst) begin//siempre que haya un flanco de bajada para Regwrite
//o para rst se procede a escribir uno o todos los registros
	if (RegWrite == 0)begin//si el cambio es en RegWrite se procede a escribir la información que está en los
	//dipswitch en el registro especificado con los dipswitch de dirección de entrada.
      breg[addrW] <= datW;
	end
	if (rst == 0)//si el cambio es en rst se procede a cambiar todos los registros a un valor conocido en este 
	//caso cero
	begin
		for(i=0; i < NREG; i = i+1)begin
			breg[i] <= 4'b0000;
		end
	end

end

endmodule