library IEEE;
use IEEE.std_logic_1164.all;

entity ex_4 is
	port(	input: 	in	std_logic_vector (7 downto 0); --input as an 8-bit bundle
		F:	out	std_logic_vector (0 downto 0)); --output true/false
end ex_4;

--implement 8-input OR gate
--since minimal direction was provided, assumed the input was a bundle and that the only false condition would be when all 8 were zero: 00000000
architecture exercise of ex_4 is
begin
	with (input) select
	F <= "0" when "00000000",
	     "1" when others;
end exercise;
