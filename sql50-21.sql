-- 1174. Immediate Food Delivery II

SELECT 
    ROUND(
        (SUM(order_date = customer_pref_delivery_date) / COUNT(*)) * 100, 2
    ) AS immediate_percentage
FROM Delivery
WHERE (customer_id,order_date) IN (SELECT customer_id,min(order_date) FROM delivery 
GROUP BY customer_id);
