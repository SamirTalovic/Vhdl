
-- VHDL Instantiation Created from source file alu.vhd -- 15:31:13 04/15/2022
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT alu
	PORT(
		input : IN std_logic_vector(1 downto 0);          
		oRES : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_alu: alu PORT MAP(
		input => ,
		oRES => 
	);


