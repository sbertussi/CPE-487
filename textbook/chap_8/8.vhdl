library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_8 is
	port( X, CLK:    in  std_logic;
	      Z1, Z2:    out std_logic;
	      Y:	 out std_logic_vector (2 downto 0));
end fsm_8;

--implementation of FEM as shown in textbook illustration
architecture exercise of fsm_8 is
	type state_type is (A, B, C, D, E, F, G, H);
	signal PS, NS: state_type; --PS = present state, NS = next state
	--NOTE: A = 000, B = 001, C = 010, D = 011, E = 100, F = 101, G = 110, H = 111

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
			--determine next state if A
			when A =>
				--set outputs
				Z1 <= '0';
				Z2 <= '0';

				--determine NS based on inputs
				if(X = '0') then
					NS <= A;
				else
					NS <= B;
				end if;

			--determine next state if B
			when B =>
				--set outputs
				Z1 <= '0';
				Z2 <= '0';

				--determine NS based on inputs
				if(X = '0') then
					NS <= B;
				else
					NS <= C;
				end if;

			--determine next state if C
			when C =>
				--set outputs
				Z1 <= '0';
				Z2 <= '0';

				--determine NS based on inputs
				if(X = '0') then
					NS <= C;
				else
					NS <= D;
				end if;

			--determine next state if D
			when D =>
				--set outputs
				Z1 <= '1';
				Z2 <= '0';

				--determine NS based on inputs
				if(X = '0') then
					NS <= D;
				else
					NS <= E;
				end if;

			--determine next state if E
			when E =>
				--set outputs
				Z1 <= '0';
				Z2 <= '1';

				--determine NS based on inputs
				if(X = '0') then
					NS <= A;
				else
					NS <= F;
				end if;

			--determine next state if F
			when F =>
				--set outputs
				Z1 <= '1';
				Z2 <= '1';

				--determine NS based on inputs
				if(X = '0') then
					NS <= F;
				else
					NS <= G;
				end if;

			--determine next state if G
			when G =>
				--set outputs
				Z1 <= '1';
				Z2 <= '1';

				--determine NS based on inputs
				if(X = '0') then
					NS <= G;
				else
					NS <= H;
				end if;

			--determine next state if H
			when H =>
				--set outputs
				Z1 <= '1';
				Z2 <= '1';

				--determine NS based on inputs
				if(X = '0') then
					NS <= H;
				else
					NS <= A;
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
		Y <= "000" when A,
		     "001" when B,
		     "010" when C,
		     "011" when D,
		     "100" when E,
		     "101" when F,
		     "110" when G,
		     "111" when H,
		     "000" when others;
end exercise;
