-- =====================================================
-- File: 01_select_filter_sort.sql
-- Purpose: Practice SELECT, WHERE, ORDER BY, LIMIT, LIKE
-- Note: Run 01_insert_data.sql first so the tables have data.
-- =====================================================

USE ecommerce_db;

-- Q1: Show the name and price of every product
SELECT product_name, price
FROM products;

-- Q2: Show only the customers who live in Dhaka
SELECT first_name, last_name, city
FROM customers
WHERE city = 'Dhaka';

-- Q3: Products priced above 1000, most expensive first
SELECT product_name, price
FROM products
WHERE price > 1000
ORDER BY price DESC;

-- Q4: The 3 cheapest products
SELECT product_name, price
FROM products
ORDER BY price ASC
LIMIT 3;

-- Q5: Customers whose first name starts with 'A'
SELECT first_name, last_name
FROM customers
WHERE first_name LIKE 'A%';

-- Q6: Orders that are still pending or shipped
SELECT order_id, customer_id, status
FROM orders
WHERE status IN ('pending', 'shipped');

-- Q7: Products priced between 1000 and 2000
SELECT product_name, price
FROM products
WHERE price BETWEEN 1000 AND 2000;

-- Q8: List of cities our customers live in (no repeats)
SELECT DISTINCT city
FROM customers;