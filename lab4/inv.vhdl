library ieee; 
use ieee.std_logic_1164.all;

entity inv is
    port (
        a : in std_logic;
        o : out std_logic
    );
end inv;

architecture rtl of inv is
    constant setup_delay : time := 10 ns;
    constant hold_delay : time := setup_delay * 0.7;
begin
    o <= reject hold_delay inertial not a after setup_delay;
end architecture;
