library ieee;
use ieee.std_logic_1164.all;

entity Deslocador_a_Direita_1D_1E_8B is
  port ( a: in std_logic_vector(7 downto 0);
         sh, into: in std_logic; 
         s: out std_logic_vector(7 downto 0)
  );
end Deslocador_a_Direita_1D_1E_8B;

architecture Structure of Deslocador_a_Direita_1D_1E_8B is
  component Multiplexador_2E_1B
    port ( i0, i1, sh: in std_logic;
           s: out std_logic
    );
  end component;
begin
  Multiplexador_2E_1B_0: Multiplexador_2E_1B
    port map (a(0), a(1), sh, s(0));
  Multiplexador_2E_1B_1: Multiplexador_2E_1B
    port map (a(1), a(2), sh, s(1));
  Multiplexador_2E_1B_2: Multiplexador_2E_1B
    port map (a(2), a(3), sh, s(2));
  Multiplexador_2E_1B_3: Multiplexador_2E_1B
    port map (a(3), a(4), sh, s(3));
  Multiplexador_2E_1B_4: Multiplexador_2E_1B
    port map (a(4), a(5), sh, s(4));
  Multiplexador_2E_1B_5: Multiplexador_2E_1B
    port map (a(5), a(6), sh, s(5));
  Multiplexador_2E_1B_6: Multiplexador_2E_1B
    port map (a(6), a(7), sh, s(6));
  Multiplexador_2E_1B_7: Multiplexador_2E_1B
    port map (a(7), into, sh, s(7));
end Structure;      
