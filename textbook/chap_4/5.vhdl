library IEEE;
use IEEE.std_logic_1164.all;

entity ex_5 is
	port(	D7, D6, D5, D4, D3, D2, D1, D0:	in	std_logic_vector (7 downto 0);
		SEL:				in	std_logic_vector (2 downto 0);
		F:	out	std_logic_vector (7 downto 0));
end ex_5;

architecture exercise of ex_5 is
begin
	with (SEL) select
	F <= D7 when "111",
	     D6 when "110",
	     D5 when "101",
	     D4 when "100",
	     D3 when "011",
	     D2 when "010",
	     D1 when "001",
	     D0 when "000",
	     "00000000" when others;
end exercise;
