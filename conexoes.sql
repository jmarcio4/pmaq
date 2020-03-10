select datnames, count(*) from pg_stat_activity
group by datname

