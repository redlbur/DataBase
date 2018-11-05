CREATE DATABASE lab7;

CREATE TABLE locations(
  location_id SERIAL PRIMARY KEY,
  street_address VARCHAR(25),
  postal_code VARCHAR(12),
  city VARCHAR(30),
  state_province VARCHAR(12)
);

CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50) UNIQUE,
  budget INTEGER,
  location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(50),
  salary INTEGER,
  manager_id INTEGER REFERENCES employees,
  department_id INTEGER REFERENCES departments
);

CREATE TABLE job_grades(
  grade CHAR(1),
  lowest_salary INTEGER,
  highest_salary INTEGER
);

SELECT E.first_name, E.last_name, E.department_id, L.city, L.state_province
FROM employees E JOIN departments D ON D.department_id = E.employee_id
JOIN locations L ON D.location_id = L.location_id WHERE E.last_name = '%b%';--3

SELECT D.department_name, L.city, L.state_province FROM departments D JOIN locations L  ON D.location_id = L.location_id;--4

SELECT E.first_name AS "employee name",
       M.first_name AS "maneger" FROM employees E LEFT OUTER JOIN employees M
    ON E.manager_id = M.employee_id;--5

SELECT grade, AVG(salary) FROM employees NATURAL JOIN job_grades GROUP BY grade;--6

SELECT first_name || ' ' || last_name AS Employee_name
	FROM employees
		JOIN departments USING (department_id)
		JOIN  locations USING (location_id)
	WHERE  city = 'London';--7