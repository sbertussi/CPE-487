library IEEE;
use IEEE.std_logic_1164.all;

entity ex_2c is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_2c;

--implement PI(3, 2) => interpreted as 0 for 0010 0011
architecture exercise of ex_2c is
begin
	--simply checks if the four signals match one of the two 0 criteria, otherwise outputs 1
	F <= '0' when (A = '0' and B = '0' and C = '1' and D = '0') else
	     '0' when (A = '0' and B = '0' and C = '1' and D = '1') else
	     '1';
end exercise;
