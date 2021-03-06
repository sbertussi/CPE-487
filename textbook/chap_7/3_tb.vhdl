library IEEE;
use IEEE.std_logic_1164.all;

entity ex_3_tb is
end ex_3_tb;

architecture test of ex_3_tb is
	component ex_3
		port
		(
			S, D, CLK, R: 	in	std_logic;
			Q, Q_N:		out	std_logic
		);
	end component;

	signal S, D, CLK, R, Q, Q_N: std_logic;

begin
	--signals and port map align with that in textbook problem
	--cycles through all combinations of S, R, and CLK
	--values of D selected to facilitate testing of S, R, and CLK conditions
	exercise: ex_3 port map (S => S, D => D, CLK => CLK, R => R, Q => Q, Q_N => Q_N);

	process begin

	S <= 'X';
	R <= 'X';
	D <= 'X';
	CLK <= '0';
	wait for 1 ns;

	S <= '0';
	R <= '1';
	D <= '0';
	CLK <= '0';
	wait for 0.5 ns;

	CLK <= '1';
	wait for 0.5 ns;

	CLK <= '0';
	wait for 0.5 ns;

	S <= '0';
	R <= '1';
	D <= '1';
	CLK <= '0';
	wait for 0.5 ns;

	CLK <= '1';
	wait for 0.5 ns;

	CLK <= '0';
	wait for 0.5 ns;

	S <= '1';
	R <= '0';
	D <= '0';
	CLK <= '0';
	wait for 0.5 ns;

	CLK <= '1';
	wait for 0.5 ns;

	CLK <= '0';
	wait for 0.5 ns;

	S <= '1';
	R <= '0';
	D <= '1';
	CLK <= '0';
	wait for 0.5 ns;

	CLK <= '1';
	wait for 0.5 ns;

	CLK <= '0';
	wait for 0.5 ns;

	S <= '1';
	R <= '1';
	D <= '1';
	CLK <= '0';
	wait for 0.5 ns;

	CLK <= '1';
	wait for 0.5 ns;

	CLK <= '0';
	wait for 0.5 ns;

	S <= '1';
	R <= '1';
	D <= '0';
	CLK <= '0';
	wait for 0.5 ns;

	CLK <= '1';
	wait for 0.5 ns;

	CLK <= '0';
	wait for 0.5 ns;

	assert false report "Reached end of test";
	wait;

	end process;

end test;
