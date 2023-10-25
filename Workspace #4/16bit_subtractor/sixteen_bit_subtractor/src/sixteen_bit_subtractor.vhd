-----------------------------------------------------------------------------------------
--
-- 16-bit Subtractor:
-- Implement a 16-bit subtractor using the 16-bit adder and gates.	
--
-- The 16-bit subtractor entity has three ports - two 16-bit signed input ports 
-- A and B, a 16-bit signed output port D, and a 1-bit std_logic output port Borrow.
-- The structural architecture instantiates XOR gates to invert input B, creating 
-- a 16-bit signal not_B_sig. It also instantiates a 16-bit adder component, 
-- connecting input A and inverted input B (not_B_sig) to the adder ports. 
-- The adder performs the subtraction A - B, outputting a 16-bit result to the 
-- internal signal adder_out. The Borrow output is determined by checking if the 
-- MSB of adder_out is '1', indicating a borrow occurred. If so, Borrow is assigned
-- '1', otherwise it is '0'. Finally, the 16-bit result adder_out is assigned to 
-- the subtractor output port D. Overall, this architecture reuses an adder and 
-- XOR gates to invert one input and perform the subtraction, setting Borrow based 
-- on the adder result and outputting the final difference.
--
----------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

-- 16-bit subtractor
entity sixteen_bit_subtractor is
  port (
    A, B : in SIGNED(15 downto 0);	--16-bit input ports
    D : out SIGNED(15 downto 0);    --16-bit input ports
    Borrow : out std_logic			--Borrow out signal
  );
end sixteen_bit_subtractor;

architecture structural of sixteen_bit_subtractor is

  -- internal signals
  signal not_B_sig : SIGNED(15 downto 0);
  -- signal borrow_temp : std_logic;

  -- 16-bit adder component
  component sixteen_bit_adder 
    port (
      A, B : in SIGNED(15 downto 0);
      Sum : out SIGNED(15 downto 0)
    );
  end component;

  -- Output of adder
  signal adder_out : SIGNED(15 downto 0);
  
  signal temp : signed(15 downto 0);
  signal sum_temp : signed(15 downto 0);
  
begin
  -- Generate 16-bit inverted B
  NOT_B: for i in 0 to 15 generate
	temp <= "0000000000000001";
    not_B_sig(i) <= not B(i); 
  end generate;
  
  ADDER1: sixteen_bit_adder
  port map(
  	A => not_B_sig,
  	B => temp,
  	Sum => sum_temp 
  );

  -- 16-bit adder to add A and inverted B
  ADDER: sixteen_bit_adder 
    port map(
      A => A,
      B => sum_temp,  
      Sum => adder_out
    );

  -- Borrow out is MSB of adder output
  Borrow <= '1' when adder_out(15) = '1' else '0'; 

  -- Assign output
  D <= adder_out;
  
end structural;