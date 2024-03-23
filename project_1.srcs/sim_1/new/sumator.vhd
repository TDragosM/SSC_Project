
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Ripple_Carry_Adder is
    Port (
        A, B: in STD_LOGIC_VECTOR(3 downto 0);
        Sum: out STD_LOGIC_VECTOR(3 downto 0);
        Cout: out STD_LOGIC
    );
end Ripple_Carry_Adder;

architecture Behavioral of Ripple_Carry_Adder is
    signal Cin: STD_LOGIC := '0';
    component fullAdder is
    Port (
        A, B, Cin: in STD_LOGIC;
        Sum, Cout: out STD_LOGIC
    );
end component;
    signal Temp_Sum: STD_LOGIC_VECTOR(3 downto 0);
    signal carry: std_logic_vector(2 downto 0);

begin
    F1: fullAdder port map (A(0), B(0), Cin, Temp_Sum(0), carry(0));
    
    F2: fullAdder port map (A(1), B(1), carry(0), Temp_Sum(1), carry(1));
    
    F3: fullAdder port map (A(2), B(2), carry(1), Temp_Sum(2), carry(2));
    
    F4:fullAdder port map (A(3), B(3), carry(2), Temp_Sum(3), Cout);

    Sum <= Temp_Sum;
end Behavioral;

