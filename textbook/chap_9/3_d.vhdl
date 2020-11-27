library IEEE;
use IEEE.std_logic_1164.all;

--signals as defined in diagram in textbook
entity ex_3_d is
	port(A, B, C: in  std_logic;
	     F:	      out std_logic);
end ex_3_d;

--see components.vhdl file to see how components are defined
architecture exercise of ex_3_d is

	component my_nand
		port(A, B: in  std_logic;
		     C:    out std_logic);
	end component;

	component my_nnor
		port(A, B: in  std_logic;
		     C:    out std_logic);
	end component;

	signal notA, notC, D, E: std_logic;
	--notA and notC are inverses of the respective input signals
	--D is the signal between the upper NAND and the final OR
	--E is the signal between the lower NAND and the final OR
begin

	--inverse signals A and C
	notA <= NOT A;
	notC <= NOT C;

	--upper NAND
	nand1: my_nand
	port map (A => notA, B => notC, C => D);

	--lower NAND
	nand2: my_nand
	port map (A => A, B => B, C => E);

	--final OR (which inverses the two input signals)
	nnor1: my_nnor
	port map (A => D, B => E, C => F);

end exercise;
