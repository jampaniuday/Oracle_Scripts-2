set lines 180 pages 400
col snap for a12
col "00" for 99
col "01" for 99
col "02" for 99
col "03" for 99
col "04" for 99
col "05" for 99
col "06" for 99
col "07" for 99
col "08" for 99
col "09" for 99
col "10" for 99
col "11" for 99
col "12" for 99
col "13" for 99
col "14" for 99
col "15" for 99
col "16" for 99
col "17" for 99
col "18" for 99
col "19" for 99
col "20" for 99
col "21" for 99
col "22" for 99
col "23" for 99


alter session set NLS_DATE_FORMAT = 'DD-MM-YYYY';

SELECT (select name from v$database) db_name, to_date(TO_CHAR(first_time,'DD-MM-YYYY'),'DD-MM-YYYY') "snap",
  round(sum(blocks*block_size/1024/1024/1024),0) "day_gb",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'00',blocks*block_size/1024/1024/1024,0)),0) "00",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'01',blocks*block_size/1024/1024/1024,0)),0) "01",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'02',blocks*block_size/1024/1024/1024,0)),0) "02",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'03',blocks*block_size/1024/1024/1024,0)),0) "03",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'04',blocks*block_size/1024/1024/1024,0)),0) "04",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'05',blocks*block_size/1024/1024/1024,0)),0) "05",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'06',blocks*block_size/1024/1024/1024,0)),0) "06",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'07',blocks*block_size/1024/1024/1024,0)),0) "07",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'08',blocks*block_size/1024/1024/1024,0)),0) "08",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'09',blocks*block_size/1024/1024/1024,0)),0) "09",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'10',blocks*block_size/1024/1024/1024,0)),0) "10",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'11',blocks*block_size/1024/1024/1024,0)),0) "11",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'12',blocks*block_size/1024/1024/1024,0)),0) "12",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'13',blocks*block_size/1024/1024/1024,0)),0) "13",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'14',blocks*block_size/1024/1024/1024,0)),0) "14",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'15',blocks*block_size/1024/1024/1024,0)),0) "15",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'16',blocks*block_size/1024/1024/1024,0)),0) "16",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'17',blocks*block_size/1024/1024/1024,0)),0) "17",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'18',blocks*block_size/1024/1024/1024,0)),0) "18",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'19',blocks*block_size/1024/1024/1024,0)),0) "19",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'20',blocks*block_size/1024/1024/1024,0)),0) "20",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'21',blocks*block_size/1024/1024/1024,0)),0) "21",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'22',blocks*block_size/1024/1024/1024,0)),0) "22",
  round(SUM(DECODE(TO_CHAR(first_time,'HH24'),'23',blocks*block_size/1024/1024/1024,0)),0) "23"
FROM v$archived_log
where
--first_time > sysdate-3 and
dest_id=1
GROUP BY to_date(TO_CHAR(first_time,'DD-MM-YYYY'),'DD-MM-YYYY')
ORDER BY to_date(TO_CHAR(first_time,'DD-MM-YYYY'),'DD-MM-YYYY');
