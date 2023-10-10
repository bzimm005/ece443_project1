-- Full Adder:
-- Implement a full adder using half adders and gates.

-- Full Adder Truth Table:
-- A	B	Cin	Sum	Cout
-- 0	0	0	0	0
-- 0	0	1	1	0
-- 0	1	0	1	0
-- 0	1	1	0	1
-- 1	0	0	1	0
-- 1	0	1	0	1
-- 1	1	0	0	1
-- 1	1	1	1	1

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Full_Adder is
  Port (
    A, B, Cin: in  STD_LOGIC;       -- Input bits and carry-in
    Sum, Cout: out STD_LOGIC        -- Output sum and carry-out
  );
end Full_Adder;

architecture Behavioral of Full_Adder is
  signal Sum1, Carry1, Carry2: STD_LOGIC;  -- signals
begin
  HA1: entity work.Half_Adder -- creating the first half adder from Half Adder.vhdl
    port map (				  -- mapping the ports
      A => A,
      B => B,
      Sum => Sum1,
      Carry => Carry1
    );

  HA2: entity work.Half_Adder -- creating the second half adder from Half Adder.vhdl	
    port map (				  -- mapping the ports
      A => Sum1,
      B => Cin,
      Sum => Sum,
      Carry => Carry2
    );

  -- the carry-out is combine through an OR of the two carry bits (essentially two half adders combine outputs go to the two inputs of the OR)
  Cout <= Carry1 OR Carry2;
end Behavioral;
