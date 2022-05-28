library ieee; 
use ieee.std_logic_1164.all; 
 
entity and2_tb is end and2_tb; 
 
architecture tb of and2_tb is
    constant tick_duration : time := 5 us;
    signal finished : boolean := false;

    component and2
        port(
            in_vec : in std_logic_vector(0 to 1);
            o : out std_logic
        );  
    end component;
    
    signal in_vec : std_logic_vector(0 to 1) := (others => '0');
    signal o : std_logic;
begin 
  
    -- Unit Under Test port map 
    UUT : and2
    port map (
        in_vec => in_vec, 
        o => o
    );

    in_vec(0) <= not in_vec(0) after tick_duration when finished /= true else '0';
    in_vec(1) <= not in_vec(1) after tick_duration * 2 when finished /= true else '0';

    process begin
        wait for 1 us;
        for i in 0 to 2 loop
            assert(o='0') report "Fail 0" severity error;            
            wait for tick_duration;
        end loop;
        assert(o='1') report "Fail 1" severity error;
        wait for tick_duration;

        finished <= true;
        assert false report "Test done" severity note;
        wait;
    end process;
end tb; 
 
configuration and2_tb_conf of and2_tb is
    for tb
        for UUT : and2
            use entity work.and2(rtl);
        end for;
    end for; 
end and2_tb_conf;
