library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity My_fifo is
port (
	D:IN STD_LOGIC_VECTOR(35 DOWNTO 0);
	wreq:in std_logic;
	rdreq:in std_logic;
	wrclk,rdclk:in std_logic;
	Y: OUT STD_LOGIC_VECTOR(34 DOWNTO 0)
	);
end My_fifo;

architecture beh of My_fifo is

--signal C_IN: std_logic;
--SIGNAL C_OUT:STD_LOGIC;
--type queue is array (0 to 3, 34 downto 0) of std_logic;
--signal mem : c_mem_t;
--signal state:std_logic_vector(3 downto 0);--0 first to go out
signal queue: std_logic_vector(34 downto 0);--one element in queue

BEGIN

	process(wrclk,rdclk)
	BEGIN
	  if(wreq='1') then
			if(wrclk'EVENT AND wrclk='1' and rdreq='1' and rdclk'EVENT AND rdclk='1') then
					--queue<=D(34 downto 0);
					Y<=D(34 downto 0);
			elsif (wrclk'EVENT AND wrclk='1') then
					queue<=D(34 downto 0);
						--if(rdreq='1' and rdclk'EVENT AND rdclk='1') then
							--Y<=queue;
						--end if;
			end if;
	  else	  
			if(rdreq='1' and rdclk'EVENT AND rdclk='1') then
							Y<=queue;
			end if;
	 end if;		
			
			
						
						
				---write for read
		--czysc state jak wyslesz na out		
			
	  
	  
end process; 
	
end beh;