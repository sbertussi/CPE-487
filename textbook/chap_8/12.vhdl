library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_12 is
	port( X1, X2, CLK:    in  std_logic;
	      Z1, Z2:	      out std_logic;
	      Y:	      out std_logic_vector (1 downto 0));
end fsm_12;

--implementation of FEM as shown in textbook illustration
architecture exercise of fsm_12 is
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
			--determine next state if at A
			when A =>
				--set Z2
				Z2 <= '1';

				--set Z1 and NS based on inputs
				if(X1 = '0') then
					Z1 <= '0';
					NS <= A;
				else
					Z1 <= '1';
					NS <= B;
				end if;	

			--determine next state if at B
			when B =>
				--set Z2
				Z2 <= '0';

				--set Z1 and NS based on inputs
				if(X2 = '0') then
					Z1 <= '1';
					NS <= C;
				else
					Z1 <= '0';
					NS <= A;
				end if;	

			--determine next state if at C
			when C =>
				--set Z2
				Z2 <= '1';

				--set Z1 and NS based on inputs
				if(X2 = '0') then
					Z1 <= '0';
					NS <= A;
				else
					Z1 <= '1';
					NS <= C;
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
		Y <= "11" when A,
		     "01" when B,
		     "00" when C,
		     "00" when others;
end exercise;

--NOT: Assuming typo and X1/X2 inputs
