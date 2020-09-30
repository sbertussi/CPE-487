library IEEE;
use IEEE.std_logic_1164.all;

entity ex_9_tb is
end ex_9_tb;

architecture test of ex_9_tb is
	component fsm_9
		port
		(
			X, CLK:    in  std_logic;
	      		Z1, Z2:    out std_logic;
	      		Y:	   out std_logic_vector (1 downto 0)
		);
	end component;

	signal X, CLK, Z1, Z2: std_logic;
	signal Y: std_logic_vector (1 downto 0);

begin
	exercise: fsm_9 port map (X => X, CLK => CLK, Z1 => Z1, Z2 => Z2, Y => Y);

	process begin

--A
	X <= '0';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	X <= '1';
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

	X <= '0';
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
