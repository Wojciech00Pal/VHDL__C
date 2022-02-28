library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity ADDER_TB is 
end ADDER_TB;

architecture TEST of ADDER_TB is

	component ADDER port(
	A,B: in std_logic;
	Ci: in std_logic;
	S,C0:out std_logic
	);
	end component;

	signal A_i, B_i,C_i: std_logic;
    signal S_i,C_0: std_logic;--output
begin

dut: ADDER port map (A => A_i, B => B_i, C0=> C_0, S=>S_i, Ci=>C_i);


process
begin

A_i <= '0';
B_i <= '0';
C_i <= '0';
wait for 1 ns;

A_i <= '0';
B_i <= '1';
C_i <= '0';
wait for 1 ns;

A_i <= '1';
B_i <= '0';
C_i <= '1';
wait for 1 ns;

A_i <= '1';
B_i <= '1';
C_i <= '1';
wait for 1 ns;

wait;

end process;
end TEST;
