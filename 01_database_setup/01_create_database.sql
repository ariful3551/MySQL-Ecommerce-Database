-- =====================================================
-- File: 01_create_database.sql
-- Purpose: Create the ecommerce_db database
-- Note: Safe to re-run. Drops any existing copy first,
--       so all existing data will be deleted.
-- =====================================================


-- Remove the old database so the script can be re-run without errors
DROP DATABASE IF EXISTS ecommerce_db;


-- utf8mb4 supports all languages (including Bangla) and emojis
-- unicode_ci makes comparisons case-insensitive ('Ali' = 'ali')
CREATE DATABASE ecommerce_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;


USE ecommerce_db;