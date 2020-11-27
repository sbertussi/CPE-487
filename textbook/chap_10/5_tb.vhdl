library IEEE;
use IEEE.std_logic_1164.all;

entity ex_5_tb is
end ex_5_tb;

architecture test of ex_5_tb is
	component ex_5
		port (A, B, C: 	      	    in  std_logic_vector(7 downto 0);
		      SL1, SL2, CLK:        in  std_logic;
		      RAX, RBX:  	    out std_logic_vector(7 downto 0));
	end component;

	signal A, B, C, RAX, RBX: std_logic_Vector(7 downto 0);
	signal SL1, SL2, CLK: std_logic;

begin
	--signals as defined in illustration
	--cycles through input signals to suffciently verify functionality of each component
	exercise: ex_5 port map (A=>A, B=>B, C=>C, SL1=>SL1, SL2=>SL2, CLK=>CLK, RAX=>RAX, RBX=>RBX);

	A <= "11111111";
	B <= "00000000";
	C <= "11110000";

	process begin

	SL1 <= '1';
	SL2 <= '1';
	CLK <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	SL1 <= '0';
	SL2 <= '0';
	wait for 1 ns;

	CLK <= '1';
	wait for 1 ns;

	CLK <= '0';
	wait for 1 ns;

	assert false report "Reached end of test";
	wait;

	end process;

end test;
