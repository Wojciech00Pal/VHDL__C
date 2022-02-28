library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity FULL_ADDER_TB is 
end FULL_ADDER_TB;

architecture TEST of FULL_ADDER_TB is

	component FULL_ADDER port(
	
	A,B: in std_logic_VECtor(7 downto 0);
	C0: in std_logic_vector(7 downto 0);
	S: out std_logic_vector(7 downto 0);
	Ci:out std_logic--added vector
	
	);
	end component;

	signal A_i, B_i,C_0,S_i: std_logic_vector(7 DOWNTO 0);--S_i out sum
    signal C_i: std_logic;--output carrying bit
--add vector
begin

dut: FULL_ADDER port map (A => A_i, B => B_i, C0=> C_0, S=>S_i,Ci=>C_i);


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

A_i <= "11111111";
B_i <= "11111111";
C_0 <= "00000001";
wait for 1 ns;

wait;
end process;


end TEST;
