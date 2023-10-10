-- Half Adder:
-- Implement a half adder using gates.

-- Half Adder Truth Table:
-- A	B	Sum	 Carry
-- 0	0	0	 0
-- 0	1	1	 0
-- 1	0	1	 0
-- 1	1	0	 1

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Half_Adder is
  Port (
    A, B: in  STD_LOGIC;       -- Input bits
    Sum, Carry: out STD_LOGIC  -- Output sum and carry bits
  );
end Half_Adder;

architecture Behavioral of Half_Adder is
begin
  Sum <= A XOR B;
  Carry <= A AND B;
end Behavioral;