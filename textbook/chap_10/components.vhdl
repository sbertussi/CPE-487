library IEEE;
use IEEE.std_logic_1164.all;

entity mux_21 is
	port (A, B: in  std_logic_vector(7 downto 0);
	      SEL:  in  std_logic;
	      C:    out std_logic_vector(7 downto 0));
end mux_21;

architecture mux_21_arch of mux_21 is
begin
	with SEL select
	C <= A when '1',
	     B when '0',
	     "00000000" when others;
end mux_21_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity reg is
	port (A:        in  std_logic_vector(7 downto 0);
	      LD, CLK:  in  std_logic;
	      B:        out std_logic_vector(7 downto 0));
end reg;

architecture reg_arch of reg is
begin
	process(CLK)
	begin
		if(rising_edge (CLK)) then
			if (LD = '1') then
				B <= A;
			end if;
		end if;
	end process;
end reg_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity decode_12 is
	port (A:        in  std_logic;
	      B:        out std_logic_vector(1 downto 0));
end decode_12;

architecture decode_12_arch of decode_12 is
begin
	with A select
	B <= "10" when '1',
	     "01" when '0',
	     "00" when others;
end decode_12_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity mux_41 is
	port (A, B, C, D: in  std_logic_vector(7 downto 0);
	      SEL:        in  std_logic_vector(1 downto 0);
	      E:          out std_logic_vector(7 downto 0));
end mux_41;

architecture mux_41_arch of mux_41 is
begin
	with SEL select
	E <= A when "11",
	     B when "10",
	     C when "01",
	     D when "00",
	     "00000000" when others;
end mux_41_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity not_reg is
	port (A:        in  std_logic_vector(7 downto 0);
	      LD, CLK:  in  std_logic;
	      B:        out std_logic_vector(7 downto 0));
end not_reg;

architecture not_reg_arch of not_reg is
begin
	process(CLK)
	begin
		if(falling_edge (CLK)) then
			if (LD = '1') then
				B <= A;
			end if;
		end if;
	end process;
end not_reg_arch;
