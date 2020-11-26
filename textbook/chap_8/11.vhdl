library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_11 is
	port( X1, X2, CLK:    in  std_logic;
	      Z:	      out std_logic;
	      Y:	      out std_logic_vector (2 downto 0));
end fsm_11;

--implementation of FEM as shown in textbook illustration
architecture exercise of fsm_11 is
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
		Z <= '0';
		case PS is
			--determine next state if at A
			when A =>
				--determine Z and NS based on inputs
				if(X1 = '0') then
					Z <= '1';
					NS <= B;
				else
					Z <= '1';
					NS <= C;
				end if;	

			--determine next state if at B
			when B =>
				--determine Z and NS based on inputs
				if(X1 = '0') then
					Z <= '0';
					NS <= C;
				else
					Z <= '0';
					NS <= B;
				end if;	

			--determine next state if at C
			when C =>
				--determine Z and NS based on inputs
				if(X2 = '0') then
					Z <= '0';
					NS <= A;
				else
					Z <= '1';
					NS <= C;
				end if;	

			--default to A and all 0s
			when others =>
				Z <= '0';
				NS <= A;
		end case;
	end process comb_proc;

	--set Y based on present state
	with PS select
		Y <= "001" when A,
		     "010" when B,
		     "100" when C,
		     "000" when others;
end exercise;

--NOT: Assuming typo and X1/X2 inputs
