library ieee;
use ieee.std_logic_1164.all;

entity registrador_contagem_12bits is

  port( ck:    in  std_logic;                     -- Clock do sistema 
        clr:   in  std_logic;                     -- Clear assíncrono ativo em nível baixo (KEY[0])
        ce:    in  std_logic;                     -- Habilitação de contagem
        d_in:  in  std_logic_vector(11 downto 0); -- Próximo estado (vindo da lógica de somador/subtrator)
        q_out: out std_logic_vector(11 downto 0)  -- Valor atual da contagem (Q2, Q1, Q0)
  );

end registrador_contagem_12bits;

architecture CKT of registrador_contagem_12bits is

  component ffd
    
    port( ck, clr, set, d : in  std_logic;
          q               : out std_logic
    );

  end component;

  
  component mux_2x1_1bit
    
    port ( entrada:        in std_logic;
           Q_realimentado: in std_logic;
           key:            in std_logic; --SignalR
           saida:          out std_logic
    );

  end component;


signal mux_out:    std_logic_vector(11 downto 0);
signal q_interno:  std_logic_vector(11 downto 0);


begin

    q_out <= q_interno;
    
    mux_0: mux_2x1_1bit port map( entrada => d_in(0), Q_realimentado => q_interno(0), key => ce, saida => mux_out(0) ); 
    ffd_0: ffd port map( ck => ck, clr => clr, set => '1', d => mux_out(0), q => q_interno(0) );

    mux_1: mux_2x1_1bit port map( entrada => d_in(1), Q_realimentado => q_interno(1), key => ce, saida => mux_out(1) ); 
    ffd_1: ffd port map( ck => ck, clr => clr, set => '1', d => mux_out(1), q => q_interno(1) );

    mux_2: mux_2x1_1bit port map( entrada => d_in(2), Q_realimentado => q_interno(2), key => ce, saida => mux_out(2) ); 
    ffd_2: ffd port map( ck => ck, clr => clr, set => '1', d => mux_out(2), q => q_interno(2) );

    mux_3: mux_2x1_1bit port map( entrada => d_in(3), Q_realimentado => q_interno(3), key => ce, saida => mux_out(3) ); 
    ffd_3: ffd port map( ck => ck, clr => clr, set => '1', d => mux_out(3), q => q_interno(3) );

    mux_4: mux_2x1_1bit port map( entrada => d_in(4), Q_realimentado => q_interno(4), key => ce, saida => mux_out(4) ); 
    ffd_4: ffd port map( ck => ck, clr => clr, set => '1', d => mux_out(4), q => q_interno(4) );

    mux_5: mux_2x1_1bit port map( entrada => d_in(5), Q_realimentado => q_interno(5), key => ce, saida => mux_out(5) ); 
    ffd_5: ffd port map( ck => ck, clr => clr, set => '1', d => mux_out(5), q => q_interno(5) );
   
    mux_6: mux_2x1_1bit port map( entrada => d_in(6), Q_realimentado => q_interno(6), key => ce, saida => mux_out(6) );
    ffd_6: ffd port map( ck => ck, clr => clr, set => '1', d => mux_out(6), q => q_interno(6) );
    
    mux_7: mux_2x1_1bit port map( entrada => d_in(7), Q_realimentado => q_interno(7), key => ce, saida => mux_out(7) ); 
    ffd_7: ffd port map( ck => ck, clr => clr, set => '1', d => mux_out(7), q => q_interno(7) );
   
    mux_8: mux_2x1_1bit port map( entrada => d_in(8), Q_realimentado => q_interno(8), key => ce, saida => mux_out(8) ); 
    ffd_8: ffd port map( ck => ck, clr => clr, set => '1', d => mux_out(8), q => q_interno(8) );
    
    mux_9: mux_2x1_1bit port map( entrada => d_in(9), Q_realimentado => q_interno(9), key => ce, saida => mux_out(9) ); 
    ffd_9: ffd port map( ck => ck, clr => clr, set => '1', d => mux_out(9), q => q_interno(9) );

    mux_10: mux_2x1_1bit port map( entrada => d_in(10), Q_realimentado => q_interno(10), key => ce, saida => mux_out(10) ); 
    ffd_10: ffd port map( ck => ck, clr => clr, set => '1', d => mux_out(10), q => q_interno(10) );

    mux_11: mux_2x1_1bit port map( entrada => d_in(11), Q_realimentado => q_interno(11), key => ce, saida => mux_out(11) ); 
    ffd_11: ffd port map( ck => ck, clr => clr, set => '1', d => mux_out(11), q => q_interno(11) );


end CKT;
