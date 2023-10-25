-------------------------------------------------------------------------------
--
-- Title       : one_bit_multiplexer
-- Design      : 1-bit multiplexer
-- Author      : Emily Ly
-- Company     : Old Dominion University
--
-------------------------------------------------------------------------------
--
-- Description: 
-- A 1-bit  multiplexer was created 
--
-------------------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;

entity mux_1bit is
  port (
    a, b, sel: in std_logic;
    y: out std_logic
  );
end mux_1bit;

architecture structural of mux_1bit is
begin
  with sel select
    y <= a when '0',
         b when others;
end structural;