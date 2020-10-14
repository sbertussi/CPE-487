# Chapter 9 Solutions
This folder contains my solutions to the exercises at the end of Chapter 9 of *Free Range VHDL*.

Each solution includes the VHDL file that answers a question, a corresponding test bench (tb) file, and the output VCD file that was check with GTKWave.

Due to the nature of this assignment, I also created a file ```components.vhdl``` to hold all the circuit elements I was modeling.  This file will need to be compiled with the other solution files for the solution to run.

Using exercise 3a as an example, to run the solution:

```
ghdl -a 3_a.vhdl
ghdl -a 3_a_tb.vhdl
ghdl -a components.vhdl
ghdl -e ex_3_a_tb
ghdl -r ex_3_a_tb --vcd=3_a.vcd
gtkwave 3_a.vcd
```
