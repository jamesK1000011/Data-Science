CREATE SCHEMA employee;
USE employee;
SET AUTOCOMMIT=0;

CREATE TABLE Department(  #<- department table name
dept_id int(3),           #<- department Id
dept_name varchar(20),    #<- department name
dept_phone varchar(15),       #<- department phone
total_employee int(10),   #<- total number of employees
CONSTRAINT pk_dept PRIMARY KEY(dept_id));  #<- dept_id as the primary key

CREATE TABLE Employee(   #<- employee table name
employee_id varchar(10), #<- employee id
employee_name varchar(30),  #<- employee name
employee_mail varchar(30),  #<- employee mail
employee_age int(10),        #<- employee age
dept_id int(3),             #<- department id
years_of_experience float,  #<- employee total experience years
CONSTRAINT pk_emp PRIMARY KEY(employee_id), #<- employee id as primary key
CONSTRAINT fk_dep FOREIGN KEY(dept_id)  #<- dept_id as foreign key
REFERENCES Department(dept_id)          #<- foreign key reference table
);

CREATE TABLE Project(
project_id varchar(10),
project_name varchar(30),
dept_id int(3),
total_hours_of_work float,
CONSTRAINT pk_proj PRIMARY KEY(project_id),
CONSTRAINT fk_proj FOREIGN KEY(dept_id)
REFERENCES Department(dept_id)
);

#Department insert
INSERT INTO Department(dept_id, dept_name, dept_phone, total_employee) VALUES(101, "SAP", 3335641023, 50);
INSERT INTO Department(dept_id, dept_name, dept_phone, total_employee) VALUES(102, "HR", 3335641025, 120);
INSERT INTO Department(dept_id, dept_name, dept_phone, total_employee) VALUES(103, "BA", 3335641026, 23);
INSERT INTO Department(dept_id, dept_name, dept_phone, total_employee) VALUES(104, "MS&S", 3335641027, 1033);
INSERT INTO Department(dept_id, dept_name, dept_phone, total_employee) VALUES(105, "PD", 3335641028, 72);
INSERT INTO Department(dept_id, dept_name, dept_phone, total_employee) VALUES(106, "OPS", 3335641990, 29);
INSERT INTO Department(dept_id, dept_name, dept_phone, total_employee) VALUES(107, "IT", 3335641056, 57);
INSERT INTO Department(dept_id, dept_name, total_employee) VALUES(108, "Finance", 2);
INSERT INTO Department(dept_id, dept_name, total_employee) VALUES(109, "Legal", 1);
INSERT INTO Department(dept_id, dept_name, dept_phone, total_employee) VALUES(110, "PSM", 3335641077, 1655);
INSERT INTO Department(dept_id, dept_name) VALUES(111, "AD");
INSERT INTO Department(dept_id, dept_name) VALUES(112, "AM");


#Employee insert
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("SAP2343", "Andrew", "andrew@abc.com", 45, 2.5, 101);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("SAP2345", "Linda", "linda@abc.com", 32, 11.6, 101);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("SAP2389", "Albert", "albert@abc.com", 34, 20.1, 101);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("HR9876", "Alec", "alec@abc.com", 27, 13, 102);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("HR5676", "Brinda", "brinda@abc.com", 22, 0.4,102);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("HR7865", "Cathy", "cathy@abc.com", 26, 2.3, 102);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("BA5467", "Dipi", "dipi@abc.com", 38, 7.9, 103);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("BA3222", "Eliza", "eliza@abc.com", 48, 5.3, 103);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("MSS9878", "Marg", "marg@abc.com", 19, 0.1, 104);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("MSS3888", "Zabrina", "zabrina@abc.com", 37, 1.6, 104);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("MSS9999", "Yara", "yara@abc.com", 22, 0.8, 104);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("MSS7776", "Saif", "saif@abc.com", 24, 1.7, 104);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("MSS6565", "Xu", "xu@abc.com", 25,  4.4, 104);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("MSS5654", "kathy", "kathy@abc.com", 37, 9.6, 104);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("PD9099", "Andrew", "andrew01@abc.com", 33, 6.4, 105);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("PD6563", "Rob", "rob@abc.com", 48, 18.4,  105);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("PD1222", "Jack", "jack@abc.com", 46, 19, 105);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("OPS8989", "Raj", "raj@abc.com", 29, 15.2, 106);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("OPS9098", "Randy", "randy@abc.com", 23, 0.7, 106);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("IT9099", "Daisie", "daisie@abc.com", 59, 24, 107);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("IT5543", "Fabian", "fabian@abc.com", 58, 17.5, 107);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("IT1290", "Jackie", "jackie@abc.com", 27, 6.8, 107);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("FIN8888", "Jess", "jess@abc.com", 36, 13, 108);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("LEG7590", "Nick", "nick@abc.com", 55, 6.9, 109);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience, dept_id) VALUES("PSM9909", "Vishnu", "vishnu@abc.com",47, 4.2, 110);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience) VALUES("AM111", "Aritha", "aritha@abc.com",37, 9.1);
INSERT INTO Employee(employee_id, employee_name, employee_mail, employee_age, years_of_experience) VALUES("AD101", "Rex", "rex@abc.com",56, 3.3);


#Projects
INSERT INTO Project(project_id, project_name, total_hours_of_work, dept_id) VALUES("001", "BA101", 190.489, 102);
INSERT INTO Project(project_id, project_name, total_hours_of_work, dept_id) VALUES("002", "PD109", 1232.854, 105);
INSERT INTO Project(project_id, project_name, total_hours_of_work, dept_id) VALUES("003", "MSS898", 1242.234, 104);
INSERT INTO Project(project_id, project_name, total_hours_of_work, dept_id) VALUES("004", "IT111",  1115.229, 107);
INSERT INTO Project(project_id, project_name, total_hours_of_work, dept_id) VALUES("005", "SAP909", 765.983,  101);

SET AUTOCOMMIT=1;