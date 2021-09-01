library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity multiplicador is

generic(n: integer:=4);
port ( a,b : in std_logic_vector (n-1 downto 0);
         c : out std_logic_vector (2*n-1 downto 0));
end multiplicador;

architecture sol of multiplicador is
begin

c<=std_logic_vector(unsigned(a) * unsigned(b));

end sol;