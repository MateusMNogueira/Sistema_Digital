library ieee;
use ieee.std_logic_1164.all;

entity sum_1_D is
port (
a_sum_1_D: in std_logic_vector(3 downto 0);
b_sum_1_D: in std_logic_vector(3 downto 0);
carry_in_sum_1_D: in std_logic;
carry_out_sum_1_D: out std_logic;
saida_sum_1_D: out std_logic_vector(3 downto 0)
);
end sum_1_D;

architecture ckt of sum_1_D is
component somador_4bits
port(
a_4: in std_logic_vector (3 downto 0);
b_4: in std_logic_vector (3 downto 0);
carry_in4: in std_logic;
carry_out4: out std_logic;
saida_4: out std_logic_vector (3 downto 0)
);
end component;

signal aux: std_logic_vector(3 downto 0); --Guarda o resultado Bruto da primeira soma, pode variar até 15
signal carry_in: std_logic; -- Flag de correção. Assume 1 quando a soma estourar 
signal carry_out: std_logic;

begin

U0: somador_4bits port map(a_4 => a_sum_1_D, b_4 => b_sum_1_D, carry_in4 => carry_in_sum_1_D, saida_4 => aux, carry_out4 => carry_out);
carry_in <= (carry_out or (aux(3) and (aux(2) or aux (1)))); -- Verifica se o resultado de aux é valido. Se não assume 1 necessitando correção 

--Ajuste BCD/+6. Se carry_in = 1, b_4= 6
U1: somador_4bits port map(a_4 => aux, b_4(0) =>'0',b_4(1) => carry_in, b_4(2) => carry_in, b_4(3) => '0', carry_in4 => '0', saida_4 => saida_sum_1_D);
carry_out_sum_1_D <= carry_in;-- Indica se gerou dezena


end ckt;
