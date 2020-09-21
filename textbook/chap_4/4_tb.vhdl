library IEEE;
use IEEE.std_logic_1164.all;

entity ex_4_tb is
end ex_4_tb;

architecture test of ex_4_tb is
	component ex_4		port
		(
			input:	in	std_logic_vector (7 downto 0);
			F:	out	std_logic_vector (0 downto 0)
		);
	end component;

	signal input: std_logic_vector (7 downto 0);
	signal F:     std_logic_vector (0 downto 0);

	type range_a is range 0 to 1;
	type range_b is range 0 to 1;
	type range_c is range 0 to 1;
	type range_d is range 0 to 1;
	type range_e is range 0 to 1;
	type range_g is range 0 to 1;
	type range_h is range 0 to 1;
	type range_i is range 0 to 1;

begin
	exercise: ex_4 port map (input => input, F => F);

	process begin

		for a in range_a loop
			if a = 0 then
				input(0) <= '0';
			else
				input(0) <= '1';
			end if;

			for b in range_b loop
				if b = 0 then
					input(1) <= '0';
				else
					input(1) <= '1';
				end if;

				for c in range_c loop
					if c = 0 then
						input(2) <= '0';
					else
						input(2) <= '1';
					end if;

					for d in range_d loop
						if d = 0 then
							input(3) <= '0';
						else
							input(3) <= '1';
						end if;

						for e in range_e loop
							if e = 0 then
								input(4) <= '0';
							else
								input(4) <= '1';
							end if;

							for g in range_g loop
								if g = 0 then
									input(5) <= '0';
								else
									input(5) <= '1';
								end if;

								for h in range_h loop
									if h = 0 then
										input(6) <= '0';
									else
										input(6) <= '1';
									end if;

									for i in range_i loop
										if i = 0 then
											input(7) <= '0';
										else
											input(7) <= '1';
										end if;
										wait for 1 ns;
									end loop;
								end loop;
							end loop;
						end loop;
					end loop;
				end loop;
			end loop;
		end loop;
        report "1" severity error;
wait;

	end process;
		

end test;
