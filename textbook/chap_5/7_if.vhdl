library IEEE;
use IEEE.std_logic_1164.all;

entity ex_7_if is
	port(	D_IN:	in	std_logic_vector (2 downto 0); --3-bit input to decoder
		SZ_OUT:	out	std_logic_vector (7 downto 0)); --8-bit output of decoder
end ex_7_if;

--implement 3:8 decoder
architecture exercise of ex_7_if is
begin
	my_proc: process (D_IN)
	begin
		--outputs were active-low, so 000 => 11111110
		if(D_IN = "000") then SZ_OUT <= "11111110";
		elsif(D_IN = "001") then SZ_OUT <= "11111101";
		elsif(D_IN = "010") then SZ_OUT <= "11111011";
		elsif(D_IN = "011") then SZ_OUT <= "11110111";
		elsif(D_IN = "100") then SZ_OUT <= "11101111";
		elsif(D_IN = "101") then SZ_OUT <= "11011111";
		elsif(D_IN = "110") then SZ_OUT <= "10111111";
		elsif(D_IN = "111") then SZ_OUT <= "01111111";
		else SZ_OUT <= "11111111";
		end if;
	end process my_proc;
end exercise;
