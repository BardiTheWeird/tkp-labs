library ieee; 
use ieee.std_logic_1164.all; 
 
entity jk_tb is end jk_tb; 
 
architecture tb of jk_tb is
    constant tick_duration : time := 153 ns / 2;
    constant clock_phase : time := tick_duration * 2;
    signal finished : boolean := false;

    signal pr_clr : std_logic_vector(0 to 1) := (others => '0');
    signal j_k : std_logic_vector(0 to 1) := (others => '0');
    signal clk : std_logic := '0';
    signal Q : std_logic := '0';
    signal Q_inv : std_logic := '1';
begin 
  
    -- Unit Under Test port map 
    UUT : entity work.jk(rtl)
    port map (
        pr_clr => pr_clr,
        j_k => j_k,
        clk => clk,
        Q => Q,
        Q_inv => Q_inv
    );

    clk <= not clk after tick_duration when finished /= true else '0';

    process begin
        wait for clock_phase / 4;
        while finished /= true loop
            j_k(0) <= not j_k(0);
            wait for clock_phase;
            j_k <= not j_k;
            wait for clock_phase;
        end loop;
        wait;
    end process;

    process begin
        pr_clr(0) <= '1';
        wait for clock_phase;
        -- assert(Q='1') report "Preset 1; Q != 1" severity error;
        -- assert(Q_inv='0') report "Preset 1; Q_inv != 0" severity error;
        wait for clock_phase * 3;
        
        pr_clr(0) <= '0';
        pr_clr(1) <= '1';
        wait for clock_phase;
        -- assert(Q='0') report "Clear 1; Q != 0" severity error;
        -- assert(Q_inv='1') report "Clear 1; Q_inv != 1" severity error;
        wait for clock_phase * 3;

        pr_clr(1) <= '0';
        wait for clock_phase * 2;
        -- assert(Q='1') report "J=1;K=0; Q != 1" severity error;
        wait for clock_phase;
        -- assert(Q='0') report "J=0;K=1; Q != 0" severity error;
        wait for clock_phase;
        -- assert(Q='1') report "J=1;K=1; Q != not(Q_old)" severity error;
        wait for clock_phase;

        finished <= true;
        assert false report "Test done" severity note;
        wait;
    end process;
end tb; 
 