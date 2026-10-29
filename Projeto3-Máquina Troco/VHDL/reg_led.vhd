-- ============================================================================
-- Equação de seleção do mux 2x1:
--   S0 = ERRO + (MX_ON . CHARGE)
--   S0 = 0 -> entrada 0 = '0' (LED apagado)
--   S0 = 1 -> entrada 1 = '1' (LED aceso)
--   CLEAR (ativo em '0') atua diretamente no Clear assíncrono do Flip-Flop D.
-- ============================================================================

library ieee;                        -- usa a biblioteca padrão IEEE
use ieee.std_logic_1164.all;         -- habilita o tipo std_logic

entity reg_led is                    -- declara a entidade do registrador do LED
  port (
    clk    : in  std_logic;            -- clock do sistema
    clear  : in  std_logic;            -- habilitação geral assíncrona (0 = LED sempre apagado)
    erro   : in  std_logic;            -- 1 = máquina em situação de erro
    mx_on  : in  std_logic;            -- 1 = esta moeda foi escolhida (Gerador de Operadores)
    charge : in  std_logic;            -- 1 = estado de troca (sinal CHANGE da FSM)
    led    : out std_logic             -- saída para o LED da moeda
  );
end reg_led;                         -- fim da declaração da entidade

architecture estrutural of reg_led is -- descrição interna do registrador

  component mux2x1                    -- declara o componente multiplexador 2x1
    port (
      i0, i1 : in  std_logic;          -- duas entradas de dado
      s      : in  std_logic;          -- seleção
      y      : out std_logic           -- saída
    );
  end component;                      -- fim da declaração do mux

  component ffd                       -- declara o novo componente flip-flop D
    port (
      ck  : in  std_logic;
      clr : in  std_logic;
      set : in  std_logic;
      d   : in  std_logic;
      q   : out std_logic
    );
  end component;                      -- fim da declaração do flip-flop

  signal s0    : std_logic;            -- seleção do multiplexador
  signal d_int : std_logic;            -- fio entre a saída do mux e a entrada D

begin

  s0 <= erro or (mx_on and charge);   -- acende com erro ou com a moeda em troca

  MUX: mux2x1 port map (              -- instancia o multiplexador 2x1
    i0 => '0',                        -- entrada 0: LED apagado
    i1 => '1',                        -- entrada 1: LED aceso
    s  => s0,                         -- seleção vinda da lógica combinacional
    y  => d_int                       -- saída do mux vai para o flip-flop
  );

  FF: ffd port map (                  -- instancia o novo flip-flop D
    ck  => clk,                       -- liga o clock
    clr => clear,                     -- clear assíncrono (ativo em '0')
    set => '1',                       -- set desativado (ativo em '0')
    d   => d_int,                     -- a entrada D recebe a saída do mux
    q   => led                        -- a saída Q comanda o LED
  );

end estrutural;                       -- fim da arquitetura
