library ieee;
use ieee.std_logic_1164.all;

entity somador_4bits is

  port( a_4: in std_logic_vector (3 downto 0);
        b_4: in std_logic_vector (3 downto 0);
        carry_in4: in std_logic;
        carry_out4: out std_logic;
        saida_4: out std_logic_vector (3 downto 0)
  );

end somador_4bits;

architecture ckt of somador_4bits is
  
  component somador_2bits
    
    port( a_2bits: in std_logic;
          b_2bits: in std_logic;
          carry_in2: in std_logic;
          carry_out2: out std_logic;
          saida_2bits: out std_logic
    );

end component;

signal carry: std_logic_vector(2 downto 0);

begin

U0: somador_2bits port map( a_2bits => a_4(0), b_2bits => b_4(0), carry_in2 => carry_in4, saida_2bits => saida_4(0), carry_out2 => carry(0));  
U1: somador_2bits port map( a_2bits => a_4(1), b_2bits => b_4(1), carry_in2 => carry(0), saida_2bits => saida_4(1), carry_out2 => carry(1));
U2: somador_2bits port map( a_2bits => a_4(2), b_2bits => b_4(2), carry_in2 => carry(1), saida_2bits => saida_4(2), carry_out2 => carry(2));
U3: somador_2bits port map( a_2bits => a_4(3), b_2bits => b_4(3), carry_in2 => carry(2), saida_2bits => saida_4(3), carry_out2 => carry_out4);

end ckt;
