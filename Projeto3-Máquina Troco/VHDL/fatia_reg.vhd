library ieee;                        -- usa a biblioteca padrão IEEE
use ieee.std_logic_1164.all;         -- habilita o tipo std_logic

entity fatia_reg is                  -- declara a entidade da fatia
  port (
    i0  : in  std_logic;             -- opção 0 para o próximo valor do bit
    i1  : in  std_logic;             -- opção 1 para o próximo valor do bit
    i2  : in  std_logic;             -- opção 2 para o próximo valor do bit
    i3  : in  std_logic;             -- opção 3 para o próximo valor do bit
    s1  : in  std_logic;             -- seleção (bit mais significativo)
    s0  : in  std_logic;             -- seleção (bit menos significativo)
    clk : in  std_logic;             -- clock comum a todas as fatias
    clr : in  std_logic;             -- clear assíncrono (ativo em '0')
    set : in  std_logic;             -- set assíncrono (ativo em '0')
    q   : out std_logic              -- bit armazenado
  );
end fatia_reg;                       -- fim da declaração da entidade

architecture estrutural of fatia_reg is -- descrição interna da fatia

  component mux4x1                   -- declara o componente multiplexador 4x1
    port (
      i0, i1, i2, i3 : in  std_logic; -- quatro entradas de dado
      s1, s0         : in  std_logic; -- dois bits de seleção
      y              : out std_logic  -- saída
    );
  end component;                     -- fim da declaração do mux

  component ffd                      -- declara o novo componente flip-flop D
    port (
      ck  : in  std_logic;
      clr : in  std_logic;
      set : in  std_logic;
      d   : in  std_logic;
      q   : out std_logic
    );
  end component;                     -- fim da declaração do flip-flop

  signal d_int : std_logic;          -- fio que liga a saída do mux à entrada D

begin

  MUX: mux4x1 port map (             -- instancia o multiplexador da fatia
    i0 => i0,                        -- liga a opção 0
    i1 => i1,                        -- liga a opção 1
    i2 => i2,                        -- liga a opção 2
    i3 => i3,                        -- liga a opção 3
    s1 => s1,                        -- liga a seleção alta
    s0 => s0,                        -- liga a seleção baixa
    y  => d_int                      -- saída do mux vai para o fio d_int
  );

  FF: ffd port map (                 -- instancia o novo flip-flop D da fatia
    ck  => clk,                      -- liga o clock
    clr => clr,                      -- clear assíncrono (ativo em '0')
    set => set,                      -- set assíncrono (ativo em '0')
    d   => d_int,                    -- a entrada D recebe a saída do mux
    q   => q                         -- a saída Q é o bit armazenado
  );

end estrutural;                      -- fim da arquitetura
