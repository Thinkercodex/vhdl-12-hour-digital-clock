library ieee;
use ieee.std_logic_1164.all;

package TuneClockPackage is
	component TuneClock
			port(	clock : in std_logic;
					clock1_60Hz : out std_logic);
	end component;
end TuneClockPackage;
