library ieee;
use ieee.std_logic_1164.all;

entity somador_2bits is

  port( a_2bits: in std_logic;
        b_2bits: in std_logic;
        carry_in2: in std_logic;
        saida_2bits: out std_logic;
        carry_out2: out std_logic
  );

end somador_2bits;

architecture ckt of somador_2bits is

begin
  
  saida_2bits <= ((a_2bits xor b_2bits) xor carry_in2);
  carry_out2 <= ((a_2bits and b_2bits) or (a_2bits and carry_in2) or (b_2bits and carry_in2));

end ckt; 

