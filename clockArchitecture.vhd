library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library Module2CounterLibrary;
use Module2CounterLibrary.Module2CounterPackage.all;

library Module12CounterLibrary;
use Module12CounterLibrary.Module12CounterPackage.all;

library Module60CounterLibrary;
use Module60CounterLibrary.Module60CounterPackage.all;

library Radix2ToAMOrPMConverterLibrary;
use Radix2ToAMOrPMConverterLibrary.Radix2ToAMOrPMConverterPackage.all;

library Radix10ToSevenSegConverterLibrary;
use Radix10ToSevenSegConverterLibrary.Radix10ToSevenSegConverterPackage.all;

library TuneClockLibrary;
use TuneClockLibrary.TuneClockPackage.all;

--24 Hour AM/FM Clock:
entity clockArchitecture is
	port(	en : in std_logic;
			reset : in std_logic;
			clock : in std_logic;
			hexMin0 : out std_logic_vector(0 to 6);
			hexMin1 : out std_logic_vector(0 to 6);
			hexHour0 : out std_logic_vector(0 to 6) := "1001111";
			hexHour1 : out std_logic_vector(0 to 6);
			hexA_P : out std_logic_vector(0 to 6);
			hexLetterM0 : out std_logic_vector(0 to 6);
			hexLetterM1 : out std_logic_vector(0 to 6));
end clockArchitecture;

architecture behaviour of clockArchitecture is

signal clock1_60Hz : std_logic;

signal rad2MinVal : std_logic_vector(5 downto 0);

signal rad2HourVal : std_logic_vector(3 downto 0) := "0001";

signal rad2AM_FM : std_logic;

signal enHour : std_logic;

signal enAM_FM : std_logic;

begin
	
	ClockTune : TuneClock port map(clock, clock1_60Hz);
	
	CountMin : Module60Counter port map(en, reset, clock1_60Hz, rad2MinVal);
	
	process(rad2MinVal)
	begin
		if(rad2MinVal = "111011") then
			enHour <= '1';
		else
			enHour <= '0';
		end if;
	end process;
	
	CountHour : Module12Counter port map(enHour, reset, clock1_60Hz, rad2HourVal);
	
	process(rad2HourVal)
	begin
		if(rad2HourVal = "1101") then
			enAM_FM <= '1';
		else
			enAM_FM <= '0';
		end if;
	end process;
	
	CountAM_FM : Module2Counter port map(enAM_FM, reset, clock1_60Hz, rad2AM_FM);
	
	ConvertMin7SegDisplay : Radix10ToSevenSegConverter port map(rad2MinVal, hexMin0, hexMin1);
	
	ConvertHour7SegDisplay : Radix10ToSevenSegConverter port map("00" & rad2HourVal, hexHour0, hexHour1);
	
	ConvertAM_FM7SegDisplay : Radix2ToAMOrPMConverter port map(rad2AM_FM, hexA_P, hexLetterM0, hexLetterM1);
	
end behaviour;
