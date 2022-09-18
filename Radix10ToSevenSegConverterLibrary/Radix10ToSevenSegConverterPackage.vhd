library ieee;
use ieee.std_logic_1164.all;

package Radix10ToSevenSegConverterPackage is
	component Radix10ToSevenSegConverter
		port(	valIn : in std_logic_vector(5 downto 0);
				digit0 : out std_logic_vector(0 to 6);
				digit1 : out std_logic_vector(0 to 6));
	end component;
end Radix10ToSevenSegConverterPackage;
