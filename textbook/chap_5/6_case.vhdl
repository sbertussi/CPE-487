library IEEE;
use IEEE.std_logic_1164.all;

entity ex_6_case is
	port(	D7, D6, D5, D4, D3, D2, D1, D0:	in	std_logic_vector (7 downto 0); --8 possible signals for MUX to select; they were set as 8-bit to allow for debugging
		SEL:				in	std_logic_vector (2 downto 0); --3 bit selection signal
		F:	out	std_logic_vector (7 downto 0)); --output of MUX
end ex_6_case;

--implement 8:1 MUX
--used selection model where the base 10 value of the 3-bit SEL signal is the output (i.e. 111 => 7 => D7 is output)
architecture exercise of ex_6_case is
begin

	my_proc: process (SEL)
	begin
		--uses CASE conditions on SEL
		case (SEL) is
			when "111"   => F <= D7;
			when "110"   => F <= D6;
			when "101"   => F <= D5;
			when "100"   => F <= D4;
			when "011"   => F <= D3;
			when "010"   => F <= D2;
			when "001"   => F <= D1;
			when "000"   => F <= D0;
			when others => F <= "00000000";
		end case;
	end process my_proc;
end exercise;
