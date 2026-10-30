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


-- Show customers table data
SELECT * FROM customers;


-- Show categories table data
SELECT * FROM categories;