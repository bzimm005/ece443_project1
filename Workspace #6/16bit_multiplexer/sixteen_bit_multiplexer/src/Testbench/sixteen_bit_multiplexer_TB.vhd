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

entity sixteen_bit_multiplexer_TB is
end sixteen_bit_multiplexer_TB;

architecture tb of sixteen_bit_multiplexer_TB is

  component mux_16bit
    port (
      a, b: in std_logic_vector(15 downto 0);
      sel: in std_logic; 
      y: out std_logic_vector(15 downto 0)
    );
  end component;
  
  signal a, b, y: std_logic_vector(15 downto 0);
  signal sel: std_logic;

begin

  dut: mux_16bit port map (
  	a => a, 
  	b => b, 
	sel => sel, 
	y => y);

  stimulus: process
  begin
  	
	-- Test cases 1 and 2 show that the multiplexer can select a specific input and pass it to the output
    -- Test case 1
    a <= x"AAAA";
    b <= x"BBBB";
    sel <= '0';		-- select input A
    wait for 10 ns;	
	-- Expected output = AAAA
  
    -- Test case 2  
    a <= x"AAAA"; 
    b <= x"BBBB";
    sel <= '1';	  	-- select input B
    wait for 10 ns;
	-- Expected output = BBBB
	
	
    wait;	-- Finish simulation
    
  end process;
  
end tb;