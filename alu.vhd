----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:58 04/16/2021 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is port(
	
	input : in std_logic_vector(1 downto 0);
	oRES : out std_logic_vector(3 downto 0)
);
end alu;

architecture Behavioral of alu is

	signal a : std_logic_vector(2 downto 0) := "010";
	signal b : std_logic_vector(2 downto 0) := "011";
	signal tmp : std_logic_vector(2 downto 0);

begin

	process( input, a, b)
	begin
		
			if (input = "10") then
				tmp <= a xor b;
			elsif(input = "00") then
				tmp <= a and b;
			elsif(input = "01") then
				tmp <= a or b;
			elsif(input = "110") then
				tmp <=  b + tmp ;
			end if;
			
		
	end process;
	
	

end Behavioral;

