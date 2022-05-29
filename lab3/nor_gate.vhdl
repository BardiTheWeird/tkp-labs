library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity nor_gate is
	generic (
		width : integer
	);
	port (
		in_vec : in std_logic_vector(0 to width-1);
		o : out std_logic
	);
end nor_gate;

architecture rtl of nor_gate is
begin
    o <= not or_reduce(in_vec);
end architecture;
