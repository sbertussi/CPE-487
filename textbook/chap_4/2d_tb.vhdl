library IEEE;
use IEEE.std_logic_1164.all;

entity ex_2d_tb is
end ex_2d_tb;

architecture test of ex_2d_tb is
	component ex_2d
		port
		(
			A, B, C, D:	in	std_logic;
			F:		out	std_logic_vector (0 downto 0)
		);
	end component;

	signal A, B, C, D: std_logic;
	signal F:	   std_logic_vector (0 downto 0);

begin
	--signals and port map as defined in textbook
	--runs through all logical combinations of A, B, C, and D
	exercise: ex_2d port map (A => A, B => B, C => C, D => D, F => F);

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
