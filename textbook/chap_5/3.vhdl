library IEEE;
use IEEE.std_logic_1164.all;

entity ex_3 is
	port(	A_1, A_2, B_1, B_2, D_1: 	in	std_logic;
		E_out:				out	std_logic);
end ex_3;

architecture exercise of ex_3 is
begin
	E_out <= (A_1 AND A_2) OR (B_1) OR (B_2) OR (B_2 AND NOT(D_1));
end exercise;

--(A_1)(A_2)+B_1+B_2+(B_2)(D_1)'
--True when: 11XXX XX1XX XXX1X XXX10
