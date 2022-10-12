----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:05 04/15/2022 
-- Design Name: 
-- Module Name:    Prostbroj - Behavioral 
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



entity Prostbroj is
port (
   inum : in std_logic_vector(0 to 3);
	oProst : out std_logic
);

end Prostbroj;

architecture Behavioral of Prostbroj is

begin
with inum select
oProst <= "1" when "0001" |  "0010" | "0011" | "0101" | "0111" | "1011" |  "1101" 
when others oProst <= "0"
end Behavioral;

