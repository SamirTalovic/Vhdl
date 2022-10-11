library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
 
entity ispitar2jul is
port(
    iCLK: in std_logic;
    inSTART: in std_logic;
    inSTOP: in std_logic;
    inCONTINUE: in std_logic;
    oQ: out std_logic_vector(7 downto 0)
);
end ispitar2jul;
 
architecture Behavioral of ispitar2jul is
    signal counting: std_logic := '0';
    signal sCNT: std_logic_vector(7 downto 0) := (others => '0');
    signal tmp : std_logic := '1';
    signal CLK: std_logic;
 
begin
 
process(iCLK, tmp)
    variable count: integer :=0;
begin
    if(rising_edge(iCLK)) then
        count :=count+1;
        if (count = 12000000) then
            tmp <= NOT tmp;
            count := 0;
        end if;
    end if;
    CLK <= tmp;
end process;
 
process(inSTART, inSTOP, inCONTINUE) begin
    if(inSTART = '1') then
        counting <= '1';
    else
        if(inSTOP = '1') then
            counting <= '0';
        elsif(inCONTINUE = '1') then
            counting <= '1';
        else
            counting <= counting;
        end if;
    end if;
end process;    
 
process(CLK, inSTART) begin
    if(inSTART = '1') then
        sCNT <= (others => '0');
    elsif(rising_edge(CLK)) then
        if(counting = '1') then
				sCNT <= sCNT + 1;
        else
            sCNT <= sCNT;
        end if;
    end if;
end process;
    
oQ <= sCNT;
 
end Behavioral;