library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity nor3 is
	port (
		in_vec : in std_logic_vector(0 to 2);
		o : out std_logic
	);
end nor3;

architecture rtl of nor3 is
begin
    o <= not or_reduce(in_vec);
end architecture;
