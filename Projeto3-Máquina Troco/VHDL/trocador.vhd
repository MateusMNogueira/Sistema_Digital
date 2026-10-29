library ieee;
use ieee.std_logic_1164.all;

entity trocador is
  
  port ( Vtot          : in std_logic_vector(9 downto 0);
         M_on          : in std_logic_vector(1 to 6);
         Vtot_menos_Vm : out std_logic_vector(9 downto 0)
  );

end trocador;

architecture CKT of trocador is
  
  component mux_8x1_10bits is
    
    port ( I0, I1, I2, I3, I4, I5, I6, I7 : in  std_logic_vector(9 downto 0);
           S2, S1, S0                     : in  std_logic;
           D_out                          : out std_logic_vector(9 downto 0)
    );
  
  end component;
  
  component subtrator_10bits is
    
    port ( A  : in std_logic_vector(9 downto 0);
           B  : in std_logic_vector(9 downto 0);
           S  : out std_logic_vector(9 downto 0);
           Co : out std_logic
    );
    
  end component;

  signal S2, S1, S0 : std_logic;
  signal Vm_x       : std_logic_vector(9 downto 0);
  signal Carry_out  : std_logic;
  

begin 
  
  S2 <= M_on(4) or M_on(5) or M_on(6);
  S1 <= M_on(2) or M_on(3) or M_on(6);
  S0 <= M_on(1) or M_on(3) or M_on(5);
  
  MUX: mux_8x1_10bits port map ( I0  => "0000000000",
                                 I1  => "0001100100", -- 100 centavos
                                 I2  => "0000110010", -- 50 centavos
                                 I3  => "0000011001", -- 25 centavos
                                 I4  => "0000001010", -- 10 centavos
                                 I5  => "0000000101", -- 5 centavos
                                 I6  => "0000000001", -- 1 centavos
                                 I7  => "0000000000",
                                 S2  => S0,
                                 S1  => S1,
                                 S0  => S2,
                                 D_out => Vm_x
                                
                      );
  
  SUB: subtrator_10bits port map ( A => Vtot, 
                                   B => Vm_x, 
                                   S => Vtot_menos_Vm, 
                                   Co => Carry_out 
                        );
  
end CKT;
  
  
  
  
  
  
  
  
  
  
  
  
  