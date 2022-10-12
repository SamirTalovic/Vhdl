----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:46 04/16/2021 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is port(
	clk, clr, e : in std_logic;
	output : out std_logic_vector(2 downto 0)
);
end counter;

architecture Behavioral of counter is
	
	signal tmp : std_logic_vector(2 downto 0);

begin


	process(clk, clr, e)
	begin
		if(clr = '0') then
			tmp <= (others => '0');
		elsif(rising_edge(clk)) then
			if(e = '1') then
				tmp <= tmp + 1;
			end if;
		end if;
	end process;
	
	output <= tmp;


end Behavioral;

