library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_4 is
	port( X1, X2, CLK, INIT:    in  std_logic;
	      Z1, Z2:      	    out std_logic);
end fsm_4;

--implementation of FEM as shown in textbook illustration
architecture exercise of fsm_4 is
	signal PS, NS: std_logic_vector (1 downto 0); -- PS = present state, NS = next state
	--NOTE: A=10, B=11, C=01

begin
	--move NS to PS on rising clock edge
	sync_proc: process (CLK, NS, INIT)
	begin
		if(INIT = '1') then PS <= "10"; -- if INIT is "pressed" set state to A
		elsif(rising_edge(CLK)) then PS <= NS;
		end if;
	end process sync_proc;

	--process to determine next state
	comb_proc: process (PS, X1, X2)
	begin
		--initialize everything to 0
		Z1 <= '0';
		Z2 <= '0';
		case PS is
			--determine next state if A
			when "10" => --A
				--set Z1
				Z1 <= '0';

				--determine Z2 value and NS based on inputs
				if(X1 = '1') then
					Z2 <= '1';
					NS <= "11";--B
				else
					Z2 <= '0';
					NS <= "01"; --C
				end if;

			--determine next state if B
			when "11" => --B
				--set Z1
				Z1 <= '1';

				--determine Z2 value and NS based on inputs
				if(X2 = '0') then
					Z2 <= '1';
					NS <= "01";--C
				else
					Z2 <= '0';
					NS <= "10";--A
				end if;

			--determine next state if C
			when "01" => --C
				--set Z1
				Z1 <= '1';

				--determine Z2 value and NS based on inputs
				if(X1 = '0') then
					Z2 <= '1';
					NS <= "10";--A
				else
					Z2 <= '1';
					NS <= "11";--B
				end if;

			--default to state A with all outputs 0
			when others =>
				Z1 <= '0';
				Z2 <= '0';
				NS <= "10";--a
		end case;
	end process comb_proc;
end exercise;
