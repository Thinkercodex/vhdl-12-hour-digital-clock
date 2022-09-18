library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Tune a clock input signal into a (1/60)Hz signal
-- {INPUT CLOCK SIGNAL FREQUENCY}Hz/(1/60)Hz = number of stages
entity TuneClock is
	port(	clock : in std_logic;
			clock1_60Hz : out std_logic);
end TuneClock;

architecture behaviour of TuneClock is

signal clock1_60HzWire : std_logic_vector(1 downto 0);

begin
	process(clock)
	begin
		if(rising_edge(clock)) then
			--Reset clock once "clock1_60HzWire" counts to the max number of stages:
			if(clock1_60HzWire = "11") then
				clock1_60HzWire <= "00";
			else
				clock1_60HzWire <= clock1_60HzWire + 1;
			end if;
		end if;
	end process;
	
	
	--Reroute "clock" with "clock1_60HzWire" when determined 
	-- the number of stages needed to count to tune the clock:
	clock1_60Hz <= clock;
	
end behaviour;
