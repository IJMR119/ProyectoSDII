library ieee;
use ieee.std_logic_1164.all;

entity Mux4 is
generic(n: integer :=4);
port( Sel: in std_logic_vector (1 downto 0);
		D0, D1, D2, D3: in std_logic_vector (n-1 downto 0);
		Q: out std_logic_vector (n-1 downto 0));
end Mux4;

architecture desarrollo of Mux4 is
signal temp: std_logic_vector (n-1 downto 0);
begin
	process(Sel)
	begin
		case Sel is
			when "00" => temp<=D0;
			when "01" => temp<=D1;
			when "10" => temp<=D2;
			when "11" => temp<=D3;
		end case;
	end process;
Q<=temp;
end desarrollo;