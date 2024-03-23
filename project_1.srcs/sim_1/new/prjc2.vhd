----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2023 05:27:33 PM
-- Design Name: 
-- Module Name: prjc2 - Behavioral
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

entity prjc2 is
--  Port ( );
end prjc2;

architecture Behavioral of prjc2 is

component Ripple_Carry_Adder is
    Port (
        A, B: in STD_LOGIC_VECTOR(3 downto 0);
        Sum: out STD_LOGIC_VECTOR(3 downto 0);
        Cout: out STD_LOGIC
    );
end component;
signal A,B,Sum: std_logic_vector(3 downto 0);
signal Cout: std_logic;
begin
stimuli: process
begin
A<="0001"; B<="0100"; wait for 100 NS;
A<="0011"; B<="0110"; wait for 100 NS;
A<="0101"; B<="0100"; wait for 100 NS;
A<="1011"; B<="0111"; wait for 100 NS;
wait;
end process;
RCAEX: Ripple_Carry_Adder port map(A,B,Sum,Cout);
end Behavioral;


