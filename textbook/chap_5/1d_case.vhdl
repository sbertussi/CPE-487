library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1d_case is
	--ports defined the same as in problem statement
	port(	A, B, C: 	in	std_logic;
		F:		out	std_logic);
end ex_1d_case;

architecture exercise of ex_1d_case is
	signal ABC: std_logic_vector (2 downto 0);
begin
	ABC <= A & B & C; --concatenating signals A, B, and C to use for CASE

	my_proc: process (ABC)
	begin
		--setting output to false as per conditions below
		case (ABC) is
			when "001"   => F <= '0';
			when "011"   => F <= '0';
			when "100"   => F <= '0';
			when "101"   => F <= '0';
			when others => F <= '1';
		end case;
	end process my_proc;
end exercise;

--pi(5,1,4,3)
--False for: 001 011 100 101
