library IEEE;
use IEEE.std_logic_1164.all;

entity ex_3_c is
	port(A, B, C: in  std_logic;
	     F:	      out std_logic);
end ex_3_c;

architecture exercise of ex_3_c is

	component my_and
		port(A, B: in  std_logic;
		     C:    out std_logic);
	end component;

	component my_or
		port(A, B: in  std_logic;
		     C:    out std_logic);
	end component;

	signal notB, notC, D, E: std_logic;
begin

	notB <= NOT B;
	notC <= NOT C;

	and1: my_and
	port map (A => A, B => C, C => D);

	and2: my_and
	port map (A => notC, B => notB, C => E);

	or1: my_or
	port map (A => D, B => E, C => F);

end exercise;
