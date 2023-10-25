library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sixteen_bit_adder_tb is
end sixteen_bit_adder_tb;

architecture TB_ARCHITECTURE of sixteen_bit_adder_tb is
	-- Component declaration of the tested unit
	component sixteen_bit_adder
	port(
		A : in SIGNED(15 downto 0);
		B : in SIGNED(15 downto 0);
		Sum : out SIGNED(15 downto 0) );
	end component;

	-- Stimulus signals
	signal A : SIGNED(15 downto 0);
	signal B : SIGNED(15 downto 0);
	
	-- Observed signals
	signal Sum : SIGNED(15 downto 0);

begin

	-- Unit Under Test port map
	UUT : sixteen_bit_adder
		port map (
			A => A,
			B => B,
			Sum => Sum
		);
	
	stimulus: process
	begin
		
		-- Test #1
		A <= "0000000000000010";  --  2
		B <= "1111111111111110";  -- -2
		-- Sum = 0
		wait for 10 ns;
				
		-- Test #2
		A <= "0000000000000011";  --  3
		B <= "1111111111111110";  -- -2
		-- Sum = 1
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
