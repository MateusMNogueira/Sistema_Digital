library ieee;
use ieee.std_logic_1164.all;


entity proximo_estado_bcd is

  port( q_atual     : in  std_logic_vector(11 downto 0); 
        step        : in  std_logic_vector(3 downto 0);  
        up_dw       : in  std_logic;                     -- '1' para crescente, '0' para decrescente
        val_min     : in  std_logic_vector(11 downto 0);
        val_max     : in  std_logic_vector(11 downto 0);
        prox_estado : out std_logic_vector(11 downto 0)  
  );

end proximo_estado_bcd;

architecture CKT of proximo_estado_bcd is

  component somador_bcd
    
    port( a_bcd     : in  std_logic_vector(11 downto 0);
          b_bcd     : in  std_logic_vector(11 downto 0);
          carry_in  : in  std_logic;
          carry_out : out std_logic;
          s_bcd     : out std_logic_vector(11 downto 0)
    );

  end component;

  component subtrator_BCD
    
    port( a_subBCD      : in  std_logic_vector(11 downto 0);
          b_subBCD      : in  std_logic_vector(11 downto 0);
          carry_in_sub  : in  std_logic;
          carry_out_sub : out std_logic;
          s_subbcd      : out std_logic_vector(11 downto 0)
    );
  
  end component;

  component comparator_bcd
    
    port( A_Cen : in  std_logic_vector(3 downto 0);
          B_Cen : in  std_logic_vector(3 downto 0);
          A_Dez : in  std_logic_vector(3 downto 0);
          B_Dez : in  std_logic_vector(3 downto 0);
          A_Uni : in  std_logic_vector(3 downto 0);
          B_Uni : in  std_logic_vector(3 downto 0);
          AgtB  : out std_logic;
          AltB  : out std_logic;
          AeqB  : out std_logic
    );
  
  end component;
  
  component mux_2x1_12bits
    
    port( entrada        : in  std_logic_vector(11 downto 0);
          Q_realimentado : in  std_logic_vector(11 downto 0);
          key            : in  std_logic;
          saida          : out std_logic_vector(11 downto 0)
    );
  
  end component;


signal step_12bits    : std_logic_vector(11 downto 0);
signal soma_out       : std_logic_vector(11 downto 0);
signal sub_out        : std_logic_vector(11 downto 0);
signal carry_soma     : std_logic;   -- '1' se q + step passou de 999
signal carry_sub      : std_logic;   -- '0' se q - step ficou negativo
signal soma_gt_max    : std_logic;   -- '1' se q + step > maximo
signal sub_lt_min     : std_logic;   -- '1' se q - step < minimo
signal estouro_up     : std_logic;
signal estouro_dw     : std_logic;
signal cand_up        : std_logic_vector(11 downto 0);  
signal cand_dw        : std_logic_vector(11 downto 0);  

begin
                                        
    step_12bits <= "00000000" & step;  -- centenas e dezenas recebem '0000' , unidades recebem o valor de step;
    
    -- Crescente
    SOMA: somador_bcd port map(a_bcd => q_atual, b_bcd => step_12bits, carry_in => '0', carry_out => carry_soma, s_bcd => soma_out);

    -- Decrescente
    SUB: subtrator_BCD port map(a_subBCD => q_atual, b_subBCD => step_12bits, carry_in_sub => '1', carry_out_sub => carry_sub, s_subbcd => sub_out);
    
    
    CMP_UP: comparator_bcd port map(
        A_Cen => soma_out(11 downto 8), B_Cen => val_max(11 downto 8),
        A_Dez => soma_out(7 downto 4),  B_Dez => val_max(7 downto 4),
        A_Uni => soma_out(3 downto 0),  B_Uni => val_max(3 downto 0),
        AgtB  => soma_gt_max, AltB => open, AeqB => open
    );

    
    CMP_DW: comparator_bcd port map(
        A_Cen => sub_out(11 downto 8), B_Cen => val_min(11 downto 8),
        A_Dez => sub_out(7 downto 4),  B_Dez => val_min(7 downto 4),
        A_Uni => sub_out(3 downto 0),  B_Uni => val_min(3 downto 0),
        AgtB  => open, AltB => sub_lt_min, AeqB => open
    );

    estouro_up <= carry_soma or soma_gt_max;
    estouro_dw <= (not carry_sub) or sub_lt_min;

    -- Se estourou, volta para o outro limite; senao usa o resultado da soma/subtracao
    MUX_UP: mux_2x1_12bits port map(entrada => val_min, Q_realimentado => soma_out, key => estouro_up, saida => cand_up);
    MUX_DW: mux_2x1_12bits port map(entrada => val_max, Q_realimentado => sub_out,  key => estouro_dw, saida => cand_dw);

    --(up_dw = '1' -> crescente)
    MUX_DIR: mux_2x1_12bits port map(entrada => cand_up, Q_realimentado => cand_dw, key => up_dw, saida => prox_estado);
   
end CKT;