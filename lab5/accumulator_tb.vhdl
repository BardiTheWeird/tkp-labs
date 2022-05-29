library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;

entity accumulator_tb is end accumulator_tb;

architecture tb of accumulator_tb is
    constant width : integer := 4;
    
    constant tick_duration : time := 100 ns;
    constant clock_phase : time := tick_duration * 2;
    signal finished : boolean := false;

    signal clk : std_logic := '0';
    signal in_vec : std_logic_vector(0 to width-1) := (others => '0');
    signal out_vec : std_logic_vector(0 to width-1) := (others => '0');
begin
    -- Unit Under Test port map 
    UUT : entity work.accumulator(rtl)
    generic map (
        width => width
    )
    port map (
        in_vec => in_vec,
        clk => clk,
        out_vec => out_vec
    );

    process
    begin
        wait for tick_duration;
        clk <= not clk;
        if finished then wait; end if;
    end process;

    process
    begin
        wait for tick_duration / 4;
        
        wait for clock_phase;
        in_vec <= "0001";
        wait for clock_phase;
        assert(out_vec="0001") report "Failed Test 1" severity error; 

        in_vec <= "0010";
        wait for clock_phase;
        assert(out_vec="0011") report "Failed Test 2" severity error; 

        in_vec <= "0100";
        wait for clock_phase;
        assert(out_vec="0111") report "Failed Test 3" severity error; 

        in_vec <= "1000";
        wait for clock_phase;
        assert(out_vec="1111") report "Failed Test 4" severity error; 

        in_vec <= "0001";
        wait for clock_phase;
        assert(out_vec="0000") report "Failed Test 5" severity error; 

        assert false report "Test done" severity note;
        finished <= true;
        wait;
    end process;
end architecture;
