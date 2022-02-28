library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_4WAY_tb is 
end MUX_4WAY_tb;



architecture TEST of MUX_4WAY_tb is

	--constant N : integer := 4;
	component MUX_4WAY 
	port(

	A0,A1,A2,A3:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Y: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	S: in std_logic_vector(1 downto 0)
	);
	end component;

	signal A_0,A_1,A_2,A_3: std_logic_vector( 3 DOWNTO 0);--S_i out sum
	signal Y_i: std_logic_vector( 3 DOWNTO 0);--OUTPUT
	SIGNAL S_i: std_logic_vector(1 downto 0);
  --  signal C_i: std_logic_vector(8 downto 0);--output carrying bit
--add vector
begin

test_bench: MUX_4WAY port map (A0 => A_0, A1 => A_1, A2=> A_2,A3 => A_3, S=>S_i, Y=>Y_i);


process
begin

S_i <= "00";
A_0 <= "0001";
A_1 <= "0000";
A_2 <= "0001";
A_3 <= "0000";


wait for 1 ns;

S_i <= "00";
A_0 <= "1111";
A_1 <= "0000";
A_2 <= "0001";
A_3 <= "0000";

wait for 1 ns;

S_i <= "01";
A_0 <= "0001";
A_1 <= "1111";
A_2 <= "0001";
A_3 <= "0000";

wait for 1 ns;

S_i <= "10";
A_0 <= "0001";
A_1 <= "1101";
A_2 <= "1111";
A_3 <= "0000";

wait for 1 ns;

S_i <= "11";
A_0 <= "0001";
A_1 <= "0000";
A_2 <= "0011";
A_3 <= "1111";

wait for 1 ns;

wait;
end process;


end TEST;
