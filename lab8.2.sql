CREATE DATABASE lab8;

CREATE TABLE salesman(
  salesman_id INT,
  name VARCHAR(255),
  city VARCHAR(255) DEFAULT NULL,
  commission FLOAT
);

CREATE TABLE customers(
  customers_id INT,
  cust_name VARCHAR(255),
  city VARCHAR(255),
  grade INT DEFAULT NULL,
  salesman_id INT
);

CREATE TABLE orders(
  ord_no INT,
  purch_amt FLOAT,
  ord_date VARCHAR(255),
  customer_id INT,
  salesman_id INT
);

INSERT INTO salesman VALUES (5001, 'James Hoog', 'New York', 0.15);
INSERT INTO salesman VALUES (5002, 'Nail Knite', 'Paris', 0.13);
INSERT INTO salesman VALUES (5005, 'Pit Alex', 'London', 0.11);
INSERT INTO salesman VALUES (5006, 'Mc Lyon', 'Paris', 0.14);
INSERT INTO salesman VALUES (5003, 'Lauson Hen',DEFAULT, 0.12);
INSERT INTO salesman VALUES (5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO customers VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO customers VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO customers VALUES (3001, 'Brad Guzan', 'London', DEFAULT, 5005);
INSERT INTO customers VALUES (3004, 'Fabian Johns', 'Paris', 300, 5006);
INSERT INTO customers VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO customers VALUES (3009, 'Geoff Camero', 'Berlin', 100, 5003);
INSERT INTO customers VALUES (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders VALUES (70001, 150.5, '2012-10-05', 3005, 5002);
INSERT INTO orders VALUES (70009, 270.65, '2012-09-10', 3001, 5005);
INSERT INTO orders VALUES (70002, 65.26, '2012-10-05', 3002, 5001);
INSERT INTO orders VALUES (70004, 110.5, '2012-08-17', 3009, 5003);
INSERT INTO orders VALUES (70007, 948.5, '2012-09-10', 3005, 5002);
INSERT INTO orders VALUES (70005, 2400.6, '2012-07-27', 3007, 5001);
INSERT INTO orders VALUES (70008, 5760, '2012-09-10', 3002, 5001);

SELECT * FROM salesman;
SELECT * FROM customers;
SELECT * FROM orders;

CREATE ROLE junior_dev WITH LOGIN PASSWORD 'dev';--3

CREATE VIEW ord AS SELECT name, AVG(purch_amt), SUM(purch_amt) FROM salesman, orders
WHERE salesman.salesman_id = orders.salesman_id GROUP BY name;--4
SELECT * FROM ord;

CREATE VIEW order_inf AS SELECT city, SUM(DISTINCT purch_amt) FROM salesman, orders
WHERE salesman.salesman_id = orders.salesman_id GROUP BY city;
GRANT ALL PRIVILEGES ON order_inf TO gunior_dev;--5
SELECT * FROM order_inf;

CREATE VIEW cus_with_lowgrade AS SELECT * FROM customers WHERE grade = (SELECT grade FROM customers ORDER BY grade ASC LIMIT 1);
GRANT SELECT ON cust_with_maxgrade TO gunior_dev;--6
SELECT * FROM cus_with_lowgrade;

CREATE VIEW nums_salesman_ AS SELECT grade, COUNT(salesman_id) FROM customers GROUP BY grade;
SELECT * FROM nums_salesman_;--7

CREATE VIEW sale_orders AS SELECT * FROM salesman WHERE salesman_id IN(SELECT salesman_id FROM orders GROUP BY (orders.salesman_id) HAVING COUNT(purch_amt) > 1);
SELECT * FROM sale_orders;--8

CREATE ROLE intern;
GRANT intern TO gunior_dev;--9

