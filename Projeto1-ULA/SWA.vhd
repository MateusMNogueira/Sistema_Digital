library ieee;
use ieee.std_logic_1164.all;

entity SWA is
    port (
        A: in std_logic_vector(7 downto 0);
        S: out std_logic_vector(7 downto 0)
    );
end SWA;

architecture ckt of SWA is
    begin
        S(7) <= A(0);
        S(6) <= A(1);
        S(5) <= A(2);
        S(4) <= A(3);
        S(3) <= A(4);
        S(2) <= A(5);
        S(1) <= A(6);
        S(0) <= A(7);

end ckt;