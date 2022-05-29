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
	constant setup_delay : time := width * 10 ns;
	constant hold_delay : time := setup_delay * 0.7;
begin
    o <= reject hold_delay inertial not or_reduce(in_vec) after setup_delay;
end architecture;
