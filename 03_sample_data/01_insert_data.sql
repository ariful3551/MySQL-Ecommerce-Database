-- =====================================================
-- File: 01_insert_data.sql
-- Purpose: Insert sample data into all tables
-- Note: Run 02_create_tables.sql first (it empties the tables).
--       Parents are inserted before children.
--       Customers 9 and 10 have no orders (useful for LEFT JOIN).
-- =====================================================


USE ecommerce_db;


-- Insert demo data customers table
INSERT INTO customers (first_name, last_name, email, phone, city, created_at) VALUES
('Rahim',  'Uddin',    'rahim@example.com',  '01711000001', 'Dhaka',      '2025-12-01 10:00:00'),
('Karima', 'Akter',    'karima@example.com', '01711000002', 'Chattogram', '2025-12-10 11:30:00'),
('Tanvir', 'Hasan',    'tanvir@example.com', '01711000003', 'Dhaka',      '2025-12-15 09:15:00'),
('Nusrat', 'Jahan',    'nusrat@example.com', '01711000004', 'Sylhet',     '2026-01-05 14:00:00'),
('Arif',   'Hossain',  'arif@example.com',   '01711000005', 'Dhaka',      '2026-01-12 16:45:00'),
('Sadia',  'Islam',    'sadia@example.com',  '01711000006', 'Rajshahi',   '2026-02-01 12:00:00'),
('Imran',  'Khan',     'imran@example.com',  '01711000007', 'Chattogram', '2026-02-20 18:20:00'),
('Mim',    'Chowdhury','mim@example.com',    '01711000008', 'Khulna',     '2026-03-03 13:10:00'),
('Fahim',  'Ahmed',    'fahim@example.com',  '01711000009', 'Dhaka',      '2026-04-01 10:40:00'),
('Lamia',  'Rahman',   'lamia@example.com',  '01711000010', 'Sylhet',     '2026-05-05 15:25:00');


-- Insert demo data categories table
INSERT INTO categories (category_name, description) VALUES
('Electronics',     'Phones, accessories and gadgets'),
('Clothing',        'Men and women apparel'),
('Books',           'Educational and programming books'),
('Home & Kitchen',  'Appliances and kitchenware'),
('Sports',          'Sports and fitness equipment');



-- Insert demo data product table
INSERT INTO products (product_name, price, stock_quantity, category_id) VALUES
('Wireless Mouse',        1200.00,  50, 1),
('Bluetooth Headphones',  3500.00,  30, 1),
('Smartphone',           25000.00,  15, 1),
('Cotton T-Shirt',         600.00, 100, 2),
('Denim Jeans',           1800.00,  60, 2),
('SQL for Beginners',      750.00,  40, 3),
('Python Crash Course',    900.00,  35, 3),
('Rice Cooker',           2800.00,  20, 4),
('Non-stick Pan',         1500.00,  25, 4),
('Football',              1100.00,  45, 5),
('Yoga Mat',               950.00,  30, 5),
('Desk Lamp',             1300.00,   0, 4);


-- Insert demo data orders table
INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2026-01-05 10:00:00', 'delivered'),
(1, '2026-02-14 12:30:00', 'delivered'),
(2, '2026-01-20 09:45:00', 'delivered'),
(3, '2026-02-02 17:10:00', 'delivered'),
(3, '2026-03-10 11:00:00', 'cancelled'),
(4, '2026-03-15 15:20:00', 'delivered'),
(5, '2026-03-18 13:05:00', 'shipped'),
(5, '2026-04-01 19:30:00', 'pending'),
(6, '2026-04-05 10:15:00', 'delivered'),
(7, '2026-04-12 16:00:00', 'delivered'),
(2, '2026-05-03 14:40:00', 'delivered'),
(8, '2026-05-10 12:20:00', 'shipped'),
(1, '2026-06-01 11:50:00', 'delivered'),
(4, '2026-06-15 18:00:00', 'pending');


-- Insert demo data order_items table
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1,  1, 1,  1200.00),
(1,  6, 1,   750.00),
(2,  3, 1, 25000.00),
(3,  4, 2,   600.00),
(3,  5, 1,  1800.00),
(4,  2, 1,  3500.00),
(4,  7, 1,   900.00),
(5, 10, 1,  1100.00),
(6,  8, 1,  2800.00),
(7,  9, 1,  1500.00),
(7, 11, 2,   950.00),
(8,  5, 2,  1800.00),
(9,  6, 1,   750.00),
(9,  7, 1,   900.00),
(10, 10, 2, 1100.00),
(11, 2, 1,  3500.00),
(11, 1, 1,  1200.00),
(12, 4, 3,   600.00),
(13, 8, 1,  2800.00),
(13, 9, 1,  1500.00),
(14, 11, 1,  950.00);


-- Insert demo data payments table
INSERT INTO payments (order_id, payment_method, amount, payment_status, payment_date) VALUES
(1,  'card',             1950.00, 'paid',    '2026-01-05 10:05:00'),
(2,  'card',            25000.00, 'paid',    '2026-02-14 12:35:00'),
(3,  'bkash',            3000.00, 'paid',    '2026-01-20 09:50:00'),
(4,  'bkash',            4400.00, 'paid',    '2026-02-02 17:15:00'),
(5,  'card',             1100.00, 'failed',  '2026-03-10 11:05:00'),
(6,  'cash_on_delivery', 2800.00, 'paid',    '2026-03-17 10:00:00'),
(7,  'bkash',            3400.00, 'paid',    '2026-03-18 13:10:00'),
(8,  'card',             3600.00, 'pending', '2026-04-01 19:35:00'),
(9,  'cash_on_delivery', 1650.00, 'paid',    '2026-04-07 12:00:00'),
(10, 'bkash',            2200.00, 'paid',    '2026-04-12 16:05:00'),
(11, 'card',             4700.00, 'paid',    '2026-05-03 14:45:00'),
(12, 'bkash',            1800.00, 'paid',    '2026-05-10 12:25:00'),
(13, 'card',             4300.00, 'paid',    '2026-06-01 11:55:00'),
(14, 'cash_on_delivery',  950.00, 'pending', '2026-06-15 18:05:00');


-- Show customers table data
SELECT * FROM customers;


-- Show categories table data
SELECT * FROM categories;


-- Show products table
SELECT * FROM products;


-- Show orders table
SELECT * FROM orders;


-- Show order_items table
SELECT * FROM order_items;


-- Show payments table
SELECT * FROM payments;

