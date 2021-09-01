library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Sumador is
generic(n: integer:=4);
port(A, B: in std_logic_vector(n-1 downto 0);
		R: out std_logic_vector(n-1 downto 0);
		C: out std_logic);
end Sumador;

architecture arq of Sumador is
signal temp: std_logic_vector(n downto 0);
begin
temp<= ("0"&A) + ("0"&B);
R<=temp(n-1 downto 0);
C<= temp(n);
end arq;