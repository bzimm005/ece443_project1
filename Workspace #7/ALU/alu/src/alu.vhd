-- ALU: uses 16-bit adder, 16-bit multiplier, 16-bit multiplexer

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
	port(A, B : in signed(15 downto 0);
	R : out signed(15 downto 0);
	sel : in std_logic_vector(2 downto 0);
	status : out std_logic_vector(2 downto 0) 
	);
end entity alu;

architecture structural of ALU is

component sixteen_bit_adder is
  port (
    A, B : in signed(15 downto 0);
    Sum : out signed(15 downto 0)
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

signal adder_result : signed(15 downto 0);
signal multiplier_result : signed(31 downto 0);
signal overflow_result : std_logic;

-- Signals for the 16-bit multiplexer inputs and outputs
signal mux_A, mux_B: signed(15 downto 0);
signal mux_R: signed(15 downto 0);
signal mux_S0, mux_S1, mux_S2: std_logic;
signal mux_overflow: std_logic;

begin
	adder_inst: sixteen_bit_adder
    port map (
        A   => A,
        B   => B,
        Sum => adder_result
    );

    multiplier_inst: sixteen_bit_multiplier
    port map (
        A       => A,
        B       => B,
        Result  => multiplier_result,
        Overflow => overflow_result  -- You need to provide the proper signal for Overflow
    );
	
	mux_inst: mux_16bit
    port map (
      A => mux_A,
      B => mux_B,
      S0 => mux_S0,
      S1 => mux_S1,
      S2 => mux_S2,
      R => mux_R,
      r_overflow => mux_overflow
    );
	
	-- Set the input signals for the multiplexer
	  mux_A <= A;
	  mux_B <= B;
	  mux_S0 <= sel(0);
	  mux_S1 <= sel(1);
	  mux_S2 <= sel(2);
	
	process (sel)
	begin
	   case sel is
            when "000" =>
                R <= adder_result;
            when "001" =>
                -- R <= multiplier_result;
            when others =>
                R <= (others => '0');  -- You need to specify the behavior for other cases
        end case;
	end process;

end architecture structural;