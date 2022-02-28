library ieee;
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
 
 
 ENTITY TOP IS
 PORT(
    DIN0,DIN1,DIN2,DIN3:IN STD_LOGIC_VECTOR(35 DOWNTO 0);--THE AFTER FIFO MSB CUT OUT
	 grant0,grant1,grant2,grant3:in std_logic_vector(1 downto 0);
	 dout0,dout1,dout2,dout3: out STD_LOGIC_VECTOR(34 DOWNTO 0);--FINAL out
	 rdclk: IN std_logic;
	 wrclk: in std_logic;
	 wrreq0,wrreq1,wrreq2,wrreq3: in std_logic;
	 write_enable:in std_logic--to unable readreq
	 );
 end TOP;
 
ARCHITECTURE BEH OF TOP IS
 
COMPONENT crossbar
 PORT(
	A,B,C,D:IN STD_LOGIC_VECTOR(34 downto 0);
   g0,g1,g2,g3:in std_logic_vector(1 downto 0);
	y0,y1,y2,y3:out std_logic_vector(34 downto 0)
);
end component;


component rd_block 
GENERIC(i: std_logic_vector:= "00");
port(
req_i:in std_logic_vector(1 downto 0);
write_enable: in std_logic;--the same name from top
gr0,gr1,gr2,gr3:in std_logic_vector(1 downto 0);
read_i:out std_logic
);
end component;

component mux1x2
port(
A:IN STD_LOGIC_VECTOR(35 downto 0);--fifo in 35 down to 0
y,y3:out std_logic_vector(34 downto 0)--out to crossbar 34 downto 0
);
end component;


component fifo 
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		data		: IN STD_LOGIC_VECTOR (35 DOWNTO 0);--msb is useless,
		rdclk		: IN STD_LOGIC ;
		rdreq		: IN STD_LOGIC ;
		wrclk		: IN STD_LOGIC ;
		wrreq		: IN STD_LOGIC ; --in in etity
		q		: 	  OUT STD_LOGIC_VECTOR (35 DOWNTO 0);--only this  OUT
		rdempty:   OUT STD_LOGIC ;
		wrfull:    OUT STD_LOGIC);
END component;

 --signal
 --signal zeroes: std_logic_vector(34 downto 0):=(others => '0');
 signal write0, write1, write2, write3: std_logic; --in test bench write request
 signal w_en:std_logic;--connection of write_enablele from top (write_enablele);
 signal read0,read1,read2,read3: std_logic;--CONNECT TO RDREQ IN FIFO, read data
 signal req0,req1,req2,req3: std_logic_vector(1 downto 0);
 signal fifo_out0,fifo_out1,fifo_out2,fifo_out3: std_logic_vector(35 downto 0);
 signal fifo_cross0,fifo_cross1,fifo_cross2,fifo_cross3: std_logic_vector(34 downto 0);--MSB deleted - to cross 

 
 
 begin
 
 
 --w_en<=write_enable;--assign to signal
 --write enable is input in top, if 1 readreq always 0
 
 --- from fifo in queee no din
 --shittt
-- req0<=DIN0(33 downto 32);
 --req1<=DIN1(33 downto 32);
 --req2<=DIN2(33 downto 32);
 --req3<=DIN3(33 downto 32);
 
 --it should be from fifoout????
 
 --read0<=DIN0(34);
 --read1<=DIN1(34);
 --read2<=DIN2(34);
 --read3<=DIN3(34);
 
-----------------------------------------0
up_00:fifo
port map(
		data=>DIN0,
		rdclk=>rdclk,
		rdreq=>read0,--controlled by RD-BLOC,when 1 take from fifo out
		wrclk=>wrclk,--
		wrreq=>write0,--write request test bench
		q=>fifo_out0
		); 

REq0<=fifo_out0(33 downto 32);  

up_00rd:RD_BLOCK
GENERIC MAP(
i=>"00"
)
PORT MAP(
REQ_i=>REq0,
--write_enable=>write_enable,--in test bench add, to make break after writing and then reading
gr0=>grant0,
gr1=>grant1,
gr2=>grant2,
gr3=>grant3,
read_i=>read0	--decision to make, controlled in RD-block
);		


--Mux, val as selection
--1X2
up_00_mux1x2:mux1x2
PORT MAP(
A=>FIFO_out0,
Y=>fifo_cross0
);

----------------------------------------------1
up_01_fifo:fifo
port map(
		data=>DIN0,
		rdclk=>rdclk,
		rdreq=>read0,--controlled by RD-BLOC,---------------------!!!!!!!!!!problemmmmm all time 1
		wrclk=>wrclk,--
		wrreq=>write1,--write request in test bench
		q=>fifo_out1
		); 

REq1<=fifo_out1(33 downto 32);  

up_01_rd:RD_BLOCK
GENERIC MAP(
i=>"01"
)
PORT MAP(
REQ_i=>REq1,
write_enable=>w_en,
gr0=>grant0,
gr1=>grant1,
gr2=>grant2,
gr3=>grant3,
read_i=>read1--decision to make, controlled in RD-block
);		


--Mux, val as selection
--1X2
up_01_mux1x2:mux1x2
PORT MAP(
A=>FIFO_out1,
Y=>fifo_cross1
);

--------------2-----------------------------
up_10_fifo:fifo
port map(
		data=>DIN0,
		rdclk=>rdclk,
		rdreq=>read2,--controlled by RD-BLOC,---------------------!!!!!!!!!!problemmmmm all time 1
		wrclk=>wrclk,--
		wrreq=>write2,--write request test bench
		q=>fifo_out0
		); 

REq2<=fifo_out0(33 downto 32);  

up_10_rd:RD_BLOCK
GENERIC MAP(
i=>"10"
)
PORT MAP(
REQ_i=>REq2,
write_enable=>w_en,
gr0=>grant0,
gr1=>grant1,
gr2=>grant2,
gr3=>grant3,
read_i=>read2--decision to make, controlled in RD-block
);		


--Mux, val as selection
--1X2
up_10_mux1x2:mux1x2
PORT MAP(
A=>FIFO_out2,
Y=>fifo_cross2
);

-----------3-------------
up_11_fifo:fifo
port map(
		data=>DIN0,
		rdclk=>rdclk,
		rdreq=>read3,--controlled by RD-BLOC,---------------------!!!!!!!!!!problemmmmm all time 1
		wrclk=>wrclk,--
		wrreq=>write3,--write request test bench
		q=>fifo_out3
		); 

REq0<=fifo_out3(33 downto 32);  

up_11_rd:RD_BLOCK
GENERIC MAP(
i=>"11"
)
PORT MAP(
REQ_i=>REq0,
write_enable=>w_en,
gr0=>grant0,
gr1=>grant1,
gr2=>grant2,
gr3=>grant3,
read_i=>read3--decision to make, controlled in RD-block
);		


--Mux, val as selection
--1X2
up_11_mux1x2:mux1x2
PORT MAP(
A=>FIFO_out3,
Y=>fifo_cross3
);
-----------to do

-- after all fifo ----------------------------------------
--In crossbar
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

 
 END BEH;
 