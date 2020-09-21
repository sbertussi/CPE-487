library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1f is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_1f;

architecture exercise of ex_1f is
	signal A1, A2: std_logic;
begin
	A1 <= NOT(A) AND NOT(B) AND NOT(C) AND D;
	A2 <= NOT(A) AND NOT(B) AND C AND NOT(D);
	F <= A1 OR A2;
end exercise;
