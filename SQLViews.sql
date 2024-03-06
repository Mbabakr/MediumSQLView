-- Basic Syntax:
CREATE VIEW view_name AS
  SELECT columns
  FROM tables
  [WHERE conditions];

-- create a table named emp
CREATE TABLE emp (
  f_name VARCHAR(30) NOT NULL,
  l_name VARCHAR(30) NOT NULL,
  email VARCHAR(60) NOT NULL,
  job VARCHAR(60) NOT NULL,
  city VARCHAR(40) NOT NULL,
  birth_date DATE NULL,
  id SERIAL PRIMARY KEY
);


-- Here are 14 random rows of data
INSERT INTO emp (f_name, l_name, email, job, city, birth_date)
VALUES
('Ella', 'Smith', 'ella.smith@mbabakr.ca', 'Software Developer', 'Toronto', '1990-05-15'),
('Liam', 'Johnson', 'liam.johnson@mbabakr.ca', 'Data Analyst', 'Vancouver', '1985-09-22'),
('Sophia', 'Brown', 'sophia.brown@mbabakr.ca', 'Marketing Specialist', 'Montreal', '1992-03-12'),
('Noah', 'Jones', 'noah.jones@mbabakr.ca', 'Graphic Designer', 'Calgary', '1988-07-31'),
('Olivia', 'Lee', 'olivia.lee@mbabakr.ca', 'HR Coordinator', 'Edmonton', '1995-12-09'),
('Lucas', 'Anderson', 'lucas.anderson@mbabakr.ca', 'Financial Analyst', 'Ottawa', '1982-11-18'),
('Ava', 'Williams', 'ava.williams@mbabakr.ca', 'Sales Manager', 'Winnipeg', '1993-06-25'),
('Liam', 'Garcia', 'liam.garcia@mbabakr.ca', 'Content Writer', 'Halifax', '1987-08-04'),
('Emma', 'Martinez', 'emma.martinez@mbabakr.ca', 'IT Specialist', 'Quebec City', '1998-02-14'),
('Oliver', 'Taylor', 'oliver.taylor@mbabakr.ca', 'Project Manager', 'Victoria', '1984-04-28'),
('Isabella', 'Rodriguez', 'isabella.rodriguez@mbabakr.ca', 'Research Scientist', 'Regina', '1991-10-07'),
('Lucas', 'Moore', 'lucas.moore@mbabakr.ca', 'Customer Support', 'Saskatoon', '1989-01-19'),
('Amelia', 'Cooper', 'amelia.cooper@mbabakr.ca', 'UX Designer', 'Hamilton', '1996-07-03'),
('Ethan', 'Evans', 'ethan.evans@mbabakr.ca', 'Accountant', 'London', '1986-12-15');

-- Check inserting the data
select * from emp



-- create the employee_highlight View
CREATE VIEW employee_highlight AS
  SELECT f_name, l_name, job, city
  FROM emp
  WHERE birth_date IS NOT NULL;
  
-- Check the view
SELECT * FROM employee_highlight;

-- Deleting rows from the employee_highlight view
DELETE FROM employee_highlight WHERE city IN ('Montreal', 'Vancouver');

-- Displaying the contents of the employee_highlight view after deletion
SELECT * FROM employee_highlight;

-- Displaying the contents of the original emp table
SELECT * FROM emp;




-- Updating the city in the employee_highlight view
UPDATE employee_highlight
SET city = 'Toronto'
WHERE city IN ('Calgary', 'Edmonton', 'Ottawa', 'Winnipeg');


-- Displaying the contents of the employee_highlight view after the update
SELECT * FROM employee_highlight;

-- Displaying the contents of the original emp table
SELECT * FROM emp;

-- insert values in employee_highlight view
insert into employee_highlight values('Maria','Gams','Doctor','Toronto');


-- Creating a view emp_All_columns with all columns from emp
CREATE VIEW emp_All_columns AS
SELECT * FROM emp;

-- Displaying the contents of the view emp_All_columns
SELECT * FROM emp_All_columns;

-- Adding a new column 'company' to the EMP table
ALTER TABLE emp ADD COLUMN company VARCHAR(60);

-- Checking the contents of the emp table after changes
SELECT * FROM emp;

-- Displaying the view emp_All_columns
SELECT * FROM emp_All_columns;

-- Attempting to drop the 'job' column initially
ALTER TABLE emp DROP COLUMN job;

-- Correct way with CASCADE to drop the column and its dependents
ALTER TABLE emp DROP COLUMN job CASCADE;

-- Checking the contents of the emp table
SELECT * FROM emp;

-- Attempting to query the emp_All_columns view after dropping the column resulted in an error
SELECT * FROM emp_All_columns;

-- Recreating the emp_All_columns view to include the changes
CREATE OR REPLACE VIEW emp_All_columns AS
SELECT * FROM emp;


-- Creating the emp_young view with a CHECK OPTION
CREATE VIEW emp_young AS
SELECT *
FROM emp
WHERE birth_date > '1990-01-01'
WITH CHECK OPTION;

-- Attempting to insert a row that violates the condition
-- This should result in an error
INSERT INTO emp_young (f_name, l_name, email, city, birth_date)
VALUES
('John', 'Doe', 'john.doe@mbabakr.ca', 'New York', '1985-05-20');
