library IEEE;
use IEEE.std_logic_1164.all;

entity ex_11_tb is
end ex_11_tb;

architecture test of ex_11_tb is
	component fsm_11
		port
		(
			X1, X2, CLK:  in  std_logic;
	      		Z:	      out std_logic;
	      		Y:	      out std_logic_vector (2 downto 0)
		);
	end component;

	signal X1, X2, CLK, Z: std_logic;
	signal Y: std_logic_vector (2 downto 0);

begin
	--signals as defined in textbook
	--cycles through all possible states/paths as shown in textbook
	exercise: fsm_11 port map (X1 => X1, X2 => X2, CLK => CLK, Z => Z, Y => Y);

	process begin

--A
	X1 <= 'X';
	X2 <= 'X';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--C
	X1 <= 'X';
	X2 <= '0';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--A
	X1 <= '0';
	X2 <= 'X';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--B
	X1 <= '1';
	X2 <= 'X';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--B
	X1 <= '0';
	X2 <= 'X';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--C
	X1 <= 'X';
	X2 <= '1';
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
