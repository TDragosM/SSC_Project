
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity saa is
end entity;
architecture arh of saa is
component booth is
	port(clk: in std_logic;
		  multiplicand: in std_logic_vector(23 downto 0);
		  multiplier: in std_logic_vector(23 downto 0);
		  rez: out std_logic_vector(47 downto 0)
		  );
	
end component;
signal clk:std_logic;
signal init: std_logic;
signal multiplicand , multiplier: std_logic_vector(23 downto 0);
signal rez: std_logic_vector(47 downto 0);
constant CLK_PERIOD : time := 20 ns;
begin
clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
   end process;
stimul: process
begin
init<='1'; multiplicand <="001001000000000000000000"; multiplier <= "000000000000000000000010"; wait for 5000 NS;

wait;
end process;
SAAEX: booth port map(clk => clk, multiplicand => multiplicand, multiplier => multiplier, rez => rez);

end architecture;
