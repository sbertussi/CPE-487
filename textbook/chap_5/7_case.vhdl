library IEEE;
use IEEE.std_logic_1164.all;

entity ex_7_case is
	port(	D_IN:	in	std_logic_vector (2 downto 0); --3-bit input to decoder
		SZ_OUT:	out	std_logic_vector (7 downto 0)); --8-bit output of decoder
end ex_7_case;

--implement 3:8 decoder
architecture exercise of ex_7_case is
begin
	my_proc: process (D_IN)
	begin
		--outputs were active-low, so 000 => 11111110
		case (D_IN) is
			when "000"   => SZ_OUT <= "11111110";
			when "001"   => SZ_OUT <= "11111101";
			when "010"   => SZ_OUT <= "11111011";
			when "011"   => SZ_OUT <= "11110111";
			when "100"   => SZ_OUT <= "11101111";
			when "101"   => SZ_OUT <= "11011111";
			when "110"   => SZ_OUT <= "10111111";
			when "111"   => SZ_OUT <= "01111111";
			when others => SZ_OUT <= "11111111";
		end case;
	end process my_proc;
end exercise;
