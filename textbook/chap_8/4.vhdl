library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_4 is
	port( X1, X2, CLK, INIT:    in  std_logic;
	      Z1, Z2:      	    out std_logic);
end fsm_4;

architecture exercise of fsm_4 is
--	type state_type is (A, B, C);
--	signal PS, NS: state_type;
	signal PS, NS: std_logic_vector (1 downto 0); --A=10, B=11, C=01

begin
	sync_proc: process (CLK, NS, INIT)
	begin
		if(INIT = '1') then PS <= "10"; --A
		elsif(rising_edge(CLK)) then PS <= NS;
		end if;
	end process sync_proc;

	comb_proc: process (PS, X1, X2)
	begin
		Z1 <= '0';
		Z2 <= '0';
		case PS is
			when "10" => --A
				Z1 <= '0';

				if(X1 = '1') then
					Z2 <= '1';
					NS <= "11";--B
				else
					Z2 <= '0';
					NS <= "01"; --C
				end if;

			when "11" => --B
				Z1 <= '1';

				if(X2 = '0') then
					Z2 <= '1';
					NS <= "01";--C
				else
					Z2 <= '0';
					NS <= "10";--A
				end if;

			when "01" => --c
				Z1 <= '1';

				if(X1 = '0') then
					Z2 <= '1';
					NS <= "10";--a
				else
					Z2 <= '1';
					NS <= "11";--b
				end if;

			when others =>
				Z1 <= '0';
				Z2 <= '0';
				NS <= "10";--a
		end case;
	end process comb_proc;
end exercise;
