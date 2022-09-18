library ieee;
use ieee.std_logic_1164.all;

library TFlipFlopLibrary;
use TFlipFlopLibrary.TFlipFlopPackage.all;

--Module 2 Counter
entity Module2Counter is
	port(	en : in std_logic;
			reset : in std_logic;
			clock : in std_logic;
			q : out std_logic);
end Module2Counter;

architecture behaviour of Module2Counter is
begin
	
	FlipFlop0 : TFlipFlop port map(en, '1', reset, clock, q);
	
end behaviour;
