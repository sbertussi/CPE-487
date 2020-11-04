library IEEE;
use IEEE.std_logic_1164.all;

entity ex_2d is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic_vector (0 downto 0));
end ex_2d;

--implement SIGMA(1,2) => interpreted as 1 for 0001 0010
architecture exercise of ex_2d is
	signal A1: std_logic_vector (3 downto 0);
begin
	A1 <= (A & B & C & D); --concatinates the four signals together

	--if the four bit number matches one of the two true values, output 1
	with A1 select
		F <= "1" when "0001"|"0010",
		     "0" when others;
end exercise;
