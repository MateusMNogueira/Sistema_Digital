library ieee;
use ieee.std_logic_1164.all;

entity subtrator_BCD is

  port( a_subBCD      : in  std_logic_vector(11 downto 0);
        b_subBCD      : in  std_logic_vector(11 downto 0);
        carry_in_sub  : in  std_logic;                    -- Reservado/Inutilizado se usar carry_in fixo em '1'
        carry_out_sub : out std_logic;                    -- '1' se resultado positivo (ou 0), '0' se negativo
        s_subbcd      : out std_logic_vector(11 downto 0) 
  );

end subtrator_BCD;

architecture ckt of subtrator_BCD is

  component somador_bcd is
    
    port( a_bcd : in  std_logic_vector(11 downto 0);
          b_bcd : in  std_logic_vector(11 downto 0);
          carry_in : in  std_logic;
          carry_out : out std_logic;
          s_bcd: out std_logic_vector(11 downto 0)
    );

end component;

  component complemento_9 is

      port( a : in  std_logic_vector(3 downto 0);
            b : out std_logic_vector(3 downto 0)
      );

end component;

signal aux1 : std_logic_vector(11 downto 0); -- Guarda o complemento de 9 de B

begin

-- 1. Obtenção do Complemento de 9 por dígito BCD (entradas corrigidas para b_subBCD)
U0: complemento_9 port map(a => b_subBCD(3 downto 0),  b => aux1(3 downto 0));
U1: complemento_9 port map(a => b_subBCD(7 downto 4),  b => aux1(7 downto 4));
U2: complemento_9 port map(a => b_subBCD(11 downto 8), b => aux1(11 downto 8));

-- 2. Soma BCD: A + Compl9(B) + 1 (via carry_in = '1') = A + Complemento de 10(B)
U3: somador_bcd port map( a_bcd => a_subBCD, b_bcd => aux1, carry_in => '1', carry_out => carry_out_sub, s_bcd=> s_subbcd);   -- O '1' transforma o complemento de 9 em complemento de 10
                                                                       
end ckt;
