library IEEE;
use IEEE.std_logic_1164.all;

entity ex_4_tb is
end ex_4_tb;

architecture test of ex_4_tb is
	component fsm_4
		port
		(
			X1, X2, CLK, INIT:    in  std_logic;
	      		Z1, Z2:      	      out std_logic
		);
	end component;

	signal X1, X2, CLK, INIT, Z1, Z2: std_logic;

begin
	exercise: fsm_4 port map (X1 => X1, X2 => X2, CLK => CLK, INIT => INIT, Z1 => Z1, Z2 => Z2);

	process begin

	X1 <= 'X';
	X2 <= 'X';
	CLK <= '0';
	INIT <= '0';
	wait for 3 ns;

	X1 <= '1';
	X2 <= 'X';
	CLK <= '0';
	INIT <= '1';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= '1';
	X2 <= 'X';
	CLK <= '0';
	INIT <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= 'X';
	X2 <= '1';
	CLK <= '0';
	INIT <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= '0';
	X2 <= 'X';
	CLK <= '0';
	INIT <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= '0';
	X2 <= 'X';
	CLK <= '0';
	INIT <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= '0';
	X2 <= 'X';
	CLK <= '0';
	INIT <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= '1';
	X2 <= 'X';
	CLK <= '0';
	INIT <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X1 <= 'X';
	X2 <= '0';
	CLK <= '0';
	INIT <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	assert false report "Reached end of test";
	wait;

	end process;

end test;
