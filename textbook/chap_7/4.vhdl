library IEEE;
use IEEE.std_logic_1164.all;

--ports match definitions shown in textbook picture
entity ex_4 is
	port(	S, D, CLK, R: 	in	std_logic;
		Q, Q_N:		out	std_logic);
end ex_4;

--implementation of D flip-flop as illustrated in the textbook
--active low
--asynchronous preset and clear
--see truth table below
architecture exercise of ex_4 is
	signal SR: std_logic_vector (1 downto 0); --signal for S and R together
	signal LSR: std_logic_vector (1 downto 0); --previous SR signal
	signal T:  std_logic; --temporary storage for Q (also allows for memory)
	signal T_N: std_logic; --temporary storage for Q_N (also allows for memory)
begin
	SR <= S & R; --concatenate signals S and R

	my_proc: process (SR, CLK)
	begin
		--implementation of truth table
		case (SR) is
			when "00"   => 
					--toggles signal only on first rising clock edge of 00
					--i.e. do not toggle at every CLK change while 00 occurs 
				       if(LSR = "00") then
				       else
					  T <= T_N;
					  T_N <= NOT(T_N);
				       end if;
			when "10"   => T <= '0';
				       T_N <= '1';
			when "01"   => T <= '1';
				       T_N <= '0';
			when "11"   =>
				--pass values only on rising edge of the clock
				if(rising_edge(CLK)) then
					T <= D;
				        T_N <= NOT(D);
				end if;
			when others => T <= '0';
				       T_N <= '1';
		end case;

		LSR <= SR;
	end process my_proc;
	Q <= T;
	Q_N <= T_N;
end exercise;

-- S=0, R=0 flip-flop toggles
-- S=1, R=0 Q <= 0
-- S=0, R=1 Q <= 1
-- S=1, R=1 Q <= [depends on rising edge]
