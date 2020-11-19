library IEEE;
use IEEE.std_logic_1164.all;

entity ex_6_if is
	port(	D7, D6, D5, D4, D3, D2, D1, D0:	in	std_logic_vector (7 downto 0); --8 possible signals for MUX to select; they were set as 8-bit to allow for debugging
		SEL:				in	std_logic_vector (2 downto 0); --3 bit selection signal
		F:	out	std_logic_vector (7 downto 0)); --output of MUX
end ex_6_if;

--implement 8:1 MUX
--used selection model where the base 10 value of the 3-bit SEL signal is the output (i.e. 111 => 7 => D7 is output)
architecture exercise of ex_6_if is
begin

	my_proc: process (SEL)
	begin
		--uses IF conditions on SEL
		if(SEL = "111") then F <= D7;
		elsif(SEL = "110") then F <= D6;
		elsif(SEL = "101") then F <= D5;
		elsif(SEL = "100") then F <= D4;
		elsif(SEL = "011") then F <= D3;
		elsif(SEL = "010") then F <= D2;
		elsif(SEL = "001") then F <= D1;
		elsif(SEL = "000") then F <= D0;
		else F <= "00000000";
		end if;
	end process my_proc;
end exercise;
