library ieee;
use ieee.std_logic_1164.all;

entity OR_16E_1B_1S is
  port( a: in std_logic_vector(15 downto 0);
        s: out std_logic
  );
end OR_16E_1B_1S;

architecture Behaviour of OR_16E_1B_1S is
begin
  process (a)
  begin
    s <= a(0) or a(1) or a(2) or a(3) or a(4) or a(5) or a(6) or a(7) 
      or a(8) or a(9) or a(10) or a(11) or a(12) or a(13) or a(14) or a(15);  
  end process;
end Behaviour;



