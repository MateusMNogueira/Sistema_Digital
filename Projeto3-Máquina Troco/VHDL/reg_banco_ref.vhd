-- ============================================================================
-- Operações:
--   CLEAR = 0             -> todos os bits em 1 (1111 = 15 moedas)  (s1s0 = 00 -> i0)
--   CLEAR = 1, LOAD = 0   -> mantém o valor                         (s1s0 = 01 -> i1)
--   CLEAR = 1, LOAD = 1   -> carrega o valor do banco provisório    (s1s0 = 10 -> i2)
-- Equações de seleção:
--   s1 = CLEAR . LOAD
--   s0 = CLEAR . not LOAD
-- ============================================================================

library ieee;                         -- usa a biblioteca padrão IEEE
use ieee.std_logic_1164.all;          -- habilita std_logic e std_logic_vector

entity reg_banco_ref is               -- declara a entidade do banco de referência
  port (
    clk   : in  std_logic;                    -- clock do sistema
    clear : in  std_logic;                    -- reabastecimento ativo em nível baixo
    load  : in  std_logic;                    -- 1 = copia o banco provisório
    prov  : in  std_logic_vector(3 downto 0); -- valor do banco provisório
    q     : out std_logic_vector(3 downto 0)  -- quantidade de referência da moeda
  );
end reg_banco_ref;                    -- fim da declaração da entidade

architecture estrutural of reg_banco_ref is -- descrição interna do registrador

  component fatia_reg                 -- declara a fatia de 1 bit (mux 4x1 + flip-flop D)
    port (
      i0, i1, i2, i3 : in  std_logic; -- quatro opções para o próximo valor do bit
      s1, s0         : in  std_logic; -- seleção do multiplexador
      clk            : in  std_logic; -- clock
      q              : out std_logic  -- bit armazenado
    );
  end component;                      -- fim da declaração da fatia

  signal s1, s0 : std_logic;                    -- sinais de seleção comuns às fatias
  signal q_int  : std_logic_vector(3 downto 0); -- cópia interna da saída (realimentação)

begin

  s1 <= clear and load;               -- s1 = 1 só para carregar o banco provisório
  s0 <= clear and (not load);         -- s0 = 1 só para manter o valor

  F0: fatia_reg port map (            -- fatia do bit 0
    i0 => '1',                        -- 00: leva o bit a 1 (CLEAR baixo = reabastece)
    i1 => q_int(0),                   -- 01: mantém o valor atual
    i2 => prov(0),                    -- 10: carrega o bit do banco provisório
    i3 => '0',                        -- 11: nível 0 (nunca selecionada)
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(0)                    -- guarda o bit 0 do banco de referência
  );
  F1: fatia_reg port map (            -- fatia do bit 1
    i0 => '1',                        -- 00: leva o bit a 1 (CLEAR baixo = reabastece)
    i1 => q_int(1),                   -- 01: mantém o valor atual
    i2 => prov(1),                    -- 10: carrega o bit do banco provisório
    i3 => '0',                        -- 11: nível 0 (nunca selecionada)
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(1)                    -- guarda o bit 1 do banco de referência
  );
  F2: fatia_reg port map (            -- fatia do bit 2
    i0 => '1',                        -- 00: leva o bit a 1 (CLEAR baixo = reabastece)
    i1 => q_int(2),                   -- 01: mantém o valor atual
    i2 => prov(2),                    -- 10: carrega o bit do banco provisório
    i3 => '0',                        -- 11: nível 0 (nunca selecionada)
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(2)                    -- guarda o bit 2 do banco de referência
  );
  F3: fatia_reg port map (            -- fatia do bit 3
    i0 => '1',                        -- 00: leva o bit a 1 (CLEAR baixo = reabastece)
    i1 => q_int(3),                   -- 01: mantém o valor atual
    i2 => prov(3),                    -- 10: carrega o bit do banco provisório
    i3 => '0',                        -- 11: nível 0 (nunca selecionada)
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(3)                    -- guarda o bit 3 do banco de referência
  );
  q <= q_int;                         -- leva a quantidade de referência para a saída

end estrutural;                       -- fim da arquitetura
