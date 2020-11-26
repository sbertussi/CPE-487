library IEEE;
use IEEE.std_logic_1164.all;

--ports match definitions shown in textbook picture
entity ex_5_eq is
	port(	S, T, CLK, R: 	in	std_logic;
		Q, Q_N:		out	std_logic);
end ex_5_eq;

--implementation of T flip-flop as illustrated in the textbook
--active low
--asynchronous preset and clear
--see truth table below
--equation description
architecture exercise of ex_5_eq is
	signal SR: std_logic_vector (1 downto 0); --signal for S and R together
	signal LSR: std_logic_vector (1 downto 0); --previous SR signal
	signal temp:  std_logic; --temporary signal for Q (allows for memory
begin
	SR <= S & R; --concatenate signals S and R

	my_proc: process (SR, CLK)
	begin
		--implementation of truth table
		case (SR) is
			when "00"   => temp <= '0';
			when "10"   => temp <= '0';
			when "01"   => temp <= '1';
			when "11"   =>
				--pass values only on rising edge of the clock
				if(rising_edge(CLK)) then
					--equation implementation of T flip flop
					temp <= T XOR temp;
				end if;
			when others => temp <= '0';
		end case;

		LSR <= SR;
	end process my_proc;

	--pass on valaues from process
	Q <= temp;
	Q_N <= NOT(temp);
end exercise;

-- S=0, R=0 never happens
-- S=1, R=0 Q <= 0
-- S=0, R=1 Q <= 1
-- S=1, R=1 Q <= [depends on rising edge]
