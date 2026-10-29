library ieee; 
use ieee.std_logic_1164.all;

entity mux_8x1_10bits is
    
    port ( I0, I1, I2, I3, I4, I5, I6, I7 : in  std_logic_vector(9 downto 0);
           S2, S1, S0                     : in  std_logic;
           D_out                          : out std_logic_vector(9 downto 0)
    );

end mux_8x1_10bits;

architecture CKT of mux_8x1_10bits is
    
    component mux_2x1_10bits is
        
        port ( I0, I1   : in  std_logic_vector(9 downto 0); 
               Sel      : in  std_logic; 
               D        : out std_logic_vector(9 downto 0)
        );
    
    end component;
    
    signal D0, D1, D2, D3 : std_logic_vector(9 downto 0); -- Nível 1
    signal D4, D5         : std_logic_vector(9 downto 0); -- Nível 2


begin
    -- Nível 1 (Controlado por S2)
    M0: mux_2x1_10bits port map (I0 => I0, I1 => I1, Sel => S2, D => D0);
    M1: mux_2x1_10bits port map (I0 => I2, I1 => I3, Sel => S2, D => D1);
    M2: mux_2x1_10bits port map (I0 => I4, I1 => I5, Sel => S2, D => D2);
    M3: mux_2x1_10bits port map (I0 => I6, I1 => I7, Sel => S2, D => D3);

    -- Nível 2 (Controlado por S1)
    M4: mux_2x1_10bits port map (I0 => D0, I1 => D1, Sel => S1, D => D4);
    M5: mux_2x1_10bits port map (I0 => D2, I1 => D3, Sel => S1, D => D5);

    -- Nível 3 (Controlado por S0)
    M6: mux_2x1_10bits port map (I0 => D4, I1 => D5, Sel => S0, D => D_out);

end CKT;
