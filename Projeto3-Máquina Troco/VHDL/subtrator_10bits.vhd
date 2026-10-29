library ieee; 
use ieee.std_logic_1164.all;

entity subtrator_10bits is
    
    port ( A  : in std_logic_vector(9 downto 0);
           B  : in std_logic_vector(9 downto 0);
           S  : out std_logic_vector(9 downto 0);
           Co : out std_logic
    );

end subtrator_10bits;

architecture CKT of subtrator_10bits is
    
    component somador_10bits
        
        port ( A  : in std_logic_vector(9 downto 0);
               B  : in std_logic_vector(9 downto 0); 
               Ci : in std_logic; 
               S  : out std_logic_vector(9 downto 0); 
               Co : out std_logic
        );
    
    end component;

    signal B_barrado : std_logic_vector(9 downto 0);

begin
    
    B_barrado <= not B(9 downto 0);

    subtracao: somador_10bits port map (A, B_barrado, '1', S, Co); 

end CKT;
