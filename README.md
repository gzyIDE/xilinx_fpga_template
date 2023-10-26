# xilinx_fpga_template
Xilinx fpga development environment template for my own projects

# Directory Structure
- rtl: Synthesizable Verilog (SystemVerilog) Modules
- include: Verilog (SystemVerilog) Include Files
- test: Test Vectors
- synthesis: Synthesis Scripts
- util: Some scripts

# Sample project
Sample projects targets the Arty Z7 board which uses Zynq-7000 series FPGA.
The sample design in ./rtl directory is a UART echoback circuit,
which transmits characters from UART-TX received from UART-RX.
UART is operating at baud rate of 115200bps, with no parity.
