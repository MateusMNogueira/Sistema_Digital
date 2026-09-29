library ieee;
use ieee.std_logic_1164.all;

entity Deslocador_Barrel_a_Esquerda_1E_8B is
  port (a: in std_logic_vector(7 downto 0);
        D4: in std_logic;
        D2: in std_logic;
        D1: in std_logic;
        s: out std_logic_vector(7 downto 0);
        c: out std_logic
  );
end Deslocador_Barrel_a_Esquerda_1E_8B;

architecture Structure of Deslocador_Barrel_a_Esquerda_1E_8B is
  component Deslocador_a_Esquerda_4D_1E_8B
    port ( a: in std_logic_vector(7 downto 0);
           sh, into: in std_logic; 
           s: out std_logic_vector(7 downto 0)
    );
  end component;
  component Deslocador_a_Esquerda_2D_1E_8B
    port ( a: in std_logic_vector(7 downto 0);
           sh, into: in std_logic; 
           s: out std_logic_vector(7 downto 0)
    );
  end component;
  component Deslocador_a_Esquerda_1D_1E_8B_Cmsb 
    port ( a: in std_logic_vector(7 downto 0);
           sh, into: in std_logic; 
           s: out std_logic_vector(7 downto 0);
           cmsb: out std_logic 
    );
  end component;
  signal aux0, aux1: std_logic_vector(7 downto 0);
begin
  Deslocador_4D: Deslocador_a_Esquerda_4D_1E_8B
    port map (a, D4, '0', aux0);
  Deslocador_2D: Deslocador_a_Esquerda_2D_1E_8B
    port map (aux0, D2, '0', aux1);
  Deslocador_1D: Deslocador_a_Esquerda_1D_1E_8B_Cmsb
    port map (aux1, D1, '0', s, c);   
end Structure;