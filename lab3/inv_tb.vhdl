library IEEE; 
use IEEE.std_logic_1164.all; 
 
entity inv_tb is end inv_tb; 
 
architecture tb of inv_tb is
    constant tick_duration : time := 5 us;

    component inv
        port(
            a : in std_logic;
            o : out std_logic
        );  
    end component;
    
    signal a : std_logic;
    signal o : std_logic;
begin 
  
    -- Unit Under Test port map 
    UUT : inv
    port map (
        a => a, 
        o => o 
    );

    process begin
        a <= '0'; wait for tick_duration;
        assert(o='1') report "Fail 0" severity error;

        a <= '1'; wait for tick_duration;
        assert(o='0') report "Fail 1" severity error;

        assert false report "Test done" severity note;
        wait;
    end process;

  
end tb; 
 
configuration inv_tb_conf of inv_tb is
    for tb
        for UUT : inv
            use entity work.inv(rtl);
        end for;
    end for; 
end inv_tb_conf;
