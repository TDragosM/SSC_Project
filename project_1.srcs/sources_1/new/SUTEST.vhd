----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 11:21:38 AM
-- Design Name: 
-- Module Name: SUTEST - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SUTEST is
--  Port ( );
end SUTEST;

architecture Behavioral of SUTEST is
component  multiplier is
   Port ( x : in  STD_LOGIC_VECTOR (31 downto 0);
          y : in  STD_LOGIC_VECTOR (31 downto 0);
          z : out  STD_LOGIC_VECTOR (31 downto 0));

end component;
signal clk:  std_logic;
signal a , b , rez : std_logic_vector(31 downto 0);
constant CLK_PERIOD : time := 20 ns;

component fp_adder is
  port(A      : in  std_logic_vector(31 downto 0);
       B      : in  std_logic_vector(31 downto 0);
       clk    : in  std_logic;
       reset  : in  std_logic;
       start  : in  std_logic;
       done   : out std_logic;
       sum : out std_logic_vector(31 downto 0)
       );
end component;
signal reset: std_logic;
signal start: std_logic;
signal done: std_logic;
signal sum: std_logic_vector(31 downto 0);
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
a <= "01000101010101100001001101011100";--10.112
b <= "11000001010000000000010000011001";--14.0103
reset <= '0';
start <= '1';


wait for 5000 NS;

wait;
end process;
SUEX: multiplier port map(a,b,rez);
SUMEX: fp_adder port map(a,b,clk,reset,start,done,sum);
end Behavioral;
