library IEEE;
use IEEE.std_logic_1164.all;

--signals as defined in textbook illustration
entity ex_5 is
	port (A, B, C: 	      	    in  std_logic_vector(7 downto 0);
	      SL1, SL2, CLK:        in  std_logic;
	      RAX, RBX:  	    out std_logic_vector(7 downto 0));
end ex_5;

architecture exercise of ex_5 is
	--component code can be found in the file components.vhdl
	component mux_21
		port (A, B: in  std_logic_vector(7 downto 0);
	      	      SEL:  in  std_logic;
	      	      C:    out std_logic_vector(7 downto 0));
	end component;

	component reg
		port (A:        in  std_logic_vector(7 downto 0);
	              LD, CLK:  in  std_logic;
	              B:        out std_logic_vector(7 downto 0));
	end component;

	component decode_12
		port (A:        in  std_logic;
	      	      B:        out std_logic_vector(1 downto 0));
	end component;

	signal E: std_logic_vector(1 downto 0); --E is the output signals from the 1:2 decoder
	signal D: std_logic_vector(7 downto 0); --D is the output signal from the 2:1 MUX
begin
	--1:2 Decoder
	decode1: decode_12
	port map ( A => SL1, B => E);

	--2:1 MUX
	mux1: mux_21
	port map ( A => B, B => C, SEL => SL2, C => D);

	--REGA
	regA: reg
	port map ( A => A, LD => E(1), CLK => CLK, B => RAX);

	--REGB
	regB: reg
	port map ( A => D, LD => E(0), CLK => CLK, B => RBX);
end exercise;

