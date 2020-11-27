library IEEE;
use IEEE.std_logic_1164.all;

entity ex_1_tb is
end ex_1_tb;

architecture test of ex_1_tb is
	component ex_1
		port (A, B: 	      in  std_logic_vector(7 downto 0);
		      SEL, CLK, LDA:  in  std_logic;
		      F:    	      out std_logic_vector(7 downto 0));
	end component;

	signal A, B, F: std_logic_Vector(7 downto 0);
	signal SEL, CLK, LDA: std_logic;

begin
	--signals as defined in illustration
	--cycles through input signals to suffciently verify functionality of each component
	exercise: ex_1 port map (A=>A, B=>B, SEL=>SEL, CLK=>CLK, LDA=>LDA, F=>F);

	A <= "11111111";
	B <= "00000000";

	process begin

	SEL <= '0';
	CLK <= '0';
	LDA <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	LDA <= '1';
	CLK <= '1';
	wait for 1 ns;

	SEL <= '1';
	CLK <= '0';
	LDA <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	LDA <= '1';
	CLK <= '1';
	wait for 1 ns;

	LDA <= '0';
	CLK <= '0';
	wait for 1 ns;

	assert false report "Reached end of test";
	wait;

	end process;

end test;
