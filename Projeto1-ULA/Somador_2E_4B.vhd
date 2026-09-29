library ieee;
use ieee.std_logic_1164.all;

entity Somador_2E_4B is
  port( a, b: in std_logic_vector(3 downto 0);
        cin: in std_logic;
        cout: out std_logic;
        s: out std_logic_vector(3 downto 0)
  );
end Somador_2E_4B;

architecture Structure of Somador_2E_4B is
  component somador1bit
    port(
      A: in std_logic;
      B: in std_logic;
      Cin: in std_logic;
      Cout: out std_logic;
      S: out std_logic
    );
  end component;
  signal auxC1,auxC2, auxC3: std_logic;
begin
  Somador_4B_0: somador1bit port map(a(0), b(0), cin, auxC1,   s(0));
  Somador_4B_1: somador1bit port map(a(1), b(1), auxC1, auxC2, s(1));
  Somador_4B_2: somador1bit port map(a(2), b(2), auxC2, auxC3, s(2));
  Somador_4B_3: somador1bit port map(a(3), b(3), auxC3, cout, s(3));
end Structure;

