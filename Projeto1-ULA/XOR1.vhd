library ieee;
use ieee.std_logic_1164.all;

entity XOR1 is
    port (
        A : in std_logic;
        B : in std_logic;
        S : out std_logic
    );
end XOR1;

architecture ckt of XOR1 is

begin
    S <= A xor B;

end ckt;
