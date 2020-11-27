library IEEE;
use IEEE.std_logic_1164.all;

--signals as defined in textbook illustration
entity ex_2 is
	port (X, Y, Z: 	      in  std_logic_vector(7 downto 0);
	      DS, CLK:        in  std_logic;
	      MS:	      in  std_logic_vector(1 downto 0);
	      RA, RB:  	      out std_logic_vector(7 downto 0));
end ex_2;

architecture exercise of ex_2 is
	--component code can be found in the file components.vhdl
	component mux_41
		port (A, B, C, D: in  std_logic_vector(7 downto 0);
	      	      SEL:        in  std_logic_vector(1 downto 0);
	      	      E:          out std_logic_vector(7 downto 0));
	end component;

	component not_reg
		port (A:        in  std_logic_vector(7 downto 0);
	              LD, CLK:  in  std_logic;
	              B:        out std_logic_vector(7 downto 0));
	end component;

	component decode_12
		port (A:        in  std_logic;
	      	      B:        out std_logic_vector(1 downto 0));
	end component;

	signal D:               std_logic_vector(1 downto 0); --D is the output from 1:2 Decoder
	signal tempB, C, tempA: std_logic_vector(7 downto 0);
	--tempA holds the value for RA and allows it to be fed int RB
	--tempB holds the value for RB and allows it to be fed back to 4:1 MUX
	--C is the output from the 4:1 MUX

begin
	--1:2 decoder
	decode1: decode_12
	port map ( A => DS, B => D);

	--4:1 MUX
	mux1: mux_41
	port map ( A => X, B => Y, C => Z, D => tempB, SEL => MS, E => C);

	--RA
	regA: not_reg
	port map ( A => C, LD => D(0), CLK => CLK, B => tempA);

	--RB
	regB: not_reg
	port map ( A => tempA, LD => D(1), CLK => CLK, B => tempB);

	--move temps to output signals
	RA <= tempA;
	RB <= tempB;
end exercise;

