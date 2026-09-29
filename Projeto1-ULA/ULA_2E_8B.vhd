library ieee;
use ieee.std_logic_1164.all;

entity ULA_2E_8B is
  port (A, B: in std_logic_vector(7 downto 0);
        Key: in std_logic_vector(3 downto 0);
        C, Z: out std_logic;
        S: out std_logic_vector(7 downto 0)
  );
end ULA_2E_8B;

architecture Structure of ULA_2E_8B is
  component somador8bits
    port(
      A: in std_logic_vector(7 downto 0);
      B: in std_logic_vector(7 downto 0);
      Cin: in std_logic;
      Cout: out std_logic;
      S: out std_logic_vector(7 downto 0)
    );
  end component;
  component subtrator8bits 
    port(
      A: in std_logic_vector(7 downto 0);
      B: in std_logic_vector(7 downto 0);
      Cout: out std_logic;
      S: out std_logic_vector(7 downto 0) 
    );
  end component;
  component multiplicador_8bits
    port(
      A:in std_logic_vector(7 downto 0);
      B: in std_logic_vector(7 downto 0);
      saida: out std_logic_vector(7 downto 0);
      Carry_out: out std_logic
    );
  end component;
  component incrementador 
    port(
      A: in std_logic_vector(7 downto 0);
      Cout: out std_logic;
      S: out std_logic_vector(7 downto 0)
    );
  end component;
  component decrementador 
    port(
      A: in std_logic_vector(7 downto 0);
      Cout: out std_logic;
      S: out std_logic_vector(7 downto 0)
    );
  end component;
  component Deslocador_Barrel_a_Esquerda_1E_8B 
    port (a: in std_logic_vector(7 downto 0);
          D4: in std_logic;
          D2: in std_logic;
          D1: in std_logic;
          s: out std_logic_vector(7 downto 0);
          c: out std_logic
    );
  end component;
  component Deslocador_Barrel_a_Direita_1E_8B
    port (a: in std_logic_vector(7 downto 0);
          D4: in std_logic;
          D2: in std_logic;
          D1: in std_logic;
          s: out std_logic_vector(7 downto 0)
    );
  end component;
  component SWP
    port (
        A: in std_logic_vector(7 downto 0);
        S: out std_logic_vector(7 downto 0)
    ); 
  end component;
  component SWA
    port (
        A: in std_logic_vector(7 downto 0);
        S: out std_logic_vector(7 downto 0)
    );
  end component;
  component AND8
    port (
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        S : out std_logic_vector(7 downto 0)
    );
  end component;
  component OR8
    port (
        A: in std_logic_vector(7 downto 0);
        B: in std_logic_vector(7 downto 0);
        S: out std_logic_vector(7 downto 0)
    );
  end component;
  component XOR8
    port (
        A: in std_logic_vector(7 downto 0);
        B: in std_logic_vector(7 downto 0);
        S: out std_logic_vector(7 downto 0)
    );
  end component;
  component NOT8 
    port (
        A : in std_logic_vector(7 downto 0);
        S : out std_logic_vector(7 downto 0)
    );
  end component;
  component Multiplexador_16E_8B 
    port (E15, E14, E13, E12, E11, E10, E9, E8, E7, E6, E5, E4, E3, E2, E1, E0: in std_logic_vector(7 downto 0);
          k: in std_logic_vector(3 downto 0);
          s: out std_logic_vector(7 downto 0)
    );
  end component;
  component Multiplexador_16E_1B 
    port (i: in std_logic_vector(15 downto 0);
          k: in std_logic_vector(3 downto 0);
          o: out std_logic
    );
  end component;
  component NOR_8E_1B_1S 
    port (a: in std_logic_vector(7 downto 0);
          s: out std_logic
    );
  end component;
  signal auxF1, auxF2, auxF3, auxF4, auxF5, auxF8, auxF9, auxF10, auxF11, auxF12, 
         auxF13, auxF14, auxF15, auxFX, auxMuxS: std_logic_vector(7 downto 0);
  signal auxCo1,auxCo2, auxCo3, auxCo4, auxCo5, auxCo8: std_logic; 
  signal auxMuxC: std_logic_vector(15 downto 0);  
begin
  F1: somador8bits port map (A, B, '0', auxCo1, auxF1);
  F2: subtrator8bits port map (A, B, auxCo2, auxF2);
  F3: multiplicador_8bits port map (A, B, auxF3, auxCo3);
  F4: incrementador  port map (A, auxCo4, auxF4);
  F5: decrementador port map (A, auxCo5, auxF5);
  F8: Deslocador_Barrel_a_Esquerda_1E_8B port map (A, B(2), B(1), B(0), auxF8, auxCo8);
  F9: Deslocador_Barrel_a_Direita_1E_8B port map (A, B(2), B(1), B(0), auxF9);
  F10: SWP port map (A, auxF10);
  F11: SWA port map (A, auxF11);
  F12: AND8 port map (A, B, auxF12);
  F13: OR8 port map (A, B, auxF13);
  F14: XOR8 port map (A, B, auxF14);
  F15: NOT8 port map (A, auxF15);
    
  auxFX <= "00000000";
  
  Saida: Multiplexador_16E_8B 
    port map (auxF15, auxF14, auxF13, auxF12, auxF11, auxF10, auxF9, auxF8,
     auxFX, auxFX, auxF5, auxF4, auxF3, auxF2, auxF1, auxFX, Key, auxMuxS);
  
  auxMuxC <= "0000000" & auxCo8 & "00" & auxCo5 & auxCo4 & auxCo3 & auxCo2 & auxCo1 & '0'; 
  Carry: Multiplexador_16E_1B port map (auxMuxC, Key, C);
    
  Zero: NOR_8E_1B_1S port map (auxMuxS, Z);

  S <= auxMuxS;
end Structure;
