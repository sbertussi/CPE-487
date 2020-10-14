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

entity my_not is
	port (A: in  std_logic;
	      B:    out std_logic);
end my_not;

architecture not_arch of my_not is
begin
	B <= NOT A;
end not_arch;

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
