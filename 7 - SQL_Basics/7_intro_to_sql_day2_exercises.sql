#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## 7 INTRO TO SQL DAY2 EXERCISE ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-

# --------Question 1 --------
-- Import data from employee.sql script from data folder similar to how we did with world.sql and transation.sql in class.
-- Switch to employee database.
-- Import 'employee.sql' from the data folder.
-- Inspect the schema of the tables in the employee database.

-- Answer:
use employee; 
# --------------------------------------------------+
# --------Question 2 --------
-- Select distinct dept_id from employee table.
-- Alias the table as 'dep'.

-- Answer:
SELECT DISTINCT dept_id AS dep FROM employee;
# --------------------------------------------------+
# --------Question 3 --------
-- Select employee_name as 'Name' and 
-- employee_mail as 'Mail' all in uppercase from the Employee table.

-- Answer:
SELECT employee_name AS Name, employee_mail as Mail FROM employee;
# --------------------------------------------------+
# --------Question 4 --------
-- Display all the data of employees whose dept_id is 104.
-- Now, add one more condition in displaying the employee data
-- where the dept_id is 104 and the age is less than 30.
SELECT * FROM employee
WHERE dept_id = 104;

SELECT * FROM employee
WHERE dept_id = 104 AND employee_age < 30;
-- Answer:

# --------------------------------------------------+
# --------Question 5 --------
-- Find the data of all the projects where the dept_id is in the set
-- 102, 107, 105.
SELECT * FROM Project
WHERE dept_id IN (102, 107, 105);
-- Answer:

# --------------------------------------------------+
# --------Question 6 --------
-- Find the employee data where the age of the employee is between 20 and 30.
SELECT * FROM employee
WHERE employee_age between 20 and 30;

-- Answer:
 
# --------------------------------------------------+
# --------Question 7 --------
-- Display all the department data where the dept_phone is null.
SELECT * from Department
WHERE dept_phone IS NULL;
-- Answer:

# --------------------------------------------------+
# --------Question 8 --------
-- Order the employee table in the decreasing order of the age.
SELECT * FROM Employee
ORDER BY employee_age DESC;
-- Who is the oldest employee?
	-- Daisie
    SELECT employee_name FROM Employee
    WHERE employee_age = 
    (SELECT MAX(employee_age) FROM Employee);
-- Arrange the employee table in the last letter of their name.
SELECT * FROM Employee
ORDER BY RIGHT(employee_name, 1);
-- Answer:


#### Exercise 2 ####
# =================================================-
use employee;
# --------Question 1 --------
-- Select department_name, employee_name by performing an inner join on both the tables.
-- Identify an appropriate joining attribute.
SELECT d.dept_name AS d_department_name, e.employee_name AS e_employee_name
FROM Employee AS e
INNER JOIN Department AS d ON d.dept_id = e.dept_id; 

-- How many rows have all null value?
 -- None
-- Answer:

# --------------------------------------------------+
# --------Question 2 --------
-- Select department_name, employee_name by performing a left join on both the tables.
-- Identify an appropriate joining attribute.
SELECT d.dept_name AS d_department_name, e.employee_name AS e_employee_name
FROM Employee AS e
LEFT JOIN Department AS d ON d.dept_id = e.dept_id; 
-- How many rows have null values?
 -- two from department
-- Answer:

# --------------------------------------------------+
# --------Question 3 --------
-- Select department_name, employee_name by performing a right join on both the tables.
-- Identify an appropriate joining attribute.
-- How many rows have null values?
SELECT d.dept_name AS d_department_name, e.employee_name AS e_employee_name
FROM Employee AS e
RIGHT JOIN Department AS d ON d.dept_id = e.dept_id; 
-- Answer:

# --------------------------------------------------+
# --------Question 4 --------
-- Join all three tables and display the employee_name, dept_name
-- and project_name in the database. (Use the ANSI join syntax)
-- Join on the dept_id. 
SELECT d.dept_name AS d_department_name,
 e.employee_name AS e_employee_name,
 p.project_name AS p_project_name
