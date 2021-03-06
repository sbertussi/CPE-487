library IEEE;
use IEEE.std_logic_1164.all;

--signals as defined in textbook illustration
entity ex_6 is
	port (A, B, C: 	      	    in  std_logic_vector(7 downto 0);
	      SEL1, SEL2, CLK:      in  std_logic;
	      RAP, RBP:  	    out std_logic_vector(7 downto 0));
end ex_6;

architecture exercise of ex_6 is
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

	signal D: std_logic_vector(7 downto 0); --D is the output from the 2:1 MUX
	signal E: std_logic_vector(1 downto 0); --E is the output from the 1:2 Decoder

begin
	--2:1 MUX
	mux1: mux_21
	port map ( A => A, B => B, SEL => SEL1, C => D);

	--1:2 Decoder
	decode1: decode_12
	port map ( A => SEL2, B => E);

	--REGA
	regA: reg
	port map ( A => D, LD => E(1), CLK => CLK, B => RAP);

	--REGB
	regB: reg
	port map ( A => C, LD => E(0), CLK => CLK, B => RBP);
end exercise;

