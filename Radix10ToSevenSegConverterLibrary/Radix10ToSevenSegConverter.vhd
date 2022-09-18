library ieee;
use ieee.std_logic_1164.all;

--Radix 10 (6 bit encoded) To Seven Segment Converter
entity Radix10ToSevenSegConverter is
	port(	valIn : in std_logic_vector(5 downto 0);
			digit0 : out std_logic_vector(0 to 6);
			digit1 : out std_logic_vector(0 to 6));
end Radix10ToSevenSegConverter;

architecture behaviour of Radix10ToSevenSegConverter is

component Radix10ToBCDEncoder
	port(	valIn : in std_logic_vector(5 downto 0);
			bcdDigit0 : out std_logic_vector(3 downto 0);
			bcdDigit1 : out std_logic_vector(3 downto 0));
end component;

component BCDTo7SegDecoder
	port(	valIn : in std_logic_vector(3 downto 0);
			seg7Val : out std_logic_vector(0 to 6));
end component;

signal bcdDigitWire0 : std_logic_vector(3 downto 0);
signal bcdDigitWire1 : std_logic_vector(3 downto 0);

begin
	
	convertRad10BCD : Radix10ToBCDEncoder port map(valIn, bcdDigitWire0, bcdDigitWire1);
	
	convertBCDSevenSeg0 : BCDTo7SegDecoder port map(bcdDigitWire0, digit0);
	
	convertBCDSevenSeg1 : BCDTo7SegDecoder port map(bcdDigitWire1, digit1);
	
end behaviour;
