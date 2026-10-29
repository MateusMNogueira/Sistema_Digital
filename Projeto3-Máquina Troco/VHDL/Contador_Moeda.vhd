library ieee;
use ieee.std_logic_1164.all;

entity contador_moedas is

  port ( C1, C2, C3, C4, C5, C6 :  in  std_logic;  
         BM1_GT_0, BM2_GT_0, BM3_GT_0, BM4_GT_0, BM5_GT_0, BM6_GT_0 :  in  std_logic;
         HAS_M1, HAS_M2, HAS_M3, HAS_M4, HAS_M5, HAS_M6 :  out std_logic;
         EMPTY :  out std_logic
  );

end contador_moedas;
 
architecture CKT of contador_moedas is

  signal H1, H2, H3, H4, H5, H6 : std_logic;

begin
  
  H1 <= BM1_GT_0 AND C1;
  H2 <= BM2_GT_0 AND C2;
  H3 <= BM3_GT_0 AND C3;
  H4 <= BM4_GT_0 AND C4;
  H5 <= BM5_GT_0 AND C5;
  H6 <= BM6_GT_0 AND C6;

  HAS_M1 <= H1;
  HAS_M2 <= H2;
  HAS_M3 <= H3;
  HAS_M4 <= H4;
  HAS_M5 <= H5;
  HAS_M6 <= H6;
 
  EMPTY <= NOT(H1 OR H2 OR H3 OR H4 OR H5 OR H6);

end CKT;
