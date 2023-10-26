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

entity tb_alu is
end entity;

architecture test of tb_alu is

  -- Component Declaration
  component alu
    port (
      A, B: in signed(15 downto 0);
      R: out signed(15 downto 0);
      sel: in signed(2 downto 0);
      status: out std_logic_vector(2 downto 0));
  end component;

  -- Stimulus signals
  signal A_test, B_test: signed(15 downto 0);
  signal R_test: signed(15 downto 0);
  signal sel_test: signed(2 downto 0);
  signal status_test: std_logic_vector(2 downto 0);
  
begin

  -- Connect testbench signals with alu ports
  dut: alu port map (
    A => A_test,
    B => B_test,
    R => R_test,
    sel => sel_test,
    status => status_test);

  -- Generate stimuli
  stim_proc: process
  begin
  
    -- Test case 1: A + B
    A_test <= "0000000000110100"; -- 52
    B_test <= "0000000000010010"; -- 18 
    sel_test <= "000"; -- Select adder
    wait for 50 ns;

    -- Test case 2: A - B
    A_test <= "0000000001001000"; -- 72
    B_test <= "0000000000001010"; -- 10
    sel_test <= "100"; -- Select subtractor 
    wait for 50 ns;

    -- Test case 3: A * B 
    A_test <= "0000000010000000"; -- 80  
    B_test <= "0000000010000000"; -- 80
    sel_test <= "001"; -- Select multiplier	
	-- Result = 0x4000
    wait for 50 ns;

    -- Finish simulation
    wait;
	end process;
	
    -- Monitor the ALU outputs and status
  	monitor: process
  	begin
  
    	wait for 100 ns; 
    	report "R = " & integer'image(to_integer(R_test));
    	report "Status = " & integer'image(to_integer(unsigned(status_test)));
    
    	wait;
  	end process;
  
end architecture;