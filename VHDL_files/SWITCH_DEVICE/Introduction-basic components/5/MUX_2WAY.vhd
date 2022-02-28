library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX_2WAY is
--GENERIC(N: INTEGER:= 4);
port (
	A0,A1:IN STD_LOGIC;
	Y: OUT STD_LOGIC;
	S: in std_logic
	);
end MUX_2WAY;

architecture beh of MUX_2WAY is

--signal C_IN: std_logic;
--SIGNAL C_OUT:STD_LOGIC;

BEGIN
	process(A0,A1,S)
	BEGIN
	
	  if(s='0') then Y<=A0;
	  elsif(s='1') then Y<=A1;
	  END if;
	  
end process; 
	
end beh;