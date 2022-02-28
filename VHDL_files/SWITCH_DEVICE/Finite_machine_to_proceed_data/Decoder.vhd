library ieee;
use IEEE.STD_LOGIC_1164.all;

entity Decoder is
port(
req:in std_logic_vector(1 downto 0);
valid: in std_logic;
req_out:out std_logic_vector(3 downto 0)-------------------outputs from decoder
);
end decoder;

Architecture beh of Decoder is
BEGIN
 DEC:process(req)
	BEGIN
		if(valid='1') then
			if(req="00") then
			  req_out <="0001";--LSB set to 1 refers req=00  
			elsif(req="01") then
			  req_out<="0010";
			elsif(req="10") then
			  req_out<="0100";
			else
			  req_out<="1000";--msb means req=11
			end if;  
		else
		req_out<="0000";
		
		end if;
	end process;	
end beh;