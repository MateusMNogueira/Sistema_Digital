-- ============================================================================
-- mux4x1.vhd
-- Multiplexador 4x1 de 1 bit descrito pela sua equação em soma de produtos.
-- s1 s0 = 00 -> i0 | 01 -> i1 | 10 -> i2 | 11 -> i3
-- ============================================================================

library ieee;                         -- usa a biblioteca padrão IEEE
use ieee.std_logic_1164.all;          -- habilita o tipo std_logic

entity mux4x1 is                      -- declara a entidade do multiplexador
  port (
    i0 : in  std_logic;               -- entrada de dado 0 (selecionada com s1s0 = 00)
    i1 : in  std_logic;               -- entrada de dado 1 (selecionada com s1s0 = 01)
    i2 : in  std_logic;               -- entrada de dado 2 (selecionada com s1s0 = 10)
    i3 : in  std_logic;               -- entrada de dado 3 (selecionada com s1s0 = 11)
    s1 : in  std_logic;               -- bit mais significativo da seleção
    s0 : in  std_logic;               -- bit menos significativo da seleção
    y  : out std_logic                -- saída do multiplexador
  );
end mux4x1;                           -- fim da declaração da entidade

architecture fluxo_dados of mux4x1 is -- descrição por equação booleana
begin
  y <= ((not s1) and (not s0) and i0) -- passa i0 quando s1 = 0 e s0 = 0
    or ((not s1) and s0 and i1)       -- passa i1 quando s1 = 0 e s0 = 1
    or (s1 and (not s0) and i2)       -- passa i2 quando s1 = 1 e s0 = 0
    or (s1 and s0 and i3);            -- passa i3 quando s1 = 1 e s0 = 1
end fluxo_dados;                      -- fim da arquitetura
