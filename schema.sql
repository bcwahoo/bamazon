DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products (
  item_id INT NOT NULL,
  product_name VARCHAR(45) NULL,
  department_name VARCHAR(45) NULL,
  price DECIMAL(10, 2) NULL,
  stock_quanity INT NULL,
  PRIMARY KEY (item_id)
);

SELECT * FROM products

INSERT INTO products (item_id, product_name, department_name, price, stock_quanity)
VALUES 
(107601, "Timberland Boots", "footwear", 135.00, 24),
(107602, "Nike Air Flight Falcon", "footwear", 85.00, 7),
(107603, "Lenovo ThinkPad X1 Yoga", "technology", 2500.00, 13),
(107604, "HP EliteDisplay USB Portable Monitor", "technology", 200.00, 11),
(107605, "Google Pixel 4 XL", "mobile", 999.99, 1),
(107606, "Jabra Elite 75t Earbuds", "mobile", 199.99, 5),
(107607, "2020 Ford Explorer", "cars", 32765.00, 150),
(107608, "2019 Chrysler 300", "cars", 28952.00, 31),
(107609, "Torino Pro Wave Brush", "beauty", 19.99, 44),
(107610, "Cold Label Wolfin Pomade", "beauty", 16.95, 60);