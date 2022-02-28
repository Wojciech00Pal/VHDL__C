library ieee;
use IEEE.STD_LOGIC_1164.all;


entity serializer_ctrl is
port(
  validity: in std_logic;--bit from array
  clock:    in std_logic;
  RESET:    IN STD_LOGIC;
  enable:   out std_logic;--enable deserializer output from ctrl unit
  load:     out std_logic
);
end serializer_ctrl;



Architecture beh of serializer_ctrl is

type my_state is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26
,S27,S28,S29,S30,S31,S32,S33,S34);

signal current_state, next_state: my_state;

begin

CURRENT_STATE_PROCESS: PROCESS(RESET,clock)------------------------------
  begin
  if(RESET='0') then--ACTIVE LOW
		current_state<=S0;
  ELSIF (CLOCK'event and clock='1') then
	   current_state<=next_state;
  end if;
end process;


next_stage_process: PROCESS(current_state,validity)
begin
	case current_state is
			when S0=>
				IF validity='0'then
				   NEXT_state<=S0;
				ELSE --bit validity = 1
					next_state<=S1;
				end if;	
			when S1=>
				next_state<=S3;
			when S2=>
				next_state<=S3;	
			when S3=>
				next_state<=S4;
			when S4=>
				next_state<=S5;
		    when S5=>
				next_state<=S6;
			when S6=>
				next_state<=S7;
			when S7=>
				next_state<=S8;
			when S8=>
				next_state<=S9;
			when S9=>
				next_state<=S10;
	        when S10=>
				next_state<=S11;
			when S11=>
				next_state<=S12;
			when S12=>
				next_state<=S13;
			when S13=>
				next_state<=S14;
			when S14=>
				next_state<=S15;
			when S15=>
				next_state<=S16;
			when S16=>
				next_state<=S17;
			when S17=>
				next_state<=S18;
			when S18=>
				next_state<=S19;
			when S19=>
				next_state<=S20;
			when S20=>
				next_state<=S21;
			when S21=>
				next_state<=S22;
			when S22=>
				next_state<=S23;
			when S23=>
				next_state<=S24;
			when S24=>
				next_state<=S25;
			when S25=>
				next_state<=S26;
			when S26=>
				next_state<=S27;
			when S27=>
				next_state<=S28;
			when S28=>
				next_state<=S29;
			when S29=>
				next_state<=S30;
			when S30=>
				next_state<=S31;
			when S31=>
				next_state<=S32;
			when S32=>
				next_state<=S33;
			when S33=>
				next_state<=S34;
			when S34=>
				next_state<=S0;
	END CASE;	
END PROCESS;

OUTPUT_ASSIGN:process(current_state,VALIDITY)
begin
		case current_state is
				when S0=>
				  ENABLE<='0';
				  LOAD<=VALIDITY;
				WHEN OTHERS=>
				  ENABLE<='1';
				  LOAD<='0';
      end case;
end process;
end beh;
