library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity REG_TB is 
end REG_TB;

architecture TEST of REG_TB is
--GENERIC (N:INTEGER:=4);
	component REG port(
	--N EQuals to 4
	D: in std_logic_vector(3 downto 0);--8 bits adder
	CLOCK,RESET:IN STD_LOGIC;
	Q:out std_logic_vector(3 downto 0)		--output

	);
	end component;

	signal D_t: std_logic_vector(3 DOWNTO 0);
	Signal CLK_t,RESET_t:std_logic;
    signal Q_t: std_logic_vector(3 downto 0);--output carrying bit
--add vector
begin

dut: REG port map (D=>D_t, CLOCK => CLK_t, RESET=> RESET_t, Q=>Q_t);


process
begin
D_t <= "1010";
CLK_t <= '0';
RESET_t <= '0';

wait for 1 ns;
D_t <= "0111";
CLK_t <= '1';
RESET_t <= '0';
wait for 1 ns;

D_t <= "1111";
CLK_t <= '0';
RESET_t <= '1';
wait for 1 ns;
D_t <= "1111";
CLK_t <= '1';
RESET_t <= '0';
wait for 1 ns;

D_t <= "0001";
CLK_t <= '0';
RESET_t <= '0';
wait for 1 ns;

D_t <= "0011";
CLK_t <= '1';
RESET_t <= '0';
wait for 1 ns;

wait;
end process;


end TEST;
