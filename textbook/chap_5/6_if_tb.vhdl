library IEEE;
use IEEE.std_logic_1164.all;

entity ex_6_if_tb is
end ex_6_if_tb;

architecture test of ex_6_if_tb is
	component ex_6_if		
	port
		(
			D7, D6, D5, D4, D3, D2, D1, D0:	in	std_logic_vector (7 downto 0); --8 possible signals for MUX to select; they were set as 8-bit to allow for debugging
			SEL:				in	std_logic_vector (2 downto 0); --3 bit selection signal
			F:				out	std_logic_vector (7 downto 0) --output of MUX
		);
	end component;

	signal D7, D6, D5, D4, D3, D2, D1, D0:	std_logic_vector (7 downto 0);
	signal SEL:				std_logic_vector (2 downto 0);
	signal F:				std_logic_vector (7 downto 0);
begin
	exercise: ex_6_if port map (D7 => D7, D6 => D6, D5 => D5, D4 => D4, D3 => D3, D2 => D2, D1 => D1, D0 => D0, SEL => SEL, F => F);

	--assign a test value to each of the eight possible inputs
	D7 <= "10000000";
	D6 <= "01000000";
	D5 <= "00100000";
	D4 <= "00010000";
	D3 <= "00001000";
	D2 <= "00000100";
	D1 <= "00000010";
	D0 <= "00000001";

	--use waveform to cycle through all logically possible 8-bit combinations
	S0_waveform: process is
	begin
		SEL(0) <= '0', '1' after 20 ns;
		wait for 40 ns;
	end process;

	S1_waveform: process is
	begin
		SEL(1) <= '0', '1' after 30 ns;
		wait for 50 ns;
	end process;

	S2_waveform: process is
	begin
		SEL(2) <= '0', '1' after 40 ns;
		wait for 60 ns;
	end process;

end test;
