library IEEE;
use IEEE.std_logic_1164.all;

entity ex_6_tb is
end ex_6_tb;

architecture test of ex_6_tb is
	component ex_6
	port
		(
			D_IN:	in	std_logic_vector (2 downto 0);
			SZ_OUT:	out	std_logic_vector (7 downto 0)
		);
	end component;

	signal D_IN:	std_logic_vector (2 downto 0);
	signal SZ_OUT:	std_logic_vector (7 downto 0);
begin
	exercise: ex_6 port map (D_IN => D_IN, SZ_OUT => SZ_OUT);

	D0_waveform: process is
	begin
		D_IN(0) <= '0', '1' after 20 ns;
		wait for 40 ns;
	end process;

	D1_waveform: process is
	begin
		D_IN(1) <= '0', '1' after 30 ns;
		wait for 50 ns;
	end process;

	D2_waveform: process is
	begin
		D_IN(2) <= '0', '1' after 40 ns;
		wait for 60 ns;
	end process;

end test;
