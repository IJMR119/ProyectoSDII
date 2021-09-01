library ieee;
use ieee.std_logic_1164.all;

entity reg_iz_der is
	generic (k: integer:= 3);
	port (R, resetn, clock, En, Ld : in std_logic;
		  Ent    : in std_logic_vector(k-1 downto 0);
		  Q		: buffer std_logic_vector (k-1 downto 0));
end reg_iz_der;

architecture comportamiento of reg_iz_der is
begin 
	process (Resetn, clock)
	begin 
		if Resetn='0' then
			Q <= (others =>'0');
		elsif (clock'event and clock = '1')then 
			if (En='1' and Ld='1') then Q<= ent;
			elsif (En='1' and Ld='0') then
				desplazamiento: for i in 0 to k-2 loop
				Q(i) <= Q(i+1);
			end loop;
			Q(k-1) <= R;
			end if;
		end if;
	end process;
end comportamiento;