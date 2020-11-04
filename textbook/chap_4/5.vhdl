library IEEE;
use IEEE.std_logic_1164.all;

entity ex_5 is
	port(	D7, D6, D5, D4, D3, D2, D1, D0:	in	std_logic_vector (7 downto 0); --8 possible signals for MUX to select; they were set as 8-bit to allow for debugging
		SEL:				in	std_logic_vector (2 downto 0); --3 bit selection signal
		F:	out	std_logic_vector (7 downto 0)); --output of MUX
end ex_5;

--implement 8:1 MUX
--used selection model where the base 10 value of the 3-bit SEL signal (i.e. 111 => 7 => D7 is output)
architecture exercise of ex_5 is
begin
	with (SEL) select
	F <= D7 when "111",
	     D6 when "110",
	     D5 when "101",
	     D4 when "100",
	     D3 when "011",
	     D2 when "010",
	     D1 when "001",
	     D0 when "000",
	     "00000000" when others;
end exercise;
