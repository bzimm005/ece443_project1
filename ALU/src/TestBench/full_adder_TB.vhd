library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

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

	-- Add your code here ...

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
	
	-- Test Case 1: A=0, B=0, Cin=0
  process
  begin				
    A <= '0';		-- plug in the values
    B <= '0';
    Cin <= '0';
    wait for 10 ns; -- this is needed for simulation
    assert (Sum = '0' and Cout = '0')  -- sum and cout should both be 0
      report "Test Case 1 failed!" severity failure; -- report if sum and count aren't 0
    wait;
  end process;

  -- Test Case 2: A=1, B=0, Cin=0
  process
  begin
    A <= '1';		 -- plug in the values
    B <= '0';
    Cin <= '0';
    wait for 10 ns;	 -- this is needed for simulation
    assert (Sum = '1' and Cout = '0') -- sum should be 1 and cout 0
      report "Test Case 2 failed!" severity failure; -- report if this is not so
    wait;
  end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_full_adder of full_adder_tb is
	for TB_ARCHITECTURE
		for UUT : full_adder
			use entity work.full_adder(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_full_adder;

