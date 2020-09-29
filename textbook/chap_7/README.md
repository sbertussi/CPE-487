# Chapter 7 Solutions
This folder contains my solutions to the exercises at the end of Chapter 7 of *Free Range VHDL*.

Each solution includes the VHDL file that answers a question, a corresponding test bench (tb) file, and the output VCD file that was check with GTKWave.

Using exercise 1 as an example, to run the solution:

```
ghdl -a 1.vhdl
ghdl -a 1_tb.vhdl
ghdl -e ex_1_tb
ghdl -r ex_1_tb --vcd=1.vcd
gtkwave 1.vcd
```

Note: Exercise 6 is a repeat of Exercise 5 without the last sentence.  As such, no code was generated for Exercise 6.
