library IEEE;
use IEEE.std_logic_1164.all;

entity ex_3 is
	--signals as defined in problem statement
	port(	A_1, A_2, B_1, B_2, D_1: 	in	std_logic;
		E_out:				out	std_logic);
end ex_3;

architecture exercise of ex_3 is
begin
	--alternate implementation of problem 2 using concurrent signal assignment
	E_out <= (A_1 AND A_2) OR (B_1) OR (B_2) OR (B_2 AND NOT(D_1));
end exercise;

--evaluating shown circuit for true conditions

--E+out = (A_1)(A_2)+B_1+B_2+(B_2)(D_1)'
--True when: 11XXX XX1XX XXX1X XXX10
--taking vector of form: A_1 A_2 B_1 B_2 D_1 with X = don't care
