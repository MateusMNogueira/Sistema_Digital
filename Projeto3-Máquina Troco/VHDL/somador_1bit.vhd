library ieee; 
use ieee.std_logic_1164.all;

entity somador_1bit is 
  
  port ( A  : in std_logic; 
         B  : in std_logic;
         Ci : in std_logic; -- CARRY IN
         S  : out std_logic; -- SAIDA
         Co : out std_logic -- CARRY OUT
  ); 

end somador_1bit;

architecture CKT of somador_1bit is
  
begin
  
  Co <= (A and B) or (A and Ci) or (B and Ci);
  S  <= A xor B xor Ci;

end CKT;