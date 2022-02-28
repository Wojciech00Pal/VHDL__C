library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test is
port(
KEY : in std_logic_vector(3 downto 0);--will use key(0) for reset
CLK_50: in std_logic;--will be used for the pll
VGA_CLK : out std_logic;--to give to DAC
VGA_HS, VGA_VS : out std_logic;--the syncro of horizontal and vertical pointer. these will have to be shifted by 1 clock signal
VGA_R,VGA_G,VGA_B : out std_logic_vector(7 downto 0);--that will be decoded by the DAC
VGA_SYNC_N, VGA_BLANK_N : out std_logic -- to give to DAC and let him do the work
); 
end test;


architecture beh of test is

--Need two signals for key(0) being the in rst of pll and out locked of pll
signal rst_pll : std_logic;
signal locked_pll : std_logic;
signal rst_n : std_logic;
signal VGACLK,clk : std_logic := '0';--coming out of pll

--signals for synchro
signal hsync,vsync,dispen : std_logic;
signal colsync : integer range 0 to 640;
signal rowsync : integer range 0 to 480;

--signals for the counter to memory-
signal adx : integer range 0 to 25343;--from 0 to 25343
signal adx_vector : std_logic_vector(15 downto 0);
signal cntena : std_logic;
--R G B signals coming out of memory--
signal R,G,B : std_logic_vector (7 downto 0);

------------------SYNCH---------
component synchro is
  GENERIC(
    h_pulse  : INTEGER := 96;
    h_bp     : INTEGER := 48;
    h_pixels : INTEGER := 640;
    h_fp     : INTEGER := 16;
    h_pol    : STD_LOGIC := '0';
    v_pulse  : INTEGER := 2;
    v_bp     : INTEGER := 33;
    v_pixels : INTEGER := 480;
    v_fp     : INTEGER := 10;
    v_pol    : STD_LOGIC := '0');
  PORT(
    pixel_clk : IN   STD_LOGIC;
    reset_n   : IN   STD_LOGIC;
    h_sync    : OUT  STD_LOGIC;
    v_sync    : OUT  STD_LOGIC;
    disp_ena  : OUT  STD_LOGIC;
    column    : OUT  INTEGER;
    row       : OUT  INTEGER;
    n_blank   : OUT  STD_LOGIC;
    n_sync    : OUT  STD_LOGIC);
end component synchro;

--------------PLL---------------
component mypll is
port (
		refclk   : in  std_logic := '0'; --  refclk.clk
		rst      : in  std_logic := '0'; --   reset.reset
		outclk_0 : out std_logic;        -- outclk0.clk
		outclk_1 : out std_logic;        -- outclk1.clk
		locked   : out std_logic);       --  locked.export
end component mypll;

component control is
port(
	enable, rst, clock	: in std_logic;
	column					: in integer;--the x axis
	row						: in integer;--the y axis
	memR,memG,memB			: in std_logic_vector (7 downto 0);
	cntenabl					: out std_logic;--will give the right to count to counter
	vgaR, vgaG, vgaB		: out std_logic_vector(7 downto 0));
end component control;

--------MEMORIES------------
component img_rom_r is 
PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		rden		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component img_rom_r;

component img_rom_g is 
PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		rden		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component img_rom_g;

component img_rom_b is 
PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		rden		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component img_rom_b;

---------counter for memory adresses----
component counter is
port(
clock : in std_logic;
reset : in std_logic;
enable : in std_logic;
counter : out integer
);
end component counter;


begin--architecture

---------PLL signals gestion----------
rst_pll <= not key(0);--or maybe just key(0) since the pll reset works on high active
rst_n <= locked_pll and key(0);

---------VGA_CLK going out------------
VGA_CLK <= vgaclk;

---------D flip flop -----------------
process(vgaclk, rst_n)
begin--process
	if(rst_n = '0') then
		VGA_HS <= '0';
		VGA_VS <= '0';
	else
		if(vgaclk'event and vgaclk ='1') then
			VGA_HS <= hsync;
			VGA_VS <= vsync;
		end if;
	end if;
end process;


--peut pas brancher des signaux à des sorties de components puisqu'on ne branche les components qu'à la fin
--clk <= outclk_0;
--vgaclk <= outclk_1;
--mais pas besoin en fait puisqu'on saura grace au port map qu'on a outclock0 dans clk

-------------------
--a suivre, faire les D-register pour Hsync et vsync
-------------------
--adx_vector <= std_logic_vector(to_unsigned(adx, adx_vector'length));

--c_sync: sync port map(entité du component => signal//I/O) ou directement(signal//I/O)
c_sync: synchro port map(vgaclk,rst_n,hsync,vsync,dispen,colsync,rowsync,VGA_SYNC_N, VGA_BLANK_N);
c_pll: mypll port map(CLK_50, rst_pll, clk, vgaclk, locked_pll);
c_counter: counter port map(clk,rst_n, cntena, adx);
c_memoryRed: img_rom_r port map(not rst_n, std_logic_vector(to_unsigned(adx, 15)), clk, dispen, R);
c_memoryGreen: img_rom_g port map(not rst_n, std_logic_vector(to_unsigned(adx, 15)), clk, dispen, G);
c_memoryBlue: img_rom_b port map(not rst_n, std_logic_vector(to_unsigned(adx, 15)), clk, dispen, B);
c_control: control port map(dispen,rst_n,clk,colsync,rowsync, R, G, B, cntena, VGA_R,VGA_G,VGA_B);



end beh;