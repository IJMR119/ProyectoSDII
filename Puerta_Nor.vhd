Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity Puerta_Nor is
	   
generic (n: integer := 4);
Port ( ent : in std_logic_vector (n-1 downto 0);
	   sal : out std_logic);
	   
end Puerta_Nor;

Architecture desarrollo of Puerta_Nor is
SIGNAL tmp : STD_LOGIC_VECTOR(n-1 downto 0);
BEGIN
tmp <= (OTHERS => '0');
sal <= '1' WHEN ent = tmp ELSE '0';
end desarrollo;