library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity REG is
GENERIC (N:INTEGER:=4);

port (
	
	D: in std_logic_vector(N-1 downto 0);--8 bits adder
	CLOCK,RESET:IN STD_LOGIC;
	Q:out std_logic_vector(N-1 downto 0)		--output
	
	);
end REG;

architecture beh of REG is
begin
	
	process(CLOCK,RESET)
	begin
	IF(RESET='1') then
	Q<=(others=>'0');
	ELSIF(CLOCK'EVENT AND CLOCK='1') then
	Q<=D;
	end if;
	end process;
	
end beh;