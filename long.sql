set lines 180 pages 999
col inst for 9999
col username for a16
col osuser for a9
col pct_done head pctDone format 999999.99
col starttime format a16
col opname for a25
col HRS_REM for 999999
select s.INST_ID INST, s.username, s.osuser, s.SID, s.serial#, l.opname, s.sql_id, to_char(l.START_TIME, 'DD-MON-YYY HH24:MI') STARTTIME,
--TOTALWORK, sofar,
(l.sofar/decode(l.totalwork,0,1,l.totalwork))*100 PCT_DONE, round(l.TIME_REMAINING/3600, 2) HRS_REM
from
gv$session_longops l, gv$session s
where
s.SID=l.SID
AND (l.sofar/decode(l.totalwork,0,1,l.totalwork))*100!=100.00
order by 1
/

prompt
prompt  LONG Running by LAST_CALL_ET from MPESA_PLATORM ::
prompt

clear breaks
break on inst_id skip 1
select inst_id, username, sid, serial#, sql_id, logon_time, status, round(last_call_et/60) RUN_MINS, event from gv$session
where status='ACTIVE' and username='MPESA_PLATFORM' and round(last_call_et/60) > 2
order by inst_id;
