library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is
end full_adder_tb;

architecture TB_ARCHITECTURE of full_adder_tb is
	-- Component declaration of the tested unit
	component full_adder
	port(
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		Cin : in STD_LOGIC;
		Sum : out STD_LOGIC;
		Cout : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC;
	signal B : STD_LOGIC;
	signal Cin : STD_LOGIC;	  
	
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Sum : STD_LOGIC;
	signal Cout : STD_LOGIC;

begin

	-- Unit Under Test port map
	UUT : full_adder
		port map (
			A => A,
			B => B,
			Cin => Cin,
			Sum => Sum,
			Cout => Cout
		);

	-- Add your stimulus here ...
	
		  
	  stimulus: process
	  begin
		  
		-- Test Case 1: A=0, B=0, Cin=0  
	    A <= '0';		-- plug in the values
	    B <= '0';
	    Cin <= '0';	  
		-- Sum: 0 (0 XOR 0 XOR 0)
		-- Cout: 0 ((0 AND 0) OR (0 AND (0 XOR 0)))
	    wait for 10 ns; -- this is needed for simulation
	
	    -- Test Case 2: A=0, B=0, Cin=1
	    A <= '0';		 -- plug in the values
	    B <= '0';
	    Cin <= '1';
		-- Sum: 1 (0 XOR 0 XOR 1)
		-- Cout: 0 ((0 AND 0) OR (1 AND (0 XOR 0)))
	    wait for 10 ns;	 -- this is needed for simulation
			
		-- Test Case 3: A=0, B=1, Cin=0
	    A <= '0';		 -- plug in the values
	    B <= '1';
	    Cin <= '0';
	    -- Sum: 1 (0 XOR 1 XOR 0)
		-- Cout: 0 ((0 AND 1) OR (0 AND (0 XOR 1)))
		wait for 10 ns;	 -- this is needed for simulation
			
		-- Test Case 4: A=0, B=1, Cin=1
	    A <= '0';		 -- plug in the values
	    B <= '1';
	    Cin <= '1';	 
		-- Sum: 0 (0 XOR 1 XOR 1)
		-- Cout: 1 ((0 AND 1) OR (1 AND (0 XOR 1)))
	    wait for 10 ns;	 -- this is needed for simulation
			
		-- Test Case 5: A=1, B=0, Cin=0
	    A <= '1';		 -- plug in the values
	    B <= '0';
	    Cin <= '0';
		-- Sum: 1 (1 XOR 0 XOR 0)
		-- Cout: 0 ((1 AND 0) OR (0 AND (1 XOR 0)))
	    wait for 10 ns;	 -- this is needed for simulation
			
		-- Test Case 6: A=1, B=0, Cin=1
	    A <= '1';		 -- plug in the values
	    B <= '0';
	    Cin <= '1';
		-- Sum: 0 (1 XOR 0 XOR 1)
		-- Cout: 1 ((1 AND 0) OR (1 AND (1 XOR 0)))
	    wait for 10 ns;	 -- this is needed for simulation
			
		-- Test Case 7: A=1, B=1, Cin=0
	    A <= '1';		 -- plug in the values
	    B <= '1';
	    Cin <= '0';	
		-- Sum: 0 (1 XOR 1 XOR 0)
		-- Cout: 1 ((1 AND 1) OR (0 AND (1 XOR 1)))
	    wait for 10 ns;	 -- this is needed for simulation
			
		-- Test Case 8: A=1, B=1, Cin=1
	    A <= '1';		 -- plug in the values
	    B <= '1';
	    Cin <= '1';	  
		-- Sum: 1 (1 XOR 1 XOR 1)
		-- Cout: 1 ((1 AND 1) OR (1 AND (1 XOR 1)))
	    wait for 10 ns;	 -- this is needed for simulation
	    
	    
	      wait;		
	  end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_full_adder of full_adder_tb is
	for TB_ARCHITECTURE
		for UUT : full_adder
			use entity work.full_adder(structural);
		end for;
	end for;
end TESTBENCH_FOR_full_adder;
