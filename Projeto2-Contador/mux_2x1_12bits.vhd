library ieee;
use ieee.std_logic_1164.all;


entity mux_2x1_12bits is

  port ( entrada:        in  std_logic_vector(11 downto 0);
         Q_realimentado: in  std_logic_vector(11 downto 0);
         key:            in  std_logic;
         saida:          out std_logic_vector(11 downto 0)
  );

end mux_2x1_12bits;

architecture CKT of mux_2x1_12bits is

  component mux_2x1_1bit is

    port ( entrada:        in  std_logic;
           Q_realimentado: in  std_logic;
           key:            in  std_logic;
           saida:          out std_logic
    );

  end component;

begin

  mux_0: mux_2x1_1bit port map ( entrada => entrada(0), Q_realimentado => Q_realimentado(0), key => key, saida => saida(0) );
  mux_1: mux_2x1_1bit port map ( entrada => entrada(1), Q_realimentado => Q_realimentado(1), key => key, saida => saida(1) );
  mux_2: mux_2x1_1bit port map ( entrada => entrada(2), Q_realimentado => Q_realimentado(2), key => key, saida => saida(2) );
  mux_3: mux_2x1_1bit port map ( entrada => entrada(3), Q_realimentado => Q_realimentado(3), key => key, saida => saida(3) );
  mux_4: mux_2x1_1bit port map ( entrada => entrada(4), Q_realimentado => Q_realimentado(4), key => key, saida => saida(4) );
  mux_5: mux_2x1_1bit port map ( entrada => entrada(5), Q_realimentado => Q_realimentado(5), key => key, saida => saida(5) );
  mux_6: mux_2x1_1bit port map ( entrada => entrada(6), Q_realimentado => Q_realimentado(6), key => key, saida => saida(6) );
  mux_7: mux_2x1_1bit port map ( entrada => entrada(7), Q_realimentado => Q_realimentado(7), key => key, saida => saida(7) );
  mux_8: mux_2x1_1bit port map ( entrada => entrada(8), Q_realimentado => Q_realimentado(8), key => key, saida => saida(8) );
  mux_9: mux_2x1_1bit port map ( entrada => entrada(9), Q_realimentado => Q_realimentado(9), key => key, saida => saida(9) );
  mux_10: mux_2x1_1bit port map ( entrada => entrada(10), Q_realimentado => Q_realimentado(10), key => key, saida => saida(10) );
  mux_11: mux_2x1_1bit port map ( entrada => entrada(11), Q_realimentado => Q_realimentado(11), key => key, saida => saida(11) );

end CKT;