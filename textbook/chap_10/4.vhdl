library IEEE;
use IEEE.std_logic_1164.all;

entity ex_4 is
	port (X, Y: 	      			in  std_logic_vector(7 downto 0);
	      LDA, LDB, S0, S1, RD, CLK:        in  std_logic;
	      RA, RB:  	      		        out std_logic_vector(7 downto 0));
end ex_4;

architecture exercise of ex_4 is
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

begin
	mux1: mux_21
	port map ( A => X, B => Y, SEL => S1, C => D);

	mux2: mux_21
	port map ( A => tempB, B => Y, SEL => S0, C => E);

	regA: not_reg
	port map ( A => E, LD => tempLDA, CLK => CLK, B => tempA);

	regB: not_reg
	port map ( A => D, LD => tempLDB, CLK => CLK, B => tempB);

	tempLDA <= LDA AND RD;
	tempLDB <= LDB AND NOT(RD);

	RA <= tempA;
	RB <= tempB;
end exercise;

