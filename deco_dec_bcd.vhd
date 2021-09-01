library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity deco_dec_bcd is
	Port ( Ent: in STD_LOGIC_VECTOR(9 downto 0);
		Salida : OUT STD_LOGIC_VECTOR(3 downto 0)
		);
end deco_dec_bcd ;

Architecture sol of deco_dec_bcd  is
Begin
	With Ent Select
		Salida <= 	"0001" when "0000000010",
						"0010" when "0000000100",
						"0011" when "0000001000",
						"0100" when "0000010000",
						"0101" when "0000100000",
						"0110" when "0001000000",
						"0111" when "0010000000",
						"1000" when "0100000000",
						"1001" when "1000000000",
						"0000" when others;
end sol;