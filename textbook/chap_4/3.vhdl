library IEEE;
use IEEE.std_logic_1164.all;

entity ex_3 is
	port(	input: 	in	std_logic_vector (7 downto 0);
		F:	out	std_logic_vector (0 downto 0));
end ex_3;

architecture exercise of ex_3 is
begin
	with(input) select
	F <= "1" when "11111111",
	     "0" when others;
end exercise;
