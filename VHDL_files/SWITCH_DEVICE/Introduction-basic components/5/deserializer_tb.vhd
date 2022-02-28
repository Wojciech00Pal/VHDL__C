library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity deserializer_tb is 
end deserializer_tb;


architecture TEST of deserializer_tb is
--GENERIC (N:INTEGER:=4);
	component deserializer port(
		
		D: in std_logic;--input one in clk cycle
		CLOCK,Enable:IN STD_LOGIC;
		Q:out std_logic;		--output
		P:out std_logic_vector(3 downto 0)--all samples in one vector
	
	);
	end component;

	signal D_t: std_logic;--IN
	Signal CLK_t,ENable_t:std_logic;--IN
    signal Q_t: std_logic;--output 
	signal P_t: std_logic_vector(3 DOWNTO 0);--ALL register's values OUTPUT
											 --add vector
											 
begin
dut: deserializer port map (D=>D_t, CLOCK => CLK_t, ENAble=> Enable_t, Q=>Q_t,P=>P_t);

process

begin
D_t <= '1';
CLK_t <= '0';
Enable_t <= '1';

wait for 1 ns;
D_t <= '1';
CLK_t <= '1';
Enable_t <= '1';
-------------------------1
wait for 1 ns;

D_t <= '0';
CLK_t <= '0';
Enable_t <= '1';

wait for 1 ns;
D_t <= '0';
CLK_t <= '1';
Enable_t <= '1';

------------------------2
wait for 1 ns;

D_t <= '1';
CLK_t <= '0';
Enable_t <= '1';

wait for 1 ns;

D_t <= '1';
CLK_t <= '1';
Enable_t <= '1';
------------------------3
wait for 1 ns;

D_t <= '1';
CLK_t <= '0';
Enable_t <= '1';
wait for 1 ns;

D_t <= '1';
CLK_t <= '1';
Enable_t <= '1';
--------------------4
wait for 1 ns;

D_t <= '0';
CLK_t <= '0';
Enable_t <= '1';
wait for 1 ns;
D_t <= '0';
CLK_t <= '1';
Enable_t <= '1';
---------------------5
wait;
end process;


end TEST;
