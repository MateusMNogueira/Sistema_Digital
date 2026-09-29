library ieee; 
use ieee.std_logic_1164.all;

entity mux_2x1_1bit is 
  
  port ( entrada:       in std_logic;
         Q_realimentado: in std_logic;
         key:           in std_logic; --SignalR
         saida:         out std_logic
  );

end mux_2x1_1bit;

architecture CKT of mux_2x1_1bit is 

  begin
    
    saida <= (entrada and key) or (Q_realimentado and (not key));
    
end CKT;


