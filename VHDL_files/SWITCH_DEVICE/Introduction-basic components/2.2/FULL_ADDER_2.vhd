library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Full_ADDER_2 is
port (
	A,B: in std_logic_vector(7 downto 0);--8 bits adder
	C0: in std_logic_vector(7 downto 0);
	S: out std_logic_vector(7 downto 0)
	--Ci:out std_logic			--output
	);
end FULL_ADDER_2;

architecture beh of FULL_ADDER_2 is

--signal C_IN: std_logic;
--SIGNAL C_OUT:STD_LOGIC;

BEGIN

S <= A + B + C0;


	
end beh;