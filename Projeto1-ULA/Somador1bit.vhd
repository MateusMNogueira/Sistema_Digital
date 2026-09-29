library ieee;
use ieee.std_logic_1164.all;
entity somador1bit is
port(
A: in std_logic;
B: in std_logic;
Cin: in std_logic;
Cout: out std_logic;
S: out std_logic
);
end somador1bit;

architecture ckt of somador1bit is
begin
S<= (A) xor (B) xor (Cin);
Cout<= (A and Cin) or (B and Cin) or (A and B);
end ckt;

