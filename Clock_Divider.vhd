----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:46:06 04/16/2021 
-- Design Name: 
-- Module Name:    Clock_Divider - Behavioral 
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clock_Divider is port(
	clk, reset : in std_logic;
	clock_out : out std_logic
);
end Clock_Divider;

architecture Behavioral of Clock_Divider is

	signal tmp : std_logic;

begin
	process(clk, reset, tmp)
		variable count : integer := 0;
	begin
		if(reset = '0') then
			count := 0;
			tmp <= '0';
		elsif(rising_edge(clk)) then
			count := count + 1;
			if(count = 25000000) then
				tmp <= not tmp;
				count := 0;
			end if;
		end if;
		clock_out <= tmp;
	end process;

end Behavioral;

