library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity My_fifo_tb is 
end My_fifo_tb;

architecture TEST OF My_FIFO_TB IS

component My_fifo IS
	PORT
	(
		D:IN STD_LOGIC_VECTOR(35 DOWNTO 0);
		wreq:in std_logic;
		rdreq:in std_logic;
		wrclk,rdclk:in std_logic;
		Y: OUT STD_LOGIC_VECTOR(34 DOWNTO 0)
	);
END component;

signal d_t: STD_LOGIC_VECTOR (35 DOWNTO 0);
signal rdclk_t,wrclk_t,rdreq_t,wrreq_T: std_logic;
signal Y_t: std_logic_vector(34 downto 0);

begin

dut_myf: My_fifo PORT MAP(
D=>d_t,
rdclk=>rdclk_t,wrclk=>wrclk_t,rdreq=>rdreq_t,wreq=>wrreq_T,
Y=>Y_t
);

process
begin
D_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='0';--read from data_in but later
wrreq_T<='1';

wait for 1 ns;

D_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='0';--read
wrreq_T<='1';

wait for 1 ns;

D_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='1';--read
wrreq_T<='0';

wait for 1 ns;

D_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='1';--read
wrreq_T<='0';

wait for 1 ns;

D_t<=("1111" & ("11111111111111111111111111110001"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='1';--read
wrreq_T<='1';

wait for 1 ns;

D_t<=("1111" & ("11111111111111111111111111110001"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='1';--read
wrreq_T<='1';

wait for 1 ns;

D_t<=("1111" & ("11111111111111111111111111110001"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='1';--read
wrreq_T<='1';

wait for 1 ns;

D_t<=("1111" & ("11111111111111111111111111110001"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='1';--read
wrreq_T<='1';
----------------------

wait for 1 ns;

D_t<=("1111" & ("11111111111111111111111101000001"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='0';--read
wrreq_T<='1';

wait for 1 ns;

D_t<=("1111" & ("11111111111111111111111101000001"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='0';--read
wrreq_T<='1';

wait for 1 ns;

D_t<=("1111" & ("11111111111111111111111101000001"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='1';--read
wrreq_T<='0';

wait for 1 ns;

D_t<=("1111" & ("11111111111111111111111101000001"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='1';--read
wrreq_T<='0';

wait;
end process;
end test;
