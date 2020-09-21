library IEEE;
use IEEE.std_logic_1164.all;

entity ex_4 is
	port(	input: 	in	std_logic_vector (7 downto 0);
		F:	out	std_logic_vector (0 downto 0));
end ex_4;

architecture exercise of ex_4 is
begin
	with (input) select
	F <= "0" when "00000000",
	     "1" when others;
end exercise;
