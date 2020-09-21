library IEEE;
use IEEE.std_logic_1164.all;

entity ex_7 is
	port(	D_IN:	in	std_logic_vector (2 downto 0);
		SZ_OUT:	out	std_logic_vector (7 downto 0));
end ex_7;

architecture exercise of ex_7 is
begin
	with (D_IN) select
	SZ_OUT <= "11111110" when "000",
		  "11111101" when "001",
		  "11111011" when "010",
		  "11110111" when "011",
		  "11101111" when "100",
		  "11011111" when "101",
		  "10111111" when "110",
		  "01111111" when "111",
		  "11111111" when others;
end exercise;
