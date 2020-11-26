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

To use my tb files with your VHDL code, open the corresponding tb file. In this walkthrough, the 2_tb.vhdl file will be used.

1. Go to `component ex_2` and change `ex_2` to the name of your VHDL code's entity.
2. Take note of the comments explaining how my compnent's input/output signals are defined. Determine how your signals relate to mine. For the test bench to work properly, it is recommended your inputs and mine take the same form (i.e. your version of `X1` can be named whatever you want, but it should be a `std_logic` for the test bench to work properly with minimal additional work.
3. Change the signals in the `port` section of the component to match yours.
4. Go to the line `exercise: fsm_2 port map (X1 => X1, X2 => X2, CLK => CLK, Y0 => Y0, Y1 => Y1, Z => Z);`
5. Change `ex_2` to your entity's name
6. Change the right hand side of the `=>` to match your signal names. For example, if your entity is `pineapple`, your `X1` is called `A`, your `X2` is called `B`, your `CLK` is called `C`, your `Y0` is called `D`, your `Y1` is called `E`, and your `Z` is called `F`, the line should now read `	exercise: pineapple port map (X1 => A, X2 => B, CLK => C, Y0 => D, Y1 => E, Z => F);`
7. Follow the example shown above for how to run the test bench, but with the first line replaced with your VHDL file name: `ghdl -a <your file>`
