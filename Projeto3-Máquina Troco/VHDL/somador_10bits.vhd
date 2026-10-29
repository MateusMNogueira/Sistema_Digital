library ieee; 
use ieee.std_logic_1164.all;

entity somador_10bits is 
  
  port ( A  : in std_logic_vector(9 downto 0);
       	 B  : in std_logic_vector(9 downto 0);
         Ci : in std_logic;
         S  : out std_logic_vector(9 downto 0);
         Co : out std_logic
  );

end somador_10bits;

architecture Vai_um of somador_10bits is 
  
  component somador_1bit
    port ( A, B, Ci  : in std_logic;
           S, Co     : out std_logic
    );
  
  end component;
  
  signal Carry: std_logic_vector(8 downto 0);

begin
  
  somador_1bit_0: somador_1bit
    port map (A(0), B(0), Ci, S(0), Carry(0));
      
  somador_1bit_1: somador_1bit
    port map (A(1), B(1), Carry(0), S(1), Carry(1));
      
  somador_1bit_2: somador_1bit
    port map (A(2), B(2), Carry(1), S(2), Carry(2));
      
  somador_1bit_3: somador_1bit
    port map (A(3), B(3), Carry(2), S(3), Carry(3));
      
  somador_1bit_4: somador_1bit
    port map (A(4), B(4), Carry(3), S(4), Carry(4));
      
  somador_1bit_5: somador_1bit
    port map (A(5), B(5), Carry(4), S(5), Carry(5));
      
  somador_1bit_6: somador_1bit
    port map (A(6), B(6), Carry(5), S(6), Carry(6));
      
  somador_1bit_7: somador_1bit
    port map (A(7), B(7), Carry(6), S(7), Carry(7));
      
  somador_1bit_8: somador_1bit
    port map (A(8), B(8), Carry(7), S(8), Carry(8));
      
  somador_1bit_9: somador_1bit
    port map (A(9), B(9), Carry(8), S(9), Co);
      
      
end Vai_um;

