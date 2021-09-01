library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Conv_Bin_BCD is
    Port ( Bin : in   STD_LOGIC_VECTOR (9 downto 0);
           Cen : out  STD_LOGIC_VECTOR (3 downto 0);
           Dec : out  STD_LOGIC_VECTOR (3 downto 0);
           Uni : out  STD_LOGIC_VECTOR (3 downto 0));
end Conv_Bin_BCD;

architecture Behavioral of Conv_Bin_BCD is

begin

Process(Bin)
variable Z: STD_LOGIC_VECTOR (21 downto 0);
begin

 for i in 0 to 20 loop
 Z(i) := '0';
 end loop;

 Z(12 downto 3) := Bin;


 for i in 0 to 6 loop

    if Z(13 downto 10) > 4 then
  Z(13 downto 10) := Z(13 downto 10) + 3;
  end if;
 
  if Z(17 downto 14) > 4 then
  Z(17 downto 14) := Z(17 downto 14) + 3;
    end if;
 
  Z(21 downto 1) := Z(20 downto 0);
  end  loop;
   
 
  
  Cen <= Z(21 downto 18);
  Dec <= Z(17 downto 14);
  Uni <= Z(13 downto 10);
end Process;
end Behavioral;