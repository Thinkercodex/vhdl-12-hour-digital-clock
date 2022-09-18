library ieee;
use ieee.std_logic_1164.all;

package Radix2ToAMOrPMConverterPackage is
	component Radix2ToAMOrPMConverter
		port(	valIn : in std_logic;
				hexA_P : out std_logic_vector(0 to 6);
				hexML : out std_logic_vector(0 to 6);
				hexMR : out std_logic_vector(0 to 6));
	end component;
end Radix2ToAMOrPMConverterPackage;
