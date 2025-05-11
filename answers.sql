USE sales_db;

-- Create customer_details table
CREATE TABLE customer_details(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT UNIQUE,
    customer_name VARCHAR(50)
);

-- Insert customer data
INSERT INTO customer_details(order_id, customer_name) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Create product_details table
CREATE TABLE product_details(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_category VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES customer_details(order_id)
);

-- Insert product data 
INSERT INTO product_details(order_id, product_category) VALUES
(101, 'Laptop'),
(101, 'Mouse'),
(102, 'Tablet'),
(102, 'Keyboard'),
(102, 'Mouse'),
(103, 'Phone');

SELECT *FROM product_details;
SELECT *FROM customer_details;

-- creating a join
SELECT c.order_id, c.customer_name, p.product_category AS product
FROM customer_details c
JOIN product_details p ON c.order_id = p.order_id;


-- creating three tables to perform a second normalization customers, product and orders tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT UNIQUE,
    customer_name VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_category VARCHAR(50)
);

CREATE TABLE orders (
    order_product_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    FOREIGN KEY (order_id) REFERENCES customers(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- inserting data into tables products, orders and customers
-- Insert customers
INSERT INTO customers(order_id, customer_name) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert products
INSERT INTO products(product_category) VALUES
('Laptop'), ('Mouse'), ('Tablet'), ('Keyboard'), ('Phone');

-- Insert into orders
INSERT INTO orders(order_id, product_id) VALUES
(101, 1), 
(101, 2), 
(102, 3), 
(102, 4), 
(102, 2), 
(103, 5)
; 
