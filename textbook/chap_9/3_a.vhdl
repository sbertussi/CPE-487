library IEEE;
use IEEE.std_logic_1164.all;

--signals as defined in diagram in textbook
entity ex_3_a is
	port(A, B, C: in  std_logic;
	     F:	      out std_logic);
end ex_3_a;

--see components.vhdl file to see how components are defined
architecture exercise of ex_3_a is
	component my_and
		port(A, B: in  std_logic;
		     C:     out std_logic);
	end component;

	component my_or
		port(A, B: in  std_logic;
		     C:     out std_logic);
	end component;

	signal notA, notB, notC, D, E: std_logic;
	--notA, notB, and notC are the inverces of the respective input signals
	--D is the signal between the upper AND in the diagram and the last OR
	--E is the signal between the lower AND in the diagram and the last OR

begin
	--inverse of each input
	notA <= NOT(A);
	notB <= NOT(B);
	notC <= NOT(C);

	--defining upper AND with component
	and1: my_and
	port map (A => A, B => notB, C => D);

	--defining lower AND with component
	and2: my_and
	port map (A => notA, B => notC, C => E);

	--defining final OR with component
	or1: my_or
	port map (A => D, B => E, C => F);

end exercise;
