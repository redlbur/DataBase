CREATE DATABASE lab7;

SELECT * FROM countries WHERE name = 'string';
CREATE INDEX coun_name_index ON countries USING hash (name);

SELECT * FROM employees WHERE name = ‘string’ AND surname = ‘string’;
CREATE INDEX coun_name_surname_index ON employees USING hash (name,surname);

SELECT * FROM employees WHERE salary < value1 AND salary > value2;
CREATE UNIQUE INDEX sal_index ON employees USING btree(salary, salary);

SELECT * FROM employees WHERE substring(name from 1 for 4) = ‘abcd’;
CREATE INDEX emp_substring_index ON employees USING hash (substring(name from 1 to 4));

SELECT * FROM employees e JOIN departments d ON d.department_id = e.department_id WHERE d.budget > value2 AND e.salary < value2;
CREATE INDEX depart_index ON employees (department_id, salary);
CREATE INDEX budget_index ON departments (department_id, budget);                                                                 
