#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## 7 INTRO TO SQL DAY3 EXERCISE ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-


# ---- Question 1 ----
-- What is the time exactly 76 hours, 39 minutes and 10 seconds from now?
SELECT CURRENT_TIMESTAMP()
AS time_now, ADDTIME(CURRENT_TIMESTAMP(), "76:39:10") AS new_time;
-- Answer:

# ---------------------------------------------------------+
# ---- Question 2 ----
-- What is the number of days between 9th September 2013 to 24th April 2016?
SELECT DATEDIFF("20190909", "20160424") AS date_difference;
-- Answer:

# ---------------------------------------------------------+
# ---- Question 3 ----
-- What day is 21st August 2017?
SELECT DAYNAME("20170821") as day;
-- Answer:

# ---------------------------------------------------------+
# ---- Question 4 ----
-- Extract the minutes from "2011-04-29 21:34:09".
SELECT EXTRACT(minute FROM "2011-04-29 21:34:09") AS Mins;
-- Answer:

# ---------------------------------------------------------+
# ---- Question 5 ----
-- Import data from employee.sql script from data folder.
-- Switch to employee database.
use employee;
-- Import 'employee.sql' from the data folder.

-- What is the age of the oldest employee working according to our database?
SELECT MAX(employee_age)
AS max_age FROM employee;
-- Answer:


# ---------------------------------------------------------+
# ---- Question 6 ----
-- Count the number of employees in each department.
-- Count using the Employee table.
SELECT Count(employee_id) AS Num_emp, dept_id FROM employee
GROUP BY (dept_id);
-- Do not make use of the department table column "total_employee".
-- Now slightly modify the query and find the subset of result,
-- where the department has more than two employees.
SELECT Count(employee_id) AS Num_emp, dept_id FROM employee
GROUP BY (dept_id)
Having Count(employee_id) > 2;
-- Answer: 
 
# ---------------------------------------------------------+
# ---- Question 7 ----
-- What is the average work experience of the employees in each department?
-- Arrange in ascending order.
-- Round off the average to two decimal places.
SELECT Round(avg(years_of_experience),2) AS avg_xp, dept_id FROM employee
GROUP BY (dept_id)
ORDER BY Round(avg(years_of_experience),2);

-- Which department id has minimum average?

-- dep:104
-- Answer:

# ---------------------------------------------------------+
# ---- Question 8 ----
-- What is the total number of hours spent on projects by each department?
SELECT SUM(total_hours_of_work) AS ttl_project_hrs, dept_id FROM project
GROUP BY (dept_id);
-- Find the sum of hours that are completed.
-- Remove the hours that are not complete.
-- Eg: If sum of hours is 8.6 convert to 8.
SELECT floor(SUM(total_hours_of_work)) AS ttl_project_hrs, dept_id FROM project
Group BY (dept_id)
ORDER By (floor(SUM(total_hours_of_work)));
-- Which department has the lowest completed hours?
-- Enter the department name.
SELECT d.dept_name, SUM(floor(p.total_hours_of_work)) AS ttl_project_hrs, p.dept_id 
FROM project as p, department as d
WHERE p.dept_id = d.dept_id
Group BY (dept_id)
ORDER By (SUM(floor(total_hours_of_work)));

-- Answer:
-- Having SUM(floor(p.total_hours_of_work)) = max(SUM(floor(p.total_hours_of_work)))
#### Exercise 2 ####
# =================================================-
use employee;
# ----- Question 1 -----
-- Find all the employee names of department id 105 and 107.
-- Write the query as a nested non correlated subquery.
SELECT employee_name, dept_id FROM employee
WHERE dept_id = 105
OR
employee_name IN
(SELECT employee_name FROM employee WHERE dept_id = 107);
-- Answer:


# -------------------------------------------------------------+
# ----- Question 2 -----
-- Find all data of the employees whose age is greater than 
-- the age of all the employees of the department with id = 101.
-- Write the query as a nested non correlated subquery.
SELECT * FROM employee
where employee_age > ALL
(SELECT employee_age FROM employee WHERE dept_id = 101);
-- Answer:

# -------------------------------------------------------------+
# ----- Question 3 -----
-- Find the details of the employees of all departments,
-- where there are more than two employees in the department.
-- Write the query as a nested correlated subquery.
SELECT * FROM employee AS e1
WHERE
	(SELECT distinct COUNT(e1.dept_id) FROM employee AS e2 WHERE e1.dept_id = e2.dept_id) > 2
