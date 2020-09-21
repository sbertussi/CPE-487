library IEEE;
use IEEE.std_logic_1164.all;

entity ex_2_if is
	port(	A_1, A_2, B_1, B_2, D_1: 	in	std_logic;
		E_out:				out	std_logic);
end ex_2_if;

architecture exercise of ex_2_if is
	signal AA: std_logic_vector (1 downto 0);
begin
	AA <= A_1 & A_2;

	my_proc: process (AA, B_1, B_2, D_1)
	begin
		if(AA = "11" OR B_1 = '1' OR B_2 = '1') then E_out <= '1';
		else E_out <= '0';
		end if;
	end process my_proc;
end exercise;

--(A_1)(A_2)+B_1+B_2+(B_2)(D_1)'
--True when: 11XXX XX1XX XXX1X XXX10
