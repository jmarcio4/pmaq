-- View: pmaq."RESULTADO_ENFERMEIRO"

DROP VIEW if exists pmaq."RESULTADO_ENFERMEIRO";

CREATE OR REPLACE VIEW pmaq."RESULTADO_ENFERMEIRO" AS 
 SELECT tb_dim_municipio.no_municipio,
    tb_dim_unidade_saude.no_unidade_saude,
    tb_dim_unidade_saude.nu_cnes,
    tb_dim_profissional.nu_cns,
    tb_dim_profissional.no_profissional,
    tb_dim_cbo.no_cbo,
    tb_dim_cbo.nu_cbo,
    tt.nu_ano,
    tt.nu_mes,
    ( SELECT count(*) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_profissional p ON tb_fat_atendimento_individual.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_cbo tb_dim_cbo_1 ON tb_fat_atendimento_individual.co_dim_cbo_1 = tb_dim_cbo_1.co_seq_dim_cbo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE p.nu_cns::text = tb_dim_profissional.nu_cns::text AND t.nu_ano = tt.nu_ano AND t.nu_mes = tt.nu_mes) AS atendimentos,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'PUERICULTURA%'::text THEN 1
            ELSE NULL::integer
        END) AS puericultura,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'GRAVIDEZ%'::text THEN 1
            ELSE NULL::integer
        END) + count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text = 'PRÉ-NATAL'::text THEN 1
            ELSE NULL::integer
        END) AS pre_natal,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text)::integer = tt.nu_mes AND p.nu_cns::text = tb_dim_profissional.nu_cns::text) AS reuniao,
    ( SELECT count(
                CASE
                    WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_profissional p ON tb_fat_atendimento_individual.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_local_atendimento ON tb_fat_atendimento_individual.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
          WHERE p.nu_cns::text = tb_dim_profissional.nu_cns::text AND tt.nu_ano = t.nu_ano AND t.nu_mes = tt.nu_mes) AS visita_domiciliar,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'DIABETES%'::text THEN 1
            ELSE NULL::integer
        END) AS diabetes,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'HIPERTENSÃO%'::text THEN 1
            ELSE NULL::integer
        END) AS hipertensao,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'OBESIDADE%'::text THEN 1
            ELSE NULL::integer
        END) AS obsidade,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = ANY (ARRAY['Atendimento de urgência'::character varying::text, 'Consulta no dia'::character varying::text]) THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_profissional p ON tb_fat_atendimento_individual.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_cbo tb_dim_cbo_1 ON tb_fat_atendimento_individual.co_dim_cbo_1 = tb_dim_cbo_1.co_seq_dim_cbo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE p.nu_cns::text = tb_dim_profissional.nu_cns::text AND tt.nu_ano = t.nu_ano AND t.nu_mes = tt.nu_mes) AS demanda_jan,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = ANY (ARRAY['Consulta agendada'::character varying::text, 'Consulta agendada programada / Cuidado continuado'::character varying::text]) THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_profissional p ON tb_fat_atendimento_individual.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_cbo tb_dim_cbo_1 ON tb_fat_atendimento_individual.co_dim_cbo_1 = tb_dim_cbo_1.co_seq_dim_cbo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE p.nu_cns::text = tb_dim_profissional.nu_cns::text AND tt.nu_ano = t.nu_ano AND t.nu_mes = tt.nu_mes) AS agendada,
    ( SELECT count(
                CASE
                    WHEN tb_dim_procedimento.ds_proced::text ~~ 'COLETA DE CITOPATOLÓGICO DE COLO UTERINO%'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_proced_atend_proced
             JOIN tb_dim_procedimento ON tb_fat_proced_atend_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_tempo t ON tb_fat_proced_atend_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_profissional p ON tb_fat_proced_atend_proced.co_dim_profissional = p.co_seq_dim_profissional
             JOIN tb_dim_unidade_saude u ON tb_fat_proced_atend_proced.co_dim_unidade_saude = u.co_seq_dim_unidade_saude
             JOIN tb_dim_cbo c ON tb_fat_proced_atend_proced.co_dim_cbo = c.co_seq_dim_cbo
          WHERE p.nu_cns::text = tb_dim_profissional.nu_cns::text AND tt.nu_ano = t.nu_ano AND t.nu_mes = tt.nu_mes) AS citologia
   FROM tb_fat_atd_ind_problemas
     JOIN tb_dim_cbo ON tb_fat_atd_ind_problemas.co_dim_cbo_1 = tb_dim_cbo.co_seq_dim_cbo
     JOIN tb_dim_profissional ON tb_fat_atd_ind_problemas.co_dim_profissional_1 = tb_dim_profissional.co_seq_dim_profissional
     JOIN tb_dim_ciap ON tb_fat_atd_ind_problemas.co_dim_ciap = tb_dim_ciap.co_seq_dim_ciap
     JOIN tb_dim_tempo tt ON tb_fat_atd_ind_problemas.co_dim_tempo = tt.co_seq_dim_tempo
     JOIN tb_dim_municipio ON tb_fat_atd_ind_problemas.co_dim_municipio = tb_dim_municipio.co_seq_dim_municipio
     JOIN tb_dim_unidade_saude ON tb_fat_atd_ind_problemas.co_dim_unidade_saude_1 = tb_dim_unidade_saude.co_seq_dim_unidade_saude
  WHERE tb_dim_cbo.no_cbo::text = 'ENFERMEIRO DA ESTRATÉGIA DE SAÚDE DA FAMÍLIA'::text
  GROUP BY tb_dim_municipio.no_municipio, tb_dim_unidade_saude.no_unidade_saude, tb_dim_unidade_saude.nu_cnes, tb_dim_profissional.nu_cns, tb_dim_profissional.no_profissional, tb_dim_cbo.no_cbo, tt.nu_ano, tt.nu_mes, tb_dim_cbo.nu_cbo;

ALTER TABLE pmaq."RESULTADO_ENFERMEIRO"
  OWNER TO postgres;
GRANT ALL ON TABLE pmaq."RESULTADO_ENFERMEIRO" TO postgres;
GRANT ALL ON TABLE pmaq."RESULTADO_ENFERMEIRO" TO pmaq;
