-------------------------------------------------------------------------------
--
-- Title       : sixteen_bit_multiplexer_TB
-- Design      : 16-bit Multiplexer Testbench
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

entity sixteen_bit_multiplexer_TB is
end sixteen_bit_multiplexer_TB;

architecture tb of sixteen_bit_multiplexer_TB is
  signal A, B: signed(15 downto 0);
  signal S0, S1, S2: std_logic;
  signal R: signed(15 downto 0);
  signal r_overflow: std_logic;
  
  -- Component instantiation
  component mux_16bit
    port (
      A, B: in signed(15 downto 0);
      S0, S1, S2: in std_logic;
      R: out signed(15 downto 0);
      r_overflow: out std_logic
    );
  end component; 

begin
  DUT : mux_16bit
    port map (
      A => A,
      B => B,
      S0 => S0,
      S1 => S1,
      S2 => S2,
      R => R,
      r_overflow => r_overflow
    );

  stimulus: process
  begin
  	
    -- Test Case 1: S0 = '0', S1 = '0', S2 = '0' (Select A)
    A <= "1100110011001100";   --A = 0xCCCC
    B <= "0011001100110011";   -- B = 0x3311
    S0 <= '0';
    S1 <= '0';
    S2 <= '0';
    wait for 10 ns;

    -- Test Case 2: S0 = '0', S1 = '0', S2 = '1' (Select B)
    A <= "1100110011001100";   --A = 0xCCCC
    B <= "0011001100110011";   -- B = 0x3311
    S0 <= '0';
    S1 <= '0';
    S2 <= '1';
    wait for 10 ns;

    -- Test Case 3: S0 = '0', S1 = '1', S2 = '0' (Select A)
    A <= "1100110011001100";  -- A = 0xCCCC
    B <= "0011001100110011";  -- B = 0x3311
    S0 <= '0';
    S1 <= '1';
    S2 <= '0';
    wait for 10 ns;

    -- Test Case 4: S0 = '0', S1 = '1', S2 = '1' (Select B)
    A <= "1100110011001100";  -- A = 0xCCCC
    B <= "0011001100110011";  -- B = 0x3311
    S0 <= '0';
    S1 <= '1';
    S2 <= '1';
    wait for 10 ns;

    -- Test Case 5: S0 = '1', S1 = '0', S2 = '0' (Select A)
    A <= x"CCCC";	-- A = 0xCCCC
    B <= x"3311";	-- B = 0x3311
    S0 <= '1';
    S1 <= '0';
    S2 <= '0';
    wait for 10 ns;	
	
    wait;	-- Finish simulation
    
  end process;
  
end tb;