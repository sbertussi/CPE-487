library IEEE;
use IEEE.std_logic_1164.all;

--signals as defined in diagram in textbook
entity ex_3_c is
	port(A, B, C: in  std_logic;
	     F:	      out std_logic);
end ex_3_c;

--see components.vhdl file to see how components are defined
architecture exercise of ex_3_c is

	component my_and
		port(A, B: in  std_logic;
		     C:    out std_logic);
	end component;

	component my_or
		port(A, B: in  std_logic;
		     C:    out std_logic);
	end component;

	signal notB, notC, D, E: std_logic;
	--notB and notC are the inverses of the respective input signals
	--D is the signal between the upper AND and the final OR
	--E is the signal between the lower AND and the final OR
begin

	--invsere signals B and C
	notB <= NOT B;
	notC <= NOT C;

	--upper AND gate
	and1: my_and
	port map (A => A, B => C, C => D);

	--lower AND gate
	and2: my_and
	port map (A => notC, B => notB, C => E);

	--final OR
	or1: my_or
	port map (A => D, B => E, C => F);

end exercise;
