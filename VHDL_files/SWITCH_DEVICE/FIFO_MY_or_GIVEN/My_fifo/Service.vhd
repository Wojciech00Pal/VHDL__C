library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Service is
port(
	 DIN0,DIN1,DIN2,DIN3:IN STD_LOGIC_VECTOR(35 DOWNTO 0);--THE AFTER FIFO MSB CUT OUT
	 grant0,grant1,grant2,grant3:in std_logic_vector(1 downto 0);
	 dout0,dout1,dout2,dout3: out STD_LOGIC_VECTOR(34 DOWNTO 0);--FINAL out
	 rdclk: IN std_logic;
	 wrclk: in std_logic;
	 wrreq0,wrreq1,wrreq2,wrreq3: in std_logic 	--from tb
);
end Service;

ARCHITECTURE BEH OF Service IS
 
COMPONENT crossbar
 PORT(
	A,B,C,D:IN STD_LOGIC_VECTOR(34 downto 0);
   	g0,g1,g2,g3:in std_logic_vector(1 downto 0);
	y0,y1,y2,y3:out std_logic_vector(34 downto 0)
);
end component;

component mux1x2
port(
A:IN STD_LOGIC_VECTOR(34 downto 0);--fifo in 35 down to 0
y,y3:out std_logic_vector(34 downto 0)--out to crossbar 34 downto 0
);
end component;


component My_fifo
port(
	D:IN STD_LOGIC_VECTOR(35 DOWNTO 0);
	wreq:in std_logic;
	rdreq:in std_logic;
	wrclk,rdclk:in std_logic;
	Y: OUT STD_LOGIC_VECTOR(34 DOWNTO 0)
);
end component;

component rd_block
port(
i:in std_logic_vector(1 downto 0);
req_i:in std_logic_vector(1 downto 0);
gr0,gr1,gr2,gr3:in std_logic_vector(1 downto 0);
read_i:out std_logic
);
end component;


 --signal write0, write1, write2, write3: std_logic; --in test bench write request
 signal read0,read1,read2,read3: std_logic;--CONNECT TO RDREQ IN FIFO, read data
 signal req0,req1,req2,req3: std_logic_vector(1 downto 0);
 signal fifo_out0,fifo_out1,fifo_out2,fifo_out3: std_logic_vector(34 downto 0);--fifo cut one extra bit msb
 signal fifo_cross0,fifo_cross1,fifo_cross2,fifo_cross3: std_logic_vector(34 downto 0); 
 
begin

REq0<=DIN0(33 downto 32);  
REq1<=DIN1(33 downto 32);  
REq2<=DIN2(33 downto 32);  
REq3<=DIN3(33 downto 32);  

up_00rd:RD_BLOCK
PORT MAP(
i=>"00",
REQ_i=>REq0,
gr0=>grant0,
gr1=>grant1,
gr2=>grant2,
gr3=>grant3,
read_i=>read0	--decision to make, controlled in RD-block
);		 
 
up_00_fifo:My_fifo
port map(
		D=>DIN0,
		rdclk=>rdclk,
		rdreq=>read0,--controlled by RD-BLOC,when 1 take from fifo out
		wrclk=>wrclk,--
		wreq=>wrreq0,--write request TEST BENCH
		Y=>fifo_cross0
); 
		

--check validity
--up_00_mux1x2:mux1x2
--PORT MAP(
--A=>FIFO_out0,
--Y=>fifo_cross0
--);
---------------1
up_01rd:RD_BLOCK
PORT MAP(
i=>"01",
REQ_i=>REq1,
gr0=>grant0,
gr1=>grant1,
gr2=>grant2,
gr3=>grant3,
read_i=>read1	--decision to make, controlled in RD-block
);		 
 
up_01_fifo:My_fifo
port map(
		D=>DIN1,
		rdclk=>rdclk,
		rdreq=>read1,--controlled by RD-BLOC,when 1 take from fifo out
		wrclk=>wrclk,--
		wreq=>wrreq1,--write request TEST BENCH
		Y=>fifo_cross1
); 
		

--------------------2------
up_10rd:RD_BLOCK
PORT MAP(
i=>"10",
REQ_i=>REq2,
gr0=>grant0,
gr1=>grant1,
gr2=>grant2,
gr3=>grant3,
read_i=>read2	--decision to make, controlled in RD-block
);		 
 
up_10_fifo:My_fifo
port map(
		D=>DIN2,
		rdclk=>rdclk,
		rdreq=>read2,--controlled by RD-BLOC,when 1 take from fifo out
		wrclk=>wrclk,--
		wreq=>wrreq2,--write request TEST BENCH
		Y=>fifo_cross2
); 
		

--check validity
--up_10_mux1x2:mux1x2
--PORT MAP(
--A=>FIFO_out2,
--Y=>fifo_cross2);

-----------------------3
up_11rd:RD_BLOCK
PORT MAP(
i=>"11",
REQ_i=>REq3,
gr0=>grant0,
gr1=>grant1,
gr2=>grant2,
gr3=>grant3,
read_i=>read3	--decision to make, controlled in RD-block
);		 
 
up_11_fifo:My_fifo
port map(
		D=>DIN3,
		rdclk=>rdclk,
		rdreq=>read3,--controlled by RD-BLOC,when 1 take from fifo out
		wrclk=>wrclk,--
		wreq=>wrreq3,--write request TEST BENCH
		Y=>fifo_cross3
); 
		



----------crosss
CROSS:crossbar
 PORT MAP(
	A=>fifo_cross0,
	B=>fifo_cross1,
	C=>fifo_cross2,
	D=>fifo_cross3,
        g0=>grant0,
	g1=>grant1,
	g2=>grant2,
	g3=>grant3,
	y0=>dout0,
	y1=>dout1,
	y2=>dout2,
	y3=>dout3
);




end beh;