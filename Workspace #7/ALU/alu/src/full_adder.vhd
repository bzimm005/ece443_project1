-----------------------------------------------------------------------
--
-- Full Adder:
-- A full adder adds three 1-bit inputs (A, B, Cin)  
-- and outputs two 1-bit sums (Sum, Cout) 	
--
-----------------------------------------------------------------------
--
-- This Full Adder avoids needing a separate component declaration by
-- directly instantiating the Half Adder entity that was defined in the
-- external half_adder component.  It connects the carry outs with an 
-- OR gate and maps the final Sum/Cout ports.
--
-----------------------------------------------------------------------
--
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
--
-----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
  Port (
    A, B, Cin: in  STD_LOGIC;       -- Input bits and carry-in
    Sum, Cout: out STD_LOGIC        -- Output sum and carry-out
  );
end Full_Adder;

architecture structural of Full_Adder is

  -- Component declaration for half adder
  component half_adder
    port (
      A, B : in std_logic;
      Sum, Cout : out std_logic
    );
  end component;
  
  -- Signals to connect half adders
  signal Sum1, Carry1, Carry2 : std_logic;

begin
  HA1: entity work.Half_Adder -- creating the first half adder from Half Adder.vhdl
    port map (				  -- mapping the ports
      A => A,
      B => B,
      Sum => Sum1,
      Cout => Carry1
    );

  HA2: entity work.Half_Adder -- creating the second half adder from Half Adder.vhdl	
    port map (				  -- mapping the ports
      A => Sum1,
      B => Cin,
      Sum => Sum,
      Cout => Carry2
    );

  -- the carry-out is combine through an OR of the two carry bits (essentially two half adders combine outputs go to the two inputs of the OR)
  Cout <= Carry1 OR Carry2;
end structural;