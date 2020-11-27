--these are the components coded for this chapter

library IEEE;
use IEEE.std_logic_1164.all;

--2:1 MUX--
entity mux_21 is
	port (A, B: in  std_logic_vector(7 downto 0); --two 8-bit input signals
	      SEL:  in  std_logic; --selection input
	      C:    out std_logic_vector(7 downto 0)); --8-bit output signal
end mux_21;

architecture mux_21_arch of mux_21 is
begin
	--use SEL to identify output
	with SEL select
	C <= A when '1',
	     B when '0',
	     "00000000" when others;
end mux_21_arch;

library IEEE;
use IEEE.std_logic_1164.all;

--Register--
entity reg is
	port (A:        in  std_logic_vector(7 downto 0); --input data to register
	      LD, CLK:  in  std_logic; --LD = load signal; CLK = clock signal
	      B:        out std_logic_vector(7 downto 0)); --output data from register
end reg;

architecture reg_arch of reg is
begin
	process(CLK)
	begin
		--on the rising edge of the clock, transfer data if load signal is 1
		if(rising_edge (CLK)) then
			if (LD = '1') then
				B <= A;
			end if;
		end if;
	end process;
end reg_arch;

library IEEE;
use IEEE.std_logic_1164.all;

--1:2 Decoder--
entity decode_12 is
	port (A:        in  std_logic; --input signal
	      B:        out std_logic_vector(1 downto 0)); --output signals
end decode_12;

architecture decode_12_arch of decode_12 is
begin
	--based on A, define output
	with A select
	B <= "10" when '1',
	     "01" when '0',
	     "00" when others;
end decode_12_arch;

library IEEE;
use IEEE.std_logic_1164.all;

--4:1 MUX
entity mux_41 is
	port (A, B, C, D: in  std_logic_vector(7 downto 0); --4 8-bit input signals
	      SEL:        in  std_logic_vector(1 downto 0); --2-bit selection signal
	      E:          out std_logic_vector(7 downto 0)); --8-bit output signal
end mux_41;

architecture mux_41_arch of mux_41 is
begin
	--using selection signal, define output
	with SEL select
	E <= A when "11",
	     B when "10",
	     C when "01",
	     D when "00",
	     "00000000" when others;
end mux_41_arch;

library IEEE;
use IEEE.std_logic_1164.all;

--Register that loads on falling signal--
entity not_reg is
	port (A:        in  std_logic_vector(7 downto 0); --8-bit input signal
	      LD, CLK:  in  std_logic; --LD = load signal; CLK = clock signal
	      B:        out std_logic_vector(7 downto 0)); --8-bit output signal
end not_reg;

architecture not_reg_arch of not_reg is
begin
	process(CLK)
	begin
		--pass data if falling edge of clock and load signal is 1
		if(falling_edge (CLK)) then
			if (LD = '1') then
				B <= A;
			end if;
		end if;
	end process;
end not_reg_arch;
