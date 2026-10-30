-- =====================================================
-- File: 02_create_tables.sql
-- Purpose: Create all tables for ecommerce_db
-- Note: Run 01_create_database.sql first.
-- =====================================================

USE ecommerce_db;

-- Drop tables child-first so foreign keys do not block the drop
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;

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


-- Show Table
DESCRIBE customers;