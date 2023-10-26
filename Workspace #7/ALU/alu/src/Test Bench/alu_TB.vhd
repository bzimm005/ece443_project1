 -------------------------------------------------------------------------------
--
-- Title       : alu_TB
-- Design      : ALU Testbench
-- Author      : Emily Ly
-- Company     : Old Dominion University
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb is
end entity alu_tb;

architecture testbench of alu_tb is
    -- Signals for test inputs
    signal A, B: signed(15 downto 0);
    signal sel: signed(2 downto 0);
    
    -- Signals for ALU outputs
    signal R: signed(15 downto 0);
    signal status: std_logic_vector(2 downto 0);

begin
    -- Instantiate the ALU
    uut: entity work.alu
        port map (
            A => A,
            B => B,
            sel => sel,
            R => R,
            status => status
        );

    -- Stimulus generation process
    process
    begin
        -- Test case 1: Add two numbers
        A <= to_signed(5, 16);
        B <= to_signed(7, 16);
        sel <= "000";
        wait for 10 ns;

        -- Test case 2: Multiply two numbers (make sure to provide multiplier result in ALU entity)
        --A <= to_signed(6, 16);
        --B <= to_signed(4, 16);
        --sel <= "001";
        --wait for 10 ns;

        -- End the simulation
        wait;
    end process;

    -- Monitor the ALU outputs and status
    process
    begin
        wait for 20 ns;  -- Wait for a sufficient time to capture results
        --report "ALU Output (R) = " & to_string(R);
        --report "ALU Status = " & to_string(status);
        wait;
    end process;
end architecture testbench;