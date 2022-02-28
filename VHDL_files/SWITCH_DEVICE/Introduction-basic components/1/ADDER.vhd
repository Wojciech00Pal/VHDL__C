library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ADDER is
port (
	A,B: in std_logic;
	Ci: in std_logic; --in carry bit 
	S,C0:out std_logic --out carrying bit
	);
end ADDER;



architecture beh of ADDER is


--signal C_IN: std_logic;
--SIGNAL C_OUT:STD_LOGIC;

	
	
	begin
	  S <= (A XOR B) XOR Ci;
	  C0<=(A AND B)OR(Ci AND (A XOR B));--Ci BITs from prevoius operaition  
	

	
end beh;