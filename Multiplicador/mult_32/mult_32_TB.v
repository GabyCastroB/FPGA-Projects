`timescale 1ns / 1ps

`define SIMULATION


module mult_32_TB;

   reg  clk;
   reg  rst;
   reg  [3:0]in_A;
   reg  [3:0]in_B;
	reg start;
     reg [1:0] i;
	wire done;
  
   mult_32 uut (.clk(clk) , .rst(rst) , .init(start) , .A(in_A) , .B(in_B), .done(done));





   initial begin  // Initialize Inputs
      clk = 0; start = 0; rst=0;
		in_A = 5; in_B = 3;//in_A = 16'hFA00; in_B = 16'hFA00; //in_A = 8'hAA; in_B = 8'h24;
   end

  always #1 clk = ~clk;

   initial begin // Reset the system, Start the image capture process
        #5 rst=1;
		  @ (posedge clk);
		  
        start = 0;
        @ (posedge clk);
        start = 1;
       for(i=0; i<2; i=i+1) begin
         @ (posedge clk);
       end
          start = 0;
    end
	 

   initial begin: TEST_CASE
     $dumpfile("mult_32_TB.vcd");
     $dumpfile("BCDtoSSeg_TB.vcd");
    // #(200) $finish;
   end
	
endmodule

