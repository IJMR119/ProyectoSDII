library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity bcd_2_bin is
    Port ( bcd : in  STD_LOGIC_VECTOR (11 downto 0);        
           bin : out  STD_LOGIC_VECTOR (10 downto 0) := (others => '0'));
end bcd_2_bin;

architecture Behavioral of bcd_2_bin is
signal temp_0: std_logic_vector(3 downto 0);
signal temp_10: std_logic_vector(3 downto 0);
signal temp_100: std_logic_vector(3 downto 0);
begin
temp_0<= bcd(3 downto 0);
temp_10<= bcd(7 downto 4);
temp_100<= bcd(11 downto 8);
bin <= (temp_0 * "01")  --multiply by 1
                + (temp_10 * "1010") --multiply by 10
                + (temp_100 * "1100100"); --multiply by 100
                

end Behavioral;