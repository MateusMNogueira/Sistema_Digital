library ieee;
use ieee.std_logic_1164.all;

entity AND_5E_1B_1S is
  port( a, b, c, d, e: in std_logic;
        s: out std_logic
  );
end AND_5E_1B_1S;

architecture Behaviour of AND_5E_1B_1S is
begin
  process (a, b, c, d, e)
  begin
    s <= a and b and c and d and e;
  end process;
end Behaviour;

