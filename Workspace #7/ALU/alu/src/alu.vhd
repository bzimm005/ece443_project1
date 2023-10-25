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
    Port (
        A, B : in signed (15 downto 0);
        Result : out signed (31 downto 0);
		Overflow : out std_logic
    );
end component;

signal adder_result : signed(15 downto 0);
signal multiplier_result : signed(31 downto 0);
signal overflow_result : std_logic;

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