library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1a is
	port(	A, B: 	in	std_logic;
		F:	out	std_logic);
end ex_1a;

architecture exercise of ex_1a is
	signal A1, A2: std_logic;
begin
	A1 <= NOT(A) AND B;
	A2 <= A AND NOT(B);
	F <= A1 OR A OR A2;
end exercise;
