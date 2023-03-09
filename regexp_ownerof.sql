insert into  `hive`.`erc_balances`.ownerof_log
select 
log 
from `hive`.`erc_balances`.`etherscan_verified_contracts_v0`
where REGEXP(log, 'function[\s]*ownerOf(?:(?!function).)*?\{(?:(?!function).)*?\}') 
and log like '%721%';

select 
-- `offset`,
-- REGEXP_EXTRACT(log, 'function ownerOf.{52}', 0)
-- REGEXP_EXTRACT(log, 'function ownerOf.{50}', 0)
-- ,REGEXP_EXTRACT(log, 'function ownerOf', 0)\
--  REGEXP_EXTRACT(log, 'function ownerOf.*\{.*\}function', 0)
--  REGEXP_EXTRACT(log, 'function ownerOf.*\{.*\}function', 0)
-- ,`offset`
`offset`
,REGEXP_EXTRACT(log, 'function[\s]*ownerOf(?:(?!function).)*?\{(?:(?!function).)*?\}', 0)
-- ,REGEXP_EXTRACT(data[1]['SourceCode'], 'function ownerOf.*function', 0)
from `hive`.`erc_balances`.`etherscan_verified_contracts_v0`
where REGEXP(log, 'function[\s]*ownerOf(?:(?!function).)*?\{(?:(?!function).)*?\}') 
and log like '%721%'
limit 100;

