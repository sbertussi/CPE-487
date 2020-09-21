library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1a_if is
	port(	A, B: 	in	std_logic;
		F:	out	std_logic);
end ex_1a_if;

architecture exercise of ex_1a_if is
	signal AB: std_logic_vector (1 downto 0);
begin
	AB <= A & B;

	my_proc: process (AB)
	begin
		if (AB = "00") then F <= '0';
		else F <= '1';
		end if;
	end process my_proc;
end exercise;

--Not(a) and b or a or a and not(b)
--a	b	a'b	ab'	f
--0	0	0	0	0
--0	1	1	0	1
--1	0	0	1	1
--1	1	0	0	1