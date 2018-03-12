set lines 180 pages 400
col inst_id for 999999
col sql_id for a15
col username for a15
col status for a7
clear breaks
break on inst_id skip 1
compute sum of count on inst_id
col machine for a30



prompt

-- CONCURRENT SESSIONS WITH MACHINE DETAILS:

--select inst_id, username, sql_id, machine, status, count(*) count from gv$session where username='USERNAME' and status='ACTIVE' group by inst_id, username, sql_id, machine, status order by inst_id, username, sql_id, machine;

--REVISED QUERY:
select * from (
select inst_id, username, sql_id, machine, status, count(*) count,
round(avg(last_call_et/60)) AVG_RUN_MINS,
round(min(last_call_et/60)) MIN_RUN_MINS,
round(max(last_call_et/60)) MAX_RUN_MINS
from gv$session where username='USERNAME' and status='ACTIVE'
group by inst_id, username, sql_id, machine, status
union all
select inst_id, username, sql_id, machine, status, count(*) count,
round(avg(last_call_et/60)) AVG_RUN_MINS,
round(min(last_call_et/60)) MIN_RUN_MINS,
round(max(last_call_et/60)) MAX_RUN_MINS
from gv$session where username like 'FNS%' and status='ACTIVE'
group by inst_id, username, sql_id, machine, status
order by inst_id, username, sql_id, machine
);
