entity f2_8 is
    port (
        a : in bit;
        b : in bit;
        c : in bit;
        o : out bit
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

architecture rtl of f2_8_tb is
    constant tick_length : integer := 5;

    signal a : bit := '0';
    signal b : bit := '0';
    signal c : bit := '0';
    signal o : bit := '0';

begin
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
