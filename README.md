# FPGA-Projects

This repository is a collection of various projects implemented on Field-Programmable Gate Arrays (FPGAs). Each project is contained in its own folder and includes all the necessary files for the design, synthesis, and implementation.

## 🚀 Projects Overview

Here is a summary of the projects you will find in this repository. Click on a project name to navigate directly to its folder for more details.

### 1. [Sumador de 4 bits](https://github.com/GabyCastroB/FPGA-Projects/tree/main/Sumador-de-4-bits)
This project implements a 4-bit adder, a fundamental digital logic circuit for performing binary addition. This serves as a basic building block for more complex arithmetic logic units (ALUs) and is an excellent learning resource for understanding combinational logic and ripple-carry architecture on an FPGA.

## 📁 Files

*   **Verilog or VHDL source code**: The core design files that define the 4-bit adder. You will find the logic for full adders and their interconnection to create the complete 4-bit circuit.
*   **Testbench**: A simulation file that verifies the functionality of the 4-bit adder by providing a range of input values and checking for the correct sum and carry-out.
*   **Constraints file**: The file that maps the adder's input and output ports to the physical pins of the FPGA development board used for implementation.

## 💡 What you will learn

*   **Combinational Logic**: Understand how to implement a function where the output is determined solely by the current inputs.
*   **Hierarchical Design**: Learn how to build a complex circuit (a 4-bit adder) by reusing a simpler component (a 1-bit full adder).
*   **Arithmetic on FPGAs**: Get hands-on experience with implementing basic arithmetic operations in hardware description language.
*   **Testbench creation**: Practice writing simulation files to verify the correctness of a digital design.

### 2. [BCD-Siete-segmentos](https://github.com/GabyCastroB/FPGA-Projects/tree/main/BCD-Siete-segmentos)
This project implements a Binary-Coded Decimal (BCD) to 7-segment display decoder. It is a classic and essential educational project for FPGA development, as it demonstrates how to map a 4-bit binary input to the control signals needed to display a decimal digit on a 7-segment display. This is a foundational exercise for learning about combinational logic and driving external peripherals.

## 📁 Files

*   **Verilog or VHDL source code**: The HDL file contains the logic for the BCD-to-7-segment decoder, using either behavioral or structural modeling (likely a `case` statement or logical expressions).
*   **Testbench**: A simulation file that verifies the decoder's functionality. It typically provides all possible 4-bit BCD inputs (0000 to 1001) and checks if the 7-segment outputs correspond to the correct decimal digit.
*   **Constraints file**: The file that maps the 4-bit BCD input ports and the 7-segment output ports to the physical pins of the FPGA development board.

## 💡 What you will learn

*   **Combinational Logic**: Gain practical experience in designing a circuit where the output is directly dependent on the current inputs.
*   **Case Statements in HDL**: See a practical example of how to use a `case` or `if/else if` statement to implement a lookup table for logic.
*   **Driving External Peripherals**: Understand the basic principles of interfacing an FPGA with external components like displays.

### 3. [Banco de registro](https://github.com/GabyCastroB/FPGA-Projects/tree/main/Banco-de-registro)
This project implements a register bank, also known as a register file, on an FPGA. A register bank is a set of fast-access storage elements (registers) commonly used in CPU designs to hold operands and results. This project serves as an essential building block for more complex designs in computer architecture, such as single-cycle or pipelined processors.

## 📁 Files

*   **Verilog or VHDL source code**: The HDL file contains the logic for the register bank. The design typically includes multiple read ports and a single write port, allowing for simultaneous reading from two registers and writing to one.
*   **Testbench**: A simulation file that verifies the functionality of the register bank. It simulates read and write operations to ensure data is stored and retrieved correctly.
*   **Constraints file**: This file maps the register bank's input and output ports (including clock, reset, read/write addresses, and data ports) to the physical pins of the FPGA development board.

## 💡 What you will learn

*   **Synchronous Design**: Understand how to create a digital circuit that is controlled by a clock signal, a fundamental concept in digital design.
*   **Memory Fundamentals**: Gain hands-on experience with the basic principles of memory storage and retrieval in hardware.
*   **Computer Architecture**: Learn how a core component of a CPU is implemented at the hardware level.

### 4. [Multiplicador](https://github.com/GabyCastroB/FPGA-Projects/tree/main/Multiplicador)
This project implements a digital binary multiplier on an FPGA. Multiplication is a fundamental arithmetic operation in many digital systems, including digital signal processing (DSP), cryptographic algorithms, and general-purpose computing. This project serves as a concrete example of how to realize such an operation in hardware.

