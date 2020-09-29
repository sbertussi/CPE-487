library IEEE;
use IEEE.std_logic_1164.all;

entity ex_3 is
	port(	S, D, CLK, R: 	in	std_logic;
		Q, Q_N:		out	std_logic);
end ex_3;

architecture exercise of ex_3 is
	signal SR: std_logic_vector (1 downto 0);
begin
	SR <= S & R;

	my_proc: process (SR, CLK)
	begin
		if(rising_edge(CLK)) then
			case(SR) is
				when "00"   => Q <= '0';
					       Q_N <= '1';
				when "10"   => Q <= '0';
					       Q_N <= '1';
				when "01"   => Q <= '1';
					       Q_N <= '0';
				when "11"   => Q <= D;
					       Q_N <= NOT(D);
				when others => Q <= '0';
					       Q_N <= '1';
			end case;
		end if;
	end process my_proc;
end exercise;
