use bestbuy;

-- 1 joins: select all the computers from the products table using the products table and the categories table, return the product name and the category name

SELECT p.name, c.name
FROM products as p
INNER JOIN categories as c ON p.categoryid = c.categoryid
WHERE c.name = 'Computers';

-- 2 joins: find all product names, product prices, and products ratings that have a rating of 5

SELECT p.name, p.price, r.rating
FROM products as p
INNER JOIN reviews as r ON p.productid = r.productid
WHERE r.rating = 5;

-- 3 joins: find the employee with the most total quantity sold.  use the sum() function and group by

SELECT e.employeeid, e.firstname, e.lastname, SUM(s.quantity) AS total_quantity
FROM employees AS e
INNER JOIN sales AS s ON e.employeeid = s.employeeid
GROUP BY e.employeeid, e.firstname, e.lastname
ORDER BY total_quantity DESC
LIMIT 2;

-- 4 joins: find the name of the department, and the name of the category for Appliances and Games

SELECT d.name, c.name
FROM departments as d
INNER JOIN categories as c ON d.departmentid = c.departmentid
WHERE c.name IN ('Appliances', 'Games');

-- 5 joins: find the product name, total # sold, and total price sold, for Eagles: Hotel California --You may need to use SUM()

SELECT p.name, SUM(s.quantity) AS total_sold, SUM(s.quantity * s.priceperunit) AS total_price_sold
FROM products as p
INNER JOIN sales as s ON p.productid = s.productid
WHERE p.name = 'Eagles: Hotel California'
GROUP BY p.name;

-- 6 joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)

SELECT p.name, r.reviewer, r.rating, r.comment
FROM products as p
INNER JOIN reviews  as r ON p.productid = r.productid
WHERE p.name = 'Visio TV'
ORDER BY r.rating ASC
LIMIT 1;

-- Extra - May be difficult
-- Your goal is to write a query that serves as an employee sales report.

-- 7 This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold

SELECT e.employeeid, e.firstname, e.lastname, p.name, SUM(s.quantity) AS quantity_sold
FROM employees as e
INNER JOIN sales as s ON e.employeeid = s.employeeid
INNER JOIN products as p ON s.productid = p.productid
GROUP BY e.employeeid, e.firstname, e.lastname, p.name
ORDER BY e.employeeid, p.name;
