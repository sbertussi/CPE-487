library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_9 is
	port( X, CLK:    in  std_logic;
	      Z1, Z2:    out std_logic;
	      Y:	 out std_logic_vector (1 downto 0));
end fsm_9;

--implementation of FEM as shown in textbook illustration
architecture exercise of fsm_9 is
	type state_type is (A, B, C, D); -- PS = present state, NS = next state
	signal PS, NS: state_type;
	--NOTE: A = 00, B = 01, C = 10, D = 11

begin
	--move NS to PS on rising clock edge
	sync_proc: process (CLK, NS)
	begin
		if(rising_edge(CLK)) then PS <= NS;
		end if;
	end process sync_proc;

	--process to determine next state
	comb_proc: process (PS, X)
	begin
		--initialize everything to 0
		Z1 <= '0';
		Z2 <= '0';
		case PS is
			--determine next state if at A
			when A =>
				--set Z1
				Z1 <= '0';

				--determine Z2 and NS based on inputs
				if(X = '0') then
					Z2 <= '0';
					NS <= A;
				else
					Z2 <= '0';
					NS <= B;
				end if;

			--determine next state if at B
			when B =>
				--set Z1
				Z1 <= '0';

				--determine Z2 and NS based on inputs
				if(X = '0') then
					Z2 <= '0';
					NS <= A;
				else
					Z2 <= '0';
					NS <= C;
				end if;

			--determine next state if at C
			when C =>
				--set Z1
				Z1 <= '0';

				--determine Z2 and NS based on inputs
				if(X = '0') then
					Z2 <= '0';
					NS <= A;
				else
					Z2 <= '0';
					NS <= D;
				end if;

			--determine next state if at D
			when D =>
				--set Z1
				Z1 <= '1';

				--determine Z2 and NS based on inputs
				if(X = '0') then
					Z2 <= '0';
					NS <= A;
				else
					Z2 <= '1';
					NS <= D;
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
		Y <= "00" when A,
		     "01" when B,
		     "10" when C,
		     "11" when D,
		     "00" when others;
end exercise;
