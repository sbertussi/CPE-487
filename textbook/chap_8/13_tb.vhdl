library IEEE;
use IEEE.std_logic_1164.all;

entity ex_13_tb is
end ex_13_tb;

architecture test of ex_13_tb is
	component fsm_13
		port
		(
			X1, X2, CLK:  in  std_logic;
	      		CS, RD:	      out std_logic;
	      		Y:	      out std_logic_vector (2 downto 0)
		);
	end component;

	signal X1, X2, CLK, CS, RD: std_logic;
	signal Y: std_logic_vector (2 downto 0);

begin
	exercise: fsm_13 port map (X1 => X1, X2 => X2, CLK => CLK, CS => CS, RD => RD, Y => Y);

	process begin

--A
	X1 <= 'X';
	X2 <= 'X';
	CLK <= '0';
	wait for 1 ns;

--A
	X1 <= '1';
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
	X1 <= 'X';
	X2 <= 'X';
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
