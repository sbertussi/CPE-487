library IEEE;
use IEEE.std_logic_1164.all;

entity ex_5 is
	port(	input: 	in	std_logic_vector (7 downto 0);
		F:	out	std_logic);
end ex_5;

architecture exercise of ex_5 is
begin
	my_proc: process (input)
	begin
		if(input = "00000000") then F <= '0';
		else F <= '1';
		end if;
	end process my_proc;
end exercise;
