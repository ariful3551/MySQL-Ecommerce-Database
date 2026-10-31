-- =====================================================
-- File: 02_create_tables.sql
-- Purpose: Create all tables for ecommerce_db
-- Note: Run 01_create_database.sql first.
-- =====================================================

USE ecommerce_db;

-- Drop tables child-first so foreign keys do not block the drop
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;


-- -----------------------------------------------------
-- Table: customers
-- -----------------------------------------------------
CREATE TABLE customers (
  customer_id  INT AUTO_INCREMENT PRIMARY KEY,
  first_name   VARCHAR(50)  NOT NULL,
  last_name    VARCHAR(50)  NOT NULL,
  email        VARCHAR(100) NOT NULL UNIQUE,
  phone        VARCHAR(20),
  city         VARCHAR(50),
  created_at   DATETIME DEFAULT CURRENT_TIMESTAMP
);



-- -----------------------------------------------------
-- Table: categories
-- -----------------------------------------------------
CREATE TABLE categories (
  category_id    INT AUTO_INCREMENT PRIMARY KEY,
  category_name  VARCHAR(50) NOT NULL UNIQUE,
  description    VARCHAR(255)
);


-- -----------------------------------------------------
-- Table: products (each product belongs to one category)
-- -----------------------------------------------------
CREATE TABLE products (
  product_id      INT AUTO_INCREMENT PRIMARY KEY,
  product_name    VARCHAR(100)  NOT NULL,
  price           DECIMAL(10,2) NOT NULL CHECK (price >= 0),
  stock_quantity  INT NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
  category_id     INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);


-- -----------------------------------------------------
-- Table: orders (each order belongs to one customer)
-- -----------------------------------------------------
CREATE TABLE orders (
  order_id     INT AUTO_INCREMENT PRIMARY KEY,
  customer_id  INT NOT NULL,
  order_date   DATETIME DEFAULT CURRENT_TIMESTAMP,
  status       ENUM('pending','shipped','delivered','cancelled') NOT NULL DEFAULT 'pending',
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);