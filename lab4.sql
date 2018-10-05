CREATE TABLE customers(
customers_id SERIAL PRIMARY KEY,
  cust_name VARCHAR(50),
  city VARCHAR(50),
  grade INT,
  salesman_id INT
);

CREATE TABLE orders(
order_id SERIAL PRIMARY KEY,
  customers_id INT,
  description TEXT,
  purch_amt INT
);

INSERT INTO customers VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO customers VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO customers VALUES (3001, 'Brad Guzan', 'London', 100, 5005);
INSERT INTO customers VALUES (3004, 'Fabian Jhons', 'Paris', 300, 5006);
INSERT INTO customers VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO customers VALUES (3009, 'Geoff Camero', 'Berlin', 100, 5003);
INSERT INTO customers VALUES (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders VALUES (201, 3002, NULL, 23);
INSERT INTO orders VALUES (202, 3005, NULL, 24);
INSERT INTO orders VALUES (208, 3001, NULL, 25);
INSERT INTO orders VALUES (206, 3004, NULL, 26);
INSERT INTO orders VALUES (209, 3007, NULL, 27);
INSERT INTO orders VALUES (205, 3009, NULL, 28);
INSERT INTO orders VALUES (204, 3008, NULL, 29);


SELECT grade FROM customers WHERE grade > 100;
SELECT grade, city FROM customers WHERE city = 'New York' AND grade > 100;
SELECT city, grade FROM customers WHERE city = 'New York' OR grade > 100;
SELECT * FROM customers WHERE city = 'Paris' OR city = 'Rome';
SELECT * FROM customers WHERE cust_name LIKE 'B%';

SELECT * FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');
SELECT * FROM customers WHERE customers_id IN (SELECT customers_id FROM orders WHERE purch_amt > 10);
SELECT sum(purch_amt) FROM orders;
SELECT avg(purch_amt) FROM orders;
SELECT cust_name FROM customers WHERE cust_name NOTNULL;
SELECT purch_amt FROM orders ORDER BY purch_amt DESC LIMIT 1;