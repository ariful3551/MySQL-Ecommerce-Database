# Data Dictionary

This file describes every table and column in `ecommerce_db`.

## customers
One row per registered customer.

| Column | Type | Constraint | Description |
|---|---|---|---|
| customer_id | INT | PK, AUTO_INCREMENT | Unique ID of the customer |
| first_name | VARCHAR(50) | NOT NULL | First name |
| last_name | VARCHAR(50) | NOT NULL | Last name |
| email | VARCHAR(100) | NOT NULL, UNIQUE | Contact email, no duplicates allowed |
| phone | VARCHAR(20) | NULL allowed | Phone number stored as text to keep the leading 0 |
| city | VARCHAR(50) | NULL allowed | City of residence |
| created_at | DATETIME | DEFAULT CURRENT_TIMESTAMP | When the account was created |

## categories
Product groups such as Electronics or Books.

| Column | Type | Constraint | Description |
|---|---|---|---|
| category_id | INT | PK, AUTO_INCREMENT | Unique ID of the category |
| category_name | VARCHAR(50) | NOT NULL, UNIQUE | Category name |
| description | VARCHAR(255) | NULL allowed | Short explanation |

## products
Items for sale. Each product belongs to one category.

| Column | Type | Constraint | Description |
|---|---|---|---|
| product_id | INT | PK, AUTO_INCREMENT | Unique ID of the product |
| product_name | VARCHAR(100) | NOT NULL | Product name |
| price | DECIMAL(10,2) | NOT NULL, CHECK (price >= 0) | Current selling price |
| stock_quantity | INT | NOT NULL, DEFAULT 0, CHECK (>= 0) | Units currently in stock |
| category_id | INT | NOT NULL, FK | References categories(category_id) |

## orders
One row per order placed by a customer.

| Column | Type | Constraint | Description |
|---|---|---|---|
| order_id | INT | PK, AUTO_INCREMENT | Unique ID of the order |
| customer_id | INT | NOT NULL, FK | References customers(customer_id) |
| order_date | DATETIME | DEFAULT CURRENT_TIMESTAMP | When the order was placed |
| status | ENUM | NOT NULL, DEFAULT 'pending' | pending, shipped, delivered or cancelled |

## order_items
Junction table linking orders and products (many-to-many). One row per product in an order.

| Column | Type | Constraint | Description |
|---|---|---|---|
| order_item_id | INT | PK, AUTO_INCREMENT | Unique ID of the order line |
| order_id | INT | NOT NULL, FK | References orders(order_id) |
| product_id | INT | NOT NULL, FK | References products(product_id) |
| quantity | INT | NOT NULL, CHECK (quantity > 0) | Number of units ordered |
| unit_price | DECIMAL(10,2) | NOT NULL | Price at purchase time, so later price changes do not alter old orders |

## payments
Payment record for an order.

| Column | Type | Constraint | Description |
|---|---|---|---|
| payment_id | INT | PK, AUTO_INCREMENT | Unique ID of the payment |
| order_id | INT | NOT NULL, FK | References orders(order_id) |
| payment_method | ENUM | NOT NULL | card, bkash or cash_on_delivery |
| amount | DECIMAL(10,2) | NOT NULL | Amount paid |
| payment_status | ENUM | NOT NULL, DEFAULT 'pending' | paid, pending or failed |
| payment_date | DATETIME | DEFAULT CURRENT_TIMESTAMP | When the payment was made |