library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder7int is
port(
		C : in integer range 0 to 9;
		display : out std_logic_vector (0 to 6));
end decoder7int;

architecture beh of decoder7int is

signal cbits : std_logic_vector(3 downto 0);

begin

cbits <= std_logic_vector(to_unsigned(c,4));

process(cbits)
	begin
	case Cbits is
	when "0000"=>DISPLAY<="0000001";--0
	when "0001"=>DISPLAY<="1001111";--1
	when "0010"=>DISPLAY<="0010010";--2
	when "0011"=>DISPLAY<="0000110";--3
	when "0100"=>DISPLAY<="1001100";--4
	when "0101"=>DISPLAY<="0100100";--5
	when "0110"=>DISPLAY<="0100000";--6
	when "0111"=>DISPLAY<="0001111";--7
	when "1000"=>DISPLAY<="0000000";--8
	when "1001"=>DISPLAY<="0000100";--9
	when "1010"=>DISPLAY<="0001000";--A
	when "1011"=>DISPLAY<="1100000";--B
	when "1100"=>DISPLAY<="0110001";--C
	when "1101"=>DISPLAY<="1000010";--D
	when "1110"=>DISPLAY<="0110000";--E
	when others=>DISPLAY<="0111000";--F
	end case;
end process;
end beh;