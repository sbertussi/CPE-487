# Chapter 5 Solutions
This folder contains my solutions to the exercises at the end of Chapter 5 of *Free Range VHDL*.

Each solution includes the VHDL file that answers a question, a corresponding test bench (tb) file, and the output VCD file that was check with GTKWave.

Using exercise 1a if version as an example, to run the solution:

```
ghdl -a 1a_if.vhdl
ghdl -a 1a_if_tb.vhdl
ghdl -e ex_1a_if_tb
ghdl -r ex_1a_if_tb --vcd=1a_if.vcd
gtkwave 1a_if.vcd
```

To use my tb files with your VHDL code, open the corresponding tb file. In this walkthrough, the 5_tb.vhdl file will be used.

1. Go to `component ex_5` and change `ex_5` to the name of your VHDL code's entity.
2. Take note of the comments explaining how my compnent's input/output signals are defined. Determine how your signals relate to mine. For the test bench to work properly, it is recommended your inputs and mine take the same form (i.e. your version of `input` can be named whatever you want, but it should be a `std_logic_vector (7 downto 0)` for the test bench to work properly with minimal additional work.
3. Change the signals in the `port` section of the component to match yours.
4. Go to the line `exercise: ex_5 port map (input => input, F => F);`
5. Change `ex_5` to your entity's name
6. Change the right hand side of the `=>` to match your signal names. For example, if your entity is `pineapple`, your `input` is called `A` and your `F` is called `B`, the line should now read `exercise: pineapple port map (input => A, F => B);`
7. Follow the example shown above for how to run the test bench, but with the first line replaced with your VHDL file name: `ghdl -a <your file>`

Note: For solutions that have very long VCD files, the view can be limited from 0 ns to 300 ns to see all cases.
