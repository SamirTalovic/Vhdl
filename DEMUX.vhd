
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DEMUX is
    Port ( X : in  STD_LOGIC;
           S : in  STD_LOGIC_vector(1 downto 0);
			  E : in STD_LOGIC;
           Y : out  STD_LOGIC_vector(3 DOWNTO 0));
           
end DEMUX;

architecture Behavioral of DEMUX is
begin
s_case: process(S,X)
begin
Y <= "0000";
 case S is
 when "00" => Y(0) <= X;
 when "01" => Y(1) <= X;
 when "10" => Y(2) <= X;
 when "11" => Y(3) <= X;
 when others => Y <="0000"; 
 
 end case;
 end process;


end Behavioral;

