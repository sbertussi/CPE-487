library IEEE;
use IEEE.std_logic_1164.all;

--signals as defined in textbook illustration
entity ex_4 is
	port (X, Y: 	      			in  std_logic_vector(7 downto 0);
	      LDA, LDB, S0, S1, RD, CLK:        in  std_logic;
	      RA, RB:  	      		        out std_logic_vector(7 downto 0));
end ex_4;

architecture exercise of ex_4 is
	--component code can be found in the file components.vhdl
	component mux_21
		port (A, B: in  std_logic_vector(7 downto 0);
	      	      SEL:  in  std_logic;
	      	      C:    out std_logic_vector(7 downto 0));
	end component;

	component not_reg
		port (A:        in  std_logic_vector(7 downto 0);
	              LD, CLK:  in  std_logic;
	              B:        out std_logic_vector(7 downto 0));
	end component;

	signal tempA, tempB, D, E: std_logic_vector(7 downto 0);
	signal tempLDA, tempLDB: std_logic;
	--tempA holds the output RA
	--tempB holds the output RB and allows it to be fed back to the lower 2:1 MUX
	--D is the signal between the upper 2:1 MUX and REGB
	--E is the signal between the lower 2:1 MUX and REGA
	--tempLDA holds the LD signal for REGA
	--tempLDB holds the LD signal for REGB

begin
	--upper 2:1 MUX
	mux1: mux_21
	port map ( A => X, B => Y, SEL => S1, C => D);

	--lower 2:1 MUX
	mux2: mux_21
	port map ( A => tempB, B => Y, SEL => S0, C => E);

	--REGA
	regA: not_reg
	port map ( A => E, LD => tempLDA, CLK => CLK, B => tempA);

	--REGB
	regB: not_reg
	port map ( A => D, LD => tempLDB, CLK => CLK, B => tempB);

	tempLDA <= LDA AND RD; --define load signal for REGA as LDA*RD
	tempLDB <= LDB AND NOT(RD); --define load signal for REGB as LDB*(RD)'

	--moves temps to output signals
	RA <= tempA;
	RB <= tempB;
end exercise;

