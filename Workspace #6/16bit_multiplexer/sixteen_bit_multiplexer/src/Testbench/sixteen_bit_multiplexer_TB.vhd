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
  signal A0, A1, A2, A3, A4, A5, A6, A7: signed(15 downto 0);
  signal sel : signed(2 downto 0);
  signal result: signed(15 downto 0);
  
  -- Component instantiation
  component mux_16bit
    port (
      A0, A1, A2, A3, A4, A5, A6, A7: in signed(15 downto 0);
      sel: in signed(2 downto 0);
      result: out signed(15 downto 0)
    );
  end component; 

begin
  DUT : mux_16bit
    port map (
      A0 => A0,
      A1 => A1,
	  A2 => A2,
	  A3 => A3,
	  A4 => A4,
	  A5 => A5,
	  A6 => A6,
	  A7 => A7,
      result => result,
	  sel => sel
    );

  stimulus: process
  begin
  	
	-- Example values selectin A1
    A0 <= "0101010101010101";  
    A1 <= "1010101010101010";  
    A2 <= "1111111111111111";  
    A3 <= "0000000000000000"; 
    A4 <= "1100110011001100"; 
    A5 <= "0011001100110011";
    A6 <= "0101010101010101";
    A7 <= "1010101010101010";
    sel <= "001";  -- Set the selection as needed
    wait for 10 ns; -- result should show A1	
	
    wait;	-- Finish simulation
    
  end process;
  
end tb;