library IEEE;
use IEEE.std_logic_1164.all;

entity ex_3 is
	port (X, Y: 	      		    in  std_logic_vector(7 downto 0);
	      LDA, LDB, S1, S0, CLK:        in  std_logic;
	      RB:  	      		    out std_logic_vector(7 downto 0));
end ex_3;

architecture exercise of ex_3 is
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
begin
	mux1: mux_21
	port map ( A => X, B => tempB, SEL => S1, C => C);

	regA: reg
	port map ( A => C, LD => LDA, CLK => CLK, B => D);

	mux2: mux_21
	port map ( A => D, B => Y, SEL => S0, C => E);

	regB: reg
	port map ( A => E, LD => LDB, CLK => CLK, B => tempB);

	RB <= tempB;
end exercise;

