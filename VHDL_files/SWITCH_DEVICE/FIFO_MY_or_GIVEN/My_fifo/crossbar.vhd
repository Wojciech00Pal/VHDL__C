library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity CROSSBAR IS 
PORT(
A,B,C,D:IN STD_LOGIC_VECTOR(34 downto 0);
g0,g1,g2,g3:in std_logic_vector(1 downto 0);
y0,y1,y2,y3:out std_logic_vector(34 downto 0)
);
END CROSSBAR;


ARCHITECTURE beh OF crossbar IS

COMPONENT MUX_4WAY_34 is
port(
	A0,A1,A2,A3:IN STD_LOGIC_VECTOR(34 DOWNTO 0);
	Y: OUT STD_LOGIC_VECTOR(34 DOWNTO 0);
	S: in std_logic_vector(1 downto 0)
	);
END COMPONENT;


BEGIN	

L0:MUX_4WAY_34
PORT MAP(
A0=>A,
A1=>B,
A2=>C,
A3=>D,
S=>G0,
Y=>Y0
);	


L1:MUX_4WAY_34
PORT MAP(
A0=>A,
A1=>B,
A2=>C,
A3=>D,
S=>G1,
Y=>Y1
);	

L2:MUX_4WAY_34
PORT MAP(
A0=>A,
A1=>B,
A2=>C,
A3=>D,
S=>G2,
Y=>Y2
);	

L3:MUX_4WAY_34
PORT MAP(
A0=>A,
A1=>B,
A2=>C,
A3=>D,
S=>G3,
Y=>Y3
);	



end beh;
