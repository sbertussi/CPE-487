library IEEE;
use IEEE.std_logic_1164.all;

entity my_and is
	port (A, B: in  std_logic;
	      C:    out std_logic);
end my_and;

architecture and_arch of my_and is
begin
	C <= A AND B;
end and_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity my_or is
	port (A, B: in  std_logic;
	      C:    out std_logic);
end my_or;

architecture or_arch of my_or is
begin
	C <= A OR B;
end or_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity my_4_or is
	port (A, B, C, D: in  std_logic;
	      E:          out std_logic);
end my_4_or;

architecture or_4_arch of my_4_or is
begin
	E <= A OR B OR C OR D;
end or_4_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity my_nand is
	port (A, B: in  std_logic;
	      C:    out std_logic);
end my_nand;

architecture nand_arch of my_nand is
begin
	C <= NOT(A AND B);
end nand_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity my_nnor is
	port (A, B: in  std_logic;
	      C:    out std_logic);
end my_nnor;

architecture nnor_arch of my_nnor is
begin
	C <= NOT(A) OR NOT(B);
end nnor_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity my_decode_3_8 is
	port (A, B, C: in  std_logic;
	      D:       out std_logic_vector(7 downto 0));
end my_decode_3_8;

architecture decode_3_8_arch of my_decode_3_8 is
	signal SEL: std_logic_vector (2 downto 0);
begin
	SEL <= A & B & C;

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
