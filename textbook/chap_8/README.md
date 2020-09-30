# Chapter 8 Solutions
This folder contains my solutions to the exercises at the end of Chapter 8 of *Free Range VHDL*.

Each solution includes the VHDL file that answers a question, a corresponding test bench (tb) file, and the output VCD file that was check with GTKWave.

Using exercise 2 as an example, to run the solution:

```
ghdl -a 2.vhdl
ghdl -a 2_tb.vhdl
ghdl -e ex_2_tb
ghdl -r ex_2_tb --vcd=2.vcd
gtkwave 2.vcd
```
