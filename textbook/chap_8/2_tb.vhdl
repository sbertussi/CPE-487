library IEEE;
use IEEE.std_logic_1164.all;

entity ex_2_tb is
end ex_2_tb;

architecture test of ex_2_tb is
	component fsm_2
		port
		(
			X1, X2, CLK:    in  std_logic;
	      		Y0, Y1, Z:      out std_logic
		);
	end component;

	signal X1, X2, CLK, Y0, Y1, Z: std_logic;

begin
	exercise: fsm_2 port map (X1 => X1, X2 => X2, CLK => CLK, Y0 => Y0, Y1 => Y1, Z => Z);

	process begin

	X1 <= 'X';
	X2 <= 'X';
	CLK <= '0';
	wait for 3 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= '0';
	X2 <= 'X';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= '1';
	X2 <= 'X';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= 'X';
	X2 <= '1';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= 'X';
	X2 <= '1';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= 'X';
	X2 <= '0';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= '1';
	X2 <= 'X';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= 'X';
	X2 <= '0';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	assert false report "Reached end of test";
	wait;

	end process;

end test;
