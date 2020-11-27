library IEEE;
use IEEE.std_logic_1164.all;

entity ex_6_tb is
end ex_6_tb;

architecture test of ex_6_tb is
	component ex_6
		port (A, B, C: 	      	    in  std_logic_vector(7 downto 0);
		      SEL1, SEL2, CLK:      in  std_logic;
		      RAP, RBP:  	    out std_logic_vector(7 downto 0));
	end component;

	signal A, B, C, RAP, RBP: std_logic_Vector(7 downto 0);
	signal SEL1, SEL2, CLK: std_logic;

begin
	--signals as defined in illustration
	--cycles through input signals to suffciently verify functionality of each component
	exercise: ex_6 port map (A=>A, B=>B, C=>C, SEL1=>SEL1, SEL2=>SEL2, CLK=>CLK, RAP=>RAP, RBP=>RBP);

	A <= "11111111";
	B <= "00000000";
	C <= "11110000";

	process begin

	SEL1 <= '1';
	SEL2 <= '1';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	SEL1 <= '0';
	SEL2 <= '0';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	SEL2 <= '1';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	assert false report "Reached end of test";
	wait;

	end process;

end test;
