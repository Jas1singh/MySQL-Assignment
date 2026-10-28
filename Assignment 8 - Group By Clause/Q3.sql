# Assignment 8 - Group By Clause 

/*
 Question 3: 
NOTE:USE TABLE from QNO 1:Table: employees

Find the total number of employees in each department and display only those departments having more than 2 employees. (GROUP BY + HAVING)
Find the total salary paid in each department and display the results in descending order of total salary. (GROUP BY + ORDER BY)
Find the job role that has the highest total salary payout, displaying only roles where total salary is above 10,000. (GROUP BY + HAVING + ORDER BY)
Find the average salary of employees who joined after 2022, displaying only job roles where the average salary is above 4500. (WHERE + GROUP BY + HAVING)
Find departments where the total salary exceeds 10,000 and order the results in ascending order of department name. (GROUP BY + HAVING + ORDER BY)

*/

SELECT department, COUNT(*) AS total_employees FROM employees GROUP BY department HAVING COUNT(*) > 2;


SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department ORDER BY total_salary DESC;


SELECT job_role, SUM(salary) AS total_salary FROM employees GROUP BY job_role HAVING SUM(salary) > 10000 ORDER BY total_salary DESC;


SELECT job_role, AVG(salary) AS average_salary FROM employees WHERE hire_date >= '2023-01-01' GROUP BY job_role HAVING AVG(salary) > 4500;



SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department HAVING SUM(salary) > 10000 ORDER BY department ASC;
