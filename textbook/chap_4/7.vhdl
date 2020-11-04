library IEEE;
use IEEE.std_logic_1164.all;

entity ex_7 is
	port(	D_IN:	in	std_logic_vector (2 downto 0); --3-bit input to decoder
		SZ_OUT:	out	std_logic_vector (7 downto 0)); --8-bit output of decoder
end ex_7;

--implement 3:8 decoder
architecture exercise of ex_7 is
begin
	--outputs were active-low, so 000 => 11111110
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
