library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity tb is 
end tb;

architecture Behavioral of tb is

	component lab2_1 port(
			clk : in std_logic;
			RSTn : in std_logic;
			Q : out unsigned (15 downto 0));
	end component;

	signal 	clk : std_logic;
	signal RSTn : std_logic;
	signal 	Q : unsigned (15 downto 0);

begin

	inst_lab2_1: lab2_1 port map(
			clk => 	clk,
			RSTn => RSTn,
			Q => 	Q);


	process
	begin
		clk<='0'; wait for 5 ns;
		clk<='1'; wait for 5 ns;
	end process;

end Behavioral;
