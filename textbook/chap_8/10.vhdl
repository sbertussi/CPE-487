library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_10 is
	port( X, CLK:    in  std_logic;
	      Z:	 out std_logic;
	      Y:	 out std_logic_vector (2 downto 0));
end fsm_10;

architecture exercise of fsm_10 is
	type state_type is (A, B, C);
	signal PS, NS: state_type;

begin
	sync_proc: process (CLK, NS)
	begin
		if(rising_edge(CLK)) then PS <= NS;
		end if;
	end process sync_proc;

	comb_proc: process (PS, X)
	begin
		Z <= '0';
		case PS is
			when A =>
				Z <= '1';
				NS <= B;

			when B =>
				if(X = '0') then
					Z <= '0';
					NS <= A;
				else
					Z <= '0';
					NS <= C;
				end if;	

			when C =>
				Z <= '1';
				NS <= A;

			when others =>
				Z <= '0';
				NS <= A;
		end case;
	end process comb_proc;

	with PS select
		Y <= "100" when A,
		     "010" when B,
		     "001" when C,
		     "000" when others;
end exercise;

--NOTE: Assuming typo so X' goes from B to A
