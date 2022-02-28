library ieee;
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity fifo_tb is 
end fifo_tb;

architecture TEST OF FIFO_TB IS

component fifo IS
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		data		: IN STD_LOGIC_VECTOR (35 DOWNTO 0);--
		rdclk		: IN STD_LOGIC ;--
		rdreq		: IN STD_LOGIC ;--
		wrclk		: IN STD_LOGIC ;--
		wrreq		: IN STD_LOGIC ;--
		q		: OUT STD_LOGIC_VECTOR (35 DOWNTO 0);--
		rdempty		: OUT STD_LOGIC ;
		wrfull		: OUT STD_LOGIC 
	);
END component;

signal din_t: STD_LOGIC_VECTOR (35 DOWNTO 0);
signal rdclk_t,wrclk_t,rdreq_t,wrreq_T: std_logic;
signal fifo_out_t: std_logic_vector(35 downto 0);

begin

dut: fifo PORT MAP(
DATA=>din_t,
rdclk=>rdclk_t,wrclk=>wrclk_t,rdreq=>rdreq_t,wrreq=>wrreq_T,
q=>fifo_out_t
);
process
begin
DIN_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='0';--read
wrreq_T<='1';

wait for 1 ns;

DIN_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='0';--
wrreq_T<='1';

wait for 1 ns;

DIN_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='0';--read
wrreq_T<='1';

wait for 1 ns;

DIN_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='0';--
wrreq_T<='1';

wait for 1 ns;

DIN_t<=("0000" & ("11111111111111111111111111111100"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='0';--read from fifo
wrreq_T<='1';--write

wait for 1 ns;

DIN_t<=("0000" & ("11111111111111111111111111111100"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='0';
wrreq_T<='1';--write

wait for 1 ns;

DIN_t<=("1111" & ("11111111000001111111111111111100"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='0';--read
wrreq_T<='1';--still write
wait for 1 ns;

DIN_t<=("1111" & ("11111111000001111111111111111100"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='0';--
wrreq_T<='1';

wait for 1 ns;

DIN_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='0';
wrreq_T<='1';

wait for 1 ns;

DIN_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='0';
wrreq_T<='1';

wait for 1 ns;
DIN_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='0';
wrreq_T<='0';

wait for 1 ns;
DIN_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='0';
wrreq_T<='0';

wait for 1 ns;
DIN_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='0';
wrreq_T<='0';

wait for 1 ns;


DIN_t<=("1111" & ("11111111111111111111111110011100"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='0';--
wrreq_T<='0';

wait for 1 ns;

DIN_t<=("1111" & ("11111111111111111111111111111100"));
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='0';
wrreq_T<='0';

wait for 1 ns;

DIN_t<=("0000" & ("11111111111111111111111110011100"));
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='0';--
wrreq_T<='0';

wait for 1 ns;
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='1';
wrreq_T<='0';

wait for 1 ns;
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='1';--
wrreq_T<='0';

wait for 1 ns;
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='1';
wrreq_T<='0';

wait for 1 ns;
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='1';--
wrreq_T<='0';

wait for 1 ns;
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='1';
wrreq_T<='0';

wait for 1 ns;
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='1';--
wrreq_T<='0';

wait for 1 ns;
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='1';
wrreq_T<='0';

wait for 1 ns;
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='1';--
wrreq_T<='0';

wait for 1 ns;
rdclk_t<='0';
wrclk_t<='0';
rdreq_t<='1';
wrreq_T<='0';

wait for 1 ns;
rdclk_t<='1';
wrclk_t<='1';
rdreq_t<='1';--
wrreq_T<='0';
wait;
end process;
end test;
