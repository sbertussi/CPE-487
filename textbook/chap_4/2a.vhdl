library IEEE;
use IEEE.std_logic_1164.all;

entity ex_2a is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic_vector (0 downto 0));
end ex_2a;

architecture exercise of ex_2a is
	signal A1: std_logic_vector (3 downto 0);
begin
	A1 <= (A & B & C & D);
	with A1 select
		F <= "1" when "0010"|"0011"|"0110"|"1010"|"1011"|"1110",
		     "0" when others;
end exercise;
