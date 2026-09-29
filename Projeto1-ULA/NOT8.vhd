library ieee;
use ieee.std_logic_1164.all;

entity NOT8 is
    port (
        A : in std_logic_vector(7 downto 0);
        S : out std_logic_vector(7 downto 0)
    );
end NOT8;

architecture ckt of NOT8 is

component NOT1 is
    port (
        A : in std_logic;
        S : out std_logic
    );
end component;

begin

    U0: NOT1 port map(A(0), S(0));
    U1: NOT1 port map(A(1), S(1));
    U2: NOT1 port map(A(2), S(2));
    U3: NOT1 port map(A(3), S(3));
    U4: NOT1 port map(A(4), S(4));
    U5: NOT1 port map(A(5), S(5));
    U6: NOT1 port map(A(6), S(6));
    U7: NOT1 port map(A(7), S(7));

end ckt;
