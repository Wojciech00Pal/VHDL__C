library ieee;
use IEEE.STD_LOGIC_1164.all;



entity matrixarbiter is
  port(
    clk         : in  std_logic;
    rst         : in  std_logic;
    update_prty : in  std_logic;
    requests    : in  std_logic_vector(3 downto 0);
    grants      : out std_logic_vector(3 downto 0)
   ); 
end matrixarbiter;

architecture behavior of matrixarbiter is


  type   masked_request_t is array (0 to 3) of std_logic_vector(3 downto 0);
  signal masked_request : masked_request_t;

  signal grant_tmp : std_logic_vector(3 downto 0);

  type   priority_t is array (0 to 3) of std_logic_vector(3 downto 0);
  signal priority_mask : priority_t;


  signal arbitration_first_stage  : priority_t;
  signal arbitration_second_stage : priority_t;



begin


  grants <= grant_tmp and requests;

  process(clk, rst)
  begin
    if rst = '1' then
      priority_mask(0) <= "1110";
      priority_mask(1) <= "1100";
      priority_mask(2) <= "1000";
      priority_mask(3) <= "0000";
    elsif clk = '1' and clk'event then
      if (grant_tmp(0) and requests(0)) = '1' then
        priority_mask(0)(0) <= '1';
        priority_mask(1)(0) <= '1';
        priority_mask(2)(0) <= '1';
        priority_mask(3)(0) <= '1';
        priority_mask(0)    <= (others => '0');
      end if;
      if (grant_tmp(1) and requests(1)) = '1' then
        priority_mask(0)(1) <= '1';
        priority_mask(1)(1) <= '1';
        priority_mask(2)(1) <= '1';
        priority_mask(3)(1) <= '1';
        priority_mask(1)    <= (others => '0');
      end if;
      if (grant_tmp(2) and requests(2)) = '1' then
        priority_mask(0)(2) <= '1';
        priority_mask(1)(2) <= '1';
        priority_mask(2)(2) <= '1';
        priority_mask(3)(2) <= '1';
        priority_mask(2)    <= (others => '0');
      end if;
      if (grant_tmp(3) and requests(3)) = '1' then
        priority_mask(0)(3) <= '1';
        priority_mask(1)(3) <= '1';
        priority_mask(2)(3) <= '1';
        priority_mask(3)(3) <= '1';
        priority_mask(3)    <= (others => '0');
      end if;
    end if;
  end process;


  TMP_GRANT : for i in 0 to 3 generate
    TMP_GRANT_2 : for j in 0 to 3 generate
      arbitration_first_stage(i)(j) <= requests(j) and priority_mask(j)(i);
    end generate;

    TMP_GRANT_3 : for l in 0 to 1 generate
      arbitration_second_stage(i)(l) <= arbitration_first_stage(i)(2*l) nor arbitration_first_stage(i)(2*l + 1);
    end generate;

    grant_tmp(i) <= arbitration_second_stage(i)(0) and arbitration_second_stage(i)(1);
  end generate TMP_GRANT;

  
end behavior;