FROM Employee AS e, Department AS d , Project AS p 
WHERE d.dept_id = e.dept_id 
AND d.dept_id = p.dept_id;
-- Answer:

# --------------------------------------------------+
# --------Question 5 --------
-- Find all pairs of employees working in the same department and their department name.
-- Display as employee_1, employee_2 and dept_name.
-- Make sure that same employee name does not get displayed in both employee_1 and employee_2 column.
SELECT a.employee_name AS Employee_1, 
b.employee_name AS Employee_2,
d.dept_name AS dep_name
FROM Employee AS a, Employee AS b, Department AS d -- select from column from identical tables
WHERE a.dept_id = b.dept_id and a.dept_id = d.dept_id
AND a.employee_id != b.employee_id;

-- Answer:

# --------------------------------------------------+
# --------Question 6 --------
-- Find all pairs of employees working in different departments and their respective department names.
-- Display as employee_1, employee_2 and dept_name1, dept_name2.
SELECT a.employee_name AS Employee_1, 
d1.dept_name AS dep_name1,
b.employee_name AS Employee_2,
d2.dept_name AS dep_name2
FROM Employee AS a, Employee AS b, Department d1, Department d2-- select from column from identical tables
WHERE a.dept_id != b.dept_id and a.dept_id = d1.dept_id
AND d2.dept_id = b.dept_id;
-- Answer:




#### Exercise 3 ####
# =================================================-
use employee;
# --------Question 1 --------
-- Select dept_id from employee table and department table.
SELECT dept_id from employee
UNION
SELECT dept_id from department;
-- 13
-- Do it twice using UNION and UNION ALL.
SELECT dept_id from employee
UNION ALL
SELECT dept_id from department;
-- 
-- What is the number of rows in both the case?

-- Answer:

# --------Question 2 --------
-- Find all the employees whose name ends with 'a'.
SELECT employee_name from employee
where employee_name LIKE "%a";
-- Find all the departments which has 'A' anywhere in the department name.
SELECT dept_name from department
where dept_name LIKE "%A%";

-- Answer:

# ---------------------------------------------------------+
# ---- Question 3 ----

-- Find the number of characters in the employee names.
SELECT employee_name, length(employee_name) as e_length
FROM employee;
-- Answer:

# ---------------------------------------------------------+
# ---- Question 4 ----
-- Replace the department name Finance as FIN and display.
-- Note: Do not update the table.
SELECT REPLACE (dept_name, 'Finance', 'FIN') as new_d_name
FROM department;
-- Answer:

# ---------------------------------------------------------+
# ---- Question 5 ----
-- Find the position of letter 'S' in the department name.
SELECT Locate('S', dept_name) as str_loc, dept_name
FROM Department;
-- Answer:
#### Exercise 4 ####
# =================================================-

# ---- Question 1 ----
use employee;
-- Find the modulus of 5 of the total_employee of a department.
SELECT MOD(total_employee, 5)
AS employee_MOD, total_employee FROM department;
-- Answer:

# ---------------------------------------------------------+
# ---- Question 2 ----
-- Find the square root of the age of the employees.
SELECT SQRT(employee_age) as age_SQRT, employee_age
FROM employee;
-- Answer:


# ---------------------------------------------------------+
# ---- Question 3 ----
-- Find the ceiling and floor of the years_of_experience of an employee.
SELECT CEIL(years_of_experience) as to_old_for_this, years_of_experience
FROM employee;

SELECT FLOOR(years_of_experience) as to_old_for_this, years_of_experience
FROM employee;
-- Answer:

# ---------------------------------------------------------+
# ---- Question 4 ----

-- Truncate and round off the total_hours_of_work of a project to 1 decimal place.
SELECT truncate(total_hours_of_work, 1), total_hours_of_work from project;
SELECT ROUND(total_hours_of_work, 1), total_hours_of_work from project;
-- Answer:


