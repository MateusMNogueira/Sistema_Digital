-- ============================================================================
-- mux2x1.vhd
-- Multiplexador 2x1 de 1 bit: s = 0 -> i0 | s = 1 -> i1
-- ============================================================================

library ieee;                         -- usa a biblioteca padrão IEEE
use ieee.std_logic_1164.all;          -- habilita o tipo std_logic

entity mux2x1 is                      -- declara a entidade do multiplexador
  port (
    i0 : in  std_logic;               -- entrada de dado 0 (selecionada com s = 0)
    i1 : in  std_logic;               -- entrada de dado 1 (selecionada com s = 1)
    s  : in  std_logic;               -- sinal de seleção
    y  : out std_logic                -- saída do multiplexador
  );
end mux2x1;                           -- fim da declaração da entidade

architecture fluxo_dados of mux2x1 is -- descrição por equação booleana
begin
  y <= ((not s) and i0)               -- passa i0 quando s = 0
    or (s and i1);                    -- passa i1 quando s = 1
end fluxo_dados;                      -- fim da arquitetura
