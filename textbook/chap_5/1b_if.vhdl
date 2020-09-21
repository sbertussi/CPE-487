library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1b_if is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_1b_if;

architecture exercise of ex_1b_if is
	signal ABCD: std_logic_vector (3 downto 0);
begin
	ABCD <= A & B & C & D;

	my_proc: process (ABCD)
	begin
		if(ABCD = "1110") then F <= '1';
		elsif(ABCD = "1011") then F <= '1';
		elsif(ABCD = "1010") then F <= '1';
		elsif(ABCD = "0110") then F <= '1';
		elsif(ABCD = "0011") then F <= '1';
		elsif(ABCD = "0010") then F <= '1';
		else F <= '0';
		end if;
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
