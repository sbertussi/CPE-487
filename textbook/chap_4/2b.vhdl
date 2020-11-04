library IEEE;
use IEEE.std_logic_1164.all;

entity ex_2b is
	port(	A, B, C, D: 	in	std_logic;
		F:		out	std_logic);
end ex_2b;

--implement F = (A'+B)(B'+C+D')(A'+D)
--used K-map to find conditions for which true/false
--from K-map, found blanket statements for ture/false
architecture exercise of ex_2b is

begin
	--test each blanket statement to determine if F is 1/0
	F <= '1' when (A = '0' and B = '0') else --00XX => 1
	     '0' when (A = '1' and B = '0') else --10XX => 0
	     '1' when (A = '1' and B = '1' and C = '1' and D = '1') else --1111 => 1
	     '0' when (A = '1' and B = '1') else --11XX => 0
	     '0' when (A = '0' and B = '1' and C = '0' and D = '1') else --0101 => 0
	     '1'; --all else true

	--NOTE: VHDL stops reading the list when one of the WHEN statements is true i.e. if 1111 is evaluated as true, VHDL does not read 11XX.
end exercise;
