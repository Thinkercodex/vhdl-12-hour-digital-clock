library ieee;
use ieee.std_logic_1164.all;

entity BCDTo7SegDecoder is
	port(	valIn	: in std_logic_vector(3 downto 0);
			seg7Val : out std_logic_vector(0 to 6));
end BCDTo7SegDecoder;

architecture behaviour of BCDTo7SegDecoder is
begin
	process(valIn)
	begin
		case valIn is
			when "0000" =>
				seg7Val(0) <= '0';
				seg7Val(1) <= '0';
				seg7Val(2) <= '0';
				seg7Val(3) <= '0';
				seg7Val(4) <= '0';
				seg7Val(5) <= '0';
				seg7Val(6) <= '1';
			when "0001" =>
				seg7Val(0) <= '1';
				seg7Val(1) <= '0';
				seg7Val(2) <= '0';
				seg7Val(3) <= '1';
				seg7Val(4) <= '1';
				seg7Val(5) <= '1';
				seg7Val(6) <= '1';
			when "0010" =>
				seg7Val(0) <= '0';
				seg7Val(1) <= '0';
				seg7Val(2) <= '1';
				seg7Val(3) <= '0';
				seg7Val(4) <= '0';
				seg7Val(5) <= '1';
				seg7Val(6) <= '0';
			when "0011" =>
				seg7Val(0) <= '0';
				seg7Val(1) <= '0';
				seg7Val(2) <= '0';
				seg7Val(3) <= '0';
				seg7Val(4) <= '1';
				seg7Val(5) <= '1';
				seg7Val(6) <= '0';
			when "0100" =>
				seg7Val(0) <= '1';
				seg7Val(1) <= '0';
				seg7Val(2) <= '0';
				seg7Val(3) <= '1';
				seg7Val(4) <= '1';
				seg7Val(5) <= '0';
				seg7Val(6) <= '0';
			when "0101" =>
				seg7Val(0) <= '0';
				seg7Val(1) <= '1';
				seg7Val(2) <= '0';
				seg7Val(3) <= '0';
				seg7Val(4) <= '1';
				seg7Val(5) <= '0';
				seg7Val(6) <= '0';
			when "0110" =>
				seg7Val(0) <= '0';
				seg7Val(1) <= '1';
				seg7Val(2) <= '0';
				seg7Val(3) <= '0';
				seg7Val(4) <= '0';
				seg7Val(5) <= '0';
				seg7Val(6) <= '0';
			when "0111" =>
				seg7Val(0) <= '0';
				seg7Val(1) <= '0';
				seg7Val(2) <= '0';
				seg7Val(3) <= '1';
				seg7Val(4) <= '1';
				seg7Val(5) <= '1';
				seg7Val(6) <= '1';
			when "1000" =>
				seg7Val(0) <= '0';
				seg7Val(1) <= '0';
				seg7Val(2) <= '0';
				seg7Val(3) <= '0';
				seg7Val(4) <= '0';
				seg7Val(5) <= '0';
				seg7Val(6) <= '0';
			when "1001" =>
				seg7Val(0) <= '0';
				seg7Val(1) <= '0';
				seg7Val(2) <= '0';
				seg7Val(3) <= '1';
				seg7Val(4) <= '1';
				seg7Val(5) <= '0';
				seg7Val(6) <= '0';
			when "1010" =>
				seg7Val(0) <= '0';
				seg7Val(1) <= '0';
				seg7Val(2) <= '0';
				seg7Val(3) <= '1';
				seg7Val(4) <= '0';
				seg7Val(5) <= '0';
				seg7Val(6) <= '0';
			when "1011" =>
				seg7Val(0) <= '1';
				seg7Val(1) <= '1';
				seg7Val(2) <= '0';
				seg7Val(3) <= '0';
				seg7Val(4) <= '0';
				seg7Val(5) <= '0';
				seg7Val(6) <= '0';
			when "1100" =>
				seg7Val(0) <= '0';
				seg7Val(1) <= '1';
				seg7Val(2) <= '1';
				seg7Val(3) <= '0';
				seg7Val(4) <= '0';
				seg7Val(5) <= '0';
				seg7Val(6) <= '1';
			when "1101" =>
				seg7Val(0) <= '1';
				seg7Val(1) <= '0';
				seg7Val(2) <= '0';
				seg7Val(3) <= '0';
				seg7Val(4) <= '0';
				seg7Val(5) <= '1';
				seg7Val(6) <= '0';
			when "1110" =>
				seg7Val(0) <= '0';
				seg7Val(1) <= '1';
				seg7Val(2) <= '1';
				seg7Val(3) <= '0';
				seg7Val(4) <= '0';
				seg7Val(5) <= '0';
				seg7Val(6) <= '0';
			when "1111" =>
				seg7Val(0) <= '0';
				seg7Val(1) <= '1';
				seg7Val(2) <= '1';
				seg7Val(3) <= '1';
				seg7Val(4) <= '0';
				seg7Val(5) <= '0';
				seg7Val(6) <= '0';
		end case;
	end process;
end behaviour;
