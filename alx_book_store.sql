-- Create the database
DROP DATABASE IF EXISTS `alx_book_store`;
CREATE DATABASE `alx_book_store`;
USE `alx_book_store`;

-- Table: AUTHORS
CREATE TABLE AUTHORS (
  author_id INT PRIMARY KEY,
  author_name VARCHAR(215)
) ENGINE=InnoDB;

-- Table: BOOKS
CREATE TABLE BOOKS (
  book_id INT PRIMARY KEY,
  title VARCHAR(130),
  author_id INT,
  price DOUBLE,
  publication_date DATE,
  FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
) ENGINE=InnoDB;

-- Table: CUSTOMERS
CREATE TABLE CUSTOMERS (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(215),
  email VARCHAR(215),
  address TEXT
) ENGINE=InnoDB;

-- Table: ORDERS
CREATE TABLE ORDERS (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
) ENGINE=InnoDB;

-- Table: ORDER_DETAILS
CREATE TABLE ORDER_DETAILS (
  orderdetailid INT PRIMARY KEY,
  order_id INT,
  book_id INT,
  quantity DOUBLE,
  FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
  FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
) ENGINE=InnoDB;