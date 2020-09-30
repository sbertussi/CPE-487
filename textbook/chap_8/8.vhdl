library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_8 is
	port( X, CLK:    in  std_logic;
	      Z1, Z2:    out std_logic;
	      Y:	 out std_logic_vector (2 downto 0));
end fsm_8;

architecture exercise of fsm_8 is
	type state_type is (A, B, C, D, E, F, G, H);
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
				Z1 <= '0';
				Z2 <= '0';

				if(X = '0') then
					NS <= A;
				else
					NS <= B;
				end if;

			when B =>
				Z1 <= '0';
				Z2 <= '0';

				if(X = '0') then
					NS <= B;
				else
					NS <= C;
				end if;

			when C =>
				Z1 <= '0';
				Z2 <= '0';

				if(X = '0') then
					NS <= C;
				else
					NS <= D;
				end if;

			when D =>
				Z1 <= '1';
				Z2 <= '0';

				if(X = '0') then
					NS <= D;
				else
					NS <= E;
				end if;

			when E =>
				Z1 <= '0';
				Z2 <= '1';

				if(X = '0') then
					NS <= A;
				else
					NS <= F;
				end if;

			when F =>
				Z1 <= '1';
				Z2 <= '1';

				if(X = '0') then
					NS <= F;
				else
					NS <= G;
				end if;

			when G =>
				Z1 <= '1';
				Z2 <= '1';

				if(X = '0') then
					NS <= G;
				else
					NS <= H;
				end if;

			when H =>
				Z1 <= '1';
				Z2 <= '1';

				if(X = '0') then
					NS <= H;
				else
					NS <= A;
				end if;

			when others =>
				Z1 <= '0';
				Z2 <= '0';
				NS <= A;
		end case;
	end process comb_proc;

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
