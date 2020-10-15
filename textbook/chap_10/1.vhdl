library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1 is
	port (A, B: 	      in  std_logic_vector(7 downto 0);
	      SEL, CLK, LDA:  in  std_logic;
	      F:    	      out std_logic_vector(7 downto 0));
end ex_1;

architecture exercise of ex_1 is
	component mux_21
		port (A, B: in  std_logic_vector(7 downto 0);
	      	      SEL:  in  std_logic;
	      	      C:    out std_logic_vector(7 downto 0));
	end component;

	component reg
		port (A:        in  std_logic_vector(7 downto 0);
	              LD, CLK:  in  std_logic;
	              B:        out std_logic_vector(7 downto 0));
	end component;

	signal C: std_logic_vector(7 downto 0);
begin
	mux1: mux_21
	port map (A => A, B => B, SEL => SEL, C => C);

	reg1: reg
	port map (A => C, LD => LDA, CLK => CLK, B => F);

end exercise;

