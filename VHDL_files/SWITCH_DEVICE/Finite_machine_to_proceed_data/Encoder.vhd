library ieee;
use IEEE.STD_LOGIC_1164.all;

entity Encoder is
port(
grant_in:in std_logic_vector(3 downto 0);
y: OUT Std_logic_vector(1 downto 0)
);
end Encoder;

architecture beh of Encoder is

BEGIN
 process(grant_in)
  BEGIN
	if(grant_in="0001") then
		y<="00";
	elsif(grant_in="0010") then
		y<="01";
	elsif(grant_in="0100") then
		y<="10";
	elsif(grant_in="1000")then
		y<="11";
	else
		y<="00";--error
	end if;	  
end process; 
end beh;