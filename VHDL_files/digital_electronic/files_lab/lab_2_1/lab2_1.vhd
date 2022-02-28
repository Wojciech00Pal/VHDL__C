library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab2_1 is
port (
	KEY : in std_logic_vector(1 downto 0);--will be our clock
	SW : in std_logic_vector(1 downto 0);--will be the enable and the reset
	HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(0 to 6);--let's try and use the to command this time
	Q : out unsigned(15 downto 0));
end lab2_1;

architecture beh of lab2_1 is

COMPONENT decoder7 --this time it will convert a 4bits to hexa display
PORT ( 	C : IN STD_LOGIC_VECTOR(3 downto 0);
			Display : OUT STD_LOGIC_VECTOR(0 to 6));
END COMPONENT;

--signals? yes, because we need the value of Q to add to Q,...
--but it is an output signal and we can't read it without a signal
--so;
--signal sum_out : unsigned(15 downto 0) := (others=>'0');--it will then be separated in 4 pieces
signal sum_out : unsigned(15 downto 0) := (others=>'0');
signal stdsum_out : std_logic_vector(15 downto 0);

begin
	process(KEY,SW)
	begin	--process
		if (SW(0) = '0') then
			Q <= (others=> '0');--checkin' the asynchronous reset
			
		else if (KEY(0) = '1' and KEY(0)' event) then--positiv edge
		
			if (SW(1) = '1') then --letting the +1 only if enable is on
					sum_out <= sum_out + 1;
					Q <= sum_out;
				end if;--enable
			  end if;--clock
		end if;--resetn
	end process;
	
--the spliting of the sum_out signal
H0: decoder7 port map (std_logic_vector(sum_out(3 downto 0)), HEX0);--probleme here because of type
H1: decoder7 port map (std_logic_vector(sum_out(7 downto 4)), HEX1);--must get unsigned to std_logic
H2: decoder7 port map (std_logic_vector(sum_out(11 downto 8)), HEX2);--because sum_out is unsigned
H3: decoder7 port map (std_logic_vector(sum_out(15 downto 12)), HEX3);--and decoder 7 takes logic_vector
	
end beh;