library IEEE;
use IEEE.std_logic_1164.all;

entity ex_2 is
	port (X, Y, Z: 	      in  std_logic_vector(7 downto 0);
	      DS, CLK:        in  std_logic;
	      MS:	      in  std_logic_vector(1 downto 0);
	      RA, RB:  	      out std_logic_vector(7 downto 0));
end ex_2;

architecture exercise of ex_2 is
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

	signal D:               std_logic_vector(1 downto 0);
	signal tempB, C, tempA: std_logic_vector(7 downto 0);
begin
	decode1: decode_12
	port map ( A => DS, B => D);

	mux1: mux_41
	port map ( A => X, B => Y, C => Z, D => tempB, SEL => MS, E => C);

	regA: not_reg
	port map ( A => C, LD => D(0), CLK => CLK, B => tempA);

	regB: not_reg
	port map ( A => tempA, LD => D(1), CLK => CLK, B => tempB);

	RA <= tempA;
	RB <= tempB;
end exercise;

