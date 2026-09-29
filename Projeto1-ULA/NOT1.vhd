library ieee;
use ieee.std_logic_1164.all;

entity NOT1 is
    port (
        A : in std_logic;
        S : out std_logic
    );
end NOT1;

architecture ckt of NOT1 is

begin

    S <= not A;
end ckt;