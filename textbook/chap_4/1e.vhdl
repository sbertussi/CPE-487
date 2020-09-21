library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1e is
	port(	A, B, C: 	in	std_logic;
		F:		out	std_logic);
end ex_1e;

architecture exercise of ex_1e is
	signal A1, A2: std_logic;
begin
	A1 <= NOT(A) AND NOT(C);
	A2 <= A AND B;
	F <= A1 OR A2;
end exercise;
