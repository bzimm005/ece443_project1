-----------------------------------------------------------------------------------------
--
-- 16-bit Subtractor:
-- Implement a 16-bit subtractor using the 16-bit adder and gates.	  
-- 
----------------------------------------------------------------------------------------
--
-- 16-Bit Subtractor Truth Table where A and B are inputs, B is the difference output, 
-- and B is the 1-bit borrow output
--
-- A    B    Borrow   D
-- 0    0     0       0
-- 5    3     0       2  
-- 10   4     0       6
-- 20   10    0       10
-- 10   20    1      -10  
--
-----------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

-- 16-bit subtractor
entity sixteen_bit_subtractor is
  port (
    A, B : in SIGNED(15 downto 0);
    D : out SIGNED(15 downto 0);
    Borrow : out std_logic
  );
end sixteen_bit_subtractor;

architecture structural of sixteen_bit_subtractor is

  -- internal signals
  signal not_B_sig : SIGNED(15 downto 0);
  -- signal borrow_temp : std_logic;

  -- XOR gate component
  component xor_gate 
    port (
      a, b: in std_logic;
      y: out std_logic
    );
  end component;
  
  -- 16-bit adder component
  component sixteen_bit_adder is
    port (
      A, B : in SIGNED(15 downto 0);
      Sum : out SIGNED(15 downto 0)
    );
  end component;
  
  signal adder_out : SIGNED(15 downto 0);

begin

  -- Generate the 16 XOR gates
--  NOT_B: for i in 0 to 15 generate
--    	NOT_B_i: xor_gate port map (
--			a => B(i),			 -- B input
--			b => '1',			 -- Invert
--			y => not_B_sig(i));  -- Output to signal
--	end generate;

  -- Generate the 16-bit inverters (XOR gates)
  NOT_B: for i in 0 to 15 generate
    not_B_sig(i) <= A(i) XOR B(i);
  end generate;

    -- 16-bit adder instance
    ADDER: sixteen_bit_adder port map(
        A => A,
        B => not_B_sig,
        Sum => adder_out
    );
	
	Borrow <= '1' when adder_out(15) = '1' else '0';

  -- Assign outputs
  D <= adder_out;

end structural;		   

-- *** Once write 16-bit Adder in structural it's already defined in the
-- library so can add those files that have been defined to this one 
-- for all: sixteen_bit_adder use entity lib.sixteen_bit_adder(structural); 
-- or whatever the file name is