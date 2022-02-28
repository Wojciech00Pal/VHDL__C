library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity one_REG is
port (
	D: in std_logic;
	CLOCK,en:IN STD_LOGIC;
	Q:out std_logic;		--output
	RESET: in STD_LOGIC
	);
end one_REG;

architecture beh of one_REG is
begin
	
	process(CLOCK,RESET)
	begin
	IF(RESET='0') then
	Q<='0';
	ELSIF(CLOCK'EVENT AND CLOCK='1' and en='1') then
	Q<=D;
	end if;
	end process;
	
end beh;