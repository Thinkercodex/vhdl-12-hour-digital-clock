library ieee;
use ieee.std_logic_1164.all;

package Module60CounterPackage is
	component Module60Counter
		port(	en : in std_logic;
				reset : in std_logic;
				clock : in std_logic;
				q : out std_logic_vector(5 downto 0));
	end component;
end Module60CounterPackage;
