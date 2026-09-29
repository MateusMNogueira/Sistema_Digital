library ieee;
use ieee.std_logic_1164.all;

entity complemento_9 is

  port( a: in std_logic_vector(3 downto 0);
        b: out std_logic_vector(3 downto 0)
  );

end complemento_9;

architecture ckt of complemento_9 is

begin

  b(0) <= (not a(0));
  b(1) <= a(1);
  b(2) <= ((not(a(1)) and a(2)) or (a(1) and (not(a(2)))));
  b(3) <= ((not(a(1))) and (not(a(2))) and (not(a(3))));

end ckt; 
