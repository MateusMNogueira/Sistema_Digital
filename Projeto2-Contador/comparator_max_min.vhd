library ieee;
use ieee.std_logic_1164.all;
 
entity comparator_max_min is
    port(  
        A      : in  std_logic_vector(11 downto 0);  -- valor atual da contagem
        Min    : in  std_logic_vector(11 downto 0);  
        Max    : in  std_logic_vector(11 downto 0);  
 
        AgtMin : out std_logic;   -- 1 se A > Min
        AltMin : out std_logic;   -- 1 se A < Min
        AeqMin : out std_logic;   -- 1 se A = Min
 
        AgtMax : out std_logic;   -- 1 se A > Max
        AltMax : out std_logic;   -- 1 se A < Max
        AeqMax : out std_logic    -- 1 se A = Max
    );
end entity comparator_max_min;
 
architecture structural of comparator_max_min is
 
    component comparator_bcd is
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
    end component;
 
begin
 
    cmp_minimo: comparator_bcd port map(
        A_Cen => A(11 downto 8),
        B_Cen => Min(11 downto 8),
        A_Dez => A(7 downto 4),
        B_Dez => Min(7 downto 4),
        A_Uni => A(3 downto 0),
        B_Uni => Min(3 downto 0),
        AgtB  => AgtMin,
        AltB  => AltMin,
        AeqB  => AeqMin
    );
 
    cmp_maximo: comparator_bcd port map(
        A_Cen => A(11 downto 8),
        B_Cen => Max(11 downto 8),
        A_Dez => A(7 downto 4),
        B_Dez => Max(7 downto 4),
        A_Uni => A(3 downto 0),
        B_Uni => Max(3 downto 0),
        AgtB  => AgtMax,
        AltB  => AltMax,
        AeqB  => AeqMax
    );
 
end architecture structural;
 