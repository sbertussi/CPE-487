library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1a_case_tb is
end ex_1a_case_tb;

architecture test of ex_1a_case_tb is
	component ex_1a_case
		port
		(
			A, B:	in	std_logic;
			F:	out	std_logic
		);
	end component;

	signal A, B, F: std_logic;

begin
	exercise: ex_1a_case port map (A => A, B => B, F => F);

	process begin

	A <= 'X';
	B <= 'X';
	wait for 1 ns;

	A <= '1';
	B <= '1';
	wait for 1 ns;

	A <= '1';
	B <= '0';
	wait for 1 ns;

	A <= '0';
	B <= '1';
	wait for 1 ns;

	A <= '0';
	B <= '0';
	wait for 1 ns;

	assert false report "Reached end of test";
	wait;

	end process;

end test;
