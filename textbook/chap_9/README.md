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

To use my tb files with your VHDL code, open the corresponding tb file. In this walkthrough, the 3_a_tb.vhdl file will be used.

1. Go to `component ex_3_a` and change `ex_3_a` to the name of your VHDL code's entity.
2. Take note of the comments explaining how my compnent's input/output signals are defined. Determine how your signals relate to mine. For the test bench to work properly, it is recommended your inputs and mine take the same form (i.e. your version of `A` can be named whatever you want, but it should be a `std_logic` for the test bench to work properly with minimal additional work.
3. Change the signals in the `port` section of the component to match yours.
4. Go to the line `exercise: ex_3_a port map (A=>A, B=>B, C=>C, F=>F);`
5. Change `ex_3_a` to your entity's name
6. Change the right hand side of the `=>` to match your signal names. For example, if your entity is `pineapple`, your `A` is called `Z`, your `B` is called `Y`, your `C` is called `X`, and your `F` is called `W`, the line should now read `exercise: pineapple port map (A=>Z, B=>Y, C=>X, F=>W);`
7. Follow the example shown above for how to run the test bench, but with the first line replaced with your VHDL file name: `ghdl -a <your file>`

Note: Some questions did not require coding.  These solutions can be found in the `Chapter 9 Written Solutions` file.
