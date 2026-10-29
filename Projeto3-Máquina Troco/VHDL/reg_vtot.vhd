-- ============================================================================
-- Prioridade das operações:
--   CLEAR = 0                   -> zera o registrador         (s1s0 = 00 -> i0)
--   CLEAR = 1, LOAD = 1         -> carrega V                  (s1s0 = 11 -> i3)
--   CLEAR = 1, LOAD = 0, DEC = 1 -> recebe Vtot - VM          (s1s0 = 10 -> i2)
--   CLEAR = 1, LOAD = 0, DEC = 0 -> mantém o valor            (s1s0 = 01 -> i1)
-- Equações de seleção:
--   s1 = CLEAR . (LOAD + DEC)
--   s0 = CLEAR . (LOAD + not DEC)
-- ============================================================================

library ieee;                         -- usa a biblioteca padrão IEEE
use ieee.std_logic_1164.all;          -- habilita std_logic e std_logic_vector

entity reg_vtot is                    -- declara a entidade do registrador Vtot
  port (
    clk   : in  std_logic;                     -- clock do sistema
    clear : in  std_logic;                     -- inicialização ativa em nível baixo
    load  : in  std_logic;                     -- 1 = carrega o valor de entrada V
    dec   : in  std_logic;                     -- 1 = recebe o resultado da subtração
    v     : in  std_logic_vector(9 downto 0);  -- valor do troco vindo das chaves
    sub   : in  std_logic_vector(9 downto 0);  -- Vtot - VM vindo do Trocador
    q     : out std_logic_vector(9 downto 0)   -- valor atual de Vtot
  );
end reg_vtot;                         -- fim da declaração da entidade

architecture estrutural of reg_vtot is -- descrição interna do registrador

  component fatia_reg                 -- declara a fatia de 1 bit (mux 4x1 + flip-flop D)
    port (
      i0, i1, i2, i3 : in  std_logic; -- quatro opções para o próximo valor do bit
      s1, s0         : in  std_logic; -- seleção do multiplexador
      clk            : in  std_logic; -- clock
      q              : out std_logic  -- bit armazenado
    );
  end component;                      -- fim da declaração da fatia

  signal s1, s0 : std_logic;                    -- sinais de seleção comuns às fatias
  signal q_int  : std_logic_vector(9 downto 0); -- cópia interna da saída (realimentação)

begin

  s1 <= clear and (load or dec);       -- s1 = 1 para carregar V ou receber a subtração
  s0 <= clear and (load or (not dec)); -- s0 = 1 para carregar V ou manter o valor

  F0: fatia_reg port map (            -- fatia do bit 0
    i0 => '0',                        -- 00: zera o bit (CLEAR em nível baixo)
    i1 => q_int(0),                   -- 01: mantém o valor atual
    i2 => sub(0),                     -- 10: recebe o bit de Vtot - VM
    i3 => v(0),                       -- 11: carrega o bit de V
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(0)                    -- guarda o bit 0 de Vtot
  );
  F1: fatia_reg port map (            -- fatia do bit 1
    i0 => '0',                        -- 00: zera o bit (CLEAR em nível baixo)
    i1 => q_int(1),                   -- 01: mantém o valor atual
    i2 => sub(1),                     -- 10: recebe o bit de Vtot - VM
    i3 => v(1),                       -- 11: carrega o bit de V
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(1)                    -- guarda o bit 1 de Vtot
  );
  F2: fatia_reg port map (            -- fatia do bit 2
    i0 => '0',                        -- 00: zera o bit (CLEAR em nível baixo)
    i1 => q_int(2),                   -- 01: mantém o valor atual
    i2 => sub(2),                     -- 10: recebe o bit de Vtot - VM
    i3 => v(2),                       -- 11: carrega o bit de V
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(2)                    -- guarda o bit 2 de Vtot
  );
  F3: fatia_reg port map (            -- fatia do bit 3
    i0 => '0',                        -- 00: zera o bit (CLEAR em nível baixo)
    i1 => q_int(3),                   -- 01: mantém o valor atual
    i2 => sub(3),                     -- 10: recebe o bit de Vtot - VM
    i3 => v(3),                       -- 11: carrega o bit de V
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(3)                    -- guarda o bit 3 de Vtot
  );
  F4: fatia_reg port map (            -- fatia do bit 4
    i0 => '0',                        -- 00: zera o bit (CLEAR em nível baixo)
    i1 => q_int(4),                   -- 01: mantém o valor atual
    i2 => sub(4),                     -- 10: recebe o bit de Vtot - VM
    i3 => v(4),                       -- 11: carrega o bit de V
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(4)                    -- guarda o bit 4 de Vtot
  );
  F5: fatia_reg port map (            -- fatia do bit 5
    i0 => '0',                        -- 00: zera o bit (CLEAR em nível baixo)
    i1 => q_int(5),                   -- 01: mantém o valor atual
    i2 => sub(5),                     -- 10: recebe o bit de Vtot - VM
    i3 => v(5),                       -- 11: carrega o bit de V
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(5)                    -- guarda o bit 5 de Vtot
  );
  F6: fatia_reg port map (            -- fatia do bit 6
    i0 => '0',                        -- 00: zera o bit (CLEAR em nível baixo)
    i1 => q_int(6),                   -- 01: mantém o valor atual
    i2 => sub(6),                     -- 10: recebe o bit de Vtot - VM
    i3 => v(6),                       -- 11: carrega o bit de V
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(6)                    -- guarda o bit 6 de Vtot
  );
  F7: fatia_reg port map (            -- fatia do bit 7
    i0 => '0',                        -- 00: zera o bit (CLEAR em nível baixo)
    i1 => q_int(7),                   -- 01: mantém o valor atual
    i2 => sub(7),                     -- 10: recebe o bit de Vtot - VM
    i3 => v(7),                       -- 11: carrega o bit de V
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(7)                    -- guarda o bit 7 de Vtot
  );
  F8: fatia_reg port map (            -- fatia do bit 8
    i0 => '0',                        -- 00: zera o bit (CLEAR em nível baixo)
    i1 => q_int(8),                   -- 01: mantém o valor atual
    i2 => sub(8),                     -- 10: recebe o bit de Vtot - VM
    i3 => v(8),                       -- 11: carrega o bit de V
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(8)                    -- guarda o bit 8 de Vtot
  );
  F9: fatia_reg port map (            -- fatia do bit 9
    i0 => '0',                        -- 00: zera o bit (CLEAR em nível baixo)
    i1 => q_int(9),                   -- 01: mantém o valor atual
    i2 => sub(9),                     -- 10: recebe o bit de Vtot - VM
    i3 => v(9),                       -- 11: carrega o bit de V
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(9)                    -- guarda o bit 9 de Vtot
  );
  q <= q_int;                         -- leva o valor armazenado para a saída

end estrutural;                       -- fim da arquitetura
