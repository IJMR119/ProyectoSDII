library ieee;
use ieee.std_logic_1164.all;

entity Comparador is
generic(n: integer:=4);
port(A, B: in std_logic_vector(n-1 downto 0);
		AigualB, AmenorB, AmayorB: out std_logic);
end Comparador;

architecture solve of Comparador is
begin
AigualB<='1' when A=B else '0';
AmenorB<='1' when A<B else '0';
AmayorB<='1' when A>B else '0';
end solve;