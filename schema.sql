DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products (
  item_id INT NOT NULL,
  product_name VARCHAR(45) NULL,
  department_name VARCHAR(45) NULL,
  price DECIMAL(10, 2) NULL,
  stock_quanity INT NOT NULL,
  PRIMARY KEY (item_id)
);

INSERT INTO products (item_id, product_name, department_name, price, stock_quanity)
VALUES (107601, "Men's Timberland Boots Size 14", footwear, 135.00, 112),
(107601, "Men's Timberland Boots Size 14", footwear, 135.00, 112),
(107601, "Men's Timberland Boots Size 14", footwear, 135.00, 112),
(107601, "Men's Timberland Boots Size 14", footwear, 135.00, 112),
(107601, "Men's Timberland Boots Size 14", footwear, 135.00, 112),
(107601, "Men's Timberland Boots Size 14", footwear, 135.00, 112),
(107601, "Men's Timberland Boots Size 14", footwear, 135.00, 112),
(107601, "Men's Timberland Boots Size 14", footwear, 135.00, 112),
(107601, "Men's Timberland Boots Size 14", footwear, 135.00, 112),
(107601, "Men's Timberland Boots Size 14", footwear, 135.00, 112),
(107601, "Men's Timberland Boots Size 14", footwear, 135.00, 112);
