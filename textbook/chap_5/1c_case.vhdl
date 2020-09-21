library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1c_case is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_1c_case;

architecture exercise of ex_1c_case is
	signal ABCD: std_logic_vector (3 downto 0);
begin
	ABCD <= A & B & C & D;

	my_proc: process (ABCD)
	begin
		case (ABCD) is
			when "1111"   => F <= '1';
			when "0111"   => F <= '1';
			when "0110"   => F <= '1';
			when "0100"   => F <= '1';
			when "0011"   => F <= '1';
			when "0010"   => F <= '1';
			when "0001"   => F <= '1';
			when "0000"   => F <= '1';
			when others => F <= '0';
		end case;
	end process my_proc;
end exercise;

--(A'+B)(B'+C+D')(A'+D)
--A	B	C	D	A'+B	B'+C+D'	A'+D	F
--1	1	1	1	1	1	1	1
--1	1	1	0	1	1	0	0
--1	1	0	1	1	0	1	0
--1	1	0	0	1	1	0	0
--1	0	1	1	0	1	1	0
--1	0	1	0	0	1	0	0
--1	0	0	1	0	1	1	0
--1	0	0	0	0	1	0	0
--0	1	1	1	1	1	1	1
--0	1	1	0	1	1	1	1
--0	1	0	1	1	0	1	0
--0	1	0	0	1	1	1	1
--0	0	1	1	1	1	1	1
--0	0	1	0	1	1	1	1
--0	0	0	1	1	1	1	1
--0	0	0	0	1	1	1	1

--True For: 1111 0111 0110 0100 0011 0010 0001 0000
