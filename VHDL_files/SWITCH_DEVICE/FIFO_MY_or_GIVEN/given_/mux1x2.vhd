library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity mux1x2 IS 
PORT(
A:IN STD_LOGIC_VECTOR(35 downto 0);--fifo in 35 down to 0
y,y3:out std_logic_vector(34 downto 0)--out to crossbar 34 downto 0
);
END mux1x2;

ARCHITECTURE beh OF mux1x2 IS
begin
process
begin

if(A(34)='1') then
	y<= A(34 downto 0);
end if;	

end process;

end beh;
