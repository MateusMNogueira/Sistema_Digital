library ieee;
use ieee.std_logic_1164.all;

entity decodificador_7segmentos is
    
    port ( BCD : in std_logic_vector(3 downto 0);
           HEX : out std_logic_vector(6 downto 0)
    );

end decodificador_7segmentos;

architecture CKT of decodificador_7segmentos is
    
    signal A, B, C, D: std_logic;

begin
  
    A <= BCD(3);
    B <= BCD(2);
    C <= BCD(1);
    D <= BCD(0);

    -- Anodo Comum (0 = Acende, 1 = Apaga)
    -- Sentido Horário
   
    HEX(0) <= (not A and not B and not C and D) or (not A and B and not C and not D); -- A
    
  
    HEX(1) <= (not A and B and not C and D) or (not A and B and C and not D); -- B
    
    
    HEX(2) <= (not A and not B and C and not D); -- C
    
    
    HEX(3) <= (not A and not B and not C and D) or (not A and B and not C and not D) or (not A and B and C and D); -- D
    
    
    HEX(4) <= D or (not A and B and not C); -- E
    
    
    HEX(5) <= (not A and not B and D) or (not A and not B and C) or (not A and C and D); -- F
    
   
    HEX(6) <= (not A and not B and not C) or (not A and B and C and D); -- G

end CKT;