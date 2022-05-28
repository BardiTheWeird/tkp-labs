library ieee; 
use ieee.std_logic_1164.all;

entity jk is
    port (
        pr_clr : in std_logic_vector(0 to 1);
        j_k : in std_logic_vector(0 to 1);
        clk : in std_logic;
        Q : out std_logic;
        Q_inv : out std_logic
    );
end jk;

architecture rtl of jk is

    component inv
    port (
        a : in std_logic;
        o : out std_logic
    );
    end component;

    component and2
    port (
        in_vec : in std_logic_vector(0 to 1);
        o : out std_logic
    );
    end component;

    component and3
    port (
        in_vec : in std_logic_vector(0 to 2);
        o : out std_logic
    );
    end component;

    component nor3
    port (
        in_vec : in std_logic_vector(0 to 2);
        o : out std_logic
    );
    end component;

    signal clk_inv : std_logic;
    signal Q_m  : std_logic;
    signal Q_m_inv  : std_logic;

    signal and1_o : std_logic;
    signal and2_o : std_logic;
    signal and3_o : std_logic;
    signal and4_o : std_logic;

    signal and1_in_vec : std_logic_vector(0 to 2) := (others => '0');
    signal and2_in_vec : std_logic_vector(0 to 2) := (others => '0');
    signal and3_in_vec : std_logic_vector(0 to 1) := (others => '0');
    signal and4_in_vec : std_logic_vector(0 to 1) := (others => '0');
    signal nor1_in_vec : std_logic_vector(0 to 2) := (others => '0');
    signal nor2_in_vec : std_logic_vector(0 to 2) := (others => '0');
    signal nor3_in_vec : std_logic_vector(0 to 2) := (others => '0');
    signal nor4_in_vec : std_logic_vector(0 to 2) := (others => '0');
begin
    clk_inv <= not clk;

    and1_in_vec <= (0 => Q, 1 => j_k(1), 2 => clk);
    and2_in_vec <= (0 => Q_inv, 1 => j_k(0), 2 => clk);
    and3_in_vec <= (0 => Q_m_inv, 1 => clk_inv);
    and4_in_vec <= (0 => Q_m, 1 => clk_inv);
    nor1_in_vec <= (0 => pr_clr(1), 1 => Q_m_inv, 2 => and1_o);
    nor2_in_vec <= (0 => pr_clr(0), 1 => Q_m, 2 => and2_o);
    nor3_in_vec <= (0 => pr_clr(1), 1 => Q_inv, 2 => and3_o);
    nor4_in_vec <= (0 => pr_clr(0), 1 => Q, 2 => and4_o);

    and1_instance : and3
    port map (
        in_vec => and1_in_vec,
        o => and1_o
    );
    and2_instance : and3
    port map (
        in_vec => and2_in_vec,
        o => and2_o
    );
    and3_instance : and2
    port map (
        in_vec => and3_in_vec,
        o => and3_o
    );
    and4_instance : and2
    port map (
        in_vec => and4_in_vec,
        o => and4_o
    );

    nor1_instance : nor3
    port map (
        in_vec => nor1_in_vec,
        o => Q_m
    );
    nor2_instance : nor3
    port map (
        in_vec => nor2_in_vec,
        o => Q_m_inv
    );
    nor3_instance : nor3
    port map (
        in_vec => nor3_in_vec,
        o => Q
    );
    nor4_instance : nor3
    port map (
        in_vec => nor4_in_vec,
        o => Q_inv
    );

end architecture;

configuration jk_conf of jk is
    for rtl
        for and1_instance : and3
            use entity work.and3(rtl);
        end for;
        for and2_instance : and3
            use entity work.and3(rtl);
        end for;
        for and3_instance : and2
            use entity work.and2(rtl);
        end for;
        for and4_instance : and2
            use entity work.and2(rtl);
        end for;
        for nor1_instance : nor3
            use entity work.nor3(rtl);
        end for;
        for nor2_instance : nor3
            use entity work.nor3(rtl);
        end for;
        for nor3_instance : nor3
            use entity work.nor3(rtl);
        end for;
        for nor4_instance : nor3
            use entity work.nor3(rtl);
        end for;
    end for; 
end jk_conf;
