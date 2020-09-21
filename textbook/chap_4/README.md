# Chapter 4 Solutions
This folder contains my solutions to the exercises at the end of Chapter 4 of *Free Range VHDL*.

Each solution includes the VHDL file that answers a question, a corresponding test bench (tb) file, and the output VCD file that was check with GTKWave.

Using exercise 1a as an example, to run the solution:

```
ghdl -a 1a.vhdl
ghdl -a 1a_tb.vhdl
ghdl -e ex_1a_tb
ghdl -r ex_1a_tb --vcd=1a.vcd
gtkwave 1a.vcd
```

Note: For solutions that have very long VCD files, the view can be limited from 0 ns to 300 ns to see all cases.
