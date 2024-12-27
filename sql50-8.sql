-- 1581. Customer Who Visited but Did Not Make Any Transactions

SELECT Visits.customer_id, COUNT(Visits.visit_id) AS count_no_trans 
FROM Visits
WHERE Visits.visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY customer_id;
