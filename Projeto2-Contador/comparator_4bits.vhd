
library ieee;
use ieee.std_logic_1164.all;
 
entity comparator_4_bits is
    port(
        A      : in  std_logic_vector(3 downto 0);  
        B      : in  std_logic_vector(3 downto 0);  
        in_gt  : in  std_logic;                      
        in_lt  : in  std_logic;                      
        in_eq  : in  std_logic;                      
        out_gt : out std_logic;                    
        out_lt : out std_logic;                     
        out_eq : out std_logic                       
    );
end entity comparator_4_bits;
 
architecture structural of comparator_4_bits is
 
    
    component comparator_1_bit is
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
    end component;
 
  
    signal gt3, gt2, gt1 : std_logic;  
    signal lt3, lt2, lt1 : std_logic; 
    signal eq3, eq2, eq1 : std_logic;  
 
begin
 
    
    stage3: comparator_1_bit port map(
        A      => A(3),
        B      => B(3),
        in_gt  => in_gt,
        in_lt  => in_lt,
        in_eq  => in_eq,
        out_gt => gt3,
        out_lt => lt3,
        out_eq => eq3
    );
 
  
    stage2: comparator_1_bit port map(
        A      => A(2),
        B      => B(2),
        in_gt  => gt3,
        in_lt  => lt3,
        in_eq  => eq3,
        out_gt => gt2,
        out_lt => lt2,
        out_eq => eq2
    );
 
    
    stage1: comparator_1_bit port map(
        A      => A(1),
        B      => B(1),
        in_gt  => gt2,
        in_lt  => lt2,
        in_eq  => eq2,
        out_gt => gt1,
        out_lt => lt1,
        out_eq => eq1
    );
 
    
    stage0: comparator_1_bit port map(
        A      => A(0),
        B      => B(0),
        in_gt  => gt1,
        in_lt  => lt1,
        in_eq  => eq1,
        out_gt => out_gt,
        out_lt => out_lt,
        out_eq => out_eq
    );
 
end architecture structural;
 