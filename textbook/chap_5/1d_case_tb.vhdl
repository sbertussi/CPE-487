library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1d_case_tb is
end ex_1d_case_tb;

architecture test of ex_1d_case_tb is
	component ex_1d_case
		port
		(
			A, B, C:	in	std_logic;
			F:		out	std_logic
		);
	end component;

	signal A, B, C, F: std_logic;

begin
	exercise: ex_1d_case port map (A => A, B => B, C => C, F => F);

	process begin

	A <= 'X';
	B <= 'X';
	C <= 'X';
	wait for 1 ns;

	A <= '0';
	B <= '0';
	C <= '0';
	wait for 1 ns;

	A <= '0';
	B <= '0';
	C <= '1';
	wait for 1 ns;

	A <= '0';
	B <= '1';
	C <= '0';
	wait for 1 ns;

	A <= '0';
	B <= '1';
	C <= '1';
	wait for 1 ns;

	A <= '1';
	B <= '0';
	C <= '0';
	wait for 1 ns;

	A <= '1';
	B <= '0';
	C <= '1';
	wait for 1 ns;

	A <= '1';
	B <= '1';
	C <= '0';
	wait for 1 ns;

	A <= '1';
	B <= '1';
	C <= '1';
	wait for 1 ns;

	assert false report "Reached end of test";
	wait;

	end process;

end test;
