library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contador_DW is
generic(n: integer:=4);
port (clock, resetn, Ld, En: in std_logic;
		Ent: in std_logic_vector(n-1 downto 0);
		Q: out std_logic_vector(n-1 downto 0));
end contador_DW;

architecture desarrollo of contador_DW is
signal temp: std_logic_vector(n-1 downto 0);
signal reinicio: std_logic_vector(n-1 downto 0);
begin
reinicio <= (others=>'0');

process(En)
	begin
	if resetn='0' then temp<=(others=>'1');
	elsif (clock'event and clock='1') then
		if (Ld='1' and En='1') then temp<=Ent;
			elsif En='1' then
				if temp=reinicio then temp<=(others=>'1');
				else temp<=temp-1;
				end if;
		end if;
	end  if;
end process;
Q<=temp;
end desarrollo;