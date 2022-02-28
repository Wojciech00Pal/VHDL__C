library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity FULL_ADDER_TB_2 is 
end FULL_ADDER_TB_2;

architecture TEST of FULL_ADDER_TB_2 is

	component FULL_ADDER_2 port(
	
	A,B: in std_logic_vector(7 downto 0);--8 bits adder
	C0: in std_logic_vector(7 downto 0);
	S: out std_logic_vector(7 downto 0)
	
	);
	end component;

	signal A_i, B_i,C_0,S_i: std_logic_vector(7 DOWNTO 0);--S_i out sum
  --  signal C_i: std_logic_vector(8 downto 0);--output carrying bit
--add vector
begin

dut: FULL_ADDER_2 port map (A => A_i, B => B_i, C0=> C_0, S=>S_i);


process
begin

A_i <= "00000000";
B_i <= "00000000";
C_0 <= "00000000";
wait for 1 ns;

A_i <= "00000001";
B_i <= "00000001";
C_0 <= "00000000";
wait for 1 ns;

A_i <= "00000001";
B_i <= "00000001";
C_0 <= "00000001";
wait for 1 ns;

A_i <= "01010101";
B_i <= "10101010";
C_0 <= "00000000";
wait for 1 ns;

A_i <= "01111111";
B_i <= "01111111";
C_0 <= "00000001";
wait for 1 ns;

wait;
end process;


end TEST;
