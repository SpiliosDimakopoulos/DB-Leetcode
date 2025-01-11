-- 1757. Recyclable and Low Fat Products
SELECT product_id
FROM Products
WHERE low_fats = "Y" AND recyclable = "Y";

-- 584. Find Customer Referee
SELECT name 
FROM Customer 
WHERE referee_Id <> 2
OR referee_id IS NULL;

-- 595. Big Countries
SELECT name, population, area 
FROM World
WHERE area >= 3000000 OR population >= 25000000;

-- 1148. Article Views I
SELECT distinct author_id as id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;

-- 1683. Invalid Tweets
SELECT tweet_id 
FROM Tweets
WHERE LENGTH(content) > 15;

-- 1378. Replace Employee ID With The Unique Identifier
SELECT EmployeeUNI.unique_id, Employees.name
FROM Employees
LEFT JOIN EmployeeUNI on Employees.id = EmployeeUNI.id

-- 1068. Product Sales Analysis I
SELECT Product.product_name, Sales.year, Sales.price
FROM Sales
LEFT JOIN Product on Product.product_id = Sales.product_id;

-- 1581. Customer Who Visited but Did Not Make Any Transactions
SELECT Visits.customer_id, COUNT(Visits.visit_id) AS count_no_trans 
FROM Visits
WHERE Visits.visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY customer_id;

-- 197. Rising Temperature
SELECT W2.id
FROM Weather W1
JOIN Weather W2
ON DATEDIFF(W1.recordDate, W2.recordDate) = -1
AND W2.temperature > W1.temperature;

-- 1661. Average Time of Process per Machine
SELECT A1.machine_id, ROUND(AVG(A2.timestamp - A1.timestamp), 3) AS processing_time 
FROM Activity A1
JOIN Activity A2
ON A1.machine_id = A2.machine_id
WHERE A1.process_id = A2.process_id AND A1.activity_type = "start" AND A2.activity_type = "end"
GROUP BY machine_id;

-- 577. Employee Bonus
SELECT e.name, b.bonus 
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000 OR Bonus is NULL;

-- 1280. Students and Examinations
SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

-- 570. Managers with at Least 5 Direct Reports
SELECT a.name
FROM Employee a
JOIN Employee b ON a.id = b.managerId
GROUP BY b.managerId
HAVING COUNT(*) >= 5; 

-- 1934. Confirmation Rate
SELECT s.user_id, ROUND(AVG(IF(c.action = "confirmed", 1.0, 0.0)), 2) as confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY user_id;

-- 620. Not Boring Movies
SELECT id, movie, description, rating 
FROM Cinema
WHERE NOT (id % 2 = 0) AND NOT description="boring"
ORDER BY rating DESC;

-- 1251. Average Selling Price
SELECT p.product_id, IFNULL(ROUND(SUM(p.price*u.units)/SUM(u.units),2),0) as average_price
FROM Prices p 
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id AND 
u.purchase_date BETWEEN p.start_date and p.end_date
GROUP BY p.product_id;

-- 1075. Project Employees I
SELECT p.project_id, ROUND(AVG(e.experience_years), 2) as average_years
FROM Project P
LEFT JOIN Employee e ON p.employee_id = e.employee_id 
GROUP BY project_id;

-- 1633. Percentage of Users Attended a Contest
SELECT contest_id, 
ROUND(COUNT(DISTINCT user_id) * 100 /(SELECT count(user_id) FROM Users) ,2) AS percentage
FROM  Register
GROUP BY contest_id
ORDER BY percentage DESC,contest_id;

