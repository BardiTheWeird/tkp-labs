library ieee; 
use ieee.std_logic_1164.all;

entity inv is
    port (
        a : in std_logic;
        o : out std_logic
    );
end inv;

architecture rtl of inv is
begin
    o <= not a;
end architecture;
