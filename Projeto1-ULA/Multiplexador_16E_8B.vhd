library ieee;
use ieee.std_logic_1164.all;

entity Multiplexador_16E_8B is
  port (E15, E14, E13, E12, E11, E10, E9, E8, E7, E6, E5, E4, E3, E2, E1, E0: in std_logic_vector(7 downto 0);
        k: in std_logic_vector(3 downto 0);
        s: out std_logic_vector(7 downto 0)
  );
end Multiplexador_16E_8B;

architecture Structure of Multiplexador_16E_8B is
  component Multiplexador_16E_1B
    port (i: in std_logic_vector(15 downto 0);
          k: in std_logic_vector(3 downto 0);
          o: out std_logic
    );
  end component;
  signal auxI0, auxI1, auxI2, auxI3, auxI4, auxI5, auxI6, auxI7: std_logic_vector(15 downto 0);
  signal auxS0, auxS1, auxS2, auxS3, auxS4, auxS5, auxS6, auxS7: std_logic; 
  -- signal auxS_8B: std_logic(7 downto 0);      
begin
  auxI0 <= E15(0) & E14(0) & E13(0) & E12(0) & E11(0) & E10(0) & E9(0) & E8(0) 
         & E7(0) & E6(0) & E5(0) & E4(0) & E3(0) & E2(0) & E1(0) & E0(0);
  auxI1 <= E15(1) & E14(1) & E13(1) & E12(1) & E11(1) & E10(1) & E9(1) & E8(1) 
         & E7(1) & E6(1) & E5(1) & E4(1) & E3(1) & E2(1) & E1(1) & E0(1); 
  auxI2 <= E15(2) & E14(2) & E13(2) & E12(2) & E11(2) & E10(2) & E9(2) & E8(2) 
         & E7(2) & E6(2) & E5(2) & E4(2) & E3(2) & E2(2) & E1(2) & E0(2); 
  auxI3 <= E15(3) & E14(3) & E13(3) & E12(3) & E11(3) & E10(3) & E9(3) & E8(3) 
         & E7(3) & E6(3) & E5(3) & E4(3) & E3(3) & E2(3) & E1(3) & E0(3); 
  auxI4 <= E15(4) & E14(4) & E13(4) & E12(4) & E11(4) & E10(4) & E9(4) & E8(4) 
         & E7(4) & E6(4) & E5(4) & E4(4) & E3(4) & E2(4) & E1(4) & E0(4);
  auxI5 <= E15(5) & E14(5) & E13(5) & E12(5) & E11(5) & E10(5) & E9(5) & E8(5) 
         & E7(5) & E6(5) & E5(5) & E4(5) & E3(5) & E2(5) & E1(5) & E0(5); 
  auxI6 <= E15(6) & E14(6) & E13(6) & E12(6) & E11(6) & E10(6) & E9(6) & E8(6) 
         & E7(6) & E6(6) & E5(6) & E4(6) & E3(6) & E2(6) & E1(6) & E0(6); 
  auxI7 <= E15(7) & E14(7) & E13(7) & E12(7) & E11(7) & E10(7) & E9(7) & E8(7) 
         & E7(7) & E6(7) & E5(7) & E4(7) & E3(7) & E2(7) & E1(7) & E0(7); 
  
  Multiplexador_16E_1B_7: Multiplexador_16E_1B 
    port map( auxI7, k, auxS7);
  Multiplexador_16E_1B_6: Multiplexador_16E_1B 
    port map( auxI6, k, auxS6);
  Multiplexador_16E_1B_5: Multiplexador_16E_1B 
    port map( auxI5, k, auxS5);
  Multiplexador_16E_1B_4: Multiplexador_16E_1B 
    port map( auxI4, k, auxS4);
  Multiplexador_16E_1B_3: Multiplexador_16E_1B 
    port map( auxI3, k, auxS3);
  Multiplexador_16E_1B_2: Multiplexador_16E_1B 
    port map( auxI2, k, auxS2);
  Multiplexador_16E_1B_1: Multiplexador_16E_1B 
    port map( auxI1, k, auxS1);
  Multiplexador_16E_1B_0: Multiplexador_16E_1B 
    port map( auxI0, k, auxS0);
  
  s <= auxS7 & auxS6 & auxS5 & auxS4 & auxS3 & auxS2 & auxS1 & auxS0;
end Structure;