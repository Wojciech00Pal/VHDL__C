LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
port(
clock : in std_logic;
reset : in std_logic;
enable : in std_logic;
counter : out integer
);
end counter;

architecture beh of counter is

constant countrange : integer := 25344;--

begin

process(clock,reset)
variable count : integer range 0 to countrange-1 :=0;

begin
	if(reset = '0') then
		count := 0;
	else
		if(enable = '1') then 
			if(clock'event and clock ='1') then
				if (count=countrange-1) then
					count := 0;  
				else
					count := count + 1;
				end if;--coutner
			end if;--clock
		end if;--enable
	end if;--reset
	counter <= count;
end process;



end beh;