library ieee;
use ieee.std_logic_1164.all;

entity inv_3out_cd is
	port (
		x_vec : in std_logic_vector(0 to 7);
		y_vec: out std_logic_vector(0 to 2)
	);
end inv_3out_cd;

architecture rtl of inv_3out_cd is
begin
	process(x_vec) begin
		case x_vec is
			when "01111111" => y_vec <= "000";
			when "10111111" => y_vec <= "100";
			when "11011111" => y_vec <= "010";
			when "11101111" => y_vec <= "110";
			when "11110111" => y_vec <= "001";
			when "11111011" => y_vec <= "101";
			when "11111101" => y_vec <= "011";
			when "11111110" => y_vec <= "111";
			when others => y_vec <= "ZZZ";
		end case;
	end process;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity inv_3out_cd_tb is end inv_3out_cd_tb;

architecture rtl of inv_3out_cd_tb is
	signal input_vec: std_logic_vector(0 to 7) := (others => '1');
	signal output_vec: std_logic_vector(0 to 2);
	constant tick_duration : time := 5 us;
begin
	cd : entity work.inv_3out_cd(rtl)
	port map (
		x_vec => input_vec,
		y_vec => output_vec
		);
	
	
	process begin
		input_vec(0) <= '0', '1' after tick_duration;
		wait for tick_duration;
		input_vec(1) <= '0', '1' after tick_duration;
		wait for tick_duration;
		input_vec(2) <= '0', '1' after tick_duration;
		wait for tick_duration;
		input_vec(3) <= '0', '1' after tick_duration;
		wait for tick_duration;
		input_vec(4) <= '0', '1' after tick_duration;
		wait for tick_duration;
		input_vec(5) <= '0', '1' after tick_duration;
		wait for tick_duration;
		input_vec(6) <= '0', '1' after tick_duration;
		wait for tick_duration;
		input_vec(7) <= '0', '1' after tick_duration;
		wait;
	end process;
end architecture;
