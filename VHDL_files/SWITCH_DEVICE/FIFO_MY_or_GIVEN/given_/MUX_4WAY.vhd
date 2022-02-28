library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX_4WAY is
port (
	A0,A1,A2,A3:IN STD_LOGIC_VECTOR(34 DOWNTO 0);
	Y: OUT STD_LOGIC_VECTOR(34 DOWNTO 0);
	S: in std_logic_vector(1 downto 0)
	);
end MUX_4WAY;

architecture beh of MUX_4WAY is

--signal C_IN: std_logic;
--SIGNAL C_OUT:STD_LOGIC;

BEGIN
	process(A0,A1,A2,A3,S)
	BEGIN
	
	  if(s="00") then Y<=A0;
	  elsif(s="01") then Y<=A1;
	  elsif(s="10") then Y<=A2;		  
	  else Y <= A3;
	  END if;
	  
	  
end process; 
	
end beh;