library IEEE;
use IEEE.std_logic_1164.all;

entity ex_4 is
	port(	S, D, CLK, R: 	in	std_logic;
		Q, Q_N:		out	std_logic);
end ex_4;

architecture exercise of ex_4 is
	signal SR: std_logic_vector (1 downto 0);
	signal LSR: std_logic_vector (1 downto 0);
	signal T:  std_logic;
	signal T_N: std_logic;
begin
	SR <= S & R;

	my_proc: process (SR, CLK)
	begin
		case (SR) is
			when "00"   => 
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
