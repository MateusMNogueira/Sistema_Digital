library ieee;
use ieee.std_logic_1164.all;
--Entidade do Multiplicador

entity multiplicador_8bits is
port(
A:in std_logic_vector(7 downto 0);
B: in std_logic_vector(7 downto 0);
saida: out std_logic_vector(7 downto 0);
Carry_out: out std_logic
); 
end multiplicador_8bits;

-- Arquitetura
architecture ckt of multiplicador_8bits is
component somador_16bits is
port(
a_soma: in std_logic_vector(15 downto 0);
b_soma: in std_logic_vector(15 downto 0);
c_out: out std_logic;
s_soma: out std_logic_vector(15 downto 0)
);
end component;

component AND_64
port(
A_and: in std_logic_vector(7 downto 0);
B_and: in std_logic_vector(7 downto 0);
saida_and0: out std_logic_vector(7 downto 0);
saida_and1: out std_logic_vector(7 downto 0);
saida_and2: out std_logic_vector(7 downto 0);
saida_and3: out std_logic_vector(7 downto 0);
saida_and4: out std_logic_vector(7 downto 0);
saida_and5: out std_logic_vector(7 downto 0);
saida_and6: out std_logic_vector(7 downto 0);
saida_and7: out std_logic_vector(7 downto 0)
);
end component;

--Sinal dos somadores
signal sinal_soma0: std_logic_vector(15 downto 0);
signal sinal_soma1: std_logic_vector(15 downto 0);
signal sinal_soma2: std_logic_vector(15 downto 0);
signal sinal_soma3: std_logic_vector(15 downto 0);
signal sinal_soma4: std_logic_vector(15 downto 0);
signal sinal_soma5: std_logic_vector(15 downto 0);
signal sinal_soma6: std_logic_vector(15 downto 0);

--Sinal dos AND'S
signal sinal_and0:std_logic_vector(7 downto 0);
signal sinal_and1:std_logic_vector(7 downto 0);
signal sinal_and2:std_logic_vector(7 downto 0);
signal sinal_and3:std_logic_vector(7 downto 0);
signal sinal_and4:std_logic_vector(7 downto 0);
signal sinal_and5:std_logic_vector(7 downto 0);
signal sinal_and6:std_logic_vector(7 downto 0);
signal sinal_and7:std_logic_vector(7 downto 0);

--Sinal Auxiliar
signal entrada_a0 : std_logic_vector(15 downto 0);
signal entrada_b0 : std_logic_vector(15 downto 0);
signal entrada_b1 : std_logic_vector(15 downto 0);
signal entrada_b2 : std_logic_vector(15 downto 0);
signal entrada_b3 : std_logic_vector(15 downto 0);
signal entrada_b4 : std_logic_vector(15 downto 0);
signal entrada_b5 : std_logic_vector(15 downto 0);
signal entrada_b6 : std_logic_vector(15 downto 0);




begin
R_and: AND_64 port map(
A_and(7 downto 0)=>A(7 downto 0), --Conecta a entrada A do multiplicador com o A_and
B_and(7 downto 0)=>B(7 downto 0), -- Conecta a entrada B do multiplicador com o B_and
saida_and0(7 downto 0)=>sinal_and0(7 downto 0), -- A saida_and vai para o sinal_and
saida_and1(7 downto 0)=>sinal_and1(7 downto 0),
saida_and2(7 downto 0)=>sinal_and2(7 downto 0),
saida_and3(7 downto 0)=>sinal_and3(7 downto 0),
saida_and4(7 downto 0)=>sinal_and4(7 downto 0),
saida_and5(7 downto 0)=>sinal_and5(7 downto 0),
saida_and6(7 downto 0)=>sinal_and6(7 downto 0),
saida_and7(7 downto 0)=>sinal_and7(7 downto 0)
);
entrada_a0 <= "00000000" & sinal_and0;

entrada_b0 <= "0000000" & sinal_and1 & "0";

entrada_b1 <= "000000" & sinal_and2 & "00";

entrada_b2 <= "00000" & sinal_and3 & "000";

entrada_b3 <= "0000" & sinal_and4 & "0000";

entrada_b4 <= "000" & sinal_and5 & "00000";

entrada_b5 <= "00" & sinal_and6 & "000000";

entrada_b6 <= "0" & sinal_and7 & "0000000";

U0: somador_16bits port map(
a_soma=>entrada_a0,
b_soma=>entrada_b0,
s_soma=>sinal_soma0
);

U1: somador_16bits port map(
a_soma => sinal_soma0,
b_soma => entrada_b1,
s_soma => sinal_soma1
);

U2 : somador_16bits PORT MAP(
a_soma => sinal_soma1,
b_soma => entrada_b2,
s_soma => sinal_soma2
);

U3 : somador_16bits PORT MAP(
a_soma => sinal_soma2,
b_soma => entrada_b3,
s_soma => sinal_soma3
);

U4 : somador_16bits PORT MAP(
a_soma => sinal_soma3,
b_soma => entrada_b4,
s_soma => sinal_soma4
);

U5 : somador_16bits PORT MAP(
a_soma => sinal_soma4,
b_soma => entrada_b5,
s_soma => sinal_soma5
);

U6 : somador_16bits PORT MAP(
a_soma => sinal_soma5,
b_soma =>entrada_b6,
s_soma => sinal_soma6
);

saida<= sinal_soma6(7 downto 0);


end ckt;
