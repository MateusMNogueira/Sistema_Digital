library ieee;
use ieee.std_logic_1164.all;

entity registrador_passo_4bits is 
  
  port ( entrada: in  std_logic_vector(3 downto 0);
         key:     in  std_logic;
         clr:     in  std_logic;
         clk:     in  std_logic;
         Q:       out std_logic_vector(3 downto 0)
  );

end registrador_passo_4bits;

architecture CKT of registrador_passo_4bits is
  
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
  
  
  signal mux_to_ffd: std_logic_vector(3 downto 0);
  signal saida_ffd:  std_logic_vector(3 downto 0);

  
begin
  
  
  mux_0: mux_2x1_1bit port map ( entrada(0), saida_ffd(0), key, mux_to_ffd(0) );
  ffd_0: ffd          port map ( clk, '1', clr, mux_to_ffd(0), saida_ffd(0) );
  
  mux_1: mux_2x1_1bit port map ( entrada(1), saida_ffd(1), key, mux_to_ffd(1) );
  ffd_1: ffd          port map ( clk, clr, '1', mux_to_ffd(1), saida_ffd(1) );
    
  mux_2: mux_2x1_1bit port map ( entrada(2), saida_ffd(2), key, mux_to_ffd(2) );
  ffd_2: ffd          port map ( clk, clr, '1', mux_to_ffd(2), saida_ffd(2) );
    
  mux_3: mux_2x1_1bit port map ( entrada(3), saida_ffd(3), key, mux_to_ffd(3) );
  ffd_3: ffd          port map ( clk, clr, '1', mux_to_ffd(3), saida_ffd(3) );
    
        
  Q <= saida_ffd;
  
end CKT;
    
