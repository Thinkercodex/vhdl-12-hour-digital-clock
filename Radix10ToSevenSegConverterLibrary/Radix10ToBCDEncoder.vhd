library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

--Radix 10 (6-bit encoded) To BCD (4-bit encoded)
entity Radix10ToBCDEncoder is
	port(	valIn : in std_logic_vector(5 downto 0);
			bcdDigit0 : out std_logic_vector(3 downto 0);
			bcdDigit1 : out std_logic_vector(3 downto 0));
end Radix10ToBCDEncoder;

architecture behaviour of Radix10ToBCDEncoder is

signal bcdDigit0Wire : std_logic_vector(5 downto 0);

signal bcdDigit1Wire : std_logic_vector(5 downto 0);

begin
	
	bcdDigit0Wire <= std_logic_vector(unsigned(valIn) rem 10);
	
	--First two bits of bcdDigit0Wire will always be "00" after conversion
	bcdDigit0 <= bcdDigit0Wire(3 downto 0);
	
	bcdDigit1Wire <= std_logic_vector(unsigned(valIn) / 10);
	
	--First two bits of bcdDigit1Wire will always be "00" after conversion
	bcdDigit1 <= bcdDigit1Wire(3 downto 0);
	
end behaviour;
