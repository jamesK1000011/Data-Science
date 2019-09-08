#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## 7 INTRO TO SQL DAY1 EXERCISE ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-

# -------- Question 1 --------
-- Create a new connection to the MySQL Server named "Exercise_Connection"
-- with the same "new_user" we created during installation.
-- Test the new Connection.
-- Check the server status.

-- Answer:

# ------------------------------------------------+
# -------- Question 2 --------
-- Create a new database named "company".

--  Answer:

#### Exercise 2 ####
# =================================================-

# -------- Question 1 --------

-- Use "company" database.
-- Create two tables in the "company" database.
USE company;
-- Name the tables as 
-- 1. "Employee" should contain 3 columns:
-- 	a. employee_id of type varchar(10)
-- 	b. employee_name of type varchar(30),
-- 	c. employee_mail of type varchar(30)

-- 2. "Department" should contain 3 columns:
--  a. dept_id int(3)
-- 	b. dept_name varchar(20) 
-- 	c. dept_phone varchar(15)
CREATE TABLE Department
(dept_id int(3),
dept_name varchar(20),
dept_phone varchar(15),
CONSTRAINT pk_department PRIMARY KEY(dept_id));

CREATE TABLE Employee
(employee_id varchar(10),
employee_name varchar(30),
employee_mail varchar(30),
dept_id int(3),
CONSTRAINT pk_employee PRIMARY KEY(employee_id), 
CONSTRAINT fk_employee_dept_id FOREIGN KEY(dept_id) 
REFERENCES Department(dept_id));

DESC Employee;
DESC Department;
-- Use dept_id as the foreign key to the employee table. 
-- Name employee_id and dept_id as the primary keys in their respective tables.
-- NOTE: Create the parent table first and then the child table, otherwise you will get an error!
-- Inspect the table structures.

-- Answer:

# ------------------------------------------------+

# -------- Question 2 --------
-- Insert two rows into department table as follows: (dept_id, dept_name, dept_phone)
-- (101, "SAP", 3335641023)
-- (103, "BA", 2233456244)  
-- Display all the data in the Department table.

-- Answer:
INSERT INTO Department 
(dept_id, dept_name, dept_phone)
VALUES (101, "SAP", 3335641023);
INSERT INTO Department 
(dept_id, dept_name, dept_phone)
VALUES (103, "BA", 2233456244);
SELECT * FROM Department;

# ------------------------------------------------+
# -------- Question 3 --------
-- Insert three rows in to Employee table as follows: 
-- (employee_id, employee_name, employee_mail, dept_id)
-- ("SAP2343", "Andrew", "andrew@abc.com", 101)
-- ("BA5324", "Jennie", "jennie@abc.com", 103)
-- ("BA6765", "Rashmi", "rashmi@abc.com", 103)
-- Display all the data in the employee table.
INSERT INTO Employee
(employee_id, employee_name, employee_mail, dept_id)
VALUES
 ("SAP2343", "Andrew", "andrew@abc.com", 101),
 ("BA5324", "Jennie", "jennie@abc.com", 103),
 ("BA6765", "Rashmi", "rashmi@abc.com", 103);
SELECT * FROM Employee;
-- Answer:

# ------------------------------------------------+
# -------- Question 4 --------
-- Insert a new row into the Employee table as follows:
-- (employee_id, employee_name, employee_mail, dept_id)
-- ("SAP2453", "Andrea", "andrea@abc.com", 104)
the dept_id is a Int type column 


-- Insert a new row into the department table as follows: (dept_id, dept_name, dept_phone)
-- ("abc34", "MS&S", 3335900023)
-- Are you able to successfully run the query?
-- why or why not?

-- Answer:
INSERT INTO Department 
(dept_id, dept_name, dept_phone)
VALUES ("abc34", "MS&S", 3335900023);
INSERT INTO Employee
(employee_id, employee_name, employee_mail, dept_id)
VALUES
 ("SAP2453", "Andrea", "andrea@abc.com", 104);
-- no it will not because you need a parent record and 

# ------------------------------------------------+
# -------- Question 5 --------

-- Check table before updating it.
-- Update the Department table by changing the value "SAP" to "SAP ERP".
-- Check table after updating it.

-- Answer:
SELECT dept_name FROM Department;
UPDATE Department
SET dept_name = "SAP ERP" WHERE dept_name = "SAP";

# ------------------------------------------------+
# -------- Question 6 --------
-- Show columns in Employee table.
DESC Employee;
-- Add a new column emp_phone int(10) into the Employee table.
ALTER TABLE Employee
ADD emp_phone int(10);
-- Modify the column emp_phone by changing the datatype to varchar(15) from int.
ALTER TABLE Employee
MODIFY emp_phone varchar(10);
-- Show columns in Employee table.
DESC Employee;
-- Delete the column emp_phone from Employee table.
ALTER TABLE Employee
DROP COLUMN emp_phone;
-- Show columns in Employee table to check the final result.
DESC Employee;
-- Answer:


# ------------------------------------------------+
# -------- Question 7 --------
-- Delete BA's record from the Department table. NOTE: Remember to delete the corresponding child rows first in Employee table.

DELETE FROM Employee
WHERE dept_id=any(SELECT dept_id FROM Department WHERE dept_name ="BA");

DELETE FROM Department
WHERE dept_name = "BA";
-- Delete all the rows from Employee table.
DELETE FROM Employees;
-- Drop all tables from the company database.
DROP TABLE Department, Employees;
-- Answer:




