library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_12 is
	port( X1, X2, CLK:    in  std_logic;
	      Z1, Z2:	      out std_logic;
	      Y:	      out std_logic_vector (1 downto 0));
end fsm_12;

architecture exercise of fsm_12 is
	type state_type is (A, B, C);
	signal PS, NS: state_type;

begin
	sync_proc: process (CLK, NS)
	begin
		if(rising_edge(CLK)) then PS <= NS;
		end if;
	end process sync_proc;

	comb_proc: process (PS, X1, X2)
	begin
		Z1 <= '0';
		Z2 <= '0';
		case PS is
			when A =>
				Z2 <= '1';

				if(X1 = '0') then
					Z1 <= '0';
					NS <= A;
				else
					Z1 <= '1';
					NS <= B;
				end if;	

			when B =>
				Z2 <= '0';

				if(X2 = '0') then
					Z1 <= '1';
					NS <= C;
				else
					Z1 <= '0';
					NS <= A;
				end if;	

			when C =>
				Z2 <= '1';

				if(X2 = '0') then
					Z1 <= '0';
					NS <= A;
				else
					Z1 <= '1';
					NS <= C;
				end if;	

			when others =>
				Z1 <= '0';
				Z2 <= '0';
				NS <= A;
		end case;
	end process comb_proc;

	with PS select
		Y <= "11" when A,
		     "01" when B,
		     "00" when C,
		     "00" when others;
end exercise;

--NOT: Assuming typo and X1/X2 inputs
