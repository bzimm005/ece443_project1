-------------------------------------------------------------------------------
--
-- Title       : halfadder
-- Design      : half_adder
-- Author      : bzimm005@odu.edu
-- Company     : Old Dominion University
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Project1_Fall22\ece443_project1\Workspace #1\half_adder_workspace\half_adder\src\halfadder.vhd
-- Generated   : Wed Oct 25 08:47:31 2023
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : A half adder takes two input bits (A,B), outputs a 1-bit Sum as A XOR B,
-- and outputs a Carry bit as A AND B 
--
-------------------------------------------------------------------------------
--
-- Half Adder Truth Table:
-- A	B	Sum	 Carry
-- 0	0	0	 0	   
-- 0	1	1	 0	   
-- 1	0	1	 0	    
-- 1	1	0	 1     
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--AND Gate entity
entity and_gate is 
   Port ( a : in STD_LOGIC;
          b : in STD_LOGIC;
          c : out STD_LOGIC);
end and_gate;

architecture structural of and_gate is
begin
   c <= a and b; 
end structural;

--XOR Gate entity
library IEEE;				   -- Not sure why I needed the libraries again since
use IEEE.STD_LOGIC_1164.ALL;   -- it's defined globally at the top but won't compile right otherwise

entity xor_gate is
   Port ( a : in STD_LOGIC;     
          b : in STD_LOGIC;
          c : out STD_LOGIC);
end xor_gate;

architecture structural of xor_gate is
begin
   c <= a xor b;
end structural;

--Half Adder entity 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfadder is
  Port ( A : in STD_LOGIC;
         B : in STD_LOGIC;
         Sum : out STD_LOGIC;
         Cout : out STD_LOGIC);
end halfadder;

-- Architecture using logic gates
architecture structural of halfadder is

  --Component declarations
  component and_gate
     Port ( a : in STD_LOGIC;
            b : in STD_LOGIC;
            c : out STD_LOGIC);
  end component;

  component xor_gate
     Port ( a : in STD_LOGIC;     
            b : in STD_LOGIC;
            c : out STD_LOGIC);
  end component;

  --Internal signals to connect gates
  signal and1_out, xor1_out : STD_LOGIC;
  
  begin	
	  
   -- Instantiage AND and XOR gates 
   U1: and_gate 
     port map(
          a => A,
          b => B, 
          c => and1_out);
          
   U2: xor_gate 
     port map(
          a => A,  
          b => B,
          c => xor1_out);
		  
   -- Connect outputs        
   Sum <= xor1_out;
   Cout <= and1_out;
   
end structural;
