library IEEE;
use IEEE.std_logic_1164.all;

entity ex_4_tb is
end ex_4_tb;

architecture test of ex_4_tb is
	component ex_4
		port
		(
			S, D, CLK, R: 	in	std_logic;
			Q, Q_N:		out	std_logic
		);
	end component;

	signal S, D, CLK, R, Q, Q_N: std_logic;

begin
	exercise: ex_4 port map (S => S, D => D, CLK => CLK, R => R, Q => Q, Q_N => Q_N);

	process begin

	S <= 'X';
	R <= 'X';
	D <= 'X';
	CLK <= '0';
	wait for 1 ns;

	S <= '0';
	R <= '0';
	D <= '0';
	CLK <= '0';
	wait for 0.5 ns;

	CLK <= '1';
	wait for 0.5 ns;

	CLK <= '0';
	wait for 0.5 ns;

	S <= '0';
	R <= '0';
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
	R <= '1';
	D <= '0';
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

	S <= '0';
	R <= '0';
	D <= '0';
	CLK <= '0';
	wait for 0.5 ns;

	CLK <= '1';
	wait for 0.5 ns;

	CLK <= '0';
	wait for 0.5 ns;

	S <= '0';
	R <= '0';
	D <= '1';
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