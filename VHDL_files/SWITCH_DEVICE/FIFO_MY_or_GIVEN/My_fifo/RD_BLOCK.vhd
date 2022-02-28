library ieee;
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;


ENTITY rd_block is
--GENERIC(i: std_logic_vector:= "00");
port(

i:in std_logic_vector(1 downto 0);
req_i:in std_logic_vector(1 downto 0);
gr0,gr1,gr2,gr3:in std_logic_vector(1 downto 0);
read_i:out std_logic

);
end rd_block;

ARCHITECTURE beh OF rd_block is

COMPONENT MUX_4WAY is
--GENERIC(N: INTEGER:= 2);
port(
	A0,A1,A2,A3:IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Y: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	S: in std_logic_vector(1 downto 0)
	);
END COMPONENT;

signal mux_out:std_logic_vector(1 downto 0);

begin

l:mux_4way
GENERIC MAP(
N=>2
)
PORT MAP(
A0=>gr0,
A1=>gr1,
A2=>gr2,
A3=>gr3,
S=>req_i,
Y=>mux_out
);	


process(mux_out)
	BEGIN
		if(mux_out=i) then
			read_i<='1';
		else
			read_i<='0';
	   end if;
	
	
end process; 


end beh;