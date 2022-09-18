library ieee;
use ieee.std_logic_1164.all;

package TFlipFlopPackage is
	component TFlipFlop
		port(	t : in std_logic;
				presetN : in std_logic;
				clearN : in std_logic;
				clock : in std_logic;
				q : out std_logic);
	end component;
end TFlipFlopPackage;
