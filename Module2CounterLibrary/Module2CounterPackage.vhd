library ieee;
use ieee.std_logic_1164.all;

package Module2CounterPackage is
	component Module2Counter
		port(	en : in std_logic;
				reset : in std_logic;
				clock : in std_logic;
				q : out std_logic);
	end component;
end Module2CounterPackage;
