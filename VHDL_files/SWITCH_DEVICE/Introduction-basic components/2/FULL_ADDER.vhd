library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Full_ADDER is
port (
	A,B: in std_logic_vector(7 downto 0);--8 bits adder
	C0: in std_logic_vector(7 downto 0);
	S: out std_logic_vector(7 downto 0);--sum
	Ci:out std_logic--output
	);
end FULL_ADDER;

architecture beh of FULL_ADDER is

signal C_INT: STD_LOGIC_VECToR(8 downto 0); --bits to carry, one more to eventually carry

COMPONENT ADDER
		PORT(
		
			A,B: in std_logic;
			C0: in std_logic; --in carry bit 
			S,Ci:out std_logic --out carrying bit
		
		);
		END COMPONENT;
		


--signal C_IN: std_logic;
--SIGNAL C_OUT:STD_LOGIC;

BEGIN
   lo: FOR i IN 0 TO 7 GENERATE
		
		FA: ADDER PORT MAP(
								A=>A(i),
								B=>B(i),
								C0=>C_INT(i),--in first bit to carry
								S=>S(i),
								Ci=>C_INT(i+1)
		);

C_INT(0) <= C0(0);--FIRSt carry bit
Ci <= C_INT (8);

     -- S(i) <= (A(i) XOR B(i)) XOR C0(i);
	 -- Ci <= (A(i) AND B(i)) OR (C0(i) AND (A(i) XOR B(i)));
   
end generate;	

	
end beh;