# lab03- BCD- siete segmentos

## Nombres de integrantes

### Diddier Alexander Hilarion Beltran
### Gabriela María Castro Beltrán
### Daniel Pineda

## Resumen

En el presente informe, se muestra la realización del diseño, sintentización e implementqación de un BCD-siete segmentos, en el cual se desarrolla un divisor de frecuencia y una selección de datos correspondientes a los anados de cada display, con el fin de visualizar en cada uno un número diferente, y por cada instante de tiempo teniendo uno solo activado, sin embargo se realizó de tal forma que no se perciba este cambio, siendo activado a 16ms. Este laboratorio se efectuó atreves de Quartus, una herramienta de software producida por Altera para el análisis y la síntesis de diseños realizados en HDL o hardware description language por sus siglas en inglés.

## Palabras claves
Verilog, tablas de verdad, compuertas lógicas, bit, FPGA, BCD. 
# Introdución
## Display de siete-segmentos

El decodificador de siete-segmentos es un dispositivo opto-electrónico que posee una cantidad de 4-bit de entrada y 7-bit de salida que son los correspondientes a los LEDS del display digital, nombrados como se muestra en la siguiente figura de *a* hasta *g*, permitiendo la visualización de números del *0* al *9* y de letras; en nuestro caso se utilizaran las letras a,b,c,d,E y F, para la representación en hexadecimal. Existen dos tipos de display, los de anodos común y catodo común, esto depende de su organización con los leds que forman a cada segmento. Esto de observa más claramente en su tablara de verdad (ver tabla 1).

