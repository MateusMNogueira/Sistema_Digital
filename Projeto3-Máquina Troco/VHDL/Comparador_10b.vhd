library ieee;
use ieee.std_logic_1164.all;

entity comparador_10bits is
    
    port ( A, B           : in  std_logic_vector(9 downto 0);
           AigualB        : out std_logic;
           AmaiorB        : out std_logic;
           AmenorB        : out std_logic
    );

end comparador_10bits;

architecture rtl of comparador_10bits is
    
    signal x : std_logic_vector(9 downto 0);
    signal igual, maior, menor : std_logic;

begin
    -- x(i) = 1 quando A(i) = B(i)
    x <= not (A xor B);

    -- A é igual a B se todos os bits forem iguais
    igual <= x(9) and x(8) and x(7) and x(6) and x(5) and 
             x(4) and x(3) and x(2) and x(1) and x(0);

    -- A maior que B
    maior <= (A(9) and not B(9)) or
             (x(9) and A(8) and not B(8)) or
             (x(9) and x(8) and A(7) and not B(7)) or
             (x(9) and x(8) and x(7) and A(6) and not B(6)) or
             (x(9) and x(8) and x(7) and x(6) and A(5) and not B(5)) or
             (x(9) and x(8) and x(7) and x(6) and x(5) and A(4) and not B(4)) or
             (x(9) and x(8) and x(7) and x(6) and x(5) and x(4) and A(3) and not B(3)) or
             (x(9) and x(8) and x(7) and x(6) and x(5) and x(4) and x(3) and A(2) and not B(2)) or
             (x(9) and x(8) and x(7) and x(6) and x(5) and x(4) and x(3) and x(2) and A(1) and not B(1)) or
             (x(9) and x(8) and x(7) and x(6) and x(5) and x(4) and x(3) and x(2) and x(1) and A(0) and not B(0));

    -- A menor que B (simetricamente)
    menor <= (not A(9) and B(9)) or
             (x(9) and not A(8) and B(8)) or
             (x(9) and x(8) and not A(7) and B(7)) or
             (x(9) and x(8) and x(7) and not A(6) and B(6)) or
             (x(9) and x(8) and x(7) and x(6) and not A(5) and B(5)) or
             (x(9) and x(8) and x(7) and x(6) and x(5) and not A(4) and B(4)) or
             (x(9) and x(8) and x(7) and x(6) and x(5) and x(4) and not A(3) and B(3)) or
             (x(9) and x(8) and x(7) and x(6) and x(5) and x(4) and x(3) and not A(2) and B(2)) or
             (x(9) and x(8) and x(7) and x(6) and x(5) and x(4) and x(3) and x(2) and not A(1) and B(1)) or
             (x(9) and x(8) and x(7) and x(6) and x(5) and x(4) and x(3) and x(2) and x(1) and not A(0) and B(0));

    -- Saídas
    AigualB <= igual;
    AmaiorB <= maior;
    AmenorB <= menor;

end rtl;