library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MUX_4WAY_tb_2 is
end;

architecture bench of MUX_4WAY_tb is

  component MUX_4WAY
  GENERIC(N: INTEGER:= 4);
  port (
  	A0,A1,A2,A3:IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  	Y: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  	S: in std_logic_vector(1 downto 0)
  	);
  end component;

  signal A0,A1,A2,A3: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  signal Y: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  signal S: std_logic_vector(1 downto 0) ;

begin

  -- Insert values for generic parameters !!
  uut: MUX_4WAY generic map ( N  =>  )
                   port map ( A0 => A0,
                              A1 => A1,
                              A2 => A2,
                              A3 => A3,
                              Y  => Y,
                              S  => S );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    wait;
  end process;


end;