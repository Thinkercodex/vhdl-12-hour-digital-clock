library ieee;
use ieee.std_logic_1164.all;

--Radix 2 To AM Or PM Converter
entity Radix2ToAMOrPMConverter is
	port(	valIn : in std_logic;
			hexA_P : out std_logic_vector(0 to 6);
			hexML : out std_logic_vector(0 to 6);
			hexMR : out std_logic_vector(0 to 6));
end Radix2ToAMOrPMConverter;

-------------------------------
--Diplay examples:
-- When AM:			_  _  _
--				   |_|| || |
--				   | ||    |
--
-- When PM:			_  _  _
--				   |_|| || |
--				   |  |    |
-------------------------------

architecture behaviour of Radix2ToAMOrPMConverter is
begin
	
	hexML <= "0001101";
	
	hexMR <= "0011001";
	
	process(valIn)
	begin
		case valIn is
			when '0' =>
				hexA_P <= "0001000";
			when '1' =>
				hexA_P <= "0011000";
		end case;
	end process;
end behaviour;
