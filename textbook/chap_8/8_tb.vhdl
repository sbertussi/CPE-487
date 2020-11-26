library IEEE;
use IEEE.std_logic_1164.all;

entity ex_8_tb is
end ex_8_tb;

architecture test of ex_8_tb is
	component fsm_8
		port
		(
			X, CLK:    in  std_logic;
	      		Z1, Z2:    out std_logic;
	      		Y:	   out std_logic_vector (2 downto 0)
		);
	end component;

	signal X, CLK, Z1, Z2: std_logic;
	signal Y: std_logic_vector (2 downto 0);

begin
	--signals as defined in textbook
	--cycles through all possible states/paths as shown in textbook
	exercise: fsm_8 port map (X => X, CLK => CLK, Z1 => Z1, Z2 => Z2, Y => Y);

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

	X <= '1';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--D
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

--E
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

	X <= '1';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--D
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

--E
	X <= '1';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

--F
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

--G
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

--H
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

	assert false report "Reached end of test";
	wait;

	end process;

end test;
