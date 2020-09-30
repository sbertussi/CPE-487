library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_6 is
	port( X, CLK:    in  std_logic;
	      Z1, Z2:    out std_logic;
	      Y:	 out std_logic_vector (1 downto 0));
end fsm_6;

architecture exercise of fsm_6 is
	type state_type is (A, B, C, D);
	signal PS, NS: state_type;

begin
	sync_proc: process (CLK, NS)
	begin
		if(rising_edge(CLK)) then PS <= NS;
		end if;
	end process sync_proc;

	comb_proc: process (PS, X)
	begin
		Z1 <= '0';
		Z2 <= '0';
		case PS is
			when A =>
				Z1 <= '1';

				if(X = '0') then
					Z2 <= '0';
					NS <= B;
				else
					Z2 <= '0';
					NS <= A;
				end if;

			when B =>
				Z1 <= '1';

				if(X = '0') then
					Z2 <= '0';
					NS <= C;
				else
					Z2 <= '0';
					NS <= A;
				end if;

			when C =>
				Z1 <= '0';

				if(X = '0') then
					Z2 <= '0';
					NS <= D;
				else
					Z2 <= '0';
					NS <= C;
				end if;

			when D =>
				Z1 <= '0';

				if(X = '0') then
					Z2 <= '1';
					NS <= A;
				else
					Z2 <= '0';
					NS <= C;
				end if;


			when others =>
				Z1 <= '0';
				Z2 <= '0';
				NS <= A;
		end case;
	end process comb_proc;

	with PS select
		Y <= "00" when A,
		     "10" when B,
		     "01" when C,
		     "11" when D,
		     "00" when others;
end exercise;
