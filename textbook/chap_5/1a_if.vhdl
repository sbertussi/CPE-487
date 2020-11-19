library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1a_if is
	--ports defined the same as in problem statement
	port(	A, B: 	in	std_logic;
		F:	out	std_logic);
end ex_1a_if;

architecture exercise of ex_1a_if is
	signal AB: std_logic_vector (1 downto 0);
begin
	AB <= A & B; --concatenating signals A and B to use for IF

	my_proc: process (AB)
	begin
		--based on truth table, function is true unless both A and B are 0 (AB = 00)
		if (AB = "00") then F <= '0';
		else F <= '1';
		end if;
	end process my_proc;
end exercise;

--truth table to evaluate function
--F = A'B + A + AB'

--a	b	a'b	ab'	f
--0	0	0	0	0
--0	1	1	0	1
--1	0	0	1	1
--1	1	0	0	1
