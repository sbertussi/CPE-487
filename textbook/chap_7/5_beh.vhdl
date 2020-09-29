library IEEE;
use IEEE.std_logic_1164.all;

entity ex_5_beh is
	port(	S, T, CLK, R: 	in	std_logic;
		Q, Q_N:		out	std_logic);
end ex_5_beh;

architecture exercise of ex_5_beh is
	signal SR: std_logic_vector (1 downto 0);
	signal LSR: std_logic_vector (1 downto 0);
	signal temp:  std_logic;
	signal TQ: std_logic_vector (1 downto 0);
begin
	SR <= S & R;
	TQ <= T & temp;

	my_proc: process (SR, CLK)
	begin
		case (SR) is
			when "00"   => temp <= '0';
			when "10"   => temp <= '0';
			when "01"   => temp <= '1';
			when "11"   =>
				if(rising_edge(CLK)) then
					case(TQ) is
						when "00" => temp <= '0';
						when "01" => temp <= '1';
						when "10" => temp <= '1';
						when "11" => temp <= '0';
						when others => temp <= '0';
					end case;
				end if;
			when others => temp <= '0';
		end case;

		LSR <= SR;
	end process my_proc;
	Q <= temp;
	Q_N <= NOT(temp);
end exercise;
