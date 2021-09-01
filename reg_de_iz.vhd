library ieee;
use ieee.std_logic_1164.all;

entity reg_de_iz is
	generic (k: integer:= 3);
	port (L, resetn, clock, En, Ld : in std_logic;
		  Ent    : in std_logic_vector(k-1 downto 0);
		  Q		: buffer std_logic_vector (k-1 downto 0));
end reg_de_iz;

architecture comportamiento of reg_de_iz is
begin 
	process (Resetn, clock)
	begin 
		if Resetn='0' then
			Q <= (others =>'0');
		elsif (clock'event and clock = '1')then 
			if (En='1' and Ld='1') then Q<= ent;
			elsif (En='1' and Ld='0') then
				Q(k-1 downto 1)<=Q(k-2 downto 0);
				Q(0)<=L;
			end if;
		end if;
	end process;
end comportamiento;