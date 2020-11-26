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

To use my tb files with your VHDL code, open the corresponding tb file. In this walkthrough, the 1_tb.vhdl file will be used.

1. Go to `component ex_1` and change `ex_1` to the name of your VHDL code's entity.
2. Take note of the comments explaining how my compnent's input/output signals are defined. Determine how your signals relate to mine. For the test bench to work properly, it is recommended your inputs and mine take the same form (i.e. your version of `S` can be named whatever you want, but it should be a `std_logic` for the test bench to work properly with minimal additional work.
3. Change the signals in the `port` section of the component to match yours.
4. Go to the line `exercise: ex_1 port map (S => S, D => D, CLK => CLK, R => R, Q => Q, Q_N => Q_N);`
5. Change `ex_1` to your entity's name
6. Change the right hand side of the `=>` to match your signal names. For example, if your entity is `pineapple`, your `S` is called `A`, your `D` is called `B`, your `CLK` is called `C`, your `R` is called `D`, your `Q` is called `E`, and your `Q_N` is called `F`, the line should now read `	exercise: ex_1 port map (S => A, D => B, CLK => C, R => D, Q => E, Q_N => F);`
7. Follow the example shown above for how to run the test bench, but with the first line replaced with your VHDL file name: `ghdl -a <your file>`

Note: Exercise 6 is a repeat of Exercise 5 without the last sentence.  As such, no code was generated for Exercise 6.
