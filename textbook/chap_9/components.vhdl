library IEEE;
use IEEE.std_logic_1164.all;

--these are the components used throughout the exercises for this chapter

--AND gate component--
entity my_and is
	port (A, B: in  std_logic; --two input signals to the gate
	      C:    out std_logic); --output signal
end my_and;

architecture and_arch of my_and is
begin
	C <= A AND B; --A*B=C
end and_arch;

library IEEE;
use IEEE.std_logic_1164.all;

--OR gate component--
entity my_or is
	port (A, B: in  std_logic; --two input signals to the gate
	      C:    out std_logic); --output signal
end my_or;

architecture or_arch of my_or is
begin
	C <= A OR B; --A+B=C
end or_arch;

library IEEE;
use IEEE.std_logic_1164.all;

--OR gate with four inputs--
entity my_4_or is
	port (A, B, C, D: in  std_logic; --four inputs to gate
	      E:          out std_logic); --output signal
end my_4_or;

architecture or_4_arch of my_4_or is
begin
	E <= A OR B OR C OR D; --A+B+C+D=E
end or_4_arch;

library IEEE;
use IEEE.std_logic_1164.all;

--NAND gate component --
entity my_nand is
	port (A, B: in  std_logic; --two input signals
	      C:    out std_logic); --output signal
end my_nand;

architecture nand_arch of my_nand is
begin
	C <= NOT(A AND B); --(AB)'=C
end nand_arch;

library IEEE;
use IEEE.std_logic_1164.all;

--OR gate with input signals inversed--
entity my_nnor is
	port (A, B: in  std_logic; --two input signals
	      C:    out std_logic); --output signal
end my_nnor;

architecture nnor_arch of my_nnor is
begin
	C <= NOT(A) OR NOT(B); --A'+B'=C
end nnor_arch;

library IEEE;
use IEEE.std_logic_1164.all;

--3:8 decoder--
entity my_decode_3_8 is
	port (A, B, C: in  std_logic; --3 1-bit input signals
	      D:       out std_logic_vector(7 downto 0)); --8-bit output signal
end my_decode_3_8;

architecture decode_3_8_arch of my_decode_3_8 is
	signal SEL: std_logic_vector (2 downto 0); --3-bit selection signal
begin
	SEL <= A & B & C; --concatonate A, B, and C into selection signal (SEL)

	--select output D based on SEL
	with SEL select
	D <= "10000000" when "111",
	     "01000000" when "110",
	     "00100000" when "101",
	     "00010000" when "100",
	     "00001000" when "011",
	     "00000100" when "010",
	     "00000010" when "001",
	     "00000001" when "000",
	     "00000000" when others;	
end decode_3_8_arch;
