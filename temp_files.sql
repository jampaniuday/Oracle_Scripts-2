set lines 168 pages 200
break on report
compute sum of "Total GB", "GB Used" on report
col FILE_NAME for a50
select TABLESPACE_NAME,FILE_NAME,BYTES/1024/1024/1024 "GB Used",MAXBYTES/1024/1024/1024 "Total GB",AUTOEXTENSIBLE from dba_temp_files where TABLESPACE_NAME like '%&tbs%' order by TABLESPACE_NAME,FILE_ID
/
