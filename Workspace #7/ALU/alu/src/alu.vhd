-- ALU: uses 16-bit adder, 16-bit multiplier, 16-bit multiplexer

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
	port(A, B : in signed(15 downto 0); -- the 16 bit inputs 
	R : out signed(15 downto 0);		-- the selected 16 bit result 
	sel : in signed(2 downto 0); -- selects the operation 
	status : out std_logic_vector(2 downto 0) -- the status of the ALU can be signal overflow, zero result, or a negative result
	);
end entity alu;

architecture structural of ALU is

component sixteen_bit_adder is
  port (
    A, B : in signed(15 downto 0);
    Sum : out signed(15 downto 0)
  );
end component;

component sixteen_bit_subtractor is
  port (
    A, B : in signed(15 downto 0);	
    D : out signed(15 downto 0);    
    Borrow : out std_logic		
  );
end component;

component sixteen_bit_multiplier is
    port (
        A, B : in signed (15 downto 0);
        Result : out signed (31 downto 0);
		Overflow : out std_logic
    );
end component;

component mux_16bit
	port (
  		A0, A1, A2, A3, A4, A5, A6, A7 : in signed(15 downto 0);	 --16-bit inputs
  		sel : in signed(2 downto 0);
    	result: out signed(15 downto 0)	 --16-bit output  
  	);
end component;

-- signals
signal adder_result : signed(15 downto 0);
signal subtractor_result : signed(15 downto 0);
signal subtractor_borrow : std_logic;
signal multiplier_result : signed(31 downto 0);
signal overflow_result : std_logic;


-- Multiplexer signals
signal mux_A0, mux_A1, mux_A2, mux_A3, mux_A4, mux_A5, mux_A6, mux_A7: signed(15 downto 0);
signal mux_R: signed(15 downto 0);
signal mux_overflow: std_logic;

signal result : signed(15 downto 0);

signal temp : signed(15 downto 0);

begin
	-- Instantiate components
    adder_inst: sixteen_bit_adder port map (A => A, B => B, Sum => adder_result);
    subtractor_inst: sixteen_bit_subtractor port map (A => A, B => B, D => subtractor_result, Borrow => subtractor_borrow);
    multiplier_inst: sixteen_bit_multiplier port map (A => A, B => B, Result => multiplier_result, Overflow => overflow_result);
	
	process (sel, adder_result, multiplier_result, subtractor_result)
	begin
	   case sel is
		   when "000" => -- select adder case
			    report "adder selected";
                result <= adder_result;
            when "001" => -- select multiplier case
				report "multiplier selected";
				result <= multiplier_result(15 downto 0);
			when "010" =>	-- passthrough A
				report "passthrough A selected";
				result <= A;
			when "011" =>	-- passthrough B
				report "passthrough B selected";
				result <= B;
			when "100" => -- select subtractor case
				report "subtractor selected";
				result <= subtractor_result;
            when others =>
				report "other selected";
                result <= (others => '0');  -- other cases undefined
        end case;
	
		R <= result; -- update result
		
        -- init status flags
        status <= "000";

        -- Check for overflow
        if sel = "000" then
            if adder_result(15) /= A(15) and adder_result(15) /= B(15) then
                status(0) <= '1'; -- Set overflow flag
            end if;
        end if;

        -- Check for zero result
        if result = "0000000000000000" then
            status(1) <= '1'; -- Set zero flag
        end if;

        -- Check for negative result
        if result(15) = '1' then
            status(2) <= '1'; -- Set negative flag
        end if;
    end process;

end architecture structural;