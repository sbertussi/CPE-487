library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1f is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_1f;

--implementing SIGMA(1,2) -> interpreted as 1 for 0001 0010
--F = A'B'C'D+A'B'CD'
architecture exercise of ex_1f is
	--intermediate signals for each AND in expression; not necessarily needed, but done for clairty in exercise
	signal A1, A2: std_logic;
begin
	A1 <= NOT(A) AND NOT(B) AND NOT(C) AND D; --A'B'C'D
	A2 <= NOT(A) AND NOT(B) AND C AND NOT(D); --A'B'CD'
	F <= A1 OR A2; --A'B'C'D+A'B'CD'
end exercise;
