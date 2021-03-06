library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1d_if is
	--ports defined the same as in problem statement
	port(	A, B, C: 	in	std_logic;
		F:		out	std_logic);
end ex_1d_if;

architecture exercise of ex_1d_if is
	signal ABC: std_logic_vector (2 downto 0);
begin
	ABC <= A & B & C; --concatenating signals A, B, and C to use for IF

	my_proc: process (ABC)
	begin
		--setting output to false as per conditions below
		if(ABC = "001") then F <= '0';
		elsif(ABC = "011") then F <= '0';
		elsif(ABC = "100") then F <= '0';
		elsif(ABC = "101") then F <= '0';
		else F <= '1';
		end if;
	end process my_proc;
end exercise;

--pi(5,1,4,3)
--False for: 001 011 100 101
