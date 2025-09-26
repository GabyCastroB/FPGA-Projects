module comp(B, z);
  input [3:0]B;
  output z;
  reg tmp;
  
  initial tmp = 0;
  assign z = tmp;

    always@(*)
      tmp = (B==0) ? 1'b1 : 1'b0;

endmodule

