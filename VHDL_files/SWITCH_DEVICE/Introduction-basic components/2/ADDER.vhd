library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ADDER is
port (
	A,B: in std_logic;
	C0: in std_logic; --in carry bit 
	S,Ci:out std_logic --out carrying bit
	);
end ADDER;

architecture beh of ADDER is


--signal C_IN: std_logic;
--SIGNAL C_OUT:STD_LOGIC;

	
	
	begin
	  S <= (A XOR B) XOR C0;
	  Ci<=(A AND B)OR(C0 AND (A XOR B));--Ci BITs from prevoius operaition  

end beh;