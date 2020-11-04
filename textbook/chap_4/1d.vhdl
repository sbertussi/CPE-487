library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1d is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_1d;

--implementing PI(3,2) -> interpreted as 0 for 0010 and 0011
--used a K-map to translate to F = C'+B+AB'
architecture exercise of ex_1d is
	--intermediate signals for each AND in expression; not necessarily needed, but done for clairty in exercise
	signal A1: std_logic;
begin
	A1 <= A AND NOT(B); --AB'
	F <= NOT(C) OR B OR A1; --C'+B+AB'
end exercise;
