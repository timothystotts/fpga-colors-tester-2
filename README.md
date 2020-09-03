# fpga-colors-tester-2

FPGA Colors Palette Tester Version 2
by Timothy Stotts


## Description
A small FPGA project of Xilinx IPI-BD with Zynq-7000 APSoC implementations for testing
24-bit color palette mixing of discrete RGB LEDs versus 16-bit color palette mixing of
a 96x64 OLEDrgb display's text.
The design targets the Digilent Inc. Zybo-Z7-20 FPGA development board containing a
Xilinx Zynq-7000 APSoC.
Two peripherals are used: Digilent Inc. Pmod KYPD, Digilent Inc. Pmod OLEDrgb.

The folder Color-Tester-Design-Zynq contains a Xilinx Vivado IP Integrator plus
Xilinx SDK design. The ARM hard processor is used to talk with board components,
a 4x4 alphanumeric keypad,
and 96x64 pixel color display, each through the FPGA fabric of the APSoC.
A Xilinx SDK project contains a very small Standalone program in C; drivers
for the peripherals; and a main loop to repeatedly read keypad entry and then update both
discrete LEDs and display.


### Project information document:

[FPGA Colors Palette Tester info](https://github.com/timothystotts/fpga-colors-tester-2/blob/master/Colors%20Palette%20Tester%20-%20Zynq.pdf)

### Target device assembly: Zybo-Z7-20 with Pmod KYPD, Pmod OLEDrgb, on extension cables
![Target device assembly](https://github.com/timothystotts/fpga-colors-tester-2/blob/master/Color-Tester-Design-Documents/img_color-palette-tester-zynq-assembled-20200902_130951746.jpg)

### Target device execution example: Zybo-Z7-20 with Pmod KYPD, Pmod OLEDrgb, on extension cables
![Target device execution example](https://github.com/timothystotts/fpga-colors-tester-2/blob/master/Color-Tester-Design-Documents/img_color-palette-tester-zynq-executing-a-20200902_130933775.jpg)
