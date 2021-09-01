library ieee;
use ieee.std_logic_1164.all;

entity Mux2 is
generic(n: integer :=4);
port( Sel: in std_logic;
		D0, D1: in std_logic_vector (n-1 downto 0);
		Q: out std_logic_vector (n-1 downto 0));
end Mux2;

architecture desarrollo of Mux2 is
signal temp: std_logic_vector (n-1 downto 0);
begin
	process(Sel)
	begin
		case Sel is
			when '0' => temp<=D0;
			when '1' => temp<=D1;
		end case;
	end process;
Q<=temp;
end desarrollo;