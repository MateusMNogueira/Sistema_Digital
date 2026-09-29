library ieee;
use ieee.std_logic_1164.all;

entity somador_2bits is
port(
A: in std_logic;
B: in std_logic;
Carry_in: in std_logic;
Carry_out: out std_logic;
saida: out std_logic
);
end somador_2bits;

architecture ckt of somador_2bits is
begin
saida <= ((A xor B) xor Carry_in);
Carry_out <= ((A and B) or (A and Carry_in) or (B and Carry_in));
end ckt;
