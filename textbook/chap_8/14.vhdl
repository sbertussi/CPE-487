library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_14 is
	port( X1, X2, CLK:    in  std_logic;
	      Z1, Z2:	      out std_logic;
	      Y:	      out std_logic_vector (2 downto 0));
end fsm_14;

architecture exercise of fsm_14 is
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
				Z1 <= '0';
				if(X1 = '0') then
					Z2 <= '0';
					NS <= C;
				else
					Z2 <= '1';
					NS <= B;
				end if;	

			when B =>
				Z1 <= '1';
				if(X2 = '0') then
					Z2 <= '1';
					NS <= C;
				else
					Z2 <= '0';
					NS <= A;
				end if;	

			when C =>
				Z1 <= '1';
				if(X1 = '0') then
					Z2 <= '1';
					NS <= A;
				else
					Z2 <= '1';
					NS <= B;
				end if;	

			when others =>
				Z1 <= '0';
				Z2 <= '0';
				NS <= A;
		end case;
	end process comb_proc;

	with PS select
		Y <= "001" when A,
		     "010" when B,
		     "100" when C,
		     "000" when others;
end exercise;
