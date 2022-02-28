library ieee;
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity RD_BLOCK_tb is
end RD_BLOCK_tb;

Architecture test of RD_BLOCK_tb is

component RD_BLOCK
GENERIC(i: std_logic_vector:= "11");
PORT(
req_i:in std_logic_vector(1 downto 0);
w_en<=write_enable;--assign to signal
gr0,gr1,gr2,gr3:in std_logic_vector(1 downto 0);
y:out std_logic_vector(1 downto 0);
read_i:out std_logic
);
END COmponent;

signal req_i_t,gr0_t,gr1_t,gr2_t,gr3_t,y_t: std_logic_vector(1 downto 0);
signal read_t_t: std_logic;

begin 
dut:RD_BLOCK PORT MAP(
req_i=>req_i_t,gr0=>gr0_t,gr1=>gr1_t,gr2=>gr2_t,
gr3=>gr3_t,read_i=>read_t_t
);

process
begin

req_i_t<="00";
gr0_t<="11";
gr1_t<="00";
gr2_t<="00";
gr3_t<="00";

wait for 1 ns;

req_i_t<="11";
gr0_t<="00";
gr1_t<="00";
gr2_t<="00";
gr3_t<="11";

wait for 1 ns;

req_i_t<="11";
gr0_t<="00";
gr1_t<="00";
gr2_t<="00";
gr3_t<="10";

wait;
end process;
end test;

