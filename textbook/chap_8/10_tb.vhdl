library IEEE;
use IEEE.std_logic_1164.all;

entity ex_10_tb is
end ex_10_tb;

architecture test of ex_10_tb is
	component fsm_10
		port
		(
			X, CLK:  in  std_logic;
	      		Z:	 out std_logic;
	      		Y:	 out std_logic_vector (2 downto 0)
		);
	end component;

	signal X, CLK, Z: std_logic;
	signal Y: std_logic_vector (2 downto 0);

begin
	--signals as defined in textbook
	--cycles through all possible states/paths as shown in textbook
	exercise: fsm_10 port map (X => X, CLK => CLK, Z => Z, Y => Y);

	process begin

--A
	X <= '0';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--B
	X <= '0';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--A
	X <= '1';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--B
	X <= '1';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--C
	X <= '0';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--A
	X <= '0';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--B
	X <= '1';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--C
	X <= '1';
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
