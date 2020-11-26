library IEEE;
use IEEE.std_logic_1164.all;

--ports match definitions shown in textbook picture
entity ex_2 is
	port(	S, D, CLK, R: 	in	std_logic;
		Q, Q_N:		out	std_logic);
end ex_2;

--implementation of D flip-flop as illustrated in the textbook
--active low
--asynchronous preset and clear
--see truth table below
architecture exercise of ex_2 is
	signal SR: std_logic_vector (1 downto 0); --signal for S and R together
begin
	SR <= S & R; --concatenate signals S and R

	my_proc: process (SR, CLK)
	begin
		--implementation of truth table
		case (SR) is
			when "00"   => Q <= '1';
				       Q_N <= '0';
			when "10"   => Q <= '0';
				       Q_N <= '1';
			when "01"   => Q <= '1';
				       Q_N <= '0';
			when "11"   =>
				--pass values only on rising edge of the clock
				if(rising_edge(CLK)) then
					Q <= D;
				        Q_N <= NOT(D);
				end if;
			when others => Q <= '0';
				       Q_N <= '1';
		end case;
	end process my_proc;
end exercise;

-- S=0, R=0 Q <= 1 (stated that S takes precedence in this case)
-- S=1, R=0 Q <= 0
-- S=0, R=1 Q <= 1
-- S=1, R=1 Q <= [depends on rising edge]
