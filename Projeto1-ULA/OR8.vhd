library ieee;
use ieee.std_logic_1164.all;

entity OR8 is
    port (
        A: in std_logic_vector(7 downto 0);
        B: in std_logic_vector(7 downto 0);
        S: out std_logic_vector(7 downto 0)
    );
end OR8;

architecture ckt of OR8 is

component OR1 is
    port (
        A: in std_logic;
        B: in std_logic;
        S: out std_logic
    );
end component;

begin

U0: OR1 port map(A(0), B(0), S(0));
U1: OR1 port map(A(1), B(1), S(1)); 
U2: OR1 port map(A(2), B(2), S(2));
U3: OR1 port map(A(3), B(3), S(3));
U4: OR1 port map(A(4), B(4), S(4));
U5: OR1 port map(A(5), B(5), S(5));    
U6: OR1 port map(A(6), B(6), S(6));
U7: OR1 port map(A(7), B(7), S(7));

end ckt;