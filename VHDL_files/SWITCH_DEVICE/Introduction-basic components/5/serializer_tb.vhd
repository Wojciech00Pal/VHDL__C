library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity serializer_tb is 
end serializer_tb;


architecture beh of serializer_tb is

component serializer port(

	Input: IN STD_LOGIC_VECTOR(3 DOWNTO 0); --in
	CLOCK: IN STD_LOGIC;
	LOAD:  IN STD_LOGIC;
	ENABLE:IN STD_LOGIC;
	--D:     in std_logic;
	Q0:	   OUT STD_LOGIC
);
END component;

signal input_t: std_logic_vector(3 downto 0);
signal clk_t,load_t,enable_t,Q_t: std_logic;

begin
ser: serializer port map (Input=>input_t, CLOCK => CLK_t,load=>load_t, ENAble=> Enable_t, Q0=>Q_t);

process
begin

INput_t <= "1011";
CLK_t <= '0';
load_t<='0';
Enable_t <= '1';

wait for 1 ns;
input_t <= "1011";
CLK_t <= '1';
load_t<='0';
Enable_t <= '1';

wait for 1 ns;
INput_t <= "1011";
CLK_t <= '0';
load_t<='1';
Enable_t <= '1';

wait for 1 ns;
input_t <= "1011";
CLK_t <= '1';
load_t<='1';
Enable_t <= '1';

wait for 1 ns;
INput_t <= "1011";
CLK_t <= '0';
load_t<='1';
Enable_t <= '1';

wait for 1 ns;
input_t <= "1011";
CLK_t <= '1';
load_T<='1';
Enable_t <= '1';

wait for 1 ns;
INput_t <= "1011";
CLK_t <= '0';
load_t<='1';
Enable_t <= '1';

wait for 1 ns;
input_t <= "1011";
CLK_t <= '1';
load_t<='1';
Enable_t <= '1';

wait for 1 ns;
INput_t <= "1011";
CLK_t <= '0';
load_t<='1';
Enable_t <= '1';

wait for 1 ns;
input_t <= "1011";
CLK_t <= '1';
load_t<='1';
Enable_t <= '1';

wait for 1 ns;
INput_t <= "1011";
CLK_t <= '0';
load_t<='1';
Enable_t <= '1';

wait for 1 ns;
input_t <= "1011";
CLK_t <= '1';
load_T<='1';
Enable_t <= '1';

wait for 1 ns;
INput_t <= "1011";
CLK_t <= '0';
load_t<='1';
Enable_t <= '1';

wait for 1 ns;
input_t <= "1011";
CLK_t <= '1';
load_T<='1';
Enable_t <= '1';



wait;
end process;
end beh;