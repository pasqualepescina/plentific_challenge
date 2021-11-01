CREATE OR REPLACE TABLE `project_id.dataset.REPORT_1` as 

SELECT  POSTAL_CODE,
        TYPE,
        avg(PRICE) as avg_price,
        formatted_date,

FROM (SELECT *, PARSE_DATE("%Y-%m",TRANSFER_DATE) AS formatted_date
      FROM `project_id.dataset.house_prices_CLEAN`)
group by TYPE, new_date