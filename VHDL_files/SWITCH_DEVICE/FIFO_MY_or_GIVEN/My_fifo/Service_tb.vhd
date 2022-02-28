library ieee;
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity Service_tb is 
end Service_tb;


architecture TEST of Service_tb is
--GENERIC (N:INTEGER:=4);
	component Service
	port(
	 DIN0,DIN1,DIN2,DIN3:IN STD_LOGIC_VECTOR(35 DOWNTO 0);--THE AFTER FIFO MSB CUT OUT
	 grant0,grant1,grant2,grant3:in std_logic_vector(1 downto 0);
	 dout0,dout1,dout2,dout3: out STD_LOGIC_VECTOR(34 DOWNTO 0);--FINAL out
	 rdclk: IN std_logic;
	 wrclk: in std_logic;
	 wrreq0,wrreq1,wrreq2,wrreq3: in std_logic 	--from tb
	  );
	end component;
	
	signal DIN0_t,DIN1_t,DIN2_t,DIN3_t: std_logic_vector(35 downto 0);--in
	signal grant0_t,grant1_t,grant2_t,grant3_t:std_logic_vector(1 downto 0);--in mux
	signal dout0_t, dout1_t,dout2_t,dout3_t: std_logic_VECTOR(34 DOWNTO 0);
	signal rdclk_t: std_logic;
	signal wrclk_t: std_logic;
	signal wrreq0_t,wrreq1_t,wrreq2_t,wrreq3_t: std_logic;
	
	begin
	dut_t:Service PORT MAP(
	 DIN0=> DIN0_t,DIN1=>DIN1_t,DIN2=>DIN2_t,DIN3=>DIN3_t,
	 grant0=>grant0_t,grant1=>grant1_t,grant2=>grant2_t,grant3=>grant3_t,
	 dout0=>dout0_t, dout1=>dout1_t,dout2=>dout2_t,dout3=>dout3_t,
	 rdclk=>rdclk_t,
	 wrclk=>wrclk_t,
	 wrreq0=>wrreq0_t,wrreq1=>wrreq1_t,wrreq2=>wrreq2_t,wrreq3=>wrreq3_t
	 );
	 
	 
	 
	 
process
 begin
		 DIN0_t<=("1111" & ("11111111111111111111111111111100"));--req 11 (bit 33,32)
		 DIN1_t<=("0110" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("011011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("10");
		 grant1_t<=("01");
		 grant2_t<=("10");
		 grant3_t<=("00");--So here we got 00, so from mux we got 00 comparator gives '1' => it is possible to write and read
		 rdclk_t<='0';
		 wrclk_t<='0';-------only two clocks needed
		 wrreq0_t<='1';
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 
		 wait for 1 ns;	 
       --1
		 DIN0_t<=("1111" & ("11111111111111111111111111111100"));--req 11 (bit 33,32)
		 DIN1_t<=("0110" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("0000" & ("11111111111111111111111111111110"));
		 DIN3_t<=("0100" & ("11111111111111111111111111110011"));
		 grant0_t<=("10");
		 grant1_t<=("01");
		 grant2_t<=("10");
		 grant3_t<=("00");--So here we got 00, so from mux we got 00 comparator gives '1' => it is possible to write and read
		 rdclk_t<='1';
		 wrclk_t<='1';-------only two clocks needed
		 wrreq0_t<='1';
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 
		 wait for 1 ns;
		 
		 DIN0_t<=("1111" & ("11111111111111111111111111111100"));
		 DIN1_t<=("0110" & ("11111111111111111111111111111101"));
		 DIN2_t<=("0000" & ("11111111111111111111111111111110"));
		 DIN3_t<=("0000" & ("11111111111111111111111111110011"));--req out is 00
		 grant0_t<=("11");--output 00 gives 11 so comparator gives 1
		 grant1_t<=("01");
		 grant2_t<=("01");
		 grant3_t<=("10");
		 rdclk_t<='0';
		 wrclk_t<='0';-------only two clocks needed
		 wrreq0_t<='0';
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='1';
		 
		 wait for 1 ns;	 
       --1
		 DIN0_t<=("1111" & ("11111111111111111111111111111100"));
		 DIN1_t<=("0110" & ("11111111111111111111111111111101"));
		 DIN2_t<=("0000" & ("11111111111111111111111111111110"));
		 DIN3_t<=("0000" & ("11111111111111111111111111111111"));--req out is 00
		 grant0_t<=("11");--output 00 gives 11 so comparator gives 1
		 grant1_t<=("01");
		 grant2_t<=("01");
		 grant3_t<=("10");
		 rdclk_t<='1';
		 wrclk_t<='1';-------only two clocks needed
		 wrreq0_t<='0';
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='1';
		 
		 wait for 1 ns;
		 
		 DIN0_t<=("1111" & ("11111111111111111111111111111100"));
		 DIN1_t<=("0110" & ("11111111111111111111111111111101"));
		 DIN2_t<=("0010" & ("11111111111111111111111111111110"));
		 DIN3_t<=("0100" & ("11111111111111111111111111110011"));--req out is 00
		 grant0_t<=("11");--output 00 gives 11 so comparator gives 1
		 grant1_t<=("01");
		 grant2_t<=("10");
		 grant3_t<=("11");
		 rdclk_t<='0';
		 wrclk_t<='0';-------only two clocks needed
		 wrreq0_t<='0';
		 wrreq1_t<='0';
		 wrreq2_t<='1';
		 wrreq3_t<='0';
		 
		 wait for 1 ns;	 
       --1
		 DIN0_t<=("1111" & ("11111111111111111111111111111100"));
		 DIN1_t<=("0110" & ("11111111111111111111111111111101"));
		 DIN2_t<=("0010" & ("11111111111111111111111111111110"));
		 DIN3_t<=("0100" & ("11111111111111111111111111111111"));--req out is 00
		 grant0_t<=("11");--output 00 gives 11 so comparator gives 1
		 grant1_t<=("01");
		 grant2_t<=("10");
		 grant3_t<=("11");
		 rdclk_t<='1';
		 wrclk_t<='1';-------only two clocks needed
		 wrreq0_t<='0';
		 wrreq1_t<='0';
		 wrreq2_t<='1';
		 wrreq3_t<='0';
		 
		 wait;
	
	end process;
end TEST;	
	