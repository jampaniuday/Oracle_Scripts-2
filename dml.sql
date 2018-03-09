set lines 180 pages 4000
col inst_id HEAD inst for 99
col sid for 99999
col serial# for 99999
col username for a15
col osuser for a9
col sql_id for a15
col module for a9
col machine for a25
col PROGRAM for a12
col event for a22
clear breaks
break on inst_id skip 1
select
inst_id, sid,serial#,
substr(username,1,15) username, osuser,
sql_id,
substr(program,1,9) program,
--substr(module,1,9) module,
--substr(machine,1,24) machine,
decode(machine,
'tsprds1', 'tsprds1 - ecomm',
'tsprds2', 'tsprds2 - ecomm',
'tsprds3', 'tsprds3 - ecomm',
'tsprds4', 'tsprds4 - ecomm',
'tsprds5', 'tsprds5 - ecomm',
'tsprds6', 'tsprds6 - EAI',
'tsprds7', 'tsprds7 - EAI',
'tsprds8', 'tsprds8 - EAI',
'tsprds9', 'tsprds9 - echannel',
'tsprds10', 'tsprds10 - echannel',
'tsprds111', 'tsprds111 - WFCRMap',
'tsprds112', 'tsprds112 - WF',
'tsprds121', 'tsprds121 - WF',
'tsprds122', 'tsprds122 - WF',
'tsprds131', 'tsprds131 - WF',
'tsprds132', 'tsprds132 - WF',
'tsprds141', 'tsprds141 - WF',
'tsprds15', 'tsprds15 - ProdConf',
'tsprds16', 'tsprds16 - ProdConf',
'tsprds17', 'tsprds17 - LoyBatEng',
'tsprds18', 'tsprds18 - LoyBatEng',
'tsprds19', 'tsprds19 - LRTE-1',
'tsprds20', 'tsprds20 - LRTE-1',
'tsprds21', 'tsprds21 - BIP',
'tsprds22', 'tsprds22 - BIP',
'tsprds27', 'tsprds27 - NSMP2PApp',
'tsprds28', 'tsprds28 - NSMP2PApp',
machine) machine,
substr(event,1,18) event,
decode(command,'2','Insert','6','Update','7','Delete',45,'Rolbck',47,'Pl/Sql') Command_Exe
from gv$session
where
--inst_id=2
--and
command in ('2','6','7','45','47') and status='ACTIVE' order by inst_id, sql_id;
