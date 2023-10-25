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
-- A 16-bit  multiplexer works br utilizing a 4-bit control signal, 
-- as 2^4 = 16, which enables the selection of one of the 16 data inputs. 
-- The output of the multiplexer will be the data value from the selected input. 
-- The 16-bit width indicates that each data input and the output can handle 16 
-- individual binarr digits, or bits.  
--
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_16bit is
  port (
    A, B: in signed(15 downto 0);	 --16-bit inputs
    S0, S1, S2: in std_logic;			     --Select input lines
    R: out signed(15 downto 0);	 --16-bit output  
	r_overflow: out std_logic				 --overflow output
  );
end mux_16bit;

architecture structural of mux_16bit is
  -- Internal signals
  signal R_int : signed(15 downto 0);
  signal i: integer;  -- Index for loop

begin
  -- Generate 16-bit multiplexer logic
  process(A, B, S0, S1, S2)
  begin
    R_int <= (others => '0');  -- Initialize the result to all zeros

    if (S0 = '0' and S1 = '0' and S2 = '0') then
      R_int <= A;
    elsif (S0 = '0' and S1 = '0' and S2 = '1') then
      R_int <= B;
    elsif (S0 = '0' and S1 = '1' and S2 = '0') then
      R_int <= A;
    elsif (S0 = '0' and S1 = '1' and S2 = '1') then
      R_int <= B;
    elsif (S0 = '1' and S1 = '0' and S2 = '0') then
      R_int <= A;
    end if;
  end process;

	-- Overflow detection
	process(a, b, S0, S1, S2)
	begin	
		
		r_overflow <= '0'; -- default to no overflow

		-- Check for all 1s or 0s on inputs and inverted select
		if (A = x"FFFF" and B = x"FFFF" and S0 = '0') or
   			(A = x"0000" and B = x"0000" and S0 = '1') then
    
  			r_overflow <= '1';
    	end if;

  end process;
  
  -- Assign the result to the output
  R <= R_int;
  
end structural;