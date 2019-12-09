

DROP VIEW IF EXISTS pmaq."ODONTOLOGIA";

CREATE OR REPLACE VIEW pmaq."ODONTOLOGIA" AS 
 SELECT tb_dim_municipio.no_municipio,
    uu.nu_cnes,
    uu.no_unidade_saude,
    pp.nu_cns,
    pp.no_profissional,
    cc.no_cbo,
    cc.nu_cbo,
    tt.nu_ano,
    count(
        CASE
            WHEN tt.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) AS atendimento_jan,
    count(
        CASE
            WHEN tt.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) AS atendimento_fev,
    count(
        CASE
            WHEN tt.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) AS atendimento_mar,
    count(
        CASE
            WHEN tt.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) AS atendimento_abr,
    count(
        CASE
            WHEN tt.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) AS atendimento_mai,
    count(
        CASE
            WHEN tt.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) AS atendimento_jun,
    count(
        CASE
            WHEN tt.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) AS atendimento_jul,
    count(
        CASE
            WHEN tt.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) AS atendimento_ago,
    count(
        CASE
            WHEN tt.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) AS atendimento_set,
    count(
        CASE
            WHEN tt.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) AS atendimento_out,
    count(
        CASE
            WHEN tt.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) AS atendimento_nov,
    count(
        CASE
            WHEN tt.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) AS atendimento_dez,
    count(
        CASE
            WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND tt.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) AS domi_jan,
    count(
        CASE
            WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND tt.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) AS domi_fev,
    count(
        CASE
            WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND tt.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) AS domi_mar,
    count(
        CASE
            WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND tt.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) AS domi_abr,
    count(
        CASE
            WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND tt.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) AS domi_mai,
    count(
        CASE
            WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND tt.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) AS domi_jun,
    count(
        CASE
            WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND tt.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) AS domi_jul,
    count(
        CASE
            WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND tt.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) AS domi_ago,
    count(
        CASE
            WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND tt.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) AS domi_set,
    count(
        CASE
            WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND tt.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) AS domi_out,
    count(
        CASE
            WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND tt.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) AS domi_nov,
    count(
        CASE
            WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND tt.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) AS domi_dez,
    count(
        CASE
            WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = 'Consulta agendada'::text AND tt.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) AS agendada_jan,
    count(
        CASE
            WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = 'Consulta agendada'::text AND tt.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) AS agendada_fev,
    count(
        CASE
            WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = 'Consulta agendada'::text AND tt.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) AS agendada_mar,
    count(
        CASE
            WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = 'Consulta agendada'::text AND tt.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) AS agendada_abr,
    count(
        CASE
            WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = 'Consulta agendada'::text AND tt.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) AS agendada_mai,
    count(
        CASE
            WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = 'Consulta agendada'::text AND tt.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) AS agendada_jun,
    count(
        CASE
            WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = 'Consulta agendada'::text AND tt.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) AS agendada_jul,
    count(
        CASE
            WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = 'Consulta agendada'::text AND tt.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) AS agendada_ag,
    count(
        CASE
            WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = 'Consulta agendada'::text AND tt.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) AS agendada_set,
    count(
        CASE
            WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = 'Consulta agendada'::text AND tt.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) AS agendada_out,
    count(
        CASE
            WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = 'Consulta agendada'::text AND tt.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) AS agendada_nov,
    count(
        CASE
            WHEN tb_dim_tipo_atendimento.ds_tipo_atendimento::text = 'Consulta agendada'::text AND tt.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) AS agendada_dez,
    count(
        CASE
            WHEN tt.nu_mes = 1 AND tb_fat_atendimento_odonto.st_gestante = 1 THEN 1
            ELSE NULL::integer
        END) AS gestante_jan,
    count(
        CASE
            WHEN tt.nu_mes = 2 AND tb_fat_atendimento_odonto.st_gestante = 1 THEN 1
            ELSE NULL::integer
        END) AS gestante_fev,
    count(
        CASE
            WHEN tt.nu_mes = 3 AND tb_fat_atendimento_odonto.st_gestante = 1 THEN 1
            ELSE NULL::integer
        END) AS gestante_mar,
    count(
        CASE
            WHEN tt.nu_mes = 4 AND tb_fat_atendimento_odonto.st_gestante = 1 THEN 1
            ELSE NULL::integer
        END) AS gestante_abr,
    count(
        CASE
            WHEN tt.nu_mes = 5 AND tb_fat_atendimento_odonto.st_gestante = 1 THEN 1
            ELSE NULL::integer
        END) AS gestante_mai,
    count(
        CASE
            WHEN tt.nu_mes = 6 AND tb_fat_atendimento_odonto.st_gestante = 1 THEN 1
            ELSE NULL::integer
        END) AS gestante_jun,
    count(
        CASE
            WHEN tt.nu_mes = 7 AND tb_fat_atendimento_odonto.st_gestante = 1 THEN 1
            ELSE NULL::integer
        END) AS gestante_julho,
    count(
        CASE
            WHEN tt.nu_mes = 8 AND tb_fat_atendimento_odonto.st_gestante = 1 THEN 1
            ELSE NULL::integer
        END) AS gestante_ago,
    count(
        CASE
            WHEN tt.nu_mes = 9 AND tb_fat_atendimento_odonto.st_gestante = 1 THEN 1
            ELSE NULL::integer
        END) AS gestante_setembro,
    count(
        CASE
            WHEN tt.nu_mes = 10 AND tb_fat_atendimento_odonto.st_gestante = 1 THEN 1
            ELSE NULL::integer
        END) AS gestante_out,
    count(
        CASE
            WHEN tt.nu_mes = 11 AND tb_fat_atendimento_odonto.st_gestante = 1 THEN 1
            ELSE NULL::integer
        END) AS gestante_nov,
    count(
        CASE
            WHEN tt.nu_mes = 12 AND tb_fat_atendimento_odonto.st_gestante = 1 THEN 1
            ELSE NULL::integer
        END) AS gestante_dez,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '01'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text) AS reuni_jan,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '02'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text) AS reuni_fev,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '03'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text) AS reuni_mar,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '04'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text) AS reuni_abr,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '05'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text) AS reuni_mai,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '06'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text) AS reuni_jun,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '07'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text) AS reuni_jul,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '08'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text) AS reuni_ago,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '09'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text) AS reuni_set,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '10'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text) AS reuni_out,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '11'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text) AS reuni_nov,
    ( SELECT count(
                CASE
                    WHEN tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col::text = 'REUNIÃO DE EQUIPE'::text AND to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '12'::text THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_cds_tipo_ativ_col
             JOIN tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text) AS reuni_dez,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto::text = 'Primeira consulta odontológica programática'::text AND t.nu_mes = 1 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_odonto tb_fat_atendimento_odonto_1
             JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto_1.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto_1.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto_1.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
             JOIN tb_dim_cbo c ON tb_fat_atendimento_odonto_1.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atendimento_odonto_1.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS primeira_jan,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto::text = 'Primeira consulta odontológica programática'::text AND t.nu_mes = 2 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_odonto tb_fat_atendimento_odonto_1
             JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto_1.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto_1.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto_1.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
             JOIN tb_dim_cbo c ON tb_fat_atendimento_odonto_1.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atendimento_odonto_1.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS primeira_fev,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto::text = 'Primeira consulta odontológica programática'::text AND t.nu_mes = 3 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_odonto tb_fat_atendimento_odonto_1
             JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto_1.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto_1.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto_1.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
             JOIN tb_dim_cbo c ON tb_fat_atendimento_odonto_1.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atendimento_odonto_1.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS primeira_mar,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto::text = 'Primeira consulta odontológica programática'::text AND t.nu_mes = 4 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_odonto tb_fat_atendimento_odonto_1
             JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto_1.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto_1.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto_1.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
             JOIN tb_dim_cbo c ON tb_fat_atendimento_odonto_1.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atendimento_odonto_1.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS primeira_abr,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto::text = 'Primeira consulta odontológica programática'::text AND t.nu_mes = 5 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_odonto tb_fat_atendimento_odonto_1
             JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto_1.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto_1.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto_1.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
             JOIN tb_dim_cbo c ON tb_fat_atendimento_odonto_1.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atendimento_odonto_1.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS primeira_mai,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto::text = 'Primeira consulta odontológica programática'::text AND t.nu_mes = 6 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_odonto tb_fat_atendimento_odonto_1
             JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto_1.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto_1.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto_1.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
             JOIN tb_dim_cbo c ON tb_fat_atendimento_odonto_1.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atendimento_odonto_1.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS primeira_jun,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto::text = 'Primeira consulta odontológica programática'::text AND t.nu_mes = 7 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_odonto tb_fat_atendimento_odonto_1
             JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto_1.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto_1.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto_1.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
             JOIN tb_dim_cbo c ON tb_fat_atendimento_odonto_1.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atendimento_odonto_1.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS primeira_jul,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto::text = 'Primeira consulta odontológica programática'::text AND t.nu_mes = 8 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_odonto tb_fat_atendimento_odonto_1
             JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto_1.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto_1.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto_1.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
             JOIN tb_dim_cbo c ON tb_fat_atendimento_odonto_1.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atendimento_odonto_1.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS primeira_ago,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto::text = 'Primeira consulta odontológica programática'::text AND t.nu_mes = 9 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_odonto tb_fat_atendimento_odonto_1
             JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto_1.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto_1.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto_1.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
             JOIN tb_dim_cbo c ON tb_fat_atendimento_odonto_1.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atendimento_odonto_1.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS primeira_set,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto::text = 'Primeira consulta odontológica programática'::text AND t.nu_mes = 10 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_odonto tb_fat_atendimento_odonto_1
             JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto_1.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto_1.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto_1.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
             JOIN tb_dim_cbo c ON tb_fat_atendimento_odonto_1.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atendimento_odonto_1.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS primeira_out,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto::text = 'Primeira consulta odontológica programática'::text AND t.nu_mes = 11 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_odonto tb_fat_atendimento_odonto_1
             JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto_1.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto_1.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto_1.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
             JOIN tb_dim_cbo c ON tb_fat_atendimento_odonto_1.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atendimento_odonto_1.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS primeira_nov,
    ( SELECT count(
                CASE
                    WHEN tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto::text = 'Primeira consulta odontológica programática'::text AND t.nu_mes = 12 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_odonto tb_fat_atendimento_odonto_1
             JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto_1.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto_1.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto_1.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
             JOIN tb_dim_cbo c ON tb_fat_atendimento_odonto_1.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atendimento_odonto_1.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS primeira_dez,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_conduta_tratamento_concluid = 1 AND tt.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) AS tratamento_jan,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_conduta_tratamento_concluid = 1 AND tt.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) AS tratamento_fev,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_conduta_tratamento_concluid = 1 AND tt.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) AS tratamento_mar,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_conduta_tratamento_concluid = 1 AND tt.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) AS tratamento_abr,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_conduta_tratamento_concluid = 1 AND tt.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) AS tratamento_mai,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_conduta_tratamento_concluid = 1 AND tt.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) AS tratamento_jun,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_conduta_tratamento_concluid = 1 AND tt.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) AS tratamento_jul,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_conduta_tratamento_concluid = 1 AND tt.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) AS tratamento_ago,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_conduta_tratamento_concluid = 1 AND tt.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) AS tratamento_set,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_conduta_tratamento_concluid = 1 AND tt.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) AS tratamento_out,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_conduta_tratamento_concluid = 1 AND tt.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) AS tratamento_nov,
    count(
        CASE
            WHEN tb_fat_atendimento_odonto.st_conduta_tratamento_concluid = 1 AND tt.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) AS tratamento_dez,
    ( SELECT sum(
                CASE
                    WHEN t.nu_mes = 1 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS proced_jan,
    ( SELECT sum(
                CASE
                    WHEN t.nu_mes = 2 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS proced_fev,
    ( SELECT sum(
                CASE
                    WHEN t.nu_mes = 3 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS proced_mar,
    ( SELECT sum(
                CASE
                    WHEN t.nu_mes = 4 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS proced_abr,
    ( SELECT sum(
                CASE
                    WHEN t.nu_mes = 5 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS proced_mai,
    ( SELECT sum(
                CASE
                    WHEN t.nu_mes = 6 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS proced_jun,
    ( SELECT sum(
                CASE
                    WHEN t.nu_mes = 7 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS proced_jul,
    ( SELECT sum(
                CASE
                    WHEN t.nu_mes = 8 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS proced_ago,
    ( SELECT sum(
                CASE
                    WHEN t.nu_mes = 9 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS proced_set,
    ( SELECT sum(
                CASE
                    WHEN t.nu_mes = 11 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS proced_nov,
    ( SELECT sum(
                CASE
                    WHEN t.nu_mes = 12 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text) AS proced_dez,
    (( SELECT sum(
                CASE
                    WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '01'::text AND tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica::text = 'ESCOVAÇÃO DENTAL SUPERVISIONADA'::text THEN tb_cds_ficha_ativ_col.qt_participante_ativ
                    ELSE 0
                END) AS nov_supervisionada
           FROM tb_cds_ativ_col_pratica
             JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica = rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica
             JOIN tb_cds_ficha_ativ_col ON rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col = tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
             JOIN tb_dim_unidade_saude u ON p.nu_cnes::text = u.nu_cnes::text
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text)) + (( SELECT sum(
                CASE
                    WHEN t.nu_mes = 1 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND tb_dim_procedimento.ds_proced::text = 'AÇÃO COLETIVA DE ESCOVAÇÃO DENTAL SUPERVISIONADA'::text)) AS super_jan,
    (( SELECT sum(
                CASE
                    WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '02'::text AND tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica::text = 'ESCOVAÇÃO DENTAL SUPERVISIONADA'::text THEN tb_cds_ficha_ativ_col.qt_participante_ativ
                    ELSE 0
                END) AS nov_supervisionada
           FROM tb_cds_ativ_col_pratica
             JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica = rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica
             JOIN tb_cds_ficha_ativ_col ON rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col = tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
             JOIN tb_dim_unidade_saude u ON p.nu_cnes::text = u.nu_cnes::text
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text)) + (( SELECT sum(
                CASE
                    WHEN t.nu_mes = 2 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND tb_dim_procedimento.ds_proced::text = 'AÇÃO COLETIVA DE ESCOVAÇÃO DENTAL SUPERVISIONADA'::text)) AS super_fev,
    (( SELECT sum(
                CASE
                    WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '03'::text AND tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica::text = 'ESCOVAÇÃO DENTAL SUPERVISIONADA'::text THEN tb_cds_ficha_ativ_col.qt_participante_ativ
                    ELSE 0
                END) AS nov_supervisionada
           FROM tb_cds_ativ_col_pratica
             JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica = rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica
             JOIN tb_cds_ficha_ativ_col ON rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col = tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
             JOIN tb_dim_unidade_saude u ON p.nu_cnes::text = u.nu_cnes::text
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text)) + (( SELECT sum(
                CASE
                    WHEN t.nu_mes = 3 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND tb_dim_procedimento.ds_proced::text = 'AÇÃO COLETIVA DE ESCOVAÇÃO DENTAL SUPERVISIONADA'::text)) AS super_mar,
    (( SELECT sum(
                CASE
                    WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '04'::text AND tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica::text = 'ESCOVAÇÃO DENTAL SUPERVISIONADA'::text THEN tb_cds_ficha_ativ_col.qt_participante_ativ
                    ELSE 0
                END) AS nov_supervisionada
           FROM tb_cds_ativ_col_pratica
             JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica = rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica
             JOIN tb_cds_ficha_ativ_col ON rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col = tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
             JOIN tb_dim_unidade_saude u ON p.nu_cnes::text = u.nu_cnes::text
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text)) + (( SELECT sum(
                CASE
                    WHEN t.nu_mes = 4 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND tb_dim_procedimento.ds_proced::text = 'AÇÃO COLETIVA DE ESCOVAÇÃO DENTAL SUPERVISIONADA'::text)) AS super_abr,
    (( SELECT sum(
                CASE
                    WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '05'::text AND tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica::text = 'ESCOVAÇÃO DENTAL SUPERVISIONADA'::text THEN tb_cds_ficha_ativ_col.qt_participante_ativ
                    ELSE 0
                END) AS nov_supervisionada
           FROM tb_cds_ativ_col_pratica
             JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica = rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica
             JOIN tb_cds_ficha_ativ_col ON rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col = tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
             JOIN tb_dim_unidade_saude u ON p.nu_cnes::text = u.nu_cnes::text
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text)) + (( SELECT sum(
                CASE
                    WHEN t.nu_mes = 5 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND tb_dim_procedimento.ds_proced::text = 'AÇÃO COLETIVA DE ESCOVAÇÃO DENTAL SUPERVISIONADA'::text)) AS super_mai,
    (( SELECT sum(
                CASE
                    WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '06'::text AND tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica::text = 'ESCOVAÇÃO DENTAL SUPERVISIONADA'::text THEN tb_cds_ficha_ativ_col.qt_participante_ativ
                    ELSE 0
                END) AS nov_supervisionada
           FROM tb_cds_ativ_col_pratica
             JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica = rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica
             JOIN tb_cds_ficha_ativ_col ON rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col = tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
             JOIN tb_dim_unidade_saude u ON p.nu_cnes::text = u.nu_cnes::text
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text)) + (( SELECT sum(
                CASE
                    WHEN t.nu_mes = 6 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND tb_dim_procedimento.ds_proced::text = 'AÇÃO COLETIVA DE ESCOVAÇÃO DENTAL SUPERVISIONADA'::text)) AS super_jun,
    (( SELECT sum(
                CASE
                    WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '07'::text AND tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica::text = 'ESCOVAÇÃO DENTAL SUPERVISIONADA'::text THEN tb_cds_ficha_ativ_col.qt_participante_ativ
                    ELSE 0
                END) AS nov_supervisionada
           FROM tb_cds_ativ_col_pratica
             JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica = rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica
             JOIN tb_cds_ficha_ativ_col ON rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col = tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
             JOIN tb_dim_unidade_saude u ON p.nu_cnes::text = u.nu_cnes::text
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text)) + (( SELECT sum(
                CASE
                    WHEN t.nu_mes = 7 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND tb_dim_procedimento.ds_proced::text = 'AÇÃO COLETIVA DE ESCOVAÇÃO DENTAL SUPERVISIONADA'::text)) AS super_jul,
    (( SELECT sum(
                CASE
                    WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '08'::text AND tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica::text = 'ESCOVAÇÃO DENTAL SUPERVISIONADA'::text THEN tb_cds_ficha_ativ_col.qt_participante_ativ
                    ELSE 0
                END) AS nov_supervisionada
           FROM tb_cds_ativ_col_pratica
             JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica = rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica
             JOIN tb_cds_ficha_ativ_col ON rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col = tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
             JOIN tb_dim_unidade_saude u ON p.nu_cnes::text = u.nu_cnes::text
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text)) + (( SELECT sum(
                CASE
                    WHEN t.nu_mes = 8 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND tb_dim_procedimento.ds_proced::text = 'AÇÃO COLETIVA DE ESCOVAÇÃO DENTAL SUPERVISIONADA'::text)) AS super_ago,
    (( SELECT sum(
                CASE
                    WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '09'::text AND tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica::text = 'ESCOVAÇÃO DENTAL SUPERVISIONADA'::text THEN tb_cds_ficha_ativ_col.qt_participante_ativ
                    ELSE 0
                END) AS nov_supervisionada
           FROM tb_cds_ativ_col_pratica
             JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica = rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica
             JOIN tb_cds_ficha_ativ_col ON rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col = tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
             JOIN tb_dim_unidade_saude u ON p.nu_cnes::text = u.nu_cnes::text
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text)) + (( SELECT sum(
                CASE
                    WHEN t.nu_mes = 9 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND tb_dim_procedimento.ds_proced::text = 'AÇÃO COLETIVA DE ESCOVAÇÃO DENTAL SUPERVISIONADA'::text)) AS super_set,
    (( SELECT sum(
                CASE
                    WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '10'::text AND tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica::text = 'ESCOVAÇÃO DENTAL SUPERVISIONADA'::text THEN tb_cds_ficha_ativ_col.qt_participante_ativ
                    ELSE 0
                END) AS super_out
           FROM tb_cds_ativ_col_pratica
             JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica = rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica
             JOIN tb_cds_ficha_ativ_col ON rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col = tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
             JOIN tb_dim_unidade_saude u ON p.nu_cnes::text = u.nu_cnes::text
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text)) + (( SELECT sum(
                CASE
                    WHEN t.nu_mes = 10 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND tb_dim_procedimento.ds_proced::text = 'AÇÃO COLETIVA DE ESCOVAÇÃO DENTAL SUPERVISIONADA'::text)) AS super_out,
    (( SELECT sum(
                CASE
                    WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '11'::text AND tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica::text = 'ESCOVAÇÃO DENTAL SUPERVISIONADA'::text THEN tb_cds_ficha_ativ_col.qt_participante_ativ
                    ELSE 0
                END) AS supervisionada_nov
           FROM tb_cds_ativ_col_pratica
             JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica = rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica
             JOIN tb_cds_ficha_ativ_col ON rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col = tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
             JOIN tb_dim_unidade_saude u ON p.nu_cnes::text = u.nu_cnes::text
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text)) + (( SELECT sum(
                CASE
                    WHEN t.nu_mes = 11 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND tb_dim_procedimento.ds_proced::text = 'AÇÃO COLETIVA DE ESCOVAÇÃO DENTAL SUPERVISIONADA'::text)) AS super_nov,
    (( SELECT sum(
                CASE
                    WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '12'::text AND tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica::text = 'ESCOVAÇÃO DENTAL SUPERVISIONADA'::text THEN tb_cds_ficha_ativ_col.qt_participante_ativ
                    ELSE 0
                END) AS supervisionada_dez
           FROM tb_cds_ativ_col_pratica
             JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica = rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica
             JOIN tb_cds_ficha_ativ_col ON rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col = tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col
             JOIN tb_cds_prof p ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = p.co_seq_cds_prof
             JOIN tb_dim_unidade_saude u ON p.nu_cnes::text = u.nu_cnes::text
          WHERE to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text)) + (( SELECT sum(
                CASE
                    WHEN t.nu_mes = 12 THEN tb_fat_atend_odonto_proced.qt_procedimentos
                    ELSE 0
                END) AS sum
           FROM tb_fat_atend_odonto_proced
             JOIN tb_dim_profissional p ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = p.co_seq_dim_profissional
             JOIN tb_dim_tempo t ON tb_fat_atend_odonto_proced.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
             JOIN tb_dim_cbo c ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = c.co_seq_dim_cbo
             JOIN tb_dim_unidade_saude u ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
          WHERE t.nu_ano = tt.nu_ano AND p.nu_cns::text = pp.nu_cns::text AND u.nu_cnes::text = uu.nu_cnes::text AND tb_dim_procedimento.ds_proced::text = 'AÇÃO COLETIVA DE ESCOVAÇÃO DENTAL SUPERVISIONADA'::text)) AS super_dez
   FROM tb_fat_atendimento_odonto
     JOIN tb_dim_profissional pp ON tb_fat_atendimento_odonto.co_dim_profissional_1 = pp.co_seq_dim_profissional
     JOIN tb_dim_tempo tt ON tb_fat_atendimento_odonto.co_dim_tempo = tt.co_seq_dim_tempo
     JOIN tb_dim_cbo cc ON tb_fat_atendimento_odonto.co_dim_cbo_1 = cc.co_seq_dim_cbo
     JOIN tb_dim_municipio ON tb_fat_atendimento_odonto.co_dim_municipio = tb_dim_municipio.co_seq_dim_municipio
     JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_odonto.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
     JOIN tb_dim_unidade_saude uu ON tb_fat_atendimento_odonto.co_dim_unidade_saude_1 = uu.co_seq_dim_unidade_saude
     JOIN tb_dim_local_atendimento ON tb_fat_atendimento_odonto.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
  WHERE cc.nu_cbo::text = '223293'::text
  GROUP BY tb_dim_municipio.no_municipio, uu.no_unidade_saude, pp.nu_cns, pp.no_profissional, cc.nu_cbo, cc.no_cbo, tt.nu_ano, uu.nu_cnes;

ALTER TABLE pmaq."ODONTOLOGIA"
  OWNER TO postgres;
GRANT ALL ON TABLE pmaq."ODONTOLOGIA" TO postgres;
GRANT ALL ON TABLE pmaq."ODONTOLOGIA" TO pmaq;
GRANT SELECT ON TABLE pmaq."ODONTOLOGIA" TO relatorio;
