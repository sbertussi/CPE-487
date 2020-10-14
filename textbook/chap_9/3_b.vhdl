library IEEE;
use IEEE.std_logic_1164.all;

entity ex_3_b is
	port(A, B, C: in  std_logic;
	     F:	      out std_logic);
end ex_3_b;

architecture exercise of ex_3_b is
	component my_decode_3_8
		port(A, B, C: in  std_logic;
		     D:       out std_logic_vector(7 downto 0));
	end component;

	component my_4_or
		port(A, B, C, D: in  std_logic;
		     E:          out std_logic);
	end component;

	signal D: std_logic_vector(7 downto 0);
begin
	decode1: my_decode_3_8
	port map (A => A, B => B, C => C, D => D);

	fourOr1: my_4_or
	port map (A => D(0), B => D(1), C => D(3), D => D(4), E => F);

end exercise;
