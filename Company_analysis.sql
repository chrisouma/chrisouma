-- Create a company analysis database
CREATE DATABASE Company_analysis;
USE Company_analysis;
-- Create table named employee
CREATE TABLE Employees(
emp_id INT PRIMARY KEY,
birth_date DATE,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender VARCHAR(50),
hire_date DATE
);
-- create table named dept_manager
CREATE TABLE dept_manager(
dept_no CHAR(50),
emp_id INT,
from_date DATE,
to_date DATE
);
INSERT INTO Employees (emp_id, birth_date, first_name, last_name, gender, hire_date)
VALUES
(10001, '1980-01-15', 'John', 'Smith','M','2001-07-15'), 
(10002, '1982-03-25','Emily','Johnson','F','2005-02-28'), 
(10003, '1975-12-10','Michael','Williams','M','2003-11-10'), 
(10004, '1988-05-20','Jessica','Brown','F','2007-09-15'), 
(10005, '1984-08-30','David','Jones','M','2002-04-20'), 
(10006, '1981-06-12','Sarah','Anderson','F','2004-03-18'), 
(10007, '1979-10-05','Christopher','Davis','M','2006-08-22'), 
(10008, '1983-09-17','Anna','Miller','F','2008-11-30'), 
(10009,'1986-02-28','Ryan','Moore','M','2010-05-14'), 
(10010,'1989-07-19','Amanda','Wilson','F','2009-03-26');

