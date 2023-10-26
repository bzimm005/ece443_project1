-------------------------------------------------------------------------------
--
-- Title       : sixteen_bit_subtractor_TB
-- Design      : ALU
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

entity sixteen_bit_subtractor_TB is
end sixteen_bit_subtractor_TB;

architecture TB_architecture of sixteen_bit_subtractor_TB is

  -- Component declaration
  component sixteen_bit_subtractor
    port (
      A, B: in SIGNED(15 downto 0);
      D: out SIGNED(15 downto 0);
      Borrow: out std_logic
	  );
  end component;

  -- Stimulus signals
  signal A_tb, B_tb: SIGNED(15 downto 0);
  signal D_tb: SIGNED(15 downto 0);
  signal Borrow_tb: std_logic;

begin

  -- Instantiate subtractor
  UUT: sixteen_bit_subtractor port map (
          A => A_tb,
          B => B_tb,
          D => D_tb,
          Borrow => Borrow_tb);

  -- Stimulus process
  stim_proc: process
  begin
  		
    -- Test case 1
    A_tb <= "1111111111111110"; -- 0xFFFE or -2
    B_tb <= "0000000000001010";	-- 0x000A or 10
	-- Correct output: 0xFFF4
	wait for 10 ns;
	
	-- Test case 2
    -- A_tb <= "1111111111110101"; -- -11
    -- B_tb <= "0000000000000111"; -- 7
	-- Correct output: 0xFFEE = -18
	-- wait for 10 ns;
	
    --Test case 3
    -- A_tb <= "1000000000001000"; -- -128
    -- B_tb <= "1000000000001001"; -- -127
	-- Correct output: 0xFFFF = -1
    -- wait for 10 ns;

    wait;
  end process;

end TB_architecture;