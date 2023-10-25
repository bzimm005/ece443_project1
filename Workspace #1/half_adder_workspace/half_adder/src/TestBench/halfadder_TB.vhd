library ieee;
use ieee.std_logic_1164.all;

entity halfadder_tb is
end halfadder_tb;

architecture TB_ARCHITECTURE of halfadder_tb is
	-- Component declaration of the tested unit
	component halfadder
	port(
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		Sum : out STD_LOGIC;
		Cout : out STD_LOGIC 
		);
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC;
	signal B : STD_LOGIC;
	
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Sum : STD_LOGIC;
	signal Cout : STD_LOGIC;

begin

	-- Unit Under Test port map
	UUT : halfadder
		port map (
			A => A,
			B => B,
			Sum => Sum,
			Cout => Cout
		);

	
	stimulus: process
	begin	 
		
		-- Test Case 1: A = 0, B = 0
		A <= '0';
		B <= '0';
		wait for 10 ns; -- delay to allow for simulation
			
		-- Test Case 2: A = 1, B = 0
		A <= '1';
		B <= '0';
		wait for 10 ns;
		
		-- Test Case 3: A = 0, B = 1
		A <= '0';
		B <= '1';
		wait for 10 ns;
		
		-- Test Case 4: A = 1, B = 1
		A <= '1';
		B <= '1';
		wait for 10 ns;
	
		wait; 			--end simulation
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_halfadder of halfadder_tb is
	for TB_ARCHITECTURE
		for UUT : halfadder
			use entity work.halfadder(structural);
		end for;
	end for;
end TESTBENCH_FOR_halfadder;
