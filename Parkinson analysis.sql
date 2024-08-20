DROP DATABASE IF EXISTS `Parks_and_Recreation`;
CREATE DATABASE `Parks_and_Recreation`;
USE `Parks_and_Recreation`;
CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE,
  PRIMARY KEY (employee_id)
);

CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);

INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Leslie', 'Knope', 44, 'Female','1979-09-25'),
(3,'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000,1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000,1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000,1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000,1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000,1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000,1),
(7, 'Ann', 'Perkins', 'Nurse', 55000,4),
(8, 'Chris', 'Traeger', 'City Manager', 90000,3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000,6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000,1);

CREATE TABLE parks_departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name varchar(50) NOT NULL,
  PRIMARY KEY (department_id)
);

INSERT INTO parks_departments (department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');
SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;
-- retrieving the first name column from table employee_demographics
SELECT first_name,
last_name,
gender,
age,
age+20
FROM employee_demographics;
-- using the employee_salary table
SELECT * FROM employee_salary
WHERE salary<=75000
;
SELECT *FROM employee_salary
WHERE occupation='Nurse';
-- retrieving the female from the employee_demographics
SELECT *FROM employee_demographics
WHERE gender='Female';
SELECT * FROM employee_demographics
WHERE birth_date>'1987-01-01';
-- logical operators
SELECT * FROM employee_demographics
WHERE birth_date>'1987-01-01'
AND gender='Male'
;
-- group by
SELECT gender
 FROM employee_demographics
 GROUP BY gender;
 -- using aggregate fucntions
 SELECT gender, AVG(age)
 FROM employee_demographics
 GROUP BY gender;
 SELECT occupation,salary
 FROM employee_salary
 GROUP BY occupation,salary;
 -- retrieving the max and minimum values
 SELECT gender, AVG(age),MIN(age),MAX(age)
 FROM employee_demographics
 GROUP BY gender;
 -- count for the gender
 SELECT gender, AVG(age),MIN(age),MAX(age),COUNT(age)
 FROM employee_demographics
 GROUP BY gender;
 -- order by function
 SELECT *
 FROM employee_demographics
 ORDER BY age;
 SELECT * FROM employee_salary
 ORDER BY salary;
 -- having and where fiunctions
 SELECT gender, MAX(age)
 FROM employee_demographics
 GROUP BY gender
 HAVING MAX(age)>40;
 SELECT occupation,AVG(salary)
 FROM employee_salary
 WHERE occupation LIKE '%manage%'
 GROUP BY occupation;
 -- Limits and Aliasing functions
 SELECT gender, STDDEV(age) AS std_age
 FROM employee_demographics
 GROUP BY gender;
 -- retrieving top 3 earners and oldest people
 SELECT *
 FROM employee_demographics
 ORDER BY age DESC
 LIMIT 3;
 SELECT *  FROM employee_salary
 ORDER BY salary DESC
 LIMIT 3;
 -- Joins
 -- Inner Join
 SELECT * FROM employee_demographics
 INNER JOIN employee_salary
   ON employee_demographics.employee_id=employee_salary.employee_id
 ;
 -- outer joins
 -- LEFT JOIN 
 SELECT * FROM employee_demographics
 LEFT JOIN employee_salary
   ON employee_demographics.employee_id=employee_salary.employee_id;
-- Right Join
SELECT * FROM employee_demographics
 RIGHT JOIN employee_salary
   ON employee_demographics.employee_id=employee_salary.employee_id;
-- Joining multiple tables.
SELECT * FROM employee_demographics
 INNER JOIN employee_salary
   ON employee_demographics.employee_id=employee_salary.employee_id
INNER JOIN parks_departments
   ON employee_salary.dept_id=parks_departments.department_id
 ;
 -- Unions
 SELECT first_name, last_name
 FROM employee_demographics
 UNION 
 SELECT first_name,last_name
 FROM employee_salary;
 -- unions and case statements
 SELECT first_name, last_name, 'OLD Man' AS Label
 FROM employee_demographics
 WHERE age>40 AND gender='Male'
 UNION
 SELECT first_name, last_name, 'OLD Lady' AS Label
 FROM employee_demographics
 WHERE age>40 AND gender='Female'
 UNION 
 SELECT first_name,last_name, 'Highly paid Employee' AS Label
 FROM employee_salary
 WHERE salary>70000
 ORDER BY first_name,last_name;
 -- Strings
 SELECT LENGTH('Chrisphine_ouma');
 SELECT first_name,LENGTH(first_name)
 FROM employee_demographics;
 SELECT first_name,last_name,
 CONCAT(first_name,'  ',last_name) Full_names
 FROM employee_demographics;
 -- case statements
 SELECT first_name,last_name,
 CASE
	WHEN age<=30  THEN 'Young_Adult'
    WHEN age BETWEEN 31 and 50 THEN 'Old_Adults'
    WHEN age>50 THEN 'Elderly'
    END Age_bracket
FROM employee_demographics;
SELECT* FROM employee_demographics;
-- Pay increase and Bonus
-- <50000 =5%
-- >50000 =7%
-- Finance =10% Bonus
SELECT first_name, last_name, salary,
CASE 
	WHEN salary<50000 THEN salary*1.05
	WHEN salary>=50000 THEN salary*1.07
END New_salary,
CASE 
WHEN dept_id=6 THEN salary*1.10
WHEN dept_id=1 THEN salary*1.50
END Bonus
FROM employee_salary;
-- Subqueries
SELECT * FROM employee_demographics
WHERE employee_id IN (
		SELECT employee_id
        FROM employee_salary
        WHERE dept_id=1);
SELECT first_name,salary,
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary;
-- Window functions
SELECT gender,AVG(salary)
FROM employee_demographics
JOIN employee_salary ON employee_demographics.employee_id=employee_salary.employee_id
GROUP BY gender;
SELECT employee_demographics.first_name,gender,AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics
JOIN employee_salary ON employee_demographics.employee_id=employee_salary.employee_id;
SELECT employee_demographics.first_name,gender,SUM(salary) OVER(PARTITION BY gender)
FROM employee_demographics
JOIN employee_salary ON employee_demographics.employee_id=employee_salary.employee_id;
-- Rolling total
SELECT employee_demographics.first_name,gender,salary,SUM(salary) OVER(PARTITION BY gender ORDER BY employee_demographics.employee_id) Rolling_Total
FROM employee_demographics
JOIN employee_salary ON employee_demographics.employee_id=employee_salary.employee_id;
SELECT employee_demographics.first_name,gender,salary, ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) rank_num,
DENSE_RANK ()OVER(PARTITION BY gender ORDER BY salary DESC)  den_rank
FROM employee_demographics
JOIN employee_salary ON employee_demographics.employee_id=employee_salary.employee_id;
-- CTEs
WITH CTE_employee AS
(
SELECT gender,AVG(salary) avg_sal,MAX(salary) max_sal,MIN(salary) min_sal,COUNT(salary)
FROM employee_demographics
JOIN employee_salary ON employee_demographics.employee_id=employee_salary.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal)FROM CTE_employee;
WITH CTE_employee AS
(
SELECT gender,birth_date,employee_id
FROM employee_demographics
WHERE birth_date>='1985-01-01'

),
CTE_employee1 AS
(
SELECT employee_id,salary
FROM employee_salary
where salary>=60000
)
SELECT *FROM CTE_employee
JOIN CTE_employee1 ON CTE_employee1.employee_id=CTE_employee.employee_id
;
-- Stored procedures
SELECT* FROM employee_salary
WHERE salary>=50000;
CREATE PROCEDURE large_salary()
SELECT* FROM employee_salary
WHERE salary>=50000;
CALL large_salary();
DELIMITER $$
CREATE PROCEDURE large_salary2()
BEGIN
	SELECT* FROM employee_salary
	WHERE salary>=50000;
	SELECT* FROM employee_salary
	WHERE salary>10000;
END $$
DELIMITER ;
CALL large_salary2();
-- Triggers and Events
SELECT* FROM employee_salary;
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id,first_name,last_name)
    VALUES(NEW.employee_id,NEW.first_name,NEW.last_name);
END $$
DELIMITER ;
INSERT INTO employee_salary(employee_id,first_name,last_name,occupation,salary)
VALUES(13,"Chrisphine","Ouma","Research Assistant",150000);
SELECT * FROM employee_demographics;
-- Events
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE FROM employee_demograpics
    WHERE age>=60;
END $$
DELIMITER ;
