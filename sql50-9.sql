-- 197. Rising Temperature

SELECT W2.id
FROM Weather W1
JOIN Weather W2
ON DATEDIFF(W1.recordDate, W2.recordDate) = -1
AND W2.temperature > W1.temperature;
