-- 16-bit Adder
-- Implement a 16-bit adder using full adders and gates.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sixteen_Bit_Adder is
  Port (
    A, B: in  STD_LOGIC_VECTOR(15 downto 0);  -- 16-bit input operands
    Cin: in STD_LOGIC;                        -- Carry-in
    Sum: out STD_LOGIC_VECTOR(15 downto 0);  -- 16-bit sum
    Cout: out STD_LOGIC                      -- Carry-out
  );
end Sixteen_Bit_Adder;

architecture Behavioral of Sixteen_Bit_Adder is
  signal Carry: STD_LOGIC_VECTOR(15 downto 0);  -- carry signals
begin
  Carry(0) <= Cin;  -- Initialize the carry-in for the least significant bit

  -- Instantiate 16 full adders
  Full_Adder: for i in 0 to 15 generate -- generating 16 Full Adders
    Full_Adder_i: entity work.Full_Adder -- instantiating the Full_Adder entity (i.e. creating a Full Adder)
      port map (						 -- mapping the ports
        A => A(i),
        B => B(i),
        Cin => Carry(i),
        Sum => Sum(i),
        Cout => Carry(i + 1)
      );
  end generate;

  -- The final carry-out is the carry-out of the most significant bit
  Cout <= Carry(15);
end Behavioral;