-- View: pmaq."RESULTADO_ODONTO"

DROP VIEW if exists pmaq."RESULTADO_ODONTO";

CREATE OR REPLACE VIEW pmaq."RESULTADO_ODONTO" AS 
 SELECT tb_dim_municipio.no_municipio,
nu_cnes,
    uu.no_unidade_saude,
    pp.nu_cns,
no_profissional,
    cc.no_cbo,
    cc.nu_cbo,
    tt.nu_ano,
    count(*) AS atendimentos,
    count(
        CASE
            WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text THEN 1
            ELSE NULL::integer
        END) AS domicilio,
    count(
        CASE
            WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = 'Consulta agendada'::text THEN 1
            ELSE NULL::integer
        END) AS agendada,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_gestante = 1 THEN 1
            ELSE NULL::integer
        END) AS gestante,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'mm'::text)::integer = tt.nu_mes AND p.nu_cns::text = pp.nu_cns::text) AS reuniao,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto::text = 'Primeira consulta odontológica programática'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_odonto tb_fat_atendimento_odonto_1
             JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto_1.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto_1.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto_1.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
             JOIN tb_dim_cbo c ON tb_fat_atendimento_odonto_1.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atendimento_odonto_1.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND t.nu_mes = tt.nu_mes) AS primeira,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_conduta_tratamento_concluid = 1 THEN 1
            ELSE NULL::integer
        END) AS tratamento_jan,
    ( SELECT sum(tb_fat_atend_odonto_proced.qt_procedimentos) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND t.nu_mes = tt.nu_mes) AS procedimentos,
    ( SELECT COALESCE(sum(
                CASE
                    WHEN tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica::text = 'ESCOVAÇÃO DENTAL SUPERVISIONADA'::text THEN tb_cds_ficha_ativ_col.qt_participante_ativ
                    ELSE 0
                END), 0::bigint) AS supervisionado
           FROM tb_cds_ativ_col_pratica
             JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica = rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica
             JOIN tb_cds_ficha_ativ_col ON rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col = tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
             JOIN tb_dim_unidade_saude u ON p.nu_cnes::text = u.nu_cnes::text
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'mm'::text)::integer = tt.nu_mes AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS supervisionada,
    ( SELECT i.total_pessoas_cadast
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.total_pessoas_cadast, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS total_pessoas_cadast,
    ( SELECT i.populacao_feminina_15anos
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.populacao_feminina_15anos, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS populacao_feminina_15anos,
    ( SELECT i.criancas_menor_2anos
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.criancas_menor_2anos, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS criancas_menor_2anos,
    ( SELECT i.total_familias_cadastradas
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.total_familias_cadastradas, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS total_familias_cadastradas,
    ( SELECT i.pop_menor_1
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.pop_menor_1, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS pop_menor_1,
    ( SELECT i.pop_1_a_4anos
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.pop_1_a_4anos, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS pop_1_a_4anos,
    ( SELECT i.pop_menor_5anos
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.pop_menor_5anos, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS pop_menor_5anos,
    ( SELECT i.pop_maior_18anos
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.pop_maior_18anos, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS pop_maior_18anos,
    ( SELECT i.gestantes
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.gestantes, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS gestantes,
    ( SELECT i.hipertensos
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.hipertensos, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS hipertensos,
    ( SELECT i.diabeticos
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.diabeticos, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS diabeticos,
    ( SELECT i.obesos
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.obesos, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS obesos,
    ( SELECT i.tuberculose
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.tuberculose, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS tuberculose,
    ( SELECT i.hanseniase
           FROM pmaq.tb_informacao i
          WHERE i.nu_cnes::text = uu.nu_cnes::text
          GROUP BY i.hanseniase, i.nu_cnes, i.dt_infor
          ORDER BY i.dt_infor DESC
         LIMIT 1) AS hanseniase
   FROM tb_fat_atendimento_odonto
     JOIN tb_dim_profissional pp ON tb_fat_atendimento_odonto.co_dim_profissional_1 = pp.co_seq_dim_profissional
     JOIN tb_dim_tempo tt ON tb_fat_atendimento_odonto.co_dim_tempo = tt.co_seq_dim_tempo
     JOIN tb_dim_cbo cc ON tb_fat_atendimento_odonto.co_dim_cbo_1 = cc.co_seq_dim_cbo
     JOIN tb_dim_municipio ON tb_fat_atendimento_odonto.co_dim_municipio = tb_dim_municipio.co_seq_dim_municipio
     JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_odonto.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
     JOIN tb_dim_unidade_saude uu ON tb_fat_atendimento_odonto.co_dim_unidade_saude_1 = uu.co_seq_dim_unidade_saude
     JOIN tb_dim_local_atendimento ON tb_fat_atendimento_odonto.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
  WHERE cc.nu_cbo::text = '223293'::text
  GROUP BY tb_dim_municipio.no_municipio, uu.no_unidade_saude, pp.nu_cns, pp.no_profissional, cc.nu_cbo, cc.no_cbo, tt.nu_ano, tt.nu_mes, uu.nu_cnes;

ALTER TABLE pmaq."RESULTADO_ODONTO"
  OWNER TO postgres;
GRANT ALL ON TABLE pmaq."RESULTADO_ODONTO" TO postgres;
GRANT ALL ON TABLE pmaq."RESULTADO_ODONTO" TO pmaq;
