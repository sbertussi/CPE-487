library IEEE;
use IEEE.std_logic_1164.all;

--signals as defined in textbook illustration
entity ex_3 is
	port (X, Y: 	      		    in  std_logic_vector(7 downto 0);
	      LDA, LDB, S1, S0, CLK:        in  std_logic;
	      RB:  	      		    out std_logic_vector(7 downto 0));
end ex_3;

architecture exercise of ex_3 is
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

	signal tempB, C, D, E: std_logic_vector(7 downto 0);
	--tempB holds the RB output and allows it to be fed back to the 2:1 MUX on the left
	--C is the signal between the left 2:1 MUX and REGA
	--D is the output of REGA going into the right 2:1 MUX
	--E is the output of the right 2:1 MUX going into REGB
begin
	--left 2:1 MUX
	mux1: mux_21
	port map ( A => X, B => tempB, SEL => S1, C => C);

	--REGA
	regA: reg
	port map ( A => C, LD => LDA, CLK => CLK, B => D);

	--right 2:1 MUX
	mux2: mux_21
	port map ( A => D, B => Y, SEL => S0, C => E);

	--REGB
	regB: reg
	port map ( A => E, LD => LDB, CLK => CLK, B => tempB);

	--move temp to output
	RB <= tempB;
end exercise;

