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

To use my tb files with your VHDL code, open the corresponding tb file. In this walkthrough, the 7_tb.vhdl file will be used.

1. Go to `component ex_7` and change `ex_7` to the name of your VHDL code's entity.
2. Take note of the comments explaining how my compnent's input/output signals are defined. Determine how your signals relate to mine. For the test bench to work properly, it is recommended your inputs and mine take the same form (i.e. your version of `D_IN` can be named whatever you want, but it should be a `std_logic_vector (2 downto 0)` for the test bench to work properly with minimal additional work.
3. Change the signals in the `port` section of the component to match yours.
4. Go to the line `exercise: ex_7 port map (D_IN => D_IN, SZ_OUT => SZ_OUT);`
5. Change `ex_7` to your entity's name
6. Change the right hand side of the `=>` to match your signal names. For example, if your entity is `pineapple`, your `D_IN` is called `A` and your `SZ_OUT` is called `B`, the line should now read `exercise: pineapple port map (D_IN => A, SZ_OUT => B);`
7. Follow the example shown above for how to run the test bench, but with the first line replaced with your VHDL file name: `ghdl -a <your file>`

Note: For solutions that have very long VCD files, the view can be limited from 0 ns to 300 ns to see all cases.
