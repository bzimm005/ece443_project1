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

entity sixteen_bit_subtractor_TB is
end sixteen_bit_subtractor_TB;

architecture TB_architecture of sixteen_bit_subtractor_TB is

  -- Component declaration
  component sixteen_bit_subtractor
    port (
      A, B: in std_logic_vector(15 downto 0);
      D: out std_logic_vector(15 downto 0);
      Borrow: out std_logic);
  end component;

  -- Stimulus signals
  signal A_tb, B_tb: std_logic_vector(15 downto 0);
  signal D_tb: std_logic_vector(15 downto 0);
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
    A_tb <= "1010101010101010"; 
    B_tb <= "0101010101010101";

    wait for 10 ns;

    -- Test case 2
    A_tb <= "1111111111111111";
    B_tb <= "0000000000000000";

    wait for 10 ns;

    -- Test case 3
    A_tb <= "0000000000000000";
    B_tb <= "1111111111111111";

    wait;
  end process;

end TB_architecture;