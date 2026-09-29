library ieee;
use ieee.std_logic_1164.all;

entity Multiplexador_2E_4B is
  port ( i0, i1: in std_logic_vector(3 downto 0);
         sh: in std_logic;
         s: out std_logic_vector(3 downto 0)
  );
end Multiplexador_2E_4B;

architecture Structure of Multiplexador_2E_4B is
  component Multiplexador_2E_1B is
    port ( i0, i1, sh: in std_logic;
           s: out std_logic
    );
  end component;
begin
  Multiplexador_2E_1B_0: Multiplexador_2E_1B
    port map (i0(0), i1(0), sh, s(0));
  Multiplexador_2E_1B_1: Multiplexador_2E_1B
    port map (i0(1), i1(1), sh, s(1));
  Multiplexador_2E_1B_2: Multiplexador_2E_1B
    port map (i0(2), i1(2), sh, s(2));
  Multiplexador_2E_1B_3: Multiplexador_2E_1B
    port map (i0(3), i1(3), sh, s(3));
end Structure;

