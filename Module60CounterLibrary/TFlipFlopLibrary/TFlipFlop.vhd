library ieee;
use ieee.std_logic_1164.all;

--T Flip Flop with synchronous, active low, clear and preset
entity TFlipFlop is
	port(	t : in std_logic;
			presetN : in std_logic;
			clearN : in std_logic;
			clock : in std_logic;
			q : out std_logic);
end TFlipFlop;

architecture behaviour of TFlipFlop is

	signal qWire : std_logic;

begin
	process(clock)
	begin
		if(rising_edge(clock)) then
			if((presetN xor clearN) = '1') then
				qWire <= clearN;
			elsif(t = '1') then
				qWire <= not(qWire);
			else
				qWire <= qWire;
			end if;
		end if;
	end process;
	
	q <= qWire;
end behaviour;
