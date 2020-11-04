library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1a is
	--in/out ports defined as in expression in textbook
	port(	A, B: 	in	std_logic;
		F:	out	std_logic);
end ex_1a;

--implementing A'B+A+AB'
architecture exercise of ex_1a is
	--intermediate signals for each AND in expression; not necessarily needed, but done for clairty in exercise
	signal A1, A2: std_logic;
begin
	A1 <= NOT(A) AND B; --A'B
	A2 <= A AND NOT(B); --AB'
	F <= A1 OR A OR A2; --A'B + A + AB'
end exercise;
