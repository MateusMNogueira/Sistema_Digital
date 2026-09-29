library ieee;
use ieee.std_logic_1164.all;

-- Oq são as entradas/saídas --
entity somador8bits is
  port(
    A: in std_logic_vector(7 downto 0);
    B: in std_logic_vector(7 downto 0);
    Cin: in std_logic;
    Cout: out std_logic;
    S: out std_logic_vector(7 downto 0)
  );
end somador8bits;
-- Como funciona internamente --
architecture ckt of somador8bits is
  component somador1bit
    port(
      A: in std_logic;
      B: in std_logic;
      Cin: in std_logic;
      Cout: out std_logic;
      S: out std_logic
    );
  end component;
  -- Cria as ligações internas --
  signal C1,C2,C3,C4,C5,C6,C7: std_logic;

begin
  U0: somador1bit port map(A(0), B(0), Cin, C1, S(0));
  U1: somador1bit port map(A(1), B(1), C1, C2, S(1));
  U2: somador1bit port map(A(2), B(2), C2, C3, S(2));
  U3: somador1bit port map(A(3), B(3), C3, C4, S(3));
  U4: somador1bit port map(A(4), B(4), C4, C5, S(4));
  U5: somador1bit port map(A(5), B(5), C5, C6, S(5));
  U6: somador1bit port map(A(6), B(6), C6, C7, S(6));
  U7: somador1bit port map(A(7), B(7), C7, Cout, S(7));
end ckt;
