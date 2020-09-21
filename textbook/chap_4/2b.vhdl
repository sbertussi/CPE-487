library IEEE;
use IEEE.std_logic_1164.all;

entity ex_2b is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_2b;

architecture exercise of ex_2b is

begin
	F <= '1' when (A = '0' and B = '0') else
	     '0' when (A = '1' and B = '0') else
	     '1' when (A = '1' and B = '1' and C = '1' and D = '1') else
	     '0' when (A = '1' and B = '1') else
	     '0' when (A = '0' and B = '1' and C = '0' and D = '1') else
	     '1';
end exercise;
