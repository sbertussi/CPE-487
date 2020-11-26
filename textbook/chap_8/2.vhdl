library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_2 is
	port( X1, X2, CLK:    in  std_logic;
	      Y0, Y1, Z:      out std_logic);
end fsm_2;

--implementation of FEM as shown in textbook illustration
architecture exercise of fsm_2 is
	signal PS, NS: std_logic_vector (1 downto 0); -- PS = present state, NS = next state
	--NOTE: A = 10, B = 11, C = 01

begin
	--move NS to PS on rising clock edge
	sync_proc: process (CLK, NS)
	begin
		if(rising_edge(CLK)) then PS <= NS;
		end if;
	end process sync_proc;

	--process to determine next state
	comb_proc: process (PS, X1, X2)
	begin
		--initialize everything to 0
		Y0 <= '0';
		Y1 <= '0';
		Z  <= '0';
		case PS is
			--determine next state if at A
			when "10" => --A
				--output variables
				Y1 <= '1';
				Y0 <= '0';

				--determine Z value and NS based on inputs
				if(X1 = '0') then
					Z <= '0';
					NS <= "10";--A
				else
					Z <= '0';
					NS <= "01"; --C
				end if;

			--determine next state if at B
			when "11" => --B
				--output variables
				Y1 <= '1';
				Y0 <= '1';

				--determine Z value and NS based on inputs
				if(X2 = '0') then
					Z <= '1';
					NS <= "10";--A
				else
					Z <= '0';
					NS <= "11";--B
				end if;

			--determine next state if at C
			when "01" => --C
				--output variables
				Y1 <= '0';
				Y0 <= '1';

				--determine Z values and NS based on inputs
				if(X2 = '0') then
					Z <= '1';
					NS <= "10";--A
				else
					Z <= '0';
					NS <= "11";--B
				end if;

			--default to state A with all outputs 0
			when others =>
				Y0 <= '0';
				Y1 <= '0';
				Z  <= '0';
				NS <= "10";--A
		end case;
	end process comb_proc;
end exercise;
