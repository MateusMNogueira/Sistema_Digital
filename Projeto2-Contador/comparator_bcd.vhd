library ieee;
use ieee.std_logic_1164.all;
 
entity comparator_bcd is
    port(
        A_Cen : in  std_logic_vector(3 downto 0); 
        B_Cen : in  std_logic_vector(3 downto 0);  
        A_Dez : in  std_logic_vector(3 downto 0);  
        B_Dez : in  std_logic_vector(3 downto 0);  
        A_Uni : in  std_logic_vector(3 downto 0);  
        B_Uni : in  std_logic_vector(3 downto 0);  
        AgtB  : out std_logic;                     
        AltB  : out std_logic;                     
        AeqB  : out std_logic                      
    );
end entity comparator_bcd;
 
architecture structural of comparator_bcd is
 
    
    component comparator_4_bits is
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
    end component;
 
   
    signal gt_cen, lt_cen, eq_cen : std_logic;  
    signal gt_dez, lt_dez, eq_dez : std_logic;  
 
begin
 
    cmp_centena: comparator_4_bits port map(
        A      => A_Cen,
        B      => B_Cen,
        in_gt  => '0',
        in_lt  => '0',
        in_eq  => '1',
        out_gt => gt_cen,
        out_lt => lt_cen,
        out_eq => eq_cen
    );
 
    cmp_dezena: comparator_4_bits port map(
        A      => A_Dez,
        B      => B_Dez,
        in_gt  => gt_cen,
        in_lt  => lt_cen,
        in_eq  => eq_cen,
        out_gt => gt_dez,
        out_lt => lt_dez,
        out_eq => eq_dez
    );
 
    
    cmp_unidade: comparator_4_bits port map(
        A      => A_Uni,
        B      => B_Uni,
        in_gt  => gt_dez,
        in_lt  => lt_dez,
        in_eq  => eq_dez,
        out_gt => AgtB,
        out_lt => AltB,
        out_eq => AeqB
    );
 
end architecture structural;
 