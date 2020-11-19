library IEEE;
use IEEE.std_logic_1164.all;

entity ex_4 is
	port(	input: 	in	std_logic_vector (7 downto 0); --8 signals going into the AND gate
		F:	out	std_logic); --output of the AND gate
end ex_4;

architecture exercise of ex_4 is
begin
	my_proc: process (input)
	begin
		--since for an AND gate to return TRUE, all inputs must be TRUE,
		--the 8-input AND gate only outputs TRUE when a string of eight 1s is inputed
		if(input = "11111111") then F <= '1';
		else F <= '0';
		end if;
	end process my_proc;
end exercise;
