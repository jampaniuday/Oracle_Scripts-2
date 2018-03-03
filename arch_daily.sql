set pages 500
select count(*)"No of Archives",trunc(completion_time)"date" from v$archived_log where dest_id=1
group by trunc(completion_time)
order by trunc(completion_time) desc 
/
