library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity sixteen_bit_adder_tb is
end sixteen_bit_adder_tb;

architecture TB_ARCHITECTURE of sixteen_bit_adder_tb is
	-- Component declaration of the tested unit
	component sixteen_bit_adder
	port(
		A : in STD_LOGIC_VECTOR(15 downto 0);
		B : in STD_LOGIC_VECTOR(15 downto 0);
		Sum : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Sum : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : sixteen_bit_adder
		port map (
			A => A,
			B => B,
			Sum => Sum
		);

	-- Add your stimulus here ...
	
	stimulus: process
	begin
		
		-- Test #1
		A <= "1100110011001100";
		B <= "0011001100110011";
		wait for 10 ns;
		
		-- Test #2
		A <= "0011001100110011";
		B <= "1100110011001100";
		wait for 10 ns;
		
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sixteen_bit_adder of sixteen_bit_adder_tb is
	for TB_ARCHITECTURE
		for UUT : sixteen_bit_adder
			use entity work.sixteen_bit_adder(structural);
		end for;
	end for;
end TESTBENCH_FOR_sixteen_bit_adder;

