library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1e_case is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_1e_case;

architecture exercise of ex_1e_case is
	signal ABCD: std_logic_vector (3 downto 0);
begin
	ABCD <= A & B & C & D;

	my_proc: process (ABCD)
	begin
		case (ABCD) is
			when "0001"   => F <= '1';
			when "0010"   => F <= '1';
			when others => F <= '0';
		end case;
	end process my_proc;
end exercise;

--sigma(1,2)
--True for: 0001 0010