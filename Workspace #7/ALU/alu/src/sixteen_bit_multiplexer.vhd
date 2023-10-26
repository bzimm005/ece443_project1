-------------------------------------------------------------------------------
--
-- Title       : sixteen_bit_multiplexer
-- Design      : 16-bit multiplexer using gates (structural model)
-- Author      : Emily Ly
-- Company     : Old Dominion University
--
-------------------------------------------------------------------------------
--
-- Description: 
-- A 16-bit  multiplexer works by which enabling the selection of one of the 
-- 16 data inputs. 
-- The output of the multiplexer will be the data value from the selected input. 
-- The 16-bit width indicates that each data input and the output can handle 16 
-- individual binary digits, or bits.  
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_16bit is
  port (
  A0, A1, A2, A3, A4, A5, A6, A7 : in signed(15 downto 0);	 --16-bit inputs
  	sel : in signed(2 downto 0);
    result: out signed(15 downto 0)	 --16-bit output  
  );
end mux_16bit;

architecture structural of mux_16bit is

begin
 
	process(sel)
	begin
	  case sel is
	    when "000" =>  -- addition
	      result <= A0;
	    when "001" =>  -- multiplication
	      result <= A1;
	    when "010" =>  -- passthrough A
	      result <= A2;
	    when "011" =>  -- passthrough B
	      result <= A3;
	    when "100" =>  -- subtraction
	      result <= A4;
	    when "101" =>  -- undefined
	      result <= A5;
	    when "110" =>  -- undefined
	      result <= A6;
	    when "111" =>  -- undefined
	      result <= A7;
	    when others =>
	      result <= (others => '0');
	  end case;
	end process;
end structural;