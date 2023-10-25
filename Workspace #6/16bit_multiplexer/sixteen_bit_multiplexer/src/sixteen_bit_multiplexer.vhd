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
-- A 16-bit  multiplexer works by utilizing a 4-bit control signal, 
-- as 2^4 = 16, which enables the selection of one of the 16 data inputs. 
-- The output of the multiplexer will be the data value from the selected input. 
-- The 16-bit width indicates that each data input and the output can handle 16 
-- individual binary digits, or bits.  
--
-- The below code uses 1-bit multiplexer components. 
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity mux_16bit is
  port (
    a, b: in std_logic_vector(15 downto 0);	 --16-bit inputs
    sel: in std_logic;						 --Select input
    y: out std_logic_vector(15 downto 0);	 --16-bit output  
	y_overflow: out std_logic				 --overflow output
  );
end mux_16bit;

architecture structural of mux_16bit is

-- 1-bit multiplexer component
component mux_1bit is
  port (
    a, b, sel: in std_logic;
    y: out std_logic
  );
end component;

begin
  -- Instantiate 16 1-bit multiplexers
  -- to create the 16-bit multiplexer
  mux_0: mux_1bit port map (
  	a => a(0), 
  	b => b(0), 
	sel => sel, 
	y => y(0));
  
  mux_1: mux_1bit port map (
  	a => a(1), 
  	b => b(1), 
	sel => sel, 
	y => y(1));
 
  mux_2: mux_1bit port map (
  	a => a(2), 
  	b => b(2), 
	sel => sel, 
	y => y(2));
	
  mux_3: mux_1bit port map (
  	a => a(3), 
  	b => b(3), 
	sel => sel, 
	y => y(3));

  mux_4: mux_1bit port map (
  	a => a(4), 
  	b => b(4), 
	sel => sel, 
	y => y(4));
  
  mux_5: mux_1bit port map (
  	a => a(5), 
  	b => b(5), 
	sel => sel, 
	y => y(5));
 
  mux_6: mux_1bit port map (
  	a => a(6), 
  	b => b(6), 
	sel => sel, 
	y => y(6));
	
  mux_7: mux_1bit port map (
  	a => a(7), 
  	b => b(7), 
	sel => sel, 
	y => y(7));	

  mux_8: mux_1bit port map (
  	a => a(8), 
  	b => b(8), 
	sel => sel, 
	y => y(8));
  
  mux_9: mux_1bit port map (
  	a => a(9), 
  	b => b(9), 
	sel => sel, 
	y => y(9));
 
  mux_10: mux_1bit port map (
  	a => a(10), 
  	b => b(10), 
	sel => sel, 
	y => y(10));
	
  mux_11: mux_1bit port map (
  	a => a(11), 
  	b => b(11), 
	sel => sel, 
	y => y(11));

  mux_12: mux_1bit port map (
  	a => a(12), 
  	b => b(12), 
	sel => sel, 
	y => y(12));
  
  mux_13: mux_1bit port map (
  	a => a(13), 
  	b => b(13), 
	sel => sel, 
	y => y(13));
 
  mux_14: mux_1bit port map (
  	a => a(14), 
  	b => b(14), 
	sel => sel, 
	y => y(14));
	
  mux_15: mux_1bit port map (
  	a => a(15), 
  	b => b(15), 
	sel => sel, 
	y => y(15));

	-- Overflow detection
	process(a, b, sel)
	begin	
		
		y_overflow <= '1'; 		-- default value
		
    	if (a = x"FFFF" and b = x"FFFF" and sel = '0') or
       		(a = x"0000" and b = x"0000" and sel = '1') then
      			
    	else
      		y_overflow <= '0'; 	-- overflow 
    	end if;

  end process;

end structural;