![Display de siete segmentos](https://github.com/unal-edigital1-lab/lab03-2022-1-grupo03-22-1-os_melhores/blob/master/Imagenes/BCD.png)

<p align="center">  

| A | B | C | D | a | b | c | d | e | f | g |
| - | - | - | - | - | - | - | - | - | - | - |
| 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| 0 | 0 | 0 | 1 | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
| 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 
| 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 0 | 1 | 0 | 0 | 1 | 1 | 0 | 0 |
| 0 | 1 | 0 | 1 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 1 | 1 | 1 |
| 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
| 1 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| 1 | 1 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 1 |
| 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 0 |
| 1 | 1 | 1 | 0 | 0 | 1 | 1 | 1 | 0 | 0 | 0 |
| 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

Tabla 1. Tabla de verdad BCD a siete segmentos.
</p>

## Multiplexor (Selector de datos)

Un multiplexor o MUX es un dispositivo que direcciona la información digital de diferentes entradas, eligiendo una única salida (para el más básico), basandose en una señal de selección. Su simbolo se muestra a continueación junto con su tabla de verdad (Ver tabla 2), en esta se puede analizar que el multiplexor elige entre las dos entradas dadas, según la información del selector (S) o señal de control.

![Símbolo del multiplexor](https://github.com/unal-edigital1-lab/lab03-2022-1-grupo03-22-1-os_melhores/blob/master/Imagenes/multiplexor.png)

<p align="center">  

| S | A | B | Y | 
| - | - | - | - | 
| 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 
| 0 | 1 | 0 | 0 | 
| 0 | 1 | 1 | 1 | 
| 1 | 0 | 0 | 0 | 
| 1 | 0 | 1 | 0 | 
| 1 | 1 | 0 | 1 | 
| 1 | 1 | 1 | 1 | 

Tabla 1. Tabla de verdad de un multiplexor.
</p>

## Contadores 

Los contadores son circuitos electrónicos digitales secuenciales, estos tienen el requerimento de necesitar memoria, estos deben tener un número máximo de cuentas, clasificarse en ascendente o descendente, síncrono (todos los números conmutan a la vez, con una señal de reloj comú) o asíncrono (el reloj no es común y los números conmutan uno tras otro), y autonpomos o autodetención. Su entrada es de tipo reloj o de pulso, con el objetivo de incrementar o decrementar la cantidad de dicho valor por cada pulso que recibe.

## Divisor de frecuencia

Una de las aplicacionnes que se les puede dar a los contadores son los divisores de frecuencia, utlizandose como *acumuladores de cuentas*, lo que significa que cuanta los pulsos de entrada y almacena esa información temporalmente, un claro ejemplo de esto son los relojes digitales, los cuales utilizan los contadores para dividir la frecunecia y un decodificador para mostralo en un display.


## Analís del Código

El código de cada módulo se explicará a continuación, empezando por nuestro módulo principal encargado de controlar la señal de datos obtenidos de cada módulo:

### Módulo de display

En este módulo recibe el número el cual se deasea visualizar, la señal del clock y la señal del reset. Como salida tiene el anodo a seleccionar y la decodificación del siete segmentos. En este módulo se instancian los demás módulos y los cables que los concectan.

```python

`timescale 1ns / 1ps
module display(
	input [15:0] num,
	input clk,
	input rst,
	
	output [0:6] sseg,
	output  [3:0] an
	
);



wire [26:0] cf;

wire enable;

//Para la FPGA 
assign enable = cf[16];
//para la simulacion
//assign enable = cf[10];
wire [3:0]bcd;




//reg [15:8] num=16'h43;
//reg [7:0] num=16'h43;
 
BCDtoSSeg bcdtosseg(.BCD(bcd), .Seg(sseg));





//codigo modularizado en clk_impl
counter_clk cl(.clk(clk), .rst(rst), .cfreq(cf));

//para la simulacion
//wire [15:0]u; 
//wire [15:0]d; 
//wire [15:0]c; 
//wire [15:0]m; 

//anntobcc atb(.ann(num),.u(u),.d(d),.c(c),.m(m));
//dynamic_v dv(.rst(rst), .clk_e(enable), .u(u),.d(d),.c(c),.m(m),.an(an), .bcd(bcd) );


//codigo modularizado en freqDivisor

dynamic_v dv(.rst(rst), .clk_e(enable), .num(num),.an(an), .bcd(bcd) );


endmodule
```

### Módulo dinamic_v

Este módulo recibe la señal del clock enable (a la frecuencia de 16 ms) y el número a visualizar. Como salida se obtiene la codificación del número en BCD y el ánodo al que corresponde cada caso. Este modulo se encarga principalmente de la codificación del número recibido y hacer la multiplexación para el anodo. 


```python
module dynamic_v(
	//Para la FPGA
	input clk_e, input [15:0] num, output reg [0:3] an,output reg [3:0] bcd
	//Para la simulacion
	//input rst,input clk_e, input [15:0] u, input [15:0] d, input [15:0] c, input [15:0] m, output reg [0:3] an, output reg [3:0] bcd
	
	);

reg [1:0] count =0;
always @(posedge clk_e or negedge rst) begin//
		
			count<= count+1;

			case (count) 
				// Para la FPGA
				
				2'h0: begin bcd <= num[3:0];   an<=4'b1110; end
				//2'h0: begin bcd <= 4'b0001;   an<=4'b1110; end 
				2'h1: begin bcd <= num[7:4];   an<=4'b1101; end
				//2'h1: begin bcd <= 4'b0010;   an<=4'b1101; end	
				2'h2: begin bcd <= num[11:8];  an<=4'b1011; end 
				//2'h2: begin bcd <= 4'b0011;  an<=4'b1011; end 
				2'h3: begin bcd <= num[15:12]; an<=4'b0111; end 
				//2'h3: begin bcd <= 4'd0;; an<=4'b0111; end 
				
				//para la simulacion
				
				//2'h0: begin bcd <= u;   an<=4'b1110; end
				
				//2'h1: begin bcd <= d;   an<=4'b1101; end
					
				//2'h2: begin bcd <= c;  an<=4'b1011; end 
				
				//2'h3: begin bcd <= m; an<=4'b0111; end 
					
			endcase

end

endmodule
```
 ### Módulo counter_clk:

Este módulo recibe la señal de clock y la señal de reset y como salida se obtiene un registro contador. En este módulo se cuentan los flancos de subida del clock para hacer despues la división de frecuencia para la señal enable.

```python
module counter_clk(input clk, input rst, output reg [26:0] cfreq);

always @(posedge clk) begin//cuenta los ciclos de reloj
  if(rst==1) begin
		cfreq <= 0;
	end else begin
		cfreq <=cfreq+1;
	end
end

endmodule
```
### Módulo BCDtoSSeg:

Este módulo recibe la codificación del número en BCD y como salida da la codificación del número para el display 7 segmentos. Es un módulo base para toda la visualización.

```python
module BCDtoSSeg(input [3:0] BCD, output reg[6:0] Seg);



always @ (*) begin 

	case (BCD) 
	//                abcdefg
	4'b0000: Seg = 7'b0000001; // "0"  
	4'b0001: Seg = 7'b1001111; // "1" 
	4'b0010: Seg = 7'b0010010; // "2" 
	4'b0011: Seg = 7'b0000110; // "3" 
	4'b0100: Seg = 7'b1001100; // "4" 
	4'b0101: Seg = 7'b0100100; // "5" 
	4'b0110: Seg = 7'b0100000; // "6" 
	4'b0111: Seg = 7'b0001111; // "7" 
	4'b1000: Seg = 7'b0000000; // "8"  
	4'b1001: Seg = 7'b0000100; // "9" 
	4'ha:     Seg = 7'b0001000; // "A"
	4'hb:     Seg = 7'b1100000; // "B"
	4'hc:     Seg = 7'b0110001; // "C"
	4'hd:     Seg = 7'b1000010; // "D"
	4'he:     Seg = 7'b0110000; // "E"
	4'hf:     Seg = 7'b0111000; // "F"
	default:  Seg = 7'b0000000; //off
	endcase
	end
endmodule
```

## Video de funcionamiento
En los siguientes videos se observa la visualización dinámica en los display de 7 segmentos de la placa, los datos son leidos de los dip switch de la placa y de dip switch externos.

[![visualización 1](http://img.youtube.com/vi/X-VZWwxb4Do/0.jpg)](https://youtube.com/shorts/X-VZWwxb4Do "visualización")

[![visualización 2](http://img.youtube.com/vi/pcoZlp1Zv5c/0.jpg)](https://youtube.com/shorts/pcoZlp1Zv5c "visualización")
## Simulación

Para la simulación se uso 2 archivos de testbench (BCDtoSSeg.v y testbench.v) de los cuales se obtuvo los siguientes resultados: 

  
### BCD to Seg 

![Simulación BCD to Seg](https://github.com/unal-edigital1-lab/lab03-2022-1-grupo03-22-1-os_melhores/blob/master/Imagenes/BCDtoSeg.png)

Como se puede observar en la simulación por cada número del 0 al 15 se hace su respectiva conversión para el 7 segmentos, de la forma explicada anteriormente. 

### Visualización dinámica

![Simulación Visualización dinámica](https://github.com/unal-edigital1-lab/lab03-2022-1-grupo03-22-1-os_melhores/blob/master/Imagenes/vd.png)

Con esta simulación vemos como en intervalos de 16.2u hay un cambio de ánodo o cambio de display el cual se visualiza. Se ve simultaneamente como para cada intervalo de ánodo  cambia el BCD y el SSeg con el digito correspondiente del numero ingresado.
## Conclusión 

Es importante enteder como funciona la vizualización dinámica ya que es la forma como los dispositivos pueden mostrar la información de una manera gráfica.

Se comprendió a cabalidad el funcionamiento de un divisor de frecuencia el cual fue implementado para la visualización

Se implemento la conversión de BCC a los 7 segmentos por medio de la descripción de hardware




## Bibliografía
1.	Floyd. Fundamentos de Sistemas Digitales 9 Edicion. Pearson Educacion; 2007.
