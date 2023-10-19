----------------------------------------------------------------------------------
--
-- 16-bit Adder
-- A 16-bit adder takes inputs (A,B).  It internally containes 16 individual
-- 1-bit adders that are connected together to add each bit position.  Each 
-- full adder takes 2 input bit at that position (A0-15, B0-15) and carry-ins
-- from the previous adder.  It then computes the sum bit for that position
-- along with a carry-out to the next position.  The carry-out adder of 1 
-- full adder is connected to the carry-in of the next most significant adder
-- forming a full adder (aka ripple-carry chain).  The first (least significant)
-- full adder has a carry-in of 0.  After all 16 full adders compute their sums
-- and carries, the final 16-bit sum output is the concacatenation of each 1-bit
-- sum.  The carry-out of the last (most significant) adder is the final carry-out
-- of the 16-bit addition.  If the carry-out is 1, there's an overflow where the 
-- sum is larger than 16 bits.
--
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity sixteen_bit_adder is
  port (
    A, B : in std_logic_vector(15 downto 0);  -- 16 bit inputs
    Sum : out std_logic_vector(15 downto 0)	  -- 16 bit outputs
  );
end sixteen_bit_adder;

architecture structural of sixteen_bit_adder is

  -- full adder declaration
  component full_adder
    port (
      A, B, Cin : in std_logic;
      Sum, Cout : out std_logic
    );
  end component;
  
  signal Carry : std_logic_vector(16 downto 0);	-- carry signals between the FA's
  
begin

  adders: for i in 0 to 15 generate	-- create 16 full adders
    FA: full_adder port map (
        A => A(i), 
        B => B(i),
        Cin => Carry(i),
        Sum => Sum(i),
        Cout => Carry(i+1)
       );
  end generate adders;
  
  Carry(0) <= '0'; -- set the first carry in to 0

end structural;