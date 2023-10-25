-- 16-bit Multiplier:
-- Implement a 16-bit multiplier using either a structural or behavioral model.

library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sixteen_bit_multiplier is
    Port (
        A, B : in SIGNED (15 downto 0);
        Result : out SIGNED (31 downto 0)
    );
end sixteen_bit_multiplier;

architecture Behavioral of sixteen_bit_multiplier is
begin
    process
        variable TempResult : SIGNED(31 downto 0) := (others => '0');
    begin
        TempResult := A * B;
        Result <= TempResult;
        wait; -- Fix the infinite loop warning
    end process;
end Behavioral;
