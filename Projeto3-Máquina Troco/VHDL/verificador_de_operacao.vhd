library ieee;
use ieee.std_logic_1164.all;

entity verificador_de_operacao is
    
    port ( Vtot_eq_0  : in  std_logic;
           empty      : in  std_logic;
           M_on       : in  std_logic_vector(1 to 6);
           Operate    : out std_logic_vector(1 to 6)
    );

end verificador_de_operacao;

architecture CKT of verificador_de_operacao is

begin
  
  Operate(1) <= (not Vtot_eq_0) and (not empty) and M_on(1);
  Operate(2) <= (not Vtot_eq_0) and (not empty) and M_on(2);
  Operate(3) <= (not Vtot_eq_0) and (not empty) and M_on(3);
  Operate(4) <= (not Vtot_eq_0) and (not empty) and M_on(4);
  Operate(5) <= (not Vtot_eq_0) and (not empty) and M_on(5);
  Operate(6) <= (not Vtot_eq_0) and (not empty) and M_on(6);


end CKT;