## 📁 Files

*   **Verilog or VHDL source code**: The HDL file contains the logic for the multiplier. The implementation might use a combinational design (e.g., Booth's algorithm) for fast multiplication or a sequential design for resource efficiency.
*   **Testbench**: A simulation file that verifies the multiplier's functionality by providing different sets of input values and checking if the output corresponds to the correct product.
*   **Constraints file**: This file maps the multiplier's input and output ports to the physical pins of the FPGA development board.

## 💡 What you will learn

*   **Arithmetic Logic**: Understand the hardware implementation of arithmetic operations beyond simple addition.
*   **Combinational vs. Sequential Design**: Explore the trade-offs between implementing a fast, pure combinational multiplier and a more resource-efficient sequential one.
*   **Algorithm Implementation in Hardware**: See how a mathematical algorithm can be translated into a hardware description language.

### 5. [Buffer-memoria-y-VGA](https://github.com/GabyCastroB/FPGA-Projects/tree/main/Buffer-memoria-y-VGA)
This project demonstrates the implementation of a frame buffer and a VGA (Video Graphics Array) controller on an FPGA. It shows how to use on-chip or external memory to store pixel data and then read from that memory to generate the video synchronization and color signals required by a standard VGA monitor. This is a crucial step for anyone interested in FPGA-based graphics, and it provides a foundation for more complex projects involving video processing and display.

## 📁 Files

*   **Verilog or VHDL source code**: The HDL files will contain the logic for two main components:
*   **Memory Controller**: Logic for reading and writing pixel data to and from a memory block (e.g., Block RAM on-chip or external SDRAM).
*   **VGA Controller**: Logic to generate the horizontal and vertical synchronization signals (`hsync` and `vsync`) and drive the pixel data to the RGB outputs of the VGA connector.
*   **Testbench**: A simulation file to verify that the memory and VGA controllers are working correctly, for example, by writing a simple pattern to the memory and confirming the correct VGA timing and pixel values.
*   **Constraints file**: This file maps the clock, reset, and VGA output signals to the specific pins on your FPGA development board.

## 💡 What you will learn

*   **Memory Interfacing**: Gain practical experience interfacing an FPGA with memory, whether it's internal block RAM or an external memory chip.
*   **Video Signal Generation**: Understand the timing requirements for generating standard video signals like VGA.
*   **Low-Level Graphics**: Learn the fundamentals of how a graphics system works at the hardware level, from storing pixel data to rendering it on a screen.

### 6. [Proyecto Silla_de_ruedas](https://github.com/GabyCastroB/FPGA-Projects/tree/main/Silla_de_ruedas)
This project implements an FPGA-controlled system for a robotic or motorized wheelchair. It demonstrates the use of an FPGA for a real-world, embedded control application, managing inputs (like a joystick or other sensors) and generating the necessary control signals (e.g., Pulse-Width Modulation or PWM) to drive motors. This project highlights the FPGA's ability to handle parallel processing and complex control logic in a low-latency, real-time environment.

## 📁 Files

*   **Verilog or VHDL source code**: The HDL files will contain the logic for:
*   **Input Processing**: Decoding signals from an input device (e.g., analog-to-digital converter for joystick, or a digital interface for buttons).
*   **Motor Control**: Generating precise PWM signals to control the speed and direction of two or more motors.
*   **Control Logic**: Implementing the control algorithm that translates user input into motor commands.
*   **Testbench**: A simulation file to verify the motor control logic and input processing, ensuring the system behaves as expected under various input conditions.
*   **Constraints file**: This file maps the control inputs (like joystick axes or buttons) and the motor output signals to the physical pins on your FPGA development board.

## 💡 What you will learn

*   **Embedded Systems**: Gain practical experience in using an FPGA as the central processing unit for an embedded control system.
*   **Motor Control**: Understand how to use PWM to control the speed and direction of DC motors, a core concept in robotics and automation.
*   **Real-Time Processing**: Learn how FPGAs can provide deterministic, low-latency control, which is critical for safety-sensitive applications like a wheelchair controller.
*   **System Integration**: See how different components—input sensors, a central control unit, and output actuators (motors)—are brought together in a hardware design.


## 🛠️ Requirements
The projects in this repository were developed using standard FPGA tools. Specific hardware and software requirements may vary by project, but generally include:
*   FPGA development board (e.g., Altera/Intel, Xilinx)
*   FPGA development software (e.g., Quartus Prime, Vivado)
*   Knowledge of Verilog or VHDL.
