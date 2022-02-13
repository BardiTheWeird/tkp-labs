entity f1_5 is
	port (
		a : in bit;
		b : in bit;
		c : in bit;
		o : out bit
	);
end f1_5;

architecture rtl of f1_5 is
begin
	o <= not (not a or not b) and c;
end architecture;

entity f1_5_tb is end f1_5_tb;

architecture rtl of f1_5_tb is
	constant tick_duration : time := 5 us;
	signal finished : boolean := false;
	signal in_a : bit := '0';
	signal in_b : bit := '0';
	signal in_c : bit := '0';
	signal f_o : bit := '0';
begin
	f : entity work.f1_5(rtl)
	port map (
		a => in_a,
		b => in_b,
		c => in_c,
		o => f_o	
		); 
		
	in_a <= not in_a after tick_duration when finished /= true else '0';
	in_b <= not in_b after tick_duration * 2 when finished /= true else '0';
	in_c <= not in_c after tick_duration * 4 when finished /= true else '0';
	
	process begin
		wait for tick_duration * 8;
		finished <= true;
		wait;
	end process;
end architecture;
