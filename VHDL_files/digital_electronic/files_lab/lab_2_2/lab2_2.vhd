--Flashing lights
--Up counter :
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity lab2_2 is
port (  CLOCK_50 : in std_logic;
		SW : in std_logic_vector(3 downto 0);
        HEX0 : out std_logic_vector(0 to 6));
end lab2_2;

architecture behavioral of lab2_2 is
signal downcounter : integer range 0 to 9 := 9;
signal upcounter,order  : integer range 0 to 9 := 0;

signal counter50 : integer range 0 to 99999999 := 0; --fmax is 50MHz and corresponds to the frequency of the clock, every time it reaches 50MHz, one second just passed
signal upto :integer range 0 to 99999999;--is gonna be changed according to sw2,3

component decoder7int 
port(
		C : in integer range 0 to 9;
		display : out std_logic_vector (0 to 6));
end component;



begin

--order<=SW(3);--flashing order (up-count or down-count)
--reset <=SW(0);--asynchronous reset


l1:decoder7int port map(
	                     c=>order,
						 display=>HEX0
				);
				
--order <= upcounter when SW(3) ='0',
--		  DOWNCOUNTER when SW(3)='1';		


frequencychoose : process(clock_50,SW)

begin
case sw(2 downto 1) is
when "00"=>upto<=99999999;
when "01"=>upto<=49999999;
when "10"=>upto<=24999999;
when others=>upto<=12499999;
end case;
end process;

clock_counter: process (CLOCK_50, SW(0))

begin
if sw(0) = '0' then
	upcounter<=0;
	downcounter<=9;
	counter50<=0;
else
	--if SW(3) = '1' then--going up
	--order <= upcounter;
			if CLOCK_50'event and CLOCK_50='1' then--checking clock
			counter50 <= counter50 + 1;
						if counter50 = upto then -- it means that two second just passed
						counter50 <= 0;--And we just set it to 0 so that he can recount at infinite
										
										if upcounter < 9 then 
											upcounter <=upcounter+1;-- for each second we increment the digital counter on HEX0 so that we have a counter set like a real clock
										else
											upcounter <= 0;
										end if;
										
						end if;--end of the upcounterchecking
			end if;--end of the counter50 checking	
	--else --order equal to 0
	--order <= downcounter;
						if CLOCK_50'event and CLOCK_50='1' then
						counter50 <= counter50 + 1;
										if counter50 = upto then -- it means that two second just passed
										counter50 <= 0;--And we just set it to 0 so that he can recount at infinite
																if downcounter > 0 then 
																	downcounter <= downcounter-1;-- for each second we increment the digital counter on HEX0 so that we have a counter set like a real clock
																else
																	downcounter<= 9;
																end if;
															
										end if;--downcount checking
						end if;--coutner50 checking
	--end if;--clock50 cheking
	case sw(3) is
	when '1'=>order<=upcounter;
	when others=>order<=downcounter;
	end case;

--counter50 <= counter50 + 1;

end if;--end reset
end process;
end behavioral;