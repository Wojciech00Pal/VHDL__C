library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control is 
port(
	enable, rst, clock			: in std_logic;
	column							: in integer;--the x axis
	row								: in integer;--the y axis
	memR,memG,memB					: in std_logic_vector (7 downto 0);
	cntenabl							: out std_logic;--will give the right to counter to counte
	vgaR, vgaG, vgaB				: out std_logic_vector(7 downto 0));
end control;
	
architecture beh of control is

constant hsize : integer := 640;
constant vsize : integer := 480;


begin--architecture

--checking reset
process(rst, clock)
begin--process

if(rst = '0' or enable = '0') then--we either can't write because of reset or because the syncrhoniser tells us no
	vgaR<=(others=>'0');
	vgaG<=(others=>'0');
	vgaB<=(others=>'0');
	else
		if(clock'event and clock='1') then--rising edge
			if(column < 176 and row < 144) then --in the visible screen
				vgaR <= memR;
				vgaG <= memG;
				vgaB <= memB;
				cntenabl <='1';
			else--we are not in the right rectangle
				vgaR<=(others=>'0');
				vgaG<=(others=>'0');
				vgaB<=(others=>'0');
				cntenabl <='0';
			end if;--colors
		end if;--clock
	end if;--reset 
end process;
end beh;