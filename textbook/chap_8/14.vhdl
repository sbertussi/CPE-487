library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_14 is
	port( X1, X2, CLK:    in  std_logic;
	      Z1, Z2:	      out std_logic;
	      Y:	      out std_logic_vector (2 downto 0));
end fsm_14;

--implementation of FEM as shown in textbook illustration
architecture exercise of fsm_14 is
	type state_type is (A, B, C);
	signal PS, NS: state_type; --PS = present state, NS = next state

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
		Z1 <= '0';
		Z2 <= '0';
		case PS is
			--determine next state if A
			when A =>
				--set Z1
				Z1 <= '0';

				--use inputs to determine Z2, NS
				if(X1 = '0') then
					Z2 <= '0';
					NS <= C;
				else
					Z2 <= '1';
					NS <= B;
				end if;	

			--determine next state if B
			when B =>
				--set Z1
				Z1 <= '1';

				--use inputs to determine Z2, NS
				if(X2 = '0') then
					Z2 <= '1';
					NS <= C;
				else
					Z2 <= '0';
					NS <= A;
				end if;	

			--determine next state if C
			when C =>
				--set Z1
				Z1 <= '1';

				--use inputs to determine Z2, NS
				if(X1 = '0') then
					Z2 <= '1';
					NS <= A;
				else
					Z2 <= '1';
					NS <= B;
				end if;	

			--default to A and all 0s
			when others =>
				Z1 <= '0';
				Z2 <= '0';
				NS <= A;
		end case;
	end process comb_proc;

	--set Y based on PS
	with PS select
		Y <= "001" when A,
		     "010" when B,
		     "100" when C,
		     "000" when others;
end exercise;
