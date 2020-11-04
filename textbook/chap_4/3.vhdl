library IEEE;
use IEEE.std_logic_1164.all;

entity ex_3 is
	port(	input: 	in	std_logic_vector (7 downto 0); --bundled 8 inputs
		F:	out	std_logic_vector (0 downto 0)); --output true/false signal
end ex_3;

--implement an 8-input AND gate
--since there was minimal direction, I assumed the eight inputs were bundled and therefore an input of 11111111 would be the only condition that the gate would output TRUE
architecture exercise of ex_3 is
begin
	with(input) select
	F <= "1" when "11111111",
	     "0" when others;
end exercise;
