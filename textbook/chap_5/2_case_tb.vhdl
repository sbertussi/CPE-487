library IEEE;
use IEEE.std_logic_1164.all;

entity ex_2_case_tb is
end ex_2_case_tb;

architecture test of ex_2_case_tb is
	component ex_2_case
		port
		(
			A_1, A_2, B_1, B_2, D_1: 	in	std_logic;
			E_out:				out	std_logic
		);
	end component;

	signal A_1, A_2, B_1, B_2, D_1: std_logic;
	signal E_out:			std_logic;

	type range_a is range 0 to 1;
	type range_b is range 0 to 1;
	type range_c is range 0 to 1;
	type range_d is range 0 to 1;
	type range_e is range 0 to 1;

begin
	--signals as defined in problem statement
	--cycles through all possible combinations of the five input signals
	exercise: ex_2_case port map (A_1 => A_1, A_2 => A_2, B_1 => B_1, B_2 => B_2, D_1 => D_1, E_out => E_out);

	process begin

		for a in range_a loop
			if a = 0 then
				A_1 <= '0';
			else
				A_1 <= '1';
			end if;

			for b in range_b loop
				if b = 0 then
					A_2 <= '0';
				else
					A_2 <= '1';
				end if;

				for c in range_c loop
					if c = 0 then
						B_1 <= '0';
					else
						B_1 <= '1';
					end if;

					for d in range_d loop
						if d = 0 then
							B_2 <= '0';
						else
							B_2 <= '1';
						end if;

						for e in range_e loop
							if e = 0 then
								D_1 <= '0';
							else
								D_1 <= '1';
							end if;

							wait for 1 ns;

						end loop;
					end loop;
				end loop;
			end loop;
		end loop;
        report "1" severity error;
	end process;
		

end test;
