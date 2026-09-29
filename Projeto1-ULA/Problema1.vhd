library ieee;
use ieee.std_logic_1164.all;

entity Problema1 is
  port(SW: in std_logic_vector(15 downto 0);
       Key: in std_logic_vector(3 downto 0);
       C, Z, c_a, c_b, c_c, c_d, c_e, c_f, c_g,
       d_a, d_b, d_c, d_d, d_e, d_f, d_g,
       u_a, u_b, u_c, u_d, u_e, u_f, u_g: out std_logic
  );
end Problema1;

architecture Structure of Problema1 is
  component ULA_2E_8B 
    port (A, B: in std_logic_vector(7 downto 0);
          Key: in std_logic_vector(3 downto 0);
          C, Z: out std_logic;
          S: out std_logic_vector(7 downto 0)
    );
  end component;
  component BIN_BCD_8B 
    port (a: in std_logic_vector(7 downto 0);
          c: out std_logic_vector(3 downto 0);
          d: out std_logic_vector(3 downto 0);
          u: out std_logic_vector(3 downto 0)
    );
  end component;
  component BCD_to_Display_7Seg  
    port (w,x,y,z: in std_logic;
          a,b,c,d,e,f,g: out std_logic
    );
  end component;
  signal auxA, auxB, auxSaidaULA: std_logic_vector(7 downto 0);
  signal bcdC, bcdD, bcdU: std_logic_vector(3 downto 0);
begin
  auxA <= SW(15 downto 8);
  auxB <= SW(7 downto 0);
  ULA: ULA_2E_8B port map (auxA, auxB, Key, C, Z, auxSaidaULA);
    
  BIN_BCD: BIN_BCD_8B port map (auxSaidaULA, bcdC, bcdD, bcdU);
    
  Display_Centena: BCD_to_Display_7Seg 
    port map (bcdC(3), bcdC(2), bcdC(1), bcdC(0),
              c_a, c_b, c_c, c_d, c_e, c_f, c_g);
  Display_Dezena: BCD_to_Display_7Seg 
    port map (bcdD(3), bcdD(2), bcdD(1), bcdD(0),
              d_a, d_b, d_c, d_d, d_e, d_f, d_g);
  Display_Unidade: BCD_to_Display_7Seg 
    port map (bcdU(3), bcdU(2), bcdU(1), bcdU(0),
              u_a, u_b, u_c, u_d, u_e, u_f, u_g);
end Structure;
  