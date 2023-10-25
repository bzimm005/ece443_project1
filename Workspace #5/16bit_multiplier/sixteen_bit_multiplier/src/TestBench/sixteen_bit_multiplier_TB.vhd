library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

	-- Add your library and packages declaration here ...

entity sixteen_bit_multiplier_tb is
end sixteen_bit_multiplier_tb;

architecture TB_ARCHITECTURE of sixteen_bit_multiplier_tb is
	-- Component declaration of the tested unit
	component sixteen_bit_multiplier
	port(
		A : in signed(15 downto 0);
		B : in signed(15 downto 0);
		Result : out signed(31 downto 0);
		Overflow : out std_logic );
	end component;

	signal A : signed(15 downto 0);
	signal B : signed(15 downto 0);
	signal Result : signed(31 downto 0);
	signal Overflow : std_logic;

begin

	-- Unit Under Test port map
	UUT : sixteen_bit_multiplier
		port map (
			A => A,
			B => B,
			Result => Result,
			Overflow => Overflow
		);

	-- Add your stimulus here ...
	process
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
