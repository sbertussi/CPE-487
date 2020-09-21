library IEEE;
use IEEE.std_logic_1164.all;

entity ex_4 is
	port(	input: 	in	std_logic_vector (7 downto 0);
		F:	out	std_logic);
end ex_4;

architecture exercise of ex_4 is
begin
	my_proc: process (input)
	begin
		if(input = "11111111") then F <= '1';
		else F <= '0';
		end if;
	end process my_proc;
end exercise;