order by dept_id;
-- Answer:
select distinct count(dept_id) as dept_cnt, dept_id from employee
group by dept_id;
# -------------------------------------------------------------+-
# ----- Question 4 -----
-- Find the years_of_experience difference from the 
-- maximum years_of_experience of the employee table as experience_difference.
-- Order by the experience_difference.
-- Use nested queries approach to write the query.
-- Hint: truncate the experience_difference to 1 decimal.
SELECT employee_name, years_of_experience,
	truncate(((SELECT MAX(years_of_experience) FROM employee) - years_of_experience), 1) AS experience_difference
FROM employee
order by experience_difference;
-- Answer:

# -----------------------------------------------------------+
# ----- Question 5 -----
-- Find the number of employees in each department.
-- Use nested queries approach to write the query.
-- Use the employee table to find the count of employees.
-- Do not use the total_employee column in the department table.
SELECT d1.dept_name, e2.num_employees
FROM department AS d1
INNER JOIN
	(SELECT dept_id, COUNT(*) AS num_employees 
    FROM employee 
    GROUP BY dept_id) AS e2
ON d1.dept_id = e2.dept_id;
-- Answer:
SELECT dept_id, COUNT(*) AS num_employees FROM employee GROUP BY dept_id;

#### Exercise 3 ####
# =================================================-
use employee;
# ----- Question 1 -----
-- Create a view called `project_info` with the following columns:
-- project name and department name to which the project belongs to
-- number of employees of each department (use the employee table)
-- mean age of employee of each department
-- mean years_of_experience of each employee of each department.
CREATE VIEW project_info
(project_name, department_name, no_employees, mean_age_of_e, e_xp) AS
	SELECT p.project_name,
			d.dept_name,
           (SELECT COUNT(dept_id) from department
            WHERE e.dept_id = d.dept_id),
           (SELECT AVG(employee_age) from employee
           WHERE e.dept_id = d.dept_id),
           (SELECT AVG(employee_age) from employee
           WHERE e.dept_id = d.dept_id) FROM employee AS e, department AS d, project as p
    WHERE e.dept_id = d.dept_id;
    
  

-- Display the view.
SELECT * FROM project_info;

-- Answer:

# -----------------------------------------------------------+
# ----- Question 2 -----
-- Update the following information in the view:
-- Update the project name BA101 as "Customer analytics".
-- Were you able to make the update?
-- Why and why not?
UPDATE project_info
SET project_name = 'Customer analytics' 
WHERE project_name = 'BA101';
-- Answer:
-- not updatable
# -----------------------------------------------------------+
# ----- Question 3 -----
-- Drop the view.
DROP VIEW project_info;
-- Answer:


# -----------------------------------------------------------+
# ----- Question 4 -----
-- Create dept_name as the index to the department table.
ALTER TABLE department ADD INDEX dept_name_idx(dept_name);

-- Show the index.
SHOW INDEX FROM department;
-- Now delete the index.
ALTER TABLE department DROP INDEX dept_name_idx; 
-- Answer:


# -----------------------------------------------------------+
# ----- Question 5 -----
-- We have three users updating the database at the same time.
-- Set the autocommit = 0.
-- We want to add two new rows to the project table.
-- Start a transaction.
-- Make sure to set savepoints whenever required.
-- Add two rows into project - (project_id, project_name, dept_id, total_hours_of_work)
	-- (006, "OPS334", 106, 200)
	-- (007, "LEG65", 109, 345)
-- In the mid of transaction, we realized that the second row we are trying to add is false data.
-- Rollback to the first row insertion point.
-- Commit the transaction.
SET AUTOCOMMIT = 0;
START TRANSACTION;
SAVEPOINT my_savepoint1;
INSERT INTO project VALUES(006, "OPS334", 106, 200); 
Savepoint my_savepoint2; 
INSERT INTO project VALUES(007, "LEG65", 109, 345);  
ROLLBACK TO SAVEPOINT my_savepoint2;
commit;
-- Check the project table to make sure only one row is added. 
select * From project;
-- Answer:

#### Exercise 4 ####
# =================================================-

# ----- Question 1 -----
-- View all databases.
Show databases;
-- View all tables of the employee database.
show tables from employee;
-- View all columns of all the tables of the employee database.
SHOW COLUMNS FROM employee.department;
SHOW COLUMNS FROM employee.project;
SHOW COLUMNS FROM employee.employee;
-- Answer:

# -----------------------------------------------------------+
# ----- Question 2 -----
-- Create a stored procedure to view all the employee details of dept_id = 104.
-- Name it as "Show_mss_employee_details"
-- Call the stored procedure. 
call Show_mss_employee_details(102);
-- Answer:

