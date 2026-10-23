library ieee;
use ieee.std_logic_1164.all;

entity comparador_mag_10bits is
port(
A_mag10: in std_logic_vector(9 downto 0);
S_mag10: out std_logic
);
end comparador_mag_10bits;

architecture ckt of comparador_mag_10bits is
begin
S_mag10 <= (A_mag10(0) OR A_mag10(1) OR A_mag10(2) OR A_mag10(3) OR A_mag10(4) OR A_mag10(5) OR A_mag10(6) OR A_mag10(7) OR A_mag10(8) OR A_mag10(9) OR '0');
end ckt;
