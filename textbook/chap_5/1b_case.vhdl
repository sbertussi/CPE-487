library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1b_case is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_1b_case;

architecture exercise of ex_1b_case is
	signal ABCD: std_logic_vector (3 downto 0);
begin
	ABCD <= A & B & C & D;

	my_proc: process (ABCD)
	begin
		case (ABCD) is
			when "1110"   => F <= '1';
			when "1011"   => F <= '1';
			when "1010"   => F <= '1';
			when "0110"   => F <= '1';
			when "0011"   => F <= '1';
			when "0010"   => F <= '1';
			when others => F <= '0';
		end case;
	end process my_proc;
end exercise;

--A'CD' + B'C + BCD'
--A	B	C	D	A'CD'	B'C	BCD'	F
--1	1	1	1	0	0	0	0
--*1	1	1	0	0	0	1	1
--1	1	0	1	0	0	0	0
--1	1	0	0	0	0	0	0
--*1	0	1	1	0	1	0	1
--*1	0	1	0	0	1	0	1
--1	0	0	1	0	0	0	0
--1	0	0	0	0	0	0	0
--0	1	1	1	0	0	0	0
--*0	1	1	0	1	0	1	1
--0	1	0	1	0	0	0	0
--0	1	0	0	0	0	0	0
--*0	0	1	1	0	1	0	1
--*0	0	1	0	1	1	0	1
--0	0	0	1	0	0	0	0
--0	0	0	0	0	0	0	0

--True for: 1110 1011 1010 0110 0011 0010
