library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1f_tb is
end ex_1f_tb;

architecture test of ex_1f_tb is
	component ex_1f
		port
		(
			A, B, C, D:	in	std_logic;
			F:		out	std_logic
		);
	end component;

	signal A, B, C, D, F: std_logic;

begin
	exercise: ex_1f port map (A => A, B => B, C => C, D => D, F => F);

	process begin

	A <= 'X';
	B <= 'X';
	C <= 'X';
	D <= 'X';
	wait for 1 ns;

	A <= '1';
	B <= '1';
	C <= '1';
	D <= '1';
	wait for 1 ns;

	A <= '1';
	B <= '1';
	C <= '1';
	D <= '0';
	wait for 1 ns;

	A <= '1';
	B <= '1';
	C <= '0';
	D <= '1';
	wait for 1 ns;

	A <= '1';
	B <= '1';
	C <= '0';
	D <= '0';
	wait for 1 ns;

	A <= '1';
	B <= '0';
	C <= '1';
	D <= '1';
	wait for 1 ns;

	A <= '1';
	B <= '0';
	C <= '1';
	D <= '0';
	wait for 1 ns;

	A <= '1';
	B <= '0';
	C <= '0';
	D <= '1';
	wait for 1 ns;

	A <= '1';
	B <= '0';
	C <= '0';
	D <= '0';
	wait for 1 ns;

	A <= '0';
	B <= '1';
	C <= '1';
	D <= '1';
	wait for 1 ns;

	A <= '0';
	B <= '1';
	C <= '1';
	D <= '0';
	wait for 1 ns;

	A <= '0';
	B <= '1';
	C <= '0';
	D <= '1';
	wait for 1 ns;

	A <= '0';
	B <= '1';
	C <= '0';
	D <= '0';
	wait for 1 ns;

	A <= '0';
	B <= '0';
	C <= '1';
	D <= '1';
	wait for 1 ns;

	A <= '0';
	B <= '0';
	C <= '1';
	D <= '0';
	wait for 1 ns;

	A <= '0';
	B <= '0';
	C <= '0';
	D <= '1';
	wait for 1 ns;

	A <= '0';
	B <= '0';
	C <= '0';
	D <= '0';
	wait for 1 ns;

	assert false report "Reached end of test";
	wait;

	end process;

end test;
