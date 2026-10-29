library ieee;
use ieee.std_logic_1164.all;

entity maquina_de_estados is
    
  port ( ck         : in  std_logic;
         B_on       : in  std_logic;
         Clr        : in  std_logic;

        -- Condições fornecidas pelo Dataway
         Vtot_eq_0  : in  std_logic;
         empty      : in  std_logic;
         Change_on  : in  std_logic;

        -- Controles enviados ao Dataway
         Clear      : out std_logic;
         Load_Ref   : out std_logic;
         Load_V     : out std_logic;
         Load_Prov  : out std_logic;
         Change     : out std_logic;

        -- Sinalização externa
         Return_out : out std_logic;
         L          : out std_logic
  
  );

end entity maquina_de_estados;

architecture controle of maquina_de_estados is

    type state_type is ( ST_I, ST_R, ST_V, ST_T, ST_S, ST_E, ST_L );

    signal estado_atual : state_type := ST_I;
    signal proximo_estado : state_type;

begin

    -- Memória de estado
    process (ck)
    begin
        if rising_edge(ck) then
            estado_atual <= proximo_estado;
        end if;
    end process;

    -- Transições e saídas
    process ( estado_atual, B_on, Clr, Vtot_eq_0, empty, Change_on )
    
    begin
      
        proximo_estado <= estado_atual;

        Clear      <= '0';
        Load_Ref   <= '0';
        Load_V     <= '0';
        Load_Prov  <= '0';
        Change     <= '0';
        Return_out <= '0';
        L          <= '0';

        case estado_atual is

            -- Inicial: restaura o banco provisório
            when ST_I =>
                Load_Prov <= '1';

                -- Prioridade para a reinicialização
                if Clr = '0' then
                    proximo_estado <= ST_R;
                elsif B_on = '1' then
                    proximo_estado <= ST_V;
                end if;

            -- Reinicialização/reabastecimento
            when ST_R =>
                Clear <= '1';
                L     <= '1';

                if Clr = '1' then
                    proximo_estado <= ST_I;
                end if;

            -- Carregamento do valor solicitado
            when ST_V =>
                Load_V <= '1';
                L      <= '1';

                proximo_estado <= ST_T;

            -- Troca e avaliação das condições
            when ST_T =>
                Change <= '1';
                L      <= '1';

                -- Troco concluído
                if Vtot_eq_0 = '1'
                   and Change_on = '0' then

                    proximo_estado <= ST_L;

                -- Erro: valor restante e banco vazio
                elsif Vtot_eq_0 = '0'
                      and empty = '1'
                      and Change_on = '0' then

                    proximo_estado <= ST_E;

                -- Existe moeda para continuar
                elsif Vtot_eq_0 = '0'
                      and empty = '0'
                      and Change_on = '1' then

                    proximo_estado <= ST_S;

                end if;

            -- Atualização efetuada pelo Dataway
            when ST_S =>
                L <= '1';
                proximo_estado <= ST_T;

            -- Erro: devolução do valor de entrada
            when ST_E =>
                Return_out <= '1';

                proximo_estado <= ST_I;

            -- Sucesso: confirma o estoque restante
            when ST_L =>
                Load_Ref <= '1';

                proximo_estado <= ST_I;

        end case;
    end process;

end architecture controle;
