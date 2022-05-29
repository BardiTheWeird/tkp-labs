library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity and_gate is
	generic (
		width : integer
	);
	port (
		in_vec : in std_logic_vector(0 to width-1);
		o : out std_logic
	);
end and_gate;

architecture rtl of and_gate is
begin
    o <= and_reduce(in_vec);
end architecture;
