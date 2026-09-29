library ieee;
use ieee.std_logic_1164.all;

entity gerador_de_keys is 
  
  port ( load:     in std_logic;
         mx_mi:    in std_logic;
         step:     in std_logic;
         set_max:  out std_logic;
         set_min:  out std_logic;
         set_step: out std_logic
  );
  
end gerador_de_keys;

architecture CKT of gerador_de_keys is
  
  signal load_ativo: std_logic;
  signal step_ativo: std_logic;
  
  
  begin 
    
    load_ativo <= not load;
    step_ativo <= not step;
    
    set_max <= load_ativo and mx_mi and (not step_ativo);
    
    set_min <= load_ativo and (not mx_mi) and (not step_ativo);
    
    set_step <= load_ativo and step_ativo;
    
end CKT;
