library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity f2_8 is
    port (
        a : in std_logic;
        b : in std_logic;
        c : in std_logic;
        o : out std_logic
    );
end f2_8;

architecture rtl of f2_8 is
begin
    o <= not (c and b) and not a;
end architecture;


entity f2_8_tb is
end f2_8_tb;

library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

architecture rtl of f2_8_tb is
    constant tick_length : integer := 5;

    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal c : std_logic := '0';
    signal o : std_logic := '0';

    signal val_vector : std_logic_vector(0 to 3) := ('0', '0', '0', '0');
begin
    val_vector(0) <= a;
    val_vector(1) <= b;
    val_vector(2) <= c;
    val_vector(3) <= o;

    -- output truth table
    -- doesn't really work as it prints twice if output changes too
    -- process (val_vector)
    --     variable l : line;
    -- begin
    --     write (l, val_vector);
    --     writeline (output, l);
    -- end process;

    F : entity work.f2_8(rtl)
    port map (
        a => a,
        b => b,
        c => c,
        o => o
    );

    -- change a
    process
        variable l : line;
    begin
        wait for 5 us;
        for i in 0 to 7 loop
            a <= not a;
            wait for 5 us;
        end loop;
        wait;
    end process;

    -- change b
    process
    begin
        wait for 5 * 2 us;
        for i in 0 to 3 loop
            b <= not b;
            wait for 5 * 2 us;
        end loop;
        wait;
    end process;

    -- change c
    process
    begin
        wait for 5 * 4 us;
        c <= not c;
        wait for 5 * 4 us;
        wait;
    end process;

end architecture;
