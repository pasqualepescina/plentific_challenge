CREATE OR REPLACE TABLE `project_id.dataset.house_prices_CLEAN` as 

SELECT trim(string_field_0,"{}") as HOUSE_ID,#REMOVED {} SIGNS
        int64_field_1 as PRICE,
        DATE(timestamp_field_2) as TRANSFER_DATE,# TOOK DATE FROM TIMESTAMP
        CASE WHEN string_field_3 ="" THEN (SELECT STRING_AGG(DISTINCT string_field_3 ORDER BY string_field_3 DESC LIMIT 1)   FROM `project_id.dataset.house_prices` AS A 
                                WHERE A.string_field_11 = B.string_field_11)
        ELSE string_field_3
        END AS POSTCODE,# FILLING NULL POSTCODES WITH THE POSTCODE THAT I FIND FOR THAT PARTICULAR TOWN, COULD BE ENHANCED WITH LOCATION DATA FOR MORE ACCURATE POST_CODE FILLING
        CASE WHEN string_field_4 = "D" THEN "DETACHED"
             WHEN string_field_4 = "S" THEN "SEMI_DETACHED"
             WHEN string_field_4 = "T" THEN "TERRACED"
             WHEN string_field_4 = "F" THEN "FLATS"
             WHEN string_field_4 = "O" THEN "OTHER"
             END AS TYPE,
             string_field_11 AS TOWN
        	 FROM `project_id.dataset.house_prices` AS B
