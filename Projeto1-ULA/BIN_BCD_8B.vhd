library ieee;
use ieee.std_logic_1164.all;

entity BIN_BCD_8B is
  port (a: in std_logic_vector(7 downto 0);
        c: out std_logic_vector(3 downto 0);
        d: out std_logic_vector(3 downto 0);
        u: out std_logic_vector(3 downto 0)
  );
end BIN_BCD_8B;

architecture Structure of BIN_BCD_8B is
  component Add_3 is
    port(a: in std_logic_vector(3 downto 0);
         s: out std_logic_vector(3 downto 0)
    ); 
  end component;
  signal auxU0, auxU1, auxU2, auxU3, auxU4, auxU5, auxU6, auxD0, auxD1, auxD2, auxD3, 
         auxC0, auxAddU0, auxAddU1, auxAddU2, auxAddU3, auxAddU4, auxAddU5, auxAddU6,
         auxAddD0, auxAddD1, auxAddD2, auxAddD3, auxAddC0: std_logic_vector(3 downto 0);
begin
  auxU0 <= '0' & '0' & '0' & a(7);
  Add_3_U0: Add_3 port map (auxU0, auxAddU0);
  
  auxU1 <= auxAddU0(2) & auxAddU0(1) & auxAddU0(0) & a(6);
  Add_3_U1: Add_3 port map (auxU1, auxAddU1);
    
  auxU2 <= auxAddU1(2) & auxAddU1(1) & auxAddU1(0) & a(5);
  Add_3_U2: Add_3 port map (auxU2, auxAddU2);
  
  auxD0 <= '0' & auxAddU0(3) & auxAddU1(3) & auxAddU2(3);
  Add_3_D0: Add_3 port map (auxD0, auxAddD0);
  auxU3 <= auxAddU2(2) & auxAddU2(1) & auxAddU2(0) & a(4);
  Add_3_U3: Add_3 port map (auxU3, auxAddU3);
    
  auxD1 <= auxAddD0(2) & auxAddD0(1) & auxAddD0(0) & auxAddU3(3);
  Add_3_D1: Add_3 port map (auxD1, auxAddD1);
  auxU4 <= auxAddU3(2) & auxAddU3(1) & auxAddU3(0) & a(3);
  Add_3_U4: Add_3 port map (auxU4, auxAddU4);
  
  auxD2 <= auxAddD1(2) & auxAddD1(1) & auxAddD1(0) & auxAddU4(3);
  Add_3_D2: Add_3 port map (auxD2, auxAddD2);
  auxU5 <= auxAddU4(2) & auxAddU4(1) & auxAddU4(0) & a(2);
  Add_3_U5: Add_3 port map (auxU5, auxAddU5);
    
  auxC0 <= '0' & auxAddD0(3) & auxAddD1(3) & auxAddD2(3);
  Add_3_C0: Add_3 port map (auxC0, auxAddC0);
  auxD3 <= auxAddD2(2) & auxAddD2(1) & auxAddD2(0) & auxAddU5(3);
  Add_3_D3: Add_3 port map (auxD3, auxAddD3);
  auxU6 <= auxAddU5(2) & auxAddU5(1) & auxAddU5(0) & a(1);
  Add_3_U6: Add_3 port map (auxU6, auxAddU6);
    
  c <= auxAddC0(2) & auxAddC0(1) & auxAddC0(0) & auxAddD3(3);
  d <= auxAddD3(2) & auxAddD3(1) & auxAddD3(0) & auxAddU6(3);
  u <= auxAddU6(2) & auxAddU6(1) & auxAddU6(0) & a(0);
end Structure;
        
