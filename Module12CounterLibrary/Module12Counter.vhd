library ieee;
use ieee.std_logic_1164.all;

library TFlipFlopLibrary;
use TFlipFlopLibrary.TFlipFlopPackage.all;

--Module 12 Counter (count 1 to 12)
entity Module12Counter is
	port(	en : in std_logic;
			reset : in std_logic;
			clock : in std_logic;
			q : out std_logic_vector(3 downto 0) := "0001");
end Module12Counter;

architecture behaviour of Module12Counter is

signal qWire : std_logic_vector(3 downto 0) := "0001";

signal restartN : std_logic;

begin
	
	FlipFlop0 : TFlipFlop port map(en, restartN, '1', clock, qWire(0));
	FlipFlop1 : TFlipFlop port map((en and qWire(0)), '1', restartN, clock, qWire(1));
	FlipFlop2 : TFlipFlop port map((en and qWire(0) and qWire(1)), '1', restartN, clock, qWire(2));
	FlipFlop3 : TFlipFlop port map((en and qWire(0) and qWire(1) and qWire(2)), '1', restartN, clock, qWire(3));
	
	restartN <= (not(qWire(0) and qWire(2) and qWire(3)) and reset);
	
	q <= qWire;
	
end behaviour;
