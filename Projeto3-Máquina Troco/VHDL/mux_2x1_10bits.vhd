library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_10bits is
  
  port ( I0, I1 : in  std_logic_vector(9 downto 0);
         Sel    : in  std_logic;
         D      : out std_logic_vector(9 downto 0)
  );
  
end mux_2x1_10bits;

architecture CKT of mux_2x1_10bits is 

  begin
      
    D(0) <= (not(Sel) and I0(0)) or (Sel and I1(0));
    D(1) <= (not(Sel) and I0(1)) or (Sel and I1(1));
    D(2) <= (not(Sel) and I0(2)) or (Sel and I1(2));
    D(3) <= (not(Sel) and I0(3)) or (Sel and I1(3));
    D(4) <= (not(Sel) and I0(4)) or (Sel and I1(4));
    D(5) <= (not(Sel) and I0(5)) or (Sel and I1(5));
    D(6) <= (not(Sel) and I0(6)) or (Sel and I1(6));
    D(7) <= (not(Sel) and I0(7)) or (Sel and I1(7));
    D(8) <= (not(Sel) and I0(8)) or (Sel and I1(8));
    D(9) <= (not(Sel) and I0(9)) or (Sel and I1(9));
    
end CKT;
    
    

