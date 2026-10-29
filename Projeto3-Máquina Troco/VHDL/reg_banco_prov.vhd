-- ============================================================================
-- Operações:
--   LOAD = 1 (com CLEAR = 1)                  -> carrega VREF  (s1s0 = 01 -> i1)
--   LOAD = 0, DEC = 1, OPERATE = 1 (CLEAR = 1) -> Q - 1        (s1s0 = 10 -> i2)
--   qualquer outro caso                       -> mantém Q      (s1s0 = 00 -> i0)
-- Equações de seleção:
--   s0 = CLEAR . LOAD
--   s1 = CLEAR . not LOAD . DEC . OPERATE
-- ============================================================================

library ieee;                         -- usa a biblioteca padrão IEEE
use ieee.std_logic_1164.all;          -- habilita std_logic e std_logic_vector

entity reg_banco_prov is              -- declara a entidade do banco provisório
  port (
    clk     : in  std_logic;                    -- clock do sistema
    clear   : in  std_logic;                    -- habilitação geral (ativa em nível alto)
    load    : in  std_logic;                    -- 1 = copia o banco de referência
    dec     : in  std_logic;                    -- 1 = momento de decrementar
    operate : in  std_logic;                    -- 1 = esta moeda foi usada (Verificador)
    vref    : in  std_logic_vector(3 downto 0); -- valor do banco de referência
    q       : out std_logic_vector(3 downto 0)  -- quantidade provisória da moeda
  );
end reg_banco_prov;                   -- fim da declaração da entidade

architecture estrutural of reg_banco_prov is -- descrição interna do registrador

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
  signal q_dec  : std_logic_vector(3 downto 0); -- valor decrementado Q - 1
  signal b      : std_logic_vector(2 downto 0); -- "empresta 1" (borrow) entre os bits

begin

  -- Decrementador de 4 bits (Q - 1): cada bit inverte enquanto houver borrow
  q_dec(0) <= not q_int(0);           -- o bit 0 sempre inverte ao subtrair 1
  b(0)     <= not q_int(0);           -- há borrow para o bit 1 se o bit 0 era 0
  q_dec(1) <= q_int(1) xor b(0);      -- o bit 1 inverte se recebeu borrow
  b(1)     <= b(0) and (not q_int(1)); -- borrow segue se o bit 1 também era 0
  q_dec(2) <= q_int(2) xor b(1);      -- o bit 2 inverte se recebeu borrow
  b(2)     <= b(1) and (not q_int(2)); -- borrow segue se o bit 2 também era 0
  q_dec(3) <= q_int(3) xor b(2);      -- o bit 3 inverte se recebeu borrow

  s0 <= clear and load;                         -- s0 = 1 só para carregar VREF
  s1 <= clear and (not load) and dec and operate; -- s1 = 1 só para decrementar

  F0: fatia_reg port map (            -- fatia do bit 0
    i0 => q_int(0),                   -- 00: mantém o valor atual
    i1 => vref(0),                    -- 01: carrega o bit do banco de referência
    i2 => q_dec(0),                   -- 10: recebe o bit de Q - 1
    i3 => '0',                        -- 11: nível 0 (nunca selecionada)
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(0)                    -- guarda o bit 0 do banco provisório
  );
  F1: fatia_reg port map (            -- fatia do bit 1
    i0 => q_int(1),                   -- 00: mantém o valor atual
    i1 => vref(1),                    -- 01: carrega o bit do banco de referência
    i2 => q_dec(1),                   -- 10: recebe o bit de Q - 1
    i3 => '0',                        -- 11: nível 0 (nunca selecionada)
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(1)                    -- guarda o bit 1 do banco provisório
  );
  F2: fatia_reg port map (            -- fatia do bit 2
    i0 => q_int(2),                   -- 00: mantém o valor atual
    i1 => vref(2),                    -- 01: carrega o bit do banco de referência
    i2 => q_dec(2),                   -- 10: recebe o bit de Q - 1
    i3 => '0',                        -- 11: nível 0 (nunca selecionada)
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(2)                    -- guarda o bit 2 do banco provisório
  );
  F3: fatia_reg port map (            -- fatia do bit 3
    i0 => q_int(3),                   -- 00: mantém o valor atual
    i1 => vref(3),                    -- 01: carrega o bit do banco de referência
    i2 => q_dec(3),                   -- 10: recebe o bit de Q - 1
    i3 => '0',                        -- 11: nível 0 (nunca selecionada)
    s1 => s1,                         -- seleção alta comum a todas as fatias
    s0 => s0,                         -- seleção baixa comum a todas as fatias
    clk => clk,                       -- clock comum a todas as fatias
    q  => q_int(3)                    -- guarda o bit 3 do banco provisório
  );
  q <= q_int;                         -- leva a quantidade provisória para a saída

end estrutural;                       -- fim da arquitetura
