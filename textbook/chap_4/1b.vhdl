library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1b is
	--in/out defined as in textbook
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_1b;

--implementing A'CD'+B'C+BCD'
architecture exercise of ex_1b is
	--intermediate signals for each AND in expression; not necessarily needed, but done for clairty in exercise
	signal A1, A2, A3: std_logic;
begin
	A1 <= NOT(A) AND C AND NOT(D); --A'CD'
	A2 <= NOT(B) AND C; --B'C
	A3 <= B AND C AND NOT(D); --BCD'
	F <= A1 OR A2 OR A3; --A'CD'+B'C+BCD'
end exercise;
