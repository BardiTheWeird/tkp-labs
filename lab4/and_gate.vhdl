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
	constant setup_delay : time := width * 10 ns;
	constant hold_delay : time := setup_delay * 0.7;
begin
    o <= reject hold_delay inertial and_reduce(in_vec) after setup_delay;
end architecture;
