library ieee;
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity crossbar_tb is 
end crossbar_tb;


architecture TEST of crossbar_tb is
--GENERIC (N:INTEGER:=4);
	component crossbar 
--gENERIC(N: INTEGER:= 35);
	port(
	A,B,C,D:IN STD_LOGIC_VECTOR(34 downto 0);
	g0,g1,g2,g3:in std_logic_vector(1 downto 0);
	y0,y1,y2,y3:out std_logic_vector(34 downto 0)
	);
	end component;
	
	signal A_t,B_T,C_T,D_T: std_logic_VECTOR(34 DOWNTO 0);--IN
	Signal g0_t,g1_t,g2_t,g3_t:std_logic_vector(1 downto 0);--IN
   signal y0_t,y1_t,y2_t,y3_t: std_logic_vector(34 downto 0);--output 

begin

dut:crossbar  port map (
A=>A_t,B=>B_T,C=>C_T,D=>D_T,
g0=>g0_t,g1=>g1_t,g2=>g2_t,g3=>g3_t,
y0=>y0_t,y1=>y1_t,y2=>y2_t,y3=>y3_t);

process
begin
--simulated situation
--from first DIN to dout3
--from 
A_t<= ("1111" & ("1111111111111111111111111111100"));--valid and requested output dout3, so grant 3 has to be 00, DIN0
B_T<= ("0000" & ("1111111111111111111111111111100"));--valid and req output dout2, so grant 2 should be 01
C_T<= (OTHERS => '0');
D_T<= (OTHERS => '1');
g0_t<="11";
g1_t<="11";
g2_t<="11";
g3_t<="00";

--
wait for 1 ns;
A_t<= (OTHERS => '1');
B_T<= (OTHERS => '0');
C_T<= (OTHERS => '0');
D_T<= (OTHERS => '0');
g0_t<="00";
g1_t<="00";
g2_t<="00";
g3_t<="00";

wait for 1 ns;
A_t<= (OTHERS => '1');
B_T<= (OTHERS => '1');
C_T<= (OTHERS => '0');
D_T<= (OTHERS => '1');
g0_t<="11";
g1_t<="01";
g2_t<="10";
g3_t<="11";

wait for 1 ns;
A_t<= (OTHERS => '1');
B_T<= (OTHERS => '0');
C_T<= (OTHERS => '0');
D_T<= (OTHERS => '1');
g0_t<="11";
g1_t<="11";
g2_t<="10";
g3_t<="10";


wait;
end process;

end test;