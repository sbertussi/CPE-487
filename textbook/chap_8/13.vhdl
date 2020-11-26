library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_13 is
	port( X1, X2, CLK:    in  std_logic;
	      CS, RD:	      out std_logic;
	      Y:	      out std_logic_vector (2 downto 0));
end fsm_13;

--implementation of FEM as shown in textbook illustration
architecture exercise of fsm_13 is
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
		CS <= '0';
		RD <= '0';
		case PS is
			--determine next state if A
			when A =>
				--use inputs to set CS, RD, NS
				if(X1 = '0') then
					CS <= '0';
					RD <= '1';
					NS <= B;
				else
					CS <= '1';
					RD <= '0';
					NS <= C;
				end if;	

			--determine next state if B
			when B =>
				--B only has one path, therefore set all
				CS <= '1';
				RD <= '1';
				NS <= C;

			--determine next state if C
			when C =>

				--use inputs to set CS, RD, NS
				if(X2 = '0') then
					CS <= '0';
					RD <= '0';
					NS <= A;
				else
					CS <= '0';
					RD <= '1';
					NS <= C;
				end if;	

			--default to A and all 0s
			when others =>
				CS <= '0';
				RD <= '0';
				NS <= A;
		end case;
	end process comb_proc;

	--determine Y based on PS
	with PS select
		Y <= "001" when A,
		     "010" when B,
		     "100" when C,
		     "000" when others;
end exercise;
