library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1d is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_1d;

architecture exercise of ex_1d is
	signal A1: std_logic;
begin
	A1 <= A AND NOT(B);
	F <= NOT(C) OR B OR A1;
end exercise;
