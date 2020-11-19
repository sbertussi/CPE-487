library IEEE;
use IEEE.std_logic_1164.all;

entity ex_5 is
	port(	input: 	in	std_logic_vector (7 downto 0); --8 signals going into the OR gate
		F:	out	std_logic); --output of the OR gate
end ex_5;

architecture exercise of ex_5 is
begin
	my_proc: process (input)
	begin
		--OR gates only return FALSE if all input signals are FALSE
		--therefore, the 8-input OR gate is only false if a string of eight 0s is inputted
		if(input = "00000000") then F <= '0';
		else F <= '1';
		end if;
	end process my_proc;
end exercise;
