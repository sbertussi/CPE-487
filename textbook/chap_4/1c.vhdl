library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1c is
	--in/out ports defined as in textbook
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_1c;

--implementing (A'+B)(B'+C+D')(A'+D)
architecture exercise of ex_1c is
	--intermediate signals for each OR in expression; not necessarily needed, but done for clairty in exercise
	signal A1, A2, A3: std_logic;
begin
	A1 <= NOT(A) OR B; --A'+B
	A2 <= NOT(B) OR C OR NOT(D); --B'+C+D
	A3 <= NOT(A) OR D; --A'+D
	F <= A1 AND A2 AND A3; --(A'+B)(B'+C+D')(A'+D)
end exercise;
