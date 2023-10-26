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
  		A, B: in signed(15 downto 0);
  		S0, S1, S2: in std_logic;
  		R: out signed(15 downto 0);
  		r_overflow: out std_logic
		);
end component;

-- Adder signals
signal adder_result : signed(15 downto 0);

-- Subtractor signals
signal subtractor_result : signed(15 downto 0);
signal subtractor_borrow : std_logic;

-- Multiplier signals
signal multiplier_result : signed(31 downto 0);
signal overflow_result : std_logic;

-- Multiplexer signals
signal mux_A, mux_B: signed(15 downto 0);
signal mux_R: signed(15 downto 0);
signal mux_S0, mux_S1, mux_S2: std_logic;
signal mux_overflow: std_logic;

begin
	adder_inst: entity work.sixteen_bit_adder -- mapping adder
    port map (
        A   => A,
        B   => B,
        Sum => adder_result
    );
	
	subtractor_inst: sixteen_bit_subtractor -- mapping subtractor
  	port map (
    	A => A,
    	B => B,
    	D => subtractor_result,
    	Borrow => subtractor_borrow
  	);

    multiplier_inst: sixteen_bit_multiplier -- mapping multiplier
    port map (
        A       => A,
        B       => B,
        Result  => multiplier_result,
        Overflow => overflow_result  -- needs proper signal for overflow
    );
	
	--mux_inst: mux_16bit	 -- mapping mux
    --port map (
    -- A => mux_A,
    -- B => mux_B,
    --S0 => mux_S0,
    --  S1 => mux_S1,
     -- S2 => mux_S2,
     -- R => mux_R,
     -- r_overflow => mux_overflow
    --);
	
	-- Input signals for the multiplexer
	 -- mux_A <= A;
	 -- mux_B <= B;
	 -- mux_S0 <= sel(0);
	 -- mux_S1 <= sel(1);
	 -- mux_S2 <= sel(2);
	  
	  -- R <= mux_R;
  	  --status <= mux_overflow & '0' & '0';
		R <= adder_result;
	
	process (sel)
	begin
	   case sel is
		   when "000" => -- select adder case
			    report "adder selected";
                mux_R <= adder_result;
            when "001" => -- select multiplier case
				report "multiplier selected";
				R <= multiplier_result(15 downto 0);
			when "010" =>	-- passthrough A
				report "passthrough A selected";
				R <= A;
			when "011" =>	-- passthrough B
				report "passthrough B selected";
				R <= B;
			when "100" => -- select subtractor case
				report "subtractor selected";
				R <= subtractor_result;
            when others =>
				report "other selected";
                R <= (others => '0');  -- other cases undefined
        end case;
	end process;
	
	R <= mux_R;

end architecture structural;