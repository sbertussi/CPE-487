library IEEE;
use IEEE.std_logic_1164.all;

entity ex_3_d is
	port(A, B, C: in  std_logic;
	     F:	      out std_logic);
end ex_3_d;

architecture exercise of ex_3_d is

	component my_nand
		port(A, B: in  std_logic;
		     C:    out std_logic);
	end component;

	component my_nnor
		port(A, B: in  std_logic;
		     C:    out std_logic);
	end component;

	signal notA, notC, D, E: std_logic;
begin

	notA <= NOT A;
	notC <= NOT C;

	nand1: my_nand
	port map (A => notA, B => notC, C => D);

	nand2: my_nand
	port map (A => A, B => B, C => E);

	nnor1: my_nnor
	port map (A => D, B => E, C => F);

end exercise;
