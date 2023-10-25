library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

	-- Add your library and packages declaration here ...

entity sixteen_bit_multiplier_tb is
end sixteen_bit_multiplier_tb;

architecture TB_ARCHITECTURE of sixteen_bit_multiplier_tb is
	-- Component declaration of the tested unit
	component sixteen_bit_multiplier
	port(
		A : in SIGNED(15 downto 0);
		B : in SIGNED(15 downto 0);
		Result : out SIGNED(31 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : SIGNED(15 downto 0);
	signal B : SIGNED(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Result : SIGNED(31 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : sixteen_bit_multiplier
		port map (
			A => A,
			B => B,
			Result => Result
		);

	-- Add your stimulus here ...
	stimulus: process
	begin
		A <= "0000000000000010"; -- 2
		B <= "0000000000000010"; -- 2
		wait for 100 ns;

		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sixteen_bit_multiplier of sixteen_bit_multiplier_tb is
	for TB_ARCHITECTURE
		for UUT : sixteen_bit_multiplier
			use entity work.sixteen_bit_multiplier(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_sixteen_bit_multiplier;
