library ieee;
use ieee.std_logic_1164.all;

entity Add_3 is
  port(a: in std_logic_vector(3 downto 0);
       s: out std_logic_vector(3 downto 0)
  );
end Add_3;

architecture Hybrid of Add_3 is
  component Somador_2E_4B
    port(a, b: in std_logic_vector(3 downto 0);
         cin: in std_logic;
         cout: out std_logic;
         s: out std_logic_vector(3 downto 0)
    );
  end component;
  component Multiplexador_2E_4B
    port ( i0, i1: in std_logic_vector(3 downto 0);
           sh: in std_logic;
           s: out std_logic_vector(3 downto 0)
    );
  end component;
  signal auxSum3: std_logic_vector(3 downto 0);
  signal auxKey: std_logic;
begin
  process(a)
  begin
    auxKey <= a(3) or (a(2) and a(1)) or (a(2) and a(0));
  end process;
  
  Somador_Add3: Somador_2E_4B port map(a, "0011", '0', open, auxSum3);
  Multiplexador_4B: Multiplexador_2E_4B port map(a, auxSum3, auxKey, s);
end Hybrid;
