library IEEE;
use IEEE.std_logic_1164.all;

entity ex_4_tb is
end ex_4_tb;

architecture test of ex_4_tb is
	component ex_4
		port (X, Y: 	      			in  std_logic_vector(7 downto 0);
		      LDA, LDB, S0, S1, RD, CLK:        in  std_logic;
		      RA, RB:  	      		        out std_logic_vector(7 downto 0));
	end component;

	signal X, Y, RA, RB: std_logic_Vector(7 downto 0);
	signal LDA, LDB, S1, S0, CLK, RD: std_logic;

begin
	exercise: ex_4 port map (X=>X, Y=>Y, LDA=>LDA, LDB=>LDB, S1=>S1, S0=>S0, CLK=>CLK, RB=>RB, RD => RD, RA=>RA);

	X <= "11111111";
	Y <= "00000000";

	process begin

	S0 <= '0';
	S1 <= '1';
	RD <= '0';
	LDA <= '0';
	LDB <= '0';
	CLK <= '0';
	wait for 1 ns;

	RD <= '1';
	LDA <= '1';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	RD <= '0';
	wait for 1 ns;

	LDB <= '1';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	S0 <= '1';
	wait for 1 ns;

	assert false report "Reached end of test";
	wait;

	end process;

end test;
