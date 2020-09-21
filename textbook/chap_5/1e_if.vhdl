library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1e_if is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_1e_if;

architecture exercise of ex_1e_if is
	signal ABCD: std_logic_vector (3 downto 0);
begin
	ABCD <= A & B & C & D;

	my_proc: process (ABCD)
	begin
		if(ABCD = "0001") then F <= '1';
		elsif(ABCD = "0010") then F <= '1';
		else F <= '0';
		end if;
	end process my_proc;
end exercise;

--sigma(1,2)
--True for: 0001 0010