--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:20:36 07/10/2022
-- Design Name:   
-- Module Name:   /home/ise/ise_projects/ispitar2jul/tbar2.vhd
-- Project Name:  ispitar2jul
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ispitar2jul
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbar2 IS
END tbar2;
 
ARCHITECTURE behavior OF tbar2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ispitar2jul
    PORT(
         iCLK : IN  std_logic;
         inSTART : IN  std_logic;
         inSTOP : IN  std_logic;
         inCONTINUE : IN  std_logic;
         oQ : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inSTART : std_logic := '0';
   signal inSTOP : std_logic := '0';
   signal inCONTINUE : std_logic := '0';

 	--Outputs
   signal oQ : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ispitar2jul PORT MAP (
          iCLK => iCLK,
          inSTART => inSTART,
          inSTOP => inSTOP,
          inCONTINUE => inCONTINUE,
          oQ => oQ
        );

   -- Clock process definitions
   iCLK_process :process
   begin
		iCLK <= '0';
		wait for iCLK_period/2;
		iCLK <= '1';
		wait for iCLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for iCLK_period*10;

      -- insert stimulus here 
		inSTART <= '1';
		wait for 100 ns;
		 
		inSTOP <='1';
		
		wait for 100 ns;
		
		inCONTINUE <= '1';

      wait;
   end process;

END;
