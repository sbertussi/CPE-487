library IEEE;
use IEEE.std_logic_1164.all;

--signals as defined in diagram in textbook
entity ex_3_b is
	port(A, B, C: in  std_logic;
	     F:	      out std_logic);
end ex_3_b;

--see components.vhdl file to see how components are defined
architecture exercise of ex_3_b is
	component my_decode_3_8
		port(A, B, C: in  std_logic;
		     D:       out std_logic_vector(7 downto 0));
	end component;

	component my_4_or
		port(A, B, C, D: in  std_logic;
		     E:          out std_logic);
	end component;

	signal D: std_logic_vector(7 downto 0);
	--D is the logic vector output of the decoder
begin
	--decoder component
	decode1: my_decode_3_8
	port map (A => A, B => B, C => C, D => D);

	--four way OR to final output
	fourOr1: my_4_or
	port map (A => D(0), B => D(1), C => D(3), D => D(4), E => F);

end exercise;
