-- 16-bit Multiplier:
-- Implement a 16-bit multiplier using either a structural or behavioral model.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sixteen_bit_multiplier is
    Port (
        A, B : in signed (15 downto 0);
        Result : out signed (31 downto 0);
		Overflow : out std_logic
    );
end sixteen_bit_multiplier;

architecture Behavioral of sixteen_bit_multiplier is

signal temp : signed (31 downto 0);
signal tempA : signed (15 downto 0);
signal tempB : signed (15 downto 0);

begin
	
	Result <= A*B;
	tempA <= A;
	tempB <= B;
	temp <= tempA*tempB;
	
    process(tempA, tempB, temp)
    begin
		-- Detect overflow
        if (tempA(15) = '0' and tempB(15) = '0' and temp(31) = '1') or
           (tempA(15) = '1' and tempB(15) = '1' and temp(31) = '0') then
            Overflow <= '1';
        else
            Overflow <= '0';
        end if;
    end process;
end Behavioral;