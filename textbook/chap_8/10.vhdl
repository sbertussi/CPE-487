library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_10 is
	port( X, CLK:    in  std_logic;
	      Z:	 out std_logic;
	      Y:	 out std_logic_vector (2 downto 0));
end fsm_10;

--implementation of FEM as shown in textbook illustration
architecture exercise of fsm_10 is
	type state_type is (A, B, C);
	signal PS, NS: state_type; -- PS = present state, NS = next state

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
		Z <= '0';
		case PS is
			--determine next state if at A
			when A =>
				--output variable
				--A always goest to B, regardless of input
				Z <= '1';
				NS <= B;

			--determine next state if at B
			when B =>
				--determine output and NS based on input
				if(X = '0') then
					Z <= '0';
					NS <= A;
				else
					Z <= '0';
					NS <= C;
				end if;	

			--determine next state if at C
			when C =>
				--output variable
				--C always goes to A, regardless of input
				Z <= '1';
				NS <= A;

			--default to A and all 0s
			when others =>
				Z <= '0';
				NS <= A;
		end case;
	end process comb_proc;

	--set Y based on state
	with PS select
		Y <= "100" when A,
		     "010" when B,
		     "001" when C,
		     "000" when others;
end exercise;

--NOTE: Assuming typo so X' goes from B to A
