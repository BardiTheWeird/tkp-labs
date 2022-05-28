library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity and3 is
	port (
		in_vec : in std_logic_vector(0 to 2);
		o : out std_logic
	);
end and3;

architecture rtl of and3 is
begin
    o <= and_reduce(in_vec);
end architecture;
