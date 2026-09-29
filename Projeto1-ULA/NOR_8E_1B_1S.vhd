library ieee;
use ieee.std_logic_1164.all;

entity NOR_8E_1B_1S is
  port (a: in std_logic_vector(7 downto 0);
        s: out std_logic
  );
end NOR_8E_1B_1S;

architecture Behaviour of NOR_8E_1B_1S is
begin
  process (a)
  begin
    s <= not (a(0) or a(1) or a(2) or a(3) or a(4) or a(5) or a(6) or a(7));
  end process;
end Behaviour;
