library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


--SERIALIZER---------------------
entity SERIALIZER is
generic(N:Integer:=4);
port(
Input: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0); --in
CLOCK: IN STD_LOGIC;
LOAD:  IN STD_LOGIC;
ENABLE:IN STD_LOGIC;
Q0:	   OUT STD_LOGIC);
END SERIALIZER;


ARCHITECTURE BEH OF SERIALIZER is
component one_REG 
port(	
    D:in std_logic;
	CLOCK,en:IN STD_LOGIC;
	Q:out std_logic;		--output
	RESET: in STD_LOGIC
);
end component;

component MUX_2WAY
port(
	A0,A1:IN STD_LOGIC;
	Y: OUT STD_LOGIC;
	S: in std_logic
);
END COMPONENT;

signal int_wires: std_logic_vector(N DOWNTO 0);
signal mux_out: std_logic_vector (N-1 DOWNTO 0);
--signal counter: integer range 0 to N-1:=0;


begin
--int_wires(N downto 1) <= Input;
int_wires(N) <='0';


GEN_SHIFT: FOR i in 0 to N-1 GENERATE
	--INT_WIRES(i+1)<=D;--input going to int_wires(i+1)

mux2:MUX_2WAY PORT MAP(
	A0=>INPUT(i),
	A1=>int_wires(i+1),
	Y=>mux_out(i),
	S=>load
);
	
flipflop:ONE_REG PORT MAP(
			D=>mux_out(i),--first input to int_wires(1)
			CLOCK=>CLOCK,
			en=>Enable,
			Reset=>'1',
			Q=>int_wires(i) -- first output to int_wires(0)
	);
	end generate;

    Q0<=int_wires(0);
	
END BEH;














--PROCESS (CLOCK,LOAD)
	--	BEGIN
		--IF(ENABLE='0') then
			--	INTER_WIRES<=(OTHERS=>'0');
	  --  IF(CLOCK'EVENT AND CLOCK='1') then
		--    if(ENABLE='1') then
				--IF(LOAD='0') then
			--	INTER_WIRES <= INPUT;--INTER_WIRES(0) THE OLDEST
				--else--LOAD='1'
				
		---		INTER_wIRES<=Input(N-2)&'0';--INTER_WIRES(N-2 DOWNTO 0) ;--THE INTER_wIRES(N-1) TAKE D => THE YOUNGEST
				--counter <=counter+1;
			--    END IF;
		--	END IF;	
--		END IF;
---Q0<=INTER_WIRES(N-1);
--INTER_WIRES(N)<=D;	--now the INTER_WIRES(N) is the youngest		
--END PROCESS;
--END BEH;