-- 1211. Queries Quality and Percentage
SELECT DISTINCT query_name, 
                ROUND(AVG(CAST(rating as decimal) / position), 2.0) AS quality,
                ROUND(SUM(case when rating < 3 then 1 else 0 end) * 100 / count(*), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

-- 1193. Monthly Transactions I
SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month,
       country,
       COUNT(*) AS trans_count,
       SUM(state = "approved") AS approved_count,
       SUM(amount) AS trans_total_amount,
       SUM(IF(state = "approved", amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY 1, 2;

-- 1174. Immediate Food Delivery II
SELECT 
    ROUND(
        (SUM(order_date = customer_pref_delivery_date) / COUNT(*)) * 100, 2
    ) AS immediate_percentage
FROM Delivery
WHERE (customer_id,order_date) IN (SELECT customer_id,min(order_date) FROM delivery 
GROUP BY customer_id);

-- 550. Game Play Analysis IV
SELECT ROUND(COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) as fraction
FROM Activity
WHERE (player_id, DATE_SUB(event_date, INTERVAL 1 DAY))
IN (SELECT player_id, MIN(event_date) AS first_login FROM ACTIVITY GROUP BY player_id);

-- 2356. Number of Unique Subjects Taught by Each Teacher
SELECT teacher_id , COUNT(DISTINCT subject_id) as cnt 
FROM Teacher
GROUP BY teacher_id 

-- 1141. User Activity for the Past 30 Days I
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE (activity_date > "2019-06-27" AND activity_date <= "2019-07-27")
GROUP BY activity_date;

-- 1070. Product Sales Analysis III
SELECT product_id, year as first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (SELECT product_id, min(year) FROM Sales GROUP BY product_id);

-- 596. Classes More Than 5 Students
SELECT class
FROM Courses
GROUP BY 1
HAVING COUNT(*) >= 5;

-- 1729. Find Followers Count
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

-- 619. Biggest Single Number
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
) AS unique_numbers;

-- 1045. Customers Who Bought All Products
SELECT customer_id 
FROM Customer
GROUP BY customer_id
HAVING COUNT( DISTINCT product_key) = (
    SELECT COUNT(product_key) FROM Product
);

-- 1731. The Number of Employees Which Report to Each Employee
SELECT mgr.employee_id, mgr.name, COUNT(emp.employee_id) AS reports_count, ROUND(AVG(emp.age)) AS average_age
FROM employees emp JOIN employees mgr
ON emp.reports_to = mgr.employee_id
GROUP BY employee_id
ORDER BY employee_id;

-- 1789. Primary Department for Each Employee
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag='Y' OR employee_id IN
    (
        SELECT employee_id
        FROM Employee
        GROUP BY employee_id
        HAVING COUNT(*) = 1
    );

-- 610. Triangle Judgement
SELECT *, IF(x+y>z AND y+z>x AND z+x>y, "Yes", "No") as triangle FROM Triangle 

-- 180. Consecutive Numbers
WITH tbl AS (
    SELECT num,
    LEAD(num, 1) OVER() AS num1,
    LEAD(num, 2) OVER() AS num2
    FROM Logs
)
SELECT DISTINCT num as ConsecutiveNums 
FROM tbl
WHERE (num=num1) AND (num=num2)

-- 1164. Product Price at a Given Date
SELECT DISTINCT product_id, 10 AS price
FROM Products
GROUP BY product_id 
HAVING min(change_date) > "2019-08-16" 

UNION
    
SELECT product_id, new_price as price
FROM Products
WHERE (product_id, change_date) IN (

    SELECT product_id, max(change_date) as recent_date
    FROM Products
    WHERE change_date <= "2019-08-16"
    GROUP BY product_id
    
)

-- 1204. Last Person to Fit in the Bus
SELECT person_name
FROM Queue q1 
WHERE 1000 >= ( 
    SELECT SUM(weight) 
    FROM Queue q2 
    WHERE q2.turn <= q1.turn 
)
ORDER BY turn DESC 
LIMIT 1;

-- 1907. Count Salary Categories
(select 
"Low Salary" as category,
(select count(*)  from Accounts where income < 20000) as accounts_count)
union all
(select 
"Average Salary" as category,
(select count(*) from Accounts where income >= 20000 and income <= 50000) as accounts_count)
union all 
(select 
"High Salary" as category,
(select count(*) from Accounts where income > 50000) as accounts_count)

-- 1978. Employees Whose Manager Left the Company
SELECT employee_id FROM Employees
WHERE manager_id NOT IN (select employee_id from Employees) AND salary < 30000
ORDER BY employee_id;

-- 626. Exchange Seats
SELECT
  ROW_NUMBER() OVER(ORDER BY IF(MOD(id, 2) = 0, id - 1, id + 1)) AS id,
  student
FROM Seat;

-- 1341. Movie Rating
(SELECT name as results
FROM MovieRating 
JOIN Users USING(user_id)
GROUP BY name
ORDER BY COUNT(*) DESC, name
LIMIT 1)

UNION ALL

(SELECT title AS results
FROM MovieRating
jOIN Movies USING(movie_id)
WHERE EXTRACT(YEAR_MONTH FROM created_at) = 202002
GROUP BY title
ORDER BY AVG(rating) DESC, title
LIMIT 1)

-- 1321. Restaurant Growth
select distinct visited_on,
        sum(amount) over w as amount,
        round((sum(amount) over w)/7, 2) as average_amount
    from customer
    WINDOW w AS ( 
            order by visited_on
            range between interval 6 day PRECEDING and current row
    )
Limit 6, 999

-- 602. Friend Requests II: Who Has the Most Friends
SELECT id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id
    FROM RequestAccepted
) AS all_friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;

-- 585. Investments in 2016
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016 FROM Insurance
WHERE tiv_2015 IN (SELECT tiv_2015 FROM Insurance GROUP BY tiv_2015 HAVING COUNT(*) > 1)
AND (lat, lon) IN (SELECT lat, lon FROM Insurance GROUP BY lat, lon HAVING COUNT(*) = 1);

-- 185. Department Top Three Salaries
SELECT DEPT.name AS Department, EMP.name AS Employee, EMP.salary AS Salary
FROM Department DEPT JOIN Employee EMP ON 
EMP.DepartmentId=DEPT.id WHERE 3 > (
    SELECT COUNT(DISTINCT EMP1.salary)
    FROM Employee EMP1 
    WHERE EMP1.salary > EMP.salary AND EMP.departmentId = EMP1.departmentId
);

-- 1667. Fix Names in a Table
SELECT user_id,
       concat(upper(substring(name, 1, 1)),
       lower(substring(name, 2))) AS name
  FROM Users
 ORDER BY user_id;

/*
import pandas as pd

def fix_names(users: pd.DataFrame) -> pd.DataFrame:
    
    users["name"] = users["name"].str.capitalize()
    result = users[["user_id", "name"]].sort_values("user_id", ascending=True)

    return result
*/

-- 1527. Patients With a Condition
SELECT *
FROM Patients
WHERE conditions REGEXP '\\bDIAB1';

/*
import pandas as pd

def find_patients(patients: pd.DataFrame) -> pd.DataFrame:
    return patients[
        patients['conditions'].str.contains(r'(^DIAB1)|( DIAB1)')
    ]
*/

-- 196. Delete Duplicate Emails
DELETE p
FROM Person p
JOIN Person pp
ON p.email = pp.email
WHERE p.id > pp.id;

/*
import pandas as pd

def delete_duplicate_emails(person: pd.DataFrame) -> None:
    
    person.sort_values(by="id", inplace=True)

    person.drop_duplicates(subset=["email"], keep="first", inplace=True)
*/

-- 176. Second Highest Salary
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

-- 1484. Group Sold Products By The Date
SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold, 
    GROUP_CONCAT(DISTINCT product ORDER BY product) AS products
FROM Activities
GROUP BY 1;

-- 1327. List the Products Ordered in a Period
SELECT p.product_name, SUM(o.unit) AS unit
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;

-- 1517. Find Users With Valid E-Mails
SELECT *
FROM Users
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9_.-]*@leetcode[\.]com$'

/*
import pandas as pd

def valid_emails(users: pd.DataFrame) -> pd.DataFrame:
    return users[
        users['mail'].str.fullmatch(r'^[A-Za-z][\w.-]*@leetcode\.com')
    ]
*/
