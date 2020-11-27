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

To use my tb files with your VHDL code, open the corresponding tb file. In this walkthrough, the 1_tb.vhdl file will be used.

1. Go to `component ex_1` and change `ex_1` to the name of your VHDL code's entity.
2. Take note of the comments explaining how my compnent's input/output signals are defined. Determine how your signals relate to mine. For the test bench to work properly, it is recommended your inputs and mine take the same form (i.e. your version of `A` can be named whatever you want, but it should be a `std_logic_vector(7 downto 0)` for the test bench to work properly with minimal additional work.
3. Change the signals in the `port` section of the component to match yours.
4. Go to the line `exercise: ex_1 port map (A=>A, B=>B, SEL=>SEL, CLK=>CLK, LDA=>LDA, F=>F);`
5. Change `ex_1` to your entity's name
6. Change the right hand side of the `=>` to match your signal names. For example, if your entity is `pineapple`, your `A` is called `Z`, your `B` is called `Y`, your `SEL` is called `X`, your `CLK` is called `W`, your `LDA` is called `V`, and your `F` is called `U`, the line should now read `exercise: pineapple port map (A=>Z, B=>Y, SEL=>X, CLK=>W, LDA=>V, F=>U);`
7. Follow the example shown above for how to run the test bench, but with the first line replaced with your VHDL file name: `ghdl -a <your file>`

Note that the test benches for these problems do not show all possible use cases for the circuit due to their complexity.  Rather, the test benches demonstrate that all "wiring" between the components was done correctly.  Components were tested in exercises for previous chapters' problems, so extensive testing was not required for them.
