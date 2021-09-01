library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity DemoROM is
	port (address: in std_logic_vector(7 downto 0); -- cantidad de filas en binario
			clock: in std_logic;
			Q:		 out std_logic_vector(63 downto 0));
end DemoROM;

architecture sol of DemoROM is
type rom_type is array (255 downto 0) of std_logic_vector(63 downto 0); --cantidad de filas y columnas
signal memrom: rom_type;
begin
	-- SE COLOCA EN HEXADECIMAL  
	memrom(conv_integer(x"00")) <= X"0000000000000000"; -- 7E = 126
	memrom(conv_integer(x"01")) <= X"000000000000007E"; -- 2A = 42
	memrom(conv_integer(x"02")) <= X"0000000000007E81"; -- 11 = 17
	memrom(conv_integer(x"03")) <= X"00000000007E8181";
	memrom(conv_integer(x"04")) <= X"000000007E818181";
	memrom(conv_integer(x"05")) <= X"0000007E81818181";
	memrom(conv_integer(x"06")) <= X"00007E818181817E";
	memrom(conv_integer(x"07")) <= X"007E818181817E00";
	memrom(conv_integer(x"08")) <= X"7E818181817E0000";
	memrom(conv_integer(x"09")) <= X"818181817E000000";
	memrom(conv_integer(x"0A")) <= X"8181817E00000000";
	memrom(conv_integer(x"0B")) <= X"81817E0000000000";
	memrom(conv_integer(x"0C")) <= X"817E000000000000";
	memrom(conv_integer(x"0D")) <= X"7E00000000000000";
	memrom(conv_integer(x"0E")) <= X"0000000000000000";
	
	memrom(conv_integer(x"FA")) <= X"000000000000000A"; --0A = 10
	memrom(conv_integer(x"FF")) <= X"00000000FFFF8080"; -- 5E = 94

	
	process(clock)
		begin 
			if (clock'event and clock='1') then 
				Q<=memrom(conv_integer(Address)); 	--para leerx
			end if;
	end process;
end sol;