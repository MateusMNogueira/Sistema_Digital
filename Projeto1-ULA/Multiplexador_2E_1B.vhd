library ieee;
use ieee.std_logic_1164.all;

entity Multiplexador_2E_1B is
  port ( i0, i1, sh: in std_logic;
         s: out std_logic
  );
end Multiplexador_2E_1B;

architecture Behaviour of Multiplexador_2E_1B is
begin
  process (i0, i1, sh)
  begin
    s <= (i0 and (not sh)) or (i1 and sh);
  end process;
end Behaviour;