SELECT p.project_id, ROUND(AVG(e.experience_years), 2) as average_years
FROM Project P
LEFT JOIN Employee e ON p.employee_id = e.employee_id 
GROUP BY project_id;