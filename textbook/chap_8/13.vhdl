library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_13 is
	port( X1, X2, CLK:    in  std_logic;
	      CS, RD:	      out std_logic;
	      Y:	      out std_logic_vector (2 downto 0));
end fsm_13;

architecture exercise of fsm_13 is
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
		CS <= '0';
		RD <= '0';
		case PS is
			when A =>

				if(X1 = '0') then
					CS <= '0';
					RD <= '1';
					NS <= B;
				else
					CS <= '1';
					RD <= '0';
					NS <= C;
				end if;	

			when B =>

				CS <= '1';
				RD <= '1';
				NS <= C;

			when C =>

				if(X2 = '0') then
					CS <= '0';
					RD <= '0';
					NS <= A;
				else
					CS <= '0';
					RD <= '1';
					NS <= C;
				end if;	

			when others =>
				CS <= '0';
				RD <= '0';
				NS <= A;
		end case;
	end process comb_proc;

	with PS select
		Y <= "001" when A,
		     "010" when B,
		     "100" when C,
		     "000" when others;
end exercise;
