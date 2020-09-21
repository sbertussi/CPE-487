library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1b is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_1b;

architecture exercise of ex_1b is
	signal A1, A2, A3: std_logic;
begin
	A1 <= NOT(A) AND C AND NOT(D);
	A2 <= NOT(B) AND C;
	A3 <= B AND C AND NOT(D);
	F <= A1 OR A2 OR A3;
end exercise;
