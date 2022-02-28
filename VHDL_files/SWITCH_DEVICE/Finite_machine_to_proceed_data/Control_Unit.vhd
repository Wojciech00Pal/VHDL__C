library ieee;
use IEEE.STD_LOGIC_1164.all;

entity Control_Unit is
port(
  clock: in std_logic;
  req0,req1,req2,req3: in std_logic_vector(1 downto 0);--bit from array
  valid0,valid1,valid2,valid3: in std_logic;
  grant0,grant1,grant2,grant3:out std_logic_vector(1 downto 0)
);
end Control_Unit;



Architecture beh of Control_Unit is

component Decoder port(
req:in std_logic_vector(1 downto 0);
valid: in std_logic;
req_out:out std_logic_vector(3 downto 0)
); 
end component;

component matrixarbiter 
port(
    clk         : in  std_logic;
    rst         : in  std_logic:='0';
    update_prty : in  std_logic:='0';----------------idk
    requests    : in  std_logic_vector(3 downto 0);
    grants      : out std_logic_vector(3 downto 0)
);
end component;

component Encoder
port(
grant_in:in std_logic_vector(3 downto 0);
y: OUT Std_logic_vector(1 downto 0)

);
end component;

signal dec_out0,dec_out1,dec_out2,dec_out3:std_logic_vector(3 downto 0);
--signal grant_out0,grant_out1,grant_out2,grant_out3: std_logic_vector(1 downto 0);
signal arbiter_out0,arbiter_out1,arbiter_out2,arbiter_out3: std_logic_vector(3 downto 0);
---------------
-----How decoders work with 1 bit validity and 2 out bits

begin
up_00:Decoder
port map(
req=>req0,
valid=>valid0,
req_out=>dec_out0
);

up_00_natrix:matrixarbiter
port map(
clk=>clock,
requests=>dec_out0,
grants=>arbiter_out0
);

up_00_encoder:Encoder
port map(
grant_in=>arbiter_out0,
y=>grant0
);
--------------------------------------------1

up_01:Decoder
port map(
req=>req1,
valid=>valid1,
req_out=>dec_out1
);

up_01_natrix:matrixarbiter
port map(
clk=>clock,
requests=>dec_out1,
grants=>arbiter_out1
);

up_01_encoder:Encoder
port map(
grant_in=>arbiter_out1,
y=>grant1
);
----------------------------2
up_02:Decoder
port map(
req=>req2,
valid=>valid2,
req_out=>dec_out2
);

up_02_natrix:matrixarbiter
port map(
clk=>clock,
requests=>dec_out2,
grants=>arbiter_out2
);

up_02_encoder:Encoder
port map(
grant_in=>arbiter_out2,
y=>grant2
);

-----------------3---------
up_03:Decoder
port map(
req=>req3,
valid=>valid3,
req_out=>dec_out3
);

up_03_natrix:matrixarbiter
port map(
clk=>clock,
requests=>dec_out3,
grants=>arbiter_out3
);

up_03_encoder:Encoder
port map(
grant_in=>arbiter_out3,
y=>grant3
);
end beh;