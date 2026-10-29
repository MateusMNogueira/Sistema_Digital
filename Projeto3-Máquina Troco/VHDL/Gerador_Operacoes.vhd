library ieee;
use ieee.std_logic_1164.all;
 
entity gerador_operadores is

  port ( VTOT_GT_VM_1, VTOT_GT_VM_2, VTOT_GT_VM_3,
         VTOT_GT_VM_4, VTOT_GT_VM_5, VTOT_GT_VM_6 : in  std_logic;
         HAS_M1, HAS_M2, HAS_M3, HAS_M4, HAS_M5, HAS_M6 : in  std_logic;
         CHANGE_ON : out std_logic;
         M1_ON, M2_ON, M3_ON, M4_ON, M5_ON, M6_ON : out std_logic
  );

end gerador_operadores;
 
architecture CKT of gerador_operadores is
  
  signal M1, M2, M3, M4, M5, M6 : std_logic;

begin
  
  M1 <= VTOT_GT_VM_1 AND HAS_M1;
  M2 <= VTOT_GT_VM_2 AND HAS_M2 AND NOT(M1); 
  M3 <= VTOT_GT_VM_3 AND HAS_M3 AND NOT(M1) AND NOT(M2); 
  M4 <= VTOT_GT_VM_4 AND HAS_M4 AND NOT(M1) AND NOT(M2) AND NOT(M3);
  M5 <= VTOT_GT_VM_5 AND HAS_M5 AND NOT(M1) AND NOT(M2) AND NOT(M3) AND NOT(M4);
  M6 <= VTOT_GT_VM_6 AND HAS_M6 AND NOT(M1) AND NOT(M2) AND NOT(M3) AND NOT(M4) AND NOT(M5);
 
  M1_ON <= M1;
  M2_ON <= M2;
  M3_ON <= M3;
  M4_ON <= M4;
  M5_ON <= M5;
  M6_ON <= M6;
 
  CHANGE_ON <= M1 OR M2 OR M3 OR M4 OR M5 OR M6;

end CKT;
