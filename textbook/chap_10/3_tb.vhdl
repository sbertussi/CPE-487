library IEEE;
use IEEE.std_logic_1164.all;

entity ex_3_tb is
end ex_3_tb;

architecture test of ex_3_tb is
	component ex_3
		port (X, Y: 	      		    in  std_logic_vector(7 downto 0);
		      LDA, LDB, S1, S0, CLK:        in  std_logic;
		      RB:  	      		    out std_logic_vector(7 downto 0));
	end component;

	signal X, Y, RB: std_logic_Vector(7 downto 0);
	signal LDA, LDB, S1, S0, CLK: std_logic;

begin
	exercise: ex_3 port map (X=>X, Y=>Y, LDA=>LDA, LDB=>LDB, S1=>S1, S0=>S0, CLK=>CLK, RB=>RB);

	X <= "11111111";
	Y <= "00000000";

	process begin

	S1 <= '1';
	S0 <= '0';
	CLK <= '0';
	LDA <= '1';
	LDB <= '1';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	S1 <= '0';
	S0 <= '1';
	CLK <= '0';
	LDA <= '0';
	LDB <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	LDB <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	assert false report "Reached end of test";
	wait;

	end process;

end test;
