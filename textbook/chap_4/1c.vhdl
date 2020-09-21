library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1c is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_1c;

architecture exercise of ex_1c is
	signal A1, A2, A3: std_logic;
begin
	A1 <= NOT(A) OR B;
	A2 <= NOT(B) OR C OR NOT(D);
	A3 <= NOT(A) OR D;
	F <= A1 AND A2 AND A3;
end exercise;
