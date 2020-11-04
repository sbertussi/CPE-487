library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1e is
	port(	A, B, C: 	in	std_logic;
		F:		out	std_logic);
end ex_1e;

--implementing PI(5, 1, 4, 3) -> interpreted as 0 for 001 011 100 101
--used K-map to derive F = A'C'+AB
architecture exercise of ex_1e is
	--intermediate signals for each AND in expression; not necessarily needed, but done for clairty in exercise
	signal A1, A2: std_logic;
begin
	A1 <= NOT(A) AND NOT(C); --A'C'
	A2 <= A AND B; --AB
	F <= A1 OR A2; --A'C'+AB
end exercise;
