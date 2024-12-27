-- 1211. Queries Quality and Percentage

SELECT DISTINCT query_name, 
                ROUND(AVG(CAST(rating as decimal) / position), 2.0) AS quality,
                ROUND(SUM(case when rating < 3 then 1 else 0 end) * 100 / count(*), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
