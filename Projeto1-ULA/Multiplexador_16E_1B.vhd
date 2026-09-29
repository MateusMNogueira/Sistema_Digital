library ieee;
use ieee.std_logic_1164.all;

entity Multiplexador_16E_1B is
  port (i: in std_logic_vector(15 downto 0);
        k: in std_logic_vector(3 downto 0);
        o: out std_logic
  );
end Multiplexador_16E_1B;

architecture Structure of Multiplexador_16E_1B is
  component AND_5E_1B_1S
    port( a, b, c, d, e: in std_logic;
          s: out std_logic
    );
  end component;
  component OR_16E_1B_1S
    port( a: in std_logic_vector(15 downto 0);
          s: out std_logic
    );
  end component;
  component NOT1
    port (
        A : in std_logic;
        S : out std_logic
    );
  end component;
  
  signal auxI0, auxI1, auxI2, auxI3, auxI4, auxI5, auxI6, auxI7, 
         auxI8, auxI9, auxI10, auxI11, auxI12, auxI13, auxI14, auxI15: std_logic;
  signal not_k: std_logic_vector(3 downto 0);
  signal auxOR_16E: std_logic_vector(15 downto 0);
begin
  NOT1_K0: NOT1 port map(k(0), not_k(0));
  NOT1_K1: NOT1 port map(k(1), not_k(1)); 
  NOT1_K2: NOT1 port map(k(2), not_k(2));
  NOT1_K3: NOT1 port map(k(3), not_k(3));
  
  AND_5E_0: AND_5E_1B_1S port map(i(0), not_k(3), not_k(2), not_k(1), not_k(0), auxI0);
  AND_5E_1: AND_5E_1B_1S port map(i(1), not_k(3), not_k(2), not_k(1),     k(0), auxI1);
  AND_5E_2: AND_5E_1B_1S port map(i(2), not_k(3), not_k(2),     k(1), not_k(0), auxI2);
  AND_5E_3: AND_5E_1B_1S port map(i(3), not_k(3), not_k(2),     k(1),     k(0), auxI3);
  AND_5E_4: AND_5E_1B_1S port map(i(4), not_k(3),     k(2), not_k(1), not_k(0), auxI4);
  AND_5E_5: AND_5E_1B_1S port map(i(5), not_k(3),     k(2), not_k(1),     k(0), auxI5);
  AND_5E_6: AND_5E_1B_1S port map(i(6), not_k(3),     k(2),     k(1), not_k(0), auxI6);
  AND_5E_7: AND_5E_1B_1S port map(i(7), not_k(3),     k(2),     k(1),     k(0), auxI7);
  AND_5E_8: AND_5E_1B_1S port map(i(8),     k(3), not_k(2), not_k(1), not_k(0), auxI8);
  AND_5E_9: AND_5E_1B_1S port map(i(9),     k(3), not_k(2), not_k(1),     k(0), auxI9);
  AND_5E_10: AND_5E_1B_1S port map(i(10),   k(3), not_k(2),     k(1), not_k(0), auxI10);
  AND_5E_11: AND_5E_1B_1S port map(i(11),   k(3), not_k(2),     k(1),     k(0), auxI11);
  AND_5E_12: AND_5E_1B_1S port map(i(12),   k(3),     k(2), not_k(1), not_k(0), auxI12);
  AND_5E_13: AND_5E_1B_1S port map(i(13),   k(3),     k(2), not_k(1),     k(0), auxI13);
  AND_5E_14: AND_5E_1B_1S port map(i(14),   k(3),     k(2),     k(1), not_k(0), auxI14);
  AND_5E_15: AND_5E_1B_1S port map(i(15),   k(3),     k(2),     k(1),     k(0), auxI15);
  
  auxOR_16E <= auxI0 & auxI1 & auxI2 & auxI3 & auxI4 & auxI5 & auxI6 & auxI7 & auxI8 
             & auxI9 & auxI10 & auxI11 & auxI12 & auxI13 & auxI14 & auxI15;
  OR_16E_0: OR_16E_1B_1S port map(auxOR_16E, o);
end Structure;
  
