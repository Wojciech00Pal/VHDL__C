library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity deserializer is -- deserializer 
GENERIC (N:INTEGER:=4);
port (
	D: in std_logic;--input one in clk cycle
	CLOCK,Enable:IN STD_LOGIC;
	Q:out std_logic;		--output
	P:out std_logic_vector(N-1 downto 0)--all samples in one vector
	);
end deserializer;


--deserializer

architecture beh of deserializer is


signal int_wires:STD_LOGIC_VECTOR(N DOWNTO 0);--between flip-flops ONE MORE THAN N-1 BECAUSE ONE SIGNAL ON ENTRY 
--signal out_deser:STD_LOGIC_VECTOR(N-1 downto 0);

SIGnal D_ser,ena,out_serial: std_logic;


component one_REG 
port(	
    D:in std_logic;
	CLOCK,en:IN STD_LOGIC;
	Q:out std_logic;		--output
	RESET: in STD_LOGIC
);
end component;

component SERIALIZER
generic(N:Integer:=4);
PORT 
	(
	Input: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	CLOCK: IN STD_LOGIC;
	LOAD:  IN STD_LOGIC;
	ENABLE:IN STD_LOGIC;
	D: in std_logic;
	Q0:	   OUT STD_LOGIC);
END component;

begin

GEN_SHIFT: FOR i in 0 to N-1 GENERATE
	--INT_WIRES(i+1)<=D;--input going to int_wires(i+1)
	flipflop:ONE_REG PORT MAP(
			D=>INT_WIRES(i+1),--first input to int_wires(1)
			CLOCK=>CLOCK,
			en=>Enable,
			Reset=>'1',
			Q=>int_wires(i) -- first output to int_wires(0)
	);
	end generate;
	
	int_wires(N) <=D; 		    --input in deserializer is going on last place in int_wires array 
	Q <=int_wires(0);			--last output equals last "D", so the oldest D is in int_wires 0
	P<=int_wires(N-1 downto 0); --we dont apply int_wires(N) it is not in register :( it is only input
	
	
--T1:SERIALIZER PORT MAP(int_wires(N-1 downto 0),clock,L,ENa,out_serial);
end beh;


