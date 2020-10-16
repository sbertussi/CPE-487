library IEEE;
use IEEE.std_logic_1164.all;

entity ex_2_tb is
end ex_2_tb;

architecture test of ex_2_tb is
	component ex_2
		port (X, Y, Z: 	      in  std_logic_vector(7 downto 0);
		      DS, CLK:        in  std_logic;
		      MS:	      in  std_logic_vector(1 downto 0);
		      RA, RB:  	      out std_logic_vector(7 downto 0));
	end component;

	signal X, Y, Z, RA, RB: std_logic_Vector(7 downto 0);
	signal DS, CLK: std_logic;
	signal MS: std_logic_vector(1 downto 0);

begin
	exercise: ex_2 port map (X=>X, Y=>Y, Z=>Z, RA=>RA, RB=>RB, DS=>DS, CLK=>CLK, MS=>MS);

	X <= "11111111";
	Y <= "00000000";
	Z <= "11110000";

	process begin

	DS <= '1';
	MS <= "10";
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	DS <= '0';
	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	DS <= '1';
	MS <= "11";
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	MS <= "00";
	wait for 1 ns;

	assert false report "Reached end of test";
	wait;

	end process;

end test;
