----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:46:16 09/11/2022 
-- Design Name: 
-- Module Name:    masinasadvastanja - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity masinasadvastanja is
port (
iCLK : in std_logic;
iRST : in std_logic;
iCS : in std_logic;
oLED : out std_logic
);
type stanja is(s1,s2);

end masinasadvastanja;

architecture Behavioral of masinasadvastanja is
signal  LS,FS : stanja;
signal tmp : std_logic := '1';
    signal CLK : std_logic;
 
begin
 
process(iCLK, tmp)
    variable count: integer := 0;
begin
    if(rising_edge(iCLK)) then
        count := count + 1;
        if (count = 12000000) then
            tmp <= NOT tmp;
            count := 0;
        end if;
    end if;
    CLK <= tmp;
end process;

process(LS,FS)
begin
case LS is
	when s1 => FS <= s2;
	when s2 => FS <= s1;
end case;
end process;

process(LS)
	begin
case LS is 
	when s1 => oLED <= '0';
	when s2 => oLED <= '1';
end case;
end process;

process(iCS,iRST,CLK)
	begin
if (iRST = '1') then
	LS <= s1;
elsif(rising_edge(CLK)) then
	if(iCS = '1') then
	LS<=FS;
else 
	LS<=LS;
end if;
end if;
end process;
end Behavioral;

