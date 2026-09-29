library ieee;
use ieee.std_logic_1164.all;

entity AND1 is
port(
    A: in std_logic;
    B: in std_logic;
    S: out std_logic
);
end AND1;

architecture ckt of AND1 is
begin

    S <= A and B;

end ckt;