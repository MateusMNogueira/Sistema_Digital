library ieee;
use ieee.std_logic_1164.all;

entity OR1 is
    port (
        A: in std_logic;
        B: in std_logic;
        S: out std_logic
    );
end OR1;

architecture ckt of OR1 is

begin

    S <= A or B;

end ckt;