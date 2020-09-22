library IEEE;
use IEEE.std_logic_1164.all;

entity ex_6_case is
	port(	D7, D6, D5, D4, D3, D2, D1, D0:	in	std_logic_vector (7 downto 0);
		SEL:				in	std_logic_vector (2 downto 0);
		F:	out	std_logic_vector (7 downto 0));
end ex_6_case;

architecture exercise of ex_6_case is
begin

	my_proc: process (SEL)
	begin
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
