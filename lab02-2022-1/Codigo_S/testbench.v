module testbench;

  // Inputs
  reg [4:0] xi;
  reg [4:0] yi;

  // Outputs
  wire cout;
  wire [3:0] S;

  // Instantiate the Unit Under Test (UUT)
  Sum4bcc sim (
    .xi(xi), 
    .yi(yi), 
    .cout(cout), 
    .S(S)
  );

  initial begin
  // lo que se encuentra dentro de este bloque "initial" no se sintetiza
  // solo se usa para ejecutar la simulacion
  // Initialize Inputs
    xi=0;
	 // Se genera un for usando los registros de 5 bits con el fin de poder 
   // sumar todas las posibles combinaciones de números de 4 bits
    for (yi = 0; yi < 16; yi = yi + 1) begin
      for(xi = 0; xi < 16; xi = xi + 1) begin
		    #5 $display("el valor de %d + %d = %d", xi,yi,S);
		  end
    end
  end

endmodule