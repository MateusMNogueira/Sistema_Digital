library ieee;
use ieee.std_logic_1164.all;

entity somador_bcd is

  port( a_bcd: in std_logic_vector(11 downto 0);
        b_bcd: in std_logic_vector(11 downto 0);
        carry_in: in std_logic;
        carry_out: out std_logic;
        s_bcd: out std_logic_vector(11 downto 0)
  );

end somador_bcd;

architecture ckt of somador_bcd is

  component sum_1_D 
    
    port( a_sum_1_D: in std_logic_vector(3 downto 0);
          b_sum_1_D: in std_logic_vector(3 downto 0);
          carry_in_sum_1_D: in std_logic;
          carry_out_sum_1_D: out std_logic;
          saida_sum_1_D: out std_logic_vector(3 downto 0)
    );

end component;

signal carry: std_logic_vector(1 downto 0);-- Se 0 vai para Unidades; Se 1 vai para Centenas

begin
  
--Unidades
U0: sum_1_D port map( 
a_sum_1_D         => a_bcd( 3 downto 0),
b_sum_1_D         => b_bcd (3 downto 0),
carry_in_sum_1_D  => carry_in,
saida_sum_1_D     => s_bcd(3 downto 0), 
carry_out_sum_1_D => carry(0)
);
--Dezenas
U1: sum_1_D port map( a_sum_1_D => a_bcd( 7 downto 4),
b_sum_1_D         => b_bcd (7 downto 4), 
carry_in_sum_1_D  => carry(0), 
saida_sum_1_D     => s_bcd(7 downto 4),
carry_out_sum_1_D => carry(1)
);
--Centenas
U2: sum_1_D port map( a_sum_1_D => a_bcd( 11 downto 8), 
b_sum_1_D         => b_bcd (11 downto 8),
carry_in_sum_1_D  => carry(1),
saida_sum_1_D     => s_bcd(11 downto 8),
carry_out_sum_1_D => carry_out);

end ckt;