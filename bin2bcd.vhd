library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity bin2bcd is
    Port ( Bin : in   STD_LOGIC_VECTOR (9 downto 0);
           Cen : out  STD_LOGIC_VECTOR (3 downto 0);
           Dec : out  STD_LOGIC_VECTOR (3 downto 0);
           Uni : out  STD_LOGIC_VECTOR (3 downto 0));
end bin2bcd;

architecture Behavioral of bin2bcd is

begin

Process(Bin)
variable Z: STD_LOGIC_VECTOR (21 downto 0);
begin

 for i in 0 to 21 loop
 Z(i) := '0';
 end loop;

 Z(12 downto 3) := Bin;


 for i in 0 to 4 loop

    if Z(13 downto 10) > 4 then
  Z(13 downto 10) := Z(13 downto 10) + 3;
  end if;
 
  if Z(17 downto 14) > 4 then
  Z(17 downto 14) := Z(17 downto 14) + 3;
    end if;
 
  Z(19 downto 1) := Z(18 downto 0);
  end  loop;
   
 
  
  Cen <= Z(19 downto 16);
  Dec <= Z(15 downto 12);
  Uni <= Z(11 downto 8);
end Process;
end Behavioral;