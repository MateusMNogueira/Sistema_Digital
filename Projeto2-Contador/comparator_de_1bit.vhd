library ieee;                          
use ieee.std_logic_1164.all;           
 
entity comparator_1_bit is
    port(
        A      : in  std_logic;        
        B      : in  std_logic;        
        in_gt  : in  std_logic;        
        in_lt  : in  std_logic;        
        in_eq  : in  std_logic;        
        out_gt : out std_logic;        
        out_lt : out std_logic;        
        out_eq : out std_logic         
    );
end entity comparator_1_bit;
 
architecture dataflow of comparator_1_bit is
begin
 
  
    out_gt <= (A and (not B) and in_eq) or in_gt;
 
    out_lt <= ((not A) and B and in_eq) or in_lt;
 
    out_eq <= (A xnor B) and in_eq;
 
end architecture dataflow;