library ieee;
use ieee.std_logic_1164.all;

entity contador_inteligente is
    
    port( CLOCK_27: in  std_logic;                     
          KEY:      in  std_logic_vector(2 downto 0);   
          SW:       in  std_logic_vector(17 downto 0);  
          HEX2     : out std_logic_vector(6 downto 0);   
          HEX1     : out std_logic_vector(6 downto 0);   
          HEX0     : out std_logic_vector(6 downto 0);   
          LEDR     : out std_logic_vector(1 downto 0)    
    );

end entity contador_inteligente;

architecture CKT of contador_inteligente is

    component ck_div is
        
        port ( ck_in :  in std_logic; 
               ck_out : out std_logic 
        );
    
    end component;

    component gerador_de_keys is
        
      port ( load     : in  std_logic;
             mx_mi    : in  std_logic;
             step     : in  std_logic;
             set_max  : out std_logic;
             set_min  : out std_logic;
             set_step : out std_logic
        );
    
    end component;

    component registrador_maximo_12bits is
      
      port ( entrada: in  std_logic_vector(11 downto 0);
             key:     in  std_logic;
             clr:     in  std_logic;
             clk:     in  std_logic;
             Q:       out std_logic_vector(11 downto 0)
      );

    end component;
    
    component registrador_minimo_12bits is
      
      port ( entrada: in  std_logic_vector(11 downto 0);
             key:     in  std_logic;
             clr:     in  std_logic;
             clk:     in  std_logic;
             Q:       out std_logic_vector(11 downto 0)
      );
  
    end component;
    
    component registrador_passo_4bits is
      
      port ( entrada: in  std_logic_vector(3 downto 0);
             key:     in  std_logic;
             clr:     in  std_logic;
             clk:     in  std_logic;
             Q:       out std_logic_vector(3 downto 0)
      );
    
    end component;
    
    component registrador_contagem_12bits is
      
       port( ck:    in  std_logic;                    
             clr:   in  std_logic;                     
             ce:    in  std_logic;                     
             d_in:  in  std_logic_vector(11 downto 0); 
             q_out: out std_logic_vector(11 downto 0) 
      );
    
    end component;    
    
    component proximo_estado_bcd is
      
      port ( q_atual     : in  std_logic_vector(11 downto 0); 
             step        : in  std_logic_vector(3 downto 0);  
             up_dw       : in  std_logic;
             val_min     : in std_logic_vector(11 downto 0);
             val_max     : in std_logic_vector(11 downto 0);                    
             prox_estado : out std_logic_vector(11 downto 0)  
      );
    
    end component;
    
    component comparator_max_min is
      
      port ( A      : in  std_logic_vector(11 downto 0);  -- valor atual da contagem
             Min    : in  std_logic_vector(11 downto 0);  
             Max    : in  std_logic_vector(11 downto 0);  
             AgtMin : out std_logic;   
             AltMin : out std_logic;   
             AeqMin : out std_logic;   
             AgtMax : out std_logic;   
             AltMax : out std_logic;   
             AeqMax : out std_logic    
      );
      
    end component;
    
    component decodificador_7segmentos is
      
      port ( BCD : in std_logic_vector(3 downto 0);
             HEX : out std_logic_vector(6 downto 0)
      );
      
    end component; 
    
    
  
    signal clk_1hz       : std_logic;
    signal s_set_max     : std_logic;
    signal s_set_min     : std_logic;
    signal s_set_step    : std_logic;
    
    signal val_max       : std_logic_vector(11 downto 0);
    signal val_min       : std_logic_vector(11 downto 0);
    signal val_step      : std_logic_vector(3 downto 0);
    
    signal q_atual       : std_logic_vector(11 downto 0);
    signal prox_estado   : std_logic_vector(11 downto 0);
    
    signal limit_min_eq  : std_logic;
    signal limit_max_eq  : std_logic;


begin


    DIVISOR: ck_div port map ( ck_in => CLOCK_27, ck_out => clk_1hz );
    
    LEDR(0) <= clk_1hz; 

    KEYS: gerador_de_keys port map (
        
        load     => KEY(1),
        mx_mi    => SW(16),
        step     => KEY(2),
        set_max  => s_set_max,
        set_min  => s_set_min,
        set_step => s_set_step
    );

   
    REGISTRADOR_MAX: registrador_maximo_12bits port map (
        
        clk   => clk_1hz,
        clr   => KEY(0),
        key   => s_set_max,
        entrada  => SW(11 downto 0),
        Q => val_max
    
    );

    REGISTRADOR_MIN: registrador_minimo_12bits port map (
        
        clk   => clk_1hz,
        clr   => KEY(0),
        key   => s_set_min,
        entrada  => SW(11 downto 0),
        Q => val_min
    
    );

    REGISTRADOR_STEP: registrador_passo_4bits port map (
        
        clk   => clk_1hz,
        clr   => KEY(0),
        key   => s_set_step,
        entrada  => SW(3 downto 0),   
        Q => val_step
    
    );

    ARITMETICA: proximo_estado_bcd port map (
        
        q_atual     => q_atual,
        step        => val_step,
        up_dw       => SW(17),
        val_min     => val_min,
        val_max     => val_max,
        prox_estado => prox_estado
    
    );

    
    REGISTRADOR_CONTAGEM: registrador_contagem_12bits port map (
        
        ck    => clk_1hz,
        clr   => KEY(0),
        ce    => '1',             
        d_in  => prox_estado,
        q_out => q_atual
    
    );


    COMPARADOR: comparator_max_min port map (
        
        A      => q_atual,
        Min    => val_min,
        Max    => val_max,
        AgtMin => open, AltMin => open, AeqMin => limit_min_eq,
        AgtMax => open, AltMax => open, AeqMax => limit_max_eq
    
    );

   
    LEDR(1) <= limit_max_eq or limit_min_eq;

    DISPLAY_CEN: decodificador_7segmentos port map (BCD => q_atual(11 downto 8), HEX => HEX2);
    DISPLAY_DEZ: decodificador_7segmentos port map (BCD => q_atual(7 downto 4),  HEX => HEX1);
    DISPLAY_UNI: decodificador_7segmentos port map (BCD => q_atual(3 downto 0),  HEX => HEX0);

end architecture CKT;
