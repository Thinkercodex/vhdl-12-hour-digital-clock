library ieee;
use ieee.std_logic_1164.all;

library TFlipFlopLibrary;
use TFlipFlopLibrary.TFlipFlopPackage.all;

--Module 60 Counter
entity Module60Counter is
	port(	en : in std_logic;
			reset : in std_logic;
			clock : in std_logic;
			q : out std_logic_vector(5 downto 0));
end Module60Counter;

architecture behaviour of Module60Counter is

signal qWire : std_logic_vector(5 downto 0);

signal restartN : std_logic := '1';

begin
	FlipFlop0 : TFlipFlop port map(en, '1', restartN, clock, qWire(0));
	FlipFlop1 : TFlipFlop port map((en and qWire(0)), '1', restartN, clock, qWire(1));
	FlipFlop2 : TFlipFlop port map((en and qWire(0) and qWire(1)), '1', restartN, clock, qWire(2));
	FlipFlop3 : TFlipFlop port map((en and qWire(0) and qWire(1) and qWire(2)), '1', restartN, clock, qWire(3));
	FlipFlop4 : TFlipFlop port map((en and qWire(0) and qWire(1) and qWire(2) and qWire(3)), '1', restartN, clock, qWire(4));
	FlipFlop5 : TFlipFlop port map((en and qWire(0) and qWire(1) and qWire(2) and qWire(3) and qWire(4)), '1', restartN, clock, qWire(5));
	
	restartN <= (not(qWire(0) and qWire(1) and qWire(3) and qWire(4) and qWire(5)) and reset);
	
	q <= qWire;
	
end behaviour;
