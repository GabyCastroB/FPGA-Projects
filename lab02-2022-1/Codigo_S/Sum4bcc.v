module Sum4bcc (xi,yi,cout,S);

//Declaracion de las entradas y salidas del operador
input [3:0] xi;
input [3:0] yi;
output cout;
output [3:0] S;



//Declaracion de cables 
wire C1,C2,C3,cout2;
wire [3:0] St;
assign cout= ~cout2;
assign S= ~St;

//Sumas internas de 1 bit para obtener el resultado de la suma de 4 bits
sum1bcc S1 (.A(xi[0]),.B(yi[0]),.Ci(0),.Cout(C1),.S(St[0]));
sum1bcc S2 (.A(xi[1]),.B(yi[1]),.Ci(C1),.Cout(C2),.S(St[1]));
sum1bcc S3 (.A(xi[2]),.B(yi[2]),.Ci(C2),.Cout(C3),.S(St[2]));
sum1bcc S4 (.A(xi[3]),.B(yi[3]),.Ci(C3),.Cout(cout2),.S(St[3]));

endmodule
