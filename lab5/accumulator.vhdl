library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity accumulator is
    generic (
        width : integer
    );
    port (
        in_vec : in std_logic_vector(0 to width-1);
        clk : in std_logic;
        out_vec : out std_logic_vector(0 to width-1)
    );
end accumulator;

architecture rtl of accumulator is
    signal out_sig : std_logic_vector(0 to width-1) := (others => '0');
begin
    out_vec <= out_sig;

    process
    begin
        wait until falling_edge(clk);
        out_sig <= in_vec + out_sig;
    end process;
end architecture;
