-- select all from Unversity.Course
SELECT * FROM University.Course;
-- describe course table 
DESC University.Course;

-- use unversity database 
USE University;
-- create faculty
CREATE TABLE faculty
(faculty_id INT(10),
faculty_name VARCHAR(20),
course_id INT(11),
CONSTRAINT pk_faculty PRIMARY KEY(faculty_id), 
CONSTRAINT fk_faculty_course_id FOREIGN KEY(course_id) 
REFERENCES course(course_id));
DESC faculty;

-- insert data inot Course table
INSERT INTO course 
(course_id, course_name)
VALUES (011, "DBMS");

-- select all fields from Course table 
SELECT * from Course;

-- course ids from Course table 
SELECT course_id from Course;

-- update course name
UPDATE course
SET course_name = "Database Management Systems"
WHERE course_id = 011;

-- alter table faculty
ALTER TABLE faculty
ADD dob DATE;

-- modifer date of birth
ALTER TABLE faculty
MODIFY dob YEAR;

-- drop a column
ALTER TABLE faculty
DROP COLUMN dob;

-- Update course
UPDATE course
SET course_name = "DBMS"
WHERE course_id = 011;

-- insert to more courses into course field
INSERT INTO course 
(course_id, course_name)
VALUES (012, "Operating Systems");
INSERT INTO course 
(course_id, course_name)
VALUES (013, "Data Science ");

-- delete a record 
DELETE FROM Course
WHERE course_id = 12;

-- delete all course table data
DELETE FROM Course;
-- drop entire table
DROP TABLE faculty;





