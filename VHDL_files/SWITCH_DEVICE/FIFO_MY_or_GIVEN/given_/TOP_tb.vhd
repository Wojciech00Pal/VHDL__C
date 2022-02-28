library ieee;
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity TOP_tb is 
end TOP_tb;


architecture TEST of TOP_tb is
--GENERIC (N:INTEGER:=4);
	component top
	port(
    DIN0,DIN1,DIN2,DIN3:IN STD_LOGIC_VECTOR(35 DOWNTO 0);--THE AFTER FIFO MSB CUT OUT
	 grant0,grant1,grant2,grant3:in std_logic_vector(1 downto 0);
	 dout0,dout1,dout2,dout3: out STD_LOGIC_VECTOR(34 DOWNTO 0);--FINAL out
	 rdclk: IN std_logic;
	 wrclk: in std_logic;
	 wrreq0,wrreq1,wrreq2,wrreq3: in std_logic;
	 write_enable:in std_logic--to unable readreq
	  );
	end component;
	

	signal DIN0_t,DIN1_t,DIN2_t,DIN3_t: std_logic_vector(35 downto 0);--in
	signal grant0_t,grant1_t,grant2_t,grant3_t:std_logic_vector(1 downto 0);--in mux
	signal dout0_t, dout1_t,dout2_t,dout3_t: std_logic_VECTOR(34 DOWNTO 0);
	signal rdclk_t: std_logic;
	signal wrclk_t: std_logic;
	signal wrreq0_t,wrreq1_t,wrreq2_t,wrreq3_t: std_logic;
	signal read_unable:std_logic;--read_req is unable
	
	begin
	dut_t:TOP PORT MAP(
	 DIN0=> DIN0_t,DIN1=>DIN1_t,DIN2=>DIN2_t,DIN3=>DIN3_t,
	 grant0=>grant0_t,grant1=>grant1_t,grant2=>grant2_t,grant3=>grant3_t,
	 dout0=>dout0_t, dout1=>dout1_t,dout2=>dout2_t,dout3=>dout3_t,
	 rdclk=>rdclk_t,
	 wrclk=>wrclk_t,
	 wrreq0=>wrreq0_t,wrreq1=>wrreq1_t,wrreq2=>wrreq2_t,wrreq3=>wrreq3_t,
	 write_enable=>read_unable
	 );
	 ------
process
begin--------------improve
--4 pbits taken we need 31
--1111111111111111111111111111111

		 DIN0_t<=("1111" & ("11111111111111111111111111111100"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1110" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("111011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='0';
		 wrclk_t<='0';-------only two clocks needed
		 wrreq0_t<='1';--nothing written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='1';
		 
		 wait for 1 ns;	 
       --1
		 DIN0_t<=("1111" & ("11111111111111111111111111111100"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1110" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("111011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='1';
		 wrclk_t<='1';-------only two clocks needed
		 wrreq0_t<='1';--nothing written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='1';
		 

		 wait for 1 ns;
---0
 DIN0_t<=("1111" & ("11111111111111111111111111111100"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1110" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("111011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='0';
		 wrclk_t<='0';-------only two clocks needed
		 wrreq0_t<='1';--nothing written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='1';
		 
		 wait for 1 ns;
--1
		 DIN0_t<=("1111" & ("11111111111111111111111111111100"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1110" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("111011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='1';
		 wrclk_t<='1';-------only two clocks needed
		 wrreq0_t<='1';-- written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='1';
		 
		 wait for 1 ns;
		 
--4 clc cycles
--then on rising edge possible writing proceder
--0

		 DIN0_t<=("1100" & ("11111111111111111111111111111100"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1010" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("101011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");
		 grant3_t<=("00");
		 rdclk_t<='0';
		 wrclk_t<='0';-------only two clocks needed
		 wrreq0_t<='1';--first all valid is written to fifo_0
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='1';
		 
		 
		 wait for 1 ns;
		 --1 => first writing operation
		 DIN0_t<=("1100" & ("11111111111111111111111111111100"));--35 bits, 34 has to be 1(valid), 33-32 -> 00 to produce rdreq
		 DIN1_t<=("1010" & ("11111111111111111111111111111101"));--invalid dont care
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("101011111111111111111111111111111111");--invalid dont care
		 grant0_t<=("00");
		 grant1_t<=("01");
		 grant2_t<=("10");
		 grant3_t<=("11");
		 rdclk_t<='1';
		 wrclk_t<='1';-------only two clocks needed
		 wrreq0_t<='1';--nothing written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='1';
		 
		
		 wait for 1 ns;
		--0
		 DIN0_t<=("1100" & ("11111111111111111111111111111101"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1010" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("101011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='0';
		 wrclk_t<='0';    --only two clocks needed
		 wrreq0_t<='1';  
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='1';
		  
		 wait for 1 ns;		 
		 --1
		 DIN0_t<=("1100" & ("11111111111111111111111111111101"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1110" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("111011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='1';
		 wrclk_t<='1';-------only two clocks needed
		 wrreq0_t<='1';--nothing written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='1';
		  
		 	 wait for 1 ns;
		--0
		 DIN0_t<=("1100" & ("11111111111111111111111111111101"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1010" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("101011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='0';
		 wrclk_t<='0';-------only two clocks needed
		 wrreq0_t<='0';--nothing written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='1';--buffor write 0 and read 0
		  
		 wait for 1 ns;		 
		 --1
		 DIN0_t<=("1100" & ("11111111111111111111111111111101"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1110" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("111011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='1';
		 wrclk_t<='1';-------only two clocks needed
		 wrreq0_t<='0';--nothing written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='1';
		 
		 	 wait for 1 ns;
		--0
		 DIN0_t<=("1100" & ("11111111111111111111111111111101"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1010" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("101011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='0';
		 wrclk_t<='0';-------only two clocks needed
		 wrreq0_t<='0';--nothing written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='1';
		 
		 
		 wait for 1 ns;		 
		 --1
		 DIN0_t<=("1100" & ("11111111111111111111111111111101"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1110" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("111011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='1';
		 wrclk_t<='1';-------only two clocks needed
		 wrreq0_t<='0';--nothing written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='1';
		 
		 	 	 wait for 1 ns;
		--0
		 DIN0_t<=("1100" & ("11111111111111111111111111111101"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1010" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("101011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='0';
		 wrclk_t<='0';-------only two clocks needed
		 wrreq0_t<='0';--nothing written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='0';--should start 
		 
		 
		 wait for 1 ns;		 
		 --1
		 DIN0_t<=("1100" & ("11111111111111111111111111111101"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1110" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("111011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='1';
		 wrclk_t<='1';-------only two clocks needed
		 wrreq0_t<='0';--nothing written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='0';
		 
		 	 	 wait for 1 ns;
		--0
		 DIN0_t<=("1100" & ("11111111111111111111111111111101"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1010" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("101011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='0';
		 wrclk_t<='0';-------only two clocks needed
		 wrreq0_t<='0';--nothing written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='0';
		 
		 
		 wait for 1 ns;		 
		 --1
		 DIN0_t<=("1100" & ("11111111111111111111111111111101"));--din0,valid=1 & req output dout3 ,so grant3 should be for us 00
		 DIN1_t<=("1110" & ("11111111111111111111111111111101"));--din1,valid=1 & req output dout2, so grant2 should be 01
		 DIN2_t<=("000011111111111111111111111111111110");--invalid
		 DIN3_t <= ("111011111111111111111111111111111111");--valid, & req=00 so output dout0, so grant0 ought to be 11 
		 grant0_t<=("00");
		 grant1_t<=("00");
		 grant2_t<=("00");--giitt
		 grant3_t<=("00");--ggit, WRITING IN FIFO
		 rdclk_t<='1';
		 wrclk_t<='1';-------only two clocks needed
		 wrreq0_t<='0';--nothing written
		 wrreq1_t<='0';
		 wrreq2_t<='0';
		 wrreq3_t<='0';
		 read_unable<='0';
		 
		wait;
	end process;
end TEST;	
	