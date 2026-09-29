library ieee;
use ieee.std_logic_1164.all;

entity registrador_minimo_12bits is 
  
  port ( entrada: in  std_logic_vector(11 downto 0);
         key:     in  std_logic;
         clr:     in  std_logic;
         clk:     in  std_logic;
         Q:       out std_logic_vector(11 downto 0)
  );

end registrador_minimo_12bits;

architecture CKT of registrador_minimo_12bits is
  
  component mux_2x1_1bit is
    
    port ( entrada:        in  std_logic;
           Q_realimentado: in  std_logic;
           key:            in  std_logic; --SignalR
           saida:          out std_logic
  );
  
  end component;
  
  component ffd is
  
    port ( ck:  in  std_logic;
           clr: in  std_logic;
           set: in  std_logic;
           d:   in  std_logic;
           q:   out std_logic
    );
    
  end component;
  
  
  signal mux_to_ffd: std_logic_vector(11 downto 0);
  signal saida_ffd:  std_logic_vector(11 downto 0);

  
begin
  
  
  mux_0: mux_2x1_1bit port map ( entrada(0), saida_ffd(0), key, mux_to_ffd(0) );
  ffd_0: ffd          port map ( clk, clr, '1', mux_to_ffd(0), saida_ffd(0) );
  
  mux_1: mux_2x1_1bit port map ( entrada(1), saida_ffd(1), key, mux_to_ffd(1) );
  ffd_1: ffd          port map ( clk, clr, '1', mux_to_ffd(1), saida_ffd(1) );
    
  mux_2: mux_2x1_1bit port map ( entrada(2), saida_ffd(2), key, mux_to_ffd(2) );
  ffd_2: ffd          port map ( clk, clr, '1', mux_to_ffd(2), saida_ffd(2) );
    
  mux_3: mux_2x1_1bit port map ( entrada(3), saida_ffd(3), key, mux_to_ffd(3) );
  ffd_3: ffd          port map ( clk, clr, '1', mux_to_ffd(3), saida_ffd(3) );
    
  mux_4: mux_2x1_1bit port map ( entrada(4), saida_ffd(4), key, mux_to_ffd(4) );
  ffd_4: ffd          port map ( clk, clr, '1', mux_to_ffd(4), saida_ffd(4) );
    
  mux_5: mux_2x1_1bit port map ( entrada(5), saida_ffd(5), key, mux_to_ffd(5) );
  ffd_5: ffd          port map ( clk, clr, '1', mux_to_ffd(5), saida_ffd(5) );
    
  mux_6: mux_2x1_1bit port map ( entrada(6), saida_ffd(6), key, mux_to_ffd(6) );
  ffd_6: ffd          port map ( clk, clr, '1', mux_to_ffd(6), saida_ffd(6) );
    
  mux_7: mux_2x1_1bit port map ( entrada(7), saida_ffd(7), key, mux_to_ffd(7) );
  ffd_7: ffd          port map ( clk, clr, '1', mux_to_ffd(7), saida_ffd(7) );
    
  mux_8: mux_2x1_1bit port map ( entrada(8), saida_ffd(8), key, mux_to_ffd(8) );
  ffd_8: ffd          port map ( clk, clr, '1', mux_to_ffd(8), saida_ffd(8) );
    
  mux_9: mux_2x1_1bit port map ( entrada(9), saida_ffd(9), key, mux_to_ffd(9) );
  ffd_9: ffd          port map ( clk, clr, '1', mux_to_ffd(9), saida_ffd(9) );
    
  mux_10: mux_2x1_1bit port map ( entrada(10), saida_ffd(10), key, mux_to_ffd(10) );
  ffd_10: ffd          port map ( clk, clr, '1', mux_to_ffd(10), saida_ffd(10) );
  
  mux_11: mux_2x1_1bit port map ( entrada(11), saida_ffd(11), key, mux_to_ffd(11) );
  ffd_11: ffd          port map ( clk, clr, '1', mux_to_ffd(11), saida_ffd(11) );
    
  Q <= saida_ffd;
  
end CKT;
    

