
select inst_id,sid,SERIAL#,SOFAR,TOTALWORK,round(SOFAR*100/TOTALWORK) "Percent Complete",
TIME_REMAINING from gv$session_longops 
where sid in
(select sid from gv$session where username is not null and status='ACTIVE')
and  TIME_REMAINING <> 0
order by 4 desc
/