INSERT INTO dept_manager (dept_no,emp_id,from_date,to_date)
VALUES
('d001', 10001, '2001-07-15', '2005-02-28'), 
('d002', 10002, '2005-02-28', '2007-09-15'), 
('d003', 10003, '2003-11-10', '9999-01-01'), 
('d004', 10004, '2007-09-15', '2010-12-31'), 
('d005', 10005, '2002-04-20', '9999-01-01'), 
('d001', 10006, '2004-03-18', '9999-01-01'), 
('d002', 10007, '2006-08-22', '9999-01-01'), 
('d003', 10008, '2008-11-30', '9999-01-01'), 
('d004', 10009, '2010-05-14', '9999-01-01'), 
('d005', 10010, '2009-03-26', '9999-01-01');
-- Create table named departments
CREATE TABLE departments(
dep_no CHAR(50) PRIMARY KEY,
dep_name VARCHAR(50)
);
INSERT INTO departments (dep_no,dep_name)
VALUES
('d001','Hr'),
('d002','Finance'),
('d003','Marketing'),
('d004','Engineering'),
('d005','Sales'),
('d006','IT'),
('d007','Operations'),
('d008','Research'),
('d009','Quality Assurance'),
('d010','Customer Service');
-- create a table named dept_emp
CREATE TABLE dept_emp(
emp_id INT,
dept_no CHAR(50),
from_date DATE,
to_date DATE
);
INSERT INTO dept_emp (emp_id,dept_no,from_date,to_date)
VALUES
(10001, 'd001', '2001-07-15', '9999-01-01'), 
(10002, 'd002', '2005-02-28', '9999-01-01'), 
(10003, 'd003', '2003-11-10', '2010-12-31'), 
(10004, 'd004', '2007-09-15', '9999-01-01'), 
(10005, 'd005', '2002-04-20', '9999-01-01'), 
(10006, 'd001', '2004-03-18', '9999-01-01'), 
(10007, 'd002', '2006-08-22', '9999-01-01'), 
(10008, 'd003', '2008-11-30', '9999-01-01'), 
(10009, 'd004', '2010-05-14', '9999-01-01'), 
(10010, 'd005', '2009-03-26', '9999-01-01');
-- create a table named salaries
CREATE TABLE Salaries(
emp_id INT,
salary INT,
from_date DATE,
to_date DATE
);
INSERT INTO Salaries (emp_id,salary,from_date,to_date)
VALUES
(10001,60000,'2001-07-15','2003-01-01'),
(10001,65000,'2003-01-01','2005-02-28'),
(10001,70000,'2005-02-28','9999-01-01'),
(10002,55000,'2005-02-28','2007-01-01'),
(10002,60000,'2007-01-01','9999-01-01'),
(10003,62000,'2003-11-10','2006-01-01'),
(10003,65000,'2006-01-01','2010-12-31'),
(10004,70000,'2007-09-15','9999-01-01'),
(10005,58000,'2002-04-20','2004-01-01'),
(10005,62000,'2004-01-01','9999-01-01'),
(10006,63000,'2004-03-18','9999-01-01'),
(10007,60000,'2006-08-22','9999-01-01'),
(10008,64000,'2008-11-30', '9999-01-01'),
(10009,67000,'2010-05-14','9999-01-01'),
(10010,59000,'2009-03-26','9999-01-01');
-- create a table named employee_titles
CREATE TABLE employee_titles(
emp_id INT,
title VARCHAR(50),
from_date DATE,
to_date DATE
);
INSERT INTO employee_titles (emp_id,title,from_date,to_date)
VALUES
(10001, 'Manager', '2001-07-15', '2005-02-28'), 
(10001, 'Senior Manager', '2005-02-28', '9999-01-01'), 
(10002, 'Analyst', '2005-02-28', '2007-01-01'), 
(10002, 'Senior Analyst', '2007-01-01', '9999-01-01'), 
(10003, 'Coordinator', '2003-11-10', '2006-01-01'), 
(10003, 'Manager', '2006-01-01', '2010-12-31'), 
(10004, 'Engineer', '2007-09-15', '9999-01-01'), 
(10005, 'Sales Associate', '2002-04-20', '9999-01-01'), 
(10006, 'Analyst', '2004-03-18', '9999-01-01'), 
(10007, 'Manager', '2006-08-22', '9999-01-01'), 
(10008, 'Coordinator', '2008-11-30', '9999-01-01'), 
(10009, 'Engineer', '2010-05-14', '9999-01-01'), 
(10010, 'Sales Associate', '2009-03-26', '9999-01-01');
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employee_titles;
SELECT * FROM employees;
SELECT * FROM salaries;
--  first name and last name of all employees
SELECT first_name, last_name
FROM employees;
-- average salary of all employees
SELECT AVG(salary) as avg_salaries
FROM salaries;
--  department numbers and names
SELECT dep_no,
dep_name
FROM departments;
-- Get the total number of employees.
SELECT COUNT(*) AS total_employees
FROM employees;
-- birth date and hire date of employee with emp_no 10003
SELECT birth_date,hire_date
FROM employees
WHERE emp_id=10003;
-- gender of employee with emp_no 10007
SELECT gender
FROM employees
WHERE emp_id=10007;
-- highest salary among all employees
SELECT MAX(salary) AS highest_salary
FROM salaries;
-- names of all managers along with their department names
SELECT first_name,last_name,dep_name
FROM employees
JOIN dept_emp ON employees.emp_id=dept_emp.emp_id
JOIN departments ON dept_emp.dept_no=departments.dep_no
JOIN employee_titles ON employees.emp_id=employee_titles.emp_id
WHERE employee_titles.title='Manager';
-- department with the highest number of employees
SELECT departments.dep_name,COUNT(dept_emp.emp_id) AS num_employees
FROM dept_emp
JOIN departments ON dept_emp.dept_no=departments.dep_no
GROUP BY departments.dep_name
ORDER BY departments.dep_name DESC;
-- Retrieve the employee number, first name, last name, and salary of employees earning more than $60,000
SELECT employees.emp_id,employees.first_name,employees.last_name,salaries.salary
FROM employees
JOIN salaries ON salaries.emp_id=employees.emp_id
WHERE salaries.salary>60000;
-- total number of employees who have held the title "Senior Manager
SELECT COUNT(DISTINCT employees.emp_id) AS total_senior_managers
FROM employees
JOIN employee_titles ON employees.emp_id=employee_titles.emp_id
WHERE employee_titles.title='Senior Manager';
-- average salary for each department
SELECT departments.dep_name,AVG(salaries.salary) AS avg_salary
FROM employees
JOIN dept_emp ON employees.emp_id=dept_emp.emp_id
JOIN departments ON dept_emp.dept_no=departments.dep_no
JOIN salaries ON employees.emp_id=salaries.emp_id
GROUP BY departments.dep_name;
-- employee number, first name, last name, and title of all employees who are currently managers
SELECT employees.emp_id,employees.first_name,employees.last_name
FROM employees
JOIN dept_emp ON employees.emp_id=dept_emp.emp_id
JOIN departments ON dept_emp.dept_no=departments.dep_no
JOIN employee_titles ON employees.emp_id=employee_titles.emp_id
WHERE employee_titles.title='Manager';
-- total number of employees in each department
SELECT departments.dep_name,COUNT(dept_emp.emp_id) AS num_employees
FROM dept_emp
JOIN departments ON dept_emp.dept_no=departments.dep_no
GROUP BY departments.dep_name;
-- department number and name where the most recently hired employee works
SELECT departments.dep_no,departments.dep_name
FROM employees
JOIN dept_emp ON employees.emp_id=dept_emp.emp_id
JOIN departments ON dept_emp.dept_no=departments.dep_no
WHERE hire_date='2010-05-14';
-- department number and name where employee with emp_no 10004 works.
SELECT departments.dep_no,departments.dep_name
FROM employees
JOIN dept_emp ON employees.emp_id=dept_emp.emp_id
JOIN departments ON dept_emp.dept_no=departments.dep_no
WHERE employees.emp_id=10004;
-- department number, name, and average salary for departments with more than 3 employees
SELECT departments.dep_no,departments.dep_name,AVG(salaries.salary) avg_salary
FROM departments
JOIN dept_emp ON departments.dep_no=dept_emp.dept_no
JOIN salaries ON dept_emp.emp_id=salaries.emp_id
GROUP BY departments.dep_no,departments.dep_name
HAVING COUNT(dept_emp.emp_id)>3;
-- employee number, first name, last name, and title of all employees hired in 2005.
SELECT employees.emp_id,employees.first_name,employees.last_name,employee_titles.title
FROM employees
JOIN employee_titles ON employees.emp_id=employee_titles.emp_id
WHERE employees.hire_date='2005-02-28';
-- department with the highest average salary.
SELECT departments.dep_name,AVG(salaries.salary) AS avg_salary
FROM employees
JOIN dept_emp ON employees.emp_id=dept_emp.emp_id
JOIN departments ON dept_emp.dept_no=departments.dep_no
JOIN salaries ON employees.emp_id=salaries.emp_id
GROUP BY departments.dep_name
ORDER BY avg_salary DESC
LIMIT 1;
-- employee number, first name, last name, and salary of employees hired before the year 2005
SELECT employees.emp_id,employees.first_name,employees.last_name,salaries.salary
FROM employees
JOIN salaries ON employees.emp_id=salaries.emp_id
WHERE employees.hire_date<'2005-01-01';
-- Get the department number, name, and total number of employees for departments with a female manager
SELECT departments.dep_no, departments.dep_name, COUNT(dept_emp.emp_id) AS num_employees
FROM departments 
JOIN dept_emp  ON departments.dep_no = dept_emp.dept_no
JOIN employees  ON dept_emp.emp_id = employees.emp_id
JOIN employee_titles ON employees.emp_id = employee_titles.emp_id
JOIN (
    SELECT de_sub.dept_no
    FROM dept_emp de_sub
    JOIN employees e_sub ON de_sub.emp_id = e_sub.emp_id
    JOIN employee_titles et_sub ON e_sub.emp_id = et_sub.emp_id
    WHERE et_sub.title = 'Manager' AND e_sub.gender = 'Female'
) gf ON dept_emp.dept_no = gf.dept_no
GROUP BY departments.dep_no, departments.dep_name;
-- Retrieve the employee number, first name, last name, and department name of employees who are currently working in the Finance department
SELECT employees.emp_id,employees.first_name,employees.last_name,departments.dep_name
FROM employees
JOIN dept_emp ON employees.emp_id=dept_emp.emp_id
JOIN departments ON dept_emp.dept_no=departments.dep_no
WHERE departments.dep_name='Finance';
-- Find the employee with the highest salary in each department
SELECT employees.emp_id,employees.first_name,departments.dep_name,MAX(salaries.salary) Highest_salary
FROM employees
JOIN dept_emp ON employees.emp_id=dept_emp.emp_id
JOIN departments ON dept_emp.dept_no=departments.dep_no
JOIN salaries ON employees.emp_id=salaries.emp_id
GROUP BY employees.emp_id,employees.first_name,departments.dep_name;
-- employee number, first name, last name, and department name of employees who have held a managerial position
SELECT employees.emp_id,employees.first_name,employees.last_name,departments.dep_name
FROM employees
JOIN dept_emp ON employees.emp_id=dept_emp.emp_id
JOIN departments ON dept_emp.dept_no=departments.dep_no
JOIN employee_titles ON employees.emp_id=employee_titles.emp_id
WHERE employee_titles.title='Manager';
-- department number, name, and the number of employees who have worked there for more than 5 years
SELECT departments.dep_no,departments.dep_name,COUNT(dept_emp.emp_id) num_employees
FROM departments
JOIN dept_emp ON departments.dep_no=dept_emp.dept_no
WHERE DATEDIFF(CURRENT_DATE,dept_emp.from_date)>5*365
GROUP BY departments.dep_no,departments.dep_name;
-- Find the employee with the longest tenure in the company
SELECT employees.emp_id,employees.first_name,employees.last_name,MIN(dept_emp.from_date) start_date,MAX(dept_emp.to_date) end_date
FROM employees
JOIN dept_emp ON employees.emp_id=dept_emp.emp_id
GROUP BY employees.emp_id,employees.first_name,employees.last_name
ORDER BY MIN(dept_emp.from_date)
LIMIT 1;
-- Retrieve the employee number, first name, last name, and title of employees whose hire date is between '2005-01-01' and '2006-01-01'
SELECT employees.emp_id,employees.first_name,employees.last_name,employee_titles.title
FROM employees
JOIN dept_emp ON employees.emp_id=dept_emp.emp_id
JOIN employee_titles ON employees.emp_id=employee_titles.emp_id
WHERE employees.hire_date BETWEEN '2005-01-01' AND '2006-01-01';
-- Get the department number, name, and the oldest employee's birth date for each department
SELECT d.dep_no, d.dep_name, MIN(e.birth_date) AS oldest_employee
FROM departments d
JOIN dept_emp de ON d.dep_no = de.dept_no
JOIN employees e ON de.emp_id = e.emp_id
GROUP BY d.dep_no, d.dep_name
LIMIT 0, 1000;
