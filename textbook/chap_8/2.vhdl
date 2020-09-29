library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_2 is
	port( X1, X2, CLK:    in  std_logic;
	      Y0, Y1, Z:      out std_logic);
end fsm_2;

architecture exercise of fsm_2 is
--	type state_type is (A, B, C);
--	signal PS, NS: state_type;
	signal PS, NS: std_logic_vector (1 downto 0);

begin
	sync_proc: process (CLK, NS)
	begin
		if(rising_edge(CLK)) then PS <= NS;
		end if;
	end process sync_proc;

	comb_proc: process (PS, X1, X2)
	begin
		Y0 <= '0';
		Y1 <= '0';
		Z  <= '0';
		case PS is
			when "10" => --A
				Y1 <= '1';
				Y0 <= '0';

				if(X1 = '0') then
					Z <= '0';
					NS <= "10";--A
				else
					Z <= '0';
					NS <= "01"; --C
				end if;

			when "11" => --B
				Y1 <= '1';
				Y0 <= '1';

				if(X2 = '0') then
					Z <= '1';
					NS <= "10";--A
				else
					Z <= '0';
					NS <= "11";--B
				end if;

			when "01" => --c
				Y1 <= '0';
				Y0 <= '1';

				if(X2 = '0') then
					Z <= '1';
					NS <= "10";--a
				else
					Z <= '0';
					NS <= "11";--b
				end if;

			when others =>
				Y0 <= '0';
				Y1 <= '0';
				Z  <= '0';
				NS <= "10";--a
		end case;
	end process comb_proc;
end exercise;
