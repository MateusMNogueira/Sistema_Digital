library ieee;
use ieee.std_logic_1164.all;

entity SWP is
    port (
        A: in std_logic_vector(7 downto 0);
        S: out std_logic_vector(7 downto 0)
    );
end SWP;

architecture ckt of SWP is
    begin
        S(7) <= A(3);
        S(6) <= A(2);
        S(5) <= A(1);   
        S(4) <= A(0);
        S(3) <= A(7);
        S(2) <= A(6);
        S(1) <= A(5);
        S(0) <= A(4);

    end ckt;