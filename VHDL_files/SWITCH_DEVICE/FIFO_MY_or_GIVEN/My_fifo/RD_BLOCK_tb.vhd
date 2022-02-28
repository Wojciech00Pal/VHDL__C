library ieee;
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity RD_BLOCK_tb is
end RD_BLOCK_tb;

Architecture test of RD_BLOCK_tb is

component RD_BLOCK
--GENERIC(i: std_logic_vector:= "00");
PORT(
i:in std_logic_vector(1 downto 0);
req_i:in std_logic_vector(1 downto 0);
gr0,gr1,gr2,gr3:in std_logic_vector(1 downto 0);
read_i:out std_logic
);
END COmponent;

signal req_i_t,gr0_t,gr1_t,gr2_t,gr3_t: std_logic_vector(1 downto 0);
signal read_t_t: std_logic;
signal i_t: std_logic_vector(1 downto 0);
begin 
block_my:RD_BLOCK PORT MAP(
i=>i_t,
req_i=>req_i_t,gr0=>gr0_t,gr1=>gr1_t,gr2=>gr2_t,
gr3=>gr3_t,read_i=>read_t_t
);

process
begin

i_t<="00";
req_i_t<="00";
gr0_t<="00";
gr1_t<="11";
gr2_t<="01";
gr3_t<="01";

wait for 1 ns;

req_i_t<="11";
gr0_t<="00";
gr1_t<="00";
gr2_t<="00";
gr3_t<="11";

wait for 1 ns;

req_i_t<="11";
gr0_t<="10";
gr1_t<="10";
gr2_t<="10";
gr3_t<="00";

wait for 1 ns;
i_t<="01";
req_i_t<="10";
gr0_t<="10";
gr1_t<="10";
gr2_t<="01";
gr3_t<="00";

wait for 1 ns;

req_i_t<="01";
gr0_t<="10";
gr1_t<="10";
gr2_t<="10";
gr3_t<="00";

wait for 1 ns;
i_t<="10";
req_i_t<="10";
gr0_t<="10";
gr1_t<="10";
gr2_t<="10";
gr3_t<="00";

wait;
end process;
end test;

