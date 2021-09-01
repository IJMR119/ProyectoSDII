library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Restador is
generic(n: integer:=4);
port(A, B: in std_logic_vector(n-1 downto 0);
		R: out std_logic_vector(n-1 downto 0));
end Restador;

architecture arq of Restador is
signal temp: std_logic_vector(n-1 downto 0);
begin
temp<=A-B;
R<=temp;
end arq;