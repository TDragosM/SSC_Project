library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_8bit is
	port(x: in std_logic_vector(7 downto 0);
		  y: in std_logic_vector(7 downto 0);
		  cin: in std_logic;
		  sum: out std_logic_vector(7 downto 0);
		  cout: out std_logic);
		  
end FA_8bit;

architecture Behavioral of FA_8bit is
	signal carry: std_logic_vector(6 downto 0);
	
	component fullAdder is
		port(a: in std_logic;
			  b: in std_logic;
			  cin: in std_logic;
			  sum: out std_logic;
			  cout: out std_logic);
	end component;
	
begin
	a0: fullAdder port map(x(0), y(0), cin, sum(0), carry(0));
	a1: fullAdder port map(x(1), y(1), carry(0), sum(1), carry(1));
	a2: fullAdder port map(x(2), y(2), carry(1), sum(2), carry(2));
	a3: fullAdder port map(x(3), y(3), carry(2), sum(3), carry(3));
	a4: fullAdder port map(x(4), y(4), carry(3), sum(4), carry(4));
	a5: fullAdder port map(x(5), y(5), carry(4), sum(5), carry(5));
	a6: fullAdder port map(x(6), y(6), carry(5), sum(6), carry(6));
	a7: fullAdder port map(x(7), y(7), carry(6), sum(7), cout


	);

end Behavioral;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity booth is
	port(clk: in std_logic;
		  multiplicand: in std_logic_vector(23 downto 0);
		  multiplier: in std_logic_vector(23 downto 0);
		  rez: out std_logic_vector(47 downto 0)
		  );
	
end booth;

architecture Behavioral of booth is

	
	
	
begin
	
	process(multiplicand,multiplier)
	variable a: std_logic_vector(48 downto 0) := (others => '0');
	variable s, temp: std_logic_vector(23 downto 0);
	begin
		
			a:= (others => '0');
			s:= multiplier;
			a(24 downto 1) := multiplicand;
			for i in 0 to 23 loop
			 if a(1) = '1' and a(0) = '0' then
			     temp := a(48 downto 25);
			     a(48 downto 25) := (temp - s);
			 elsif a(1)  = '0' and a(0) = '1' then
			     temp := a(48 downto 25);
			     a(48 downto 25) := temp + s;
			 end if;
			 a(47 downto 0) := a(48 downto 1);
		end loop;
		
		rez <= a(48 downto 1);
	end process;
	
end Behavioral;