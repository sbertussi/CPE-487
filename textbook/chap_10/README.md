# Chapter 10 Solutions
This folder contains my solutions to the exercises at the end of Chapter 10 of *Free Range VHDL*.

Each solution includes the VHDL file that answers a question, a corresponding test bench (tb) file, and the output VCD file that was check with GTKWave.

Due to the nature of this assignment, I also created a file ```components.vhdl``` to hold all the circuit elements I was modeling.  This file will need to be compiled with the other solution files for the solution to run.

Using exercise 1 as an example, to run the solution:

```
ghdl -a 1.vhdl
ghdl -a 1_tb.vhdl
ghdl -a components.vhdl
ghdl -e ex_1_tb
ghdl -r ex_1_tb --vcd=1.vcd
gtkwave 1.vcd
```

Note that the test benches for these problems do not show all possible use cases for the circuit due to their complexity.  Rather, the test benches demonstrate that all "wiring" between the components was done correctly.  Components were tested in exercises for previous chapters' problems, so extensive testing was not required for them.
