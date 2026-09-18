CREATE TABLE customers (
  customer_id NUMBER PRIMARY KEY,
  customer_name VARCHAR2(100),
  email VARCHAR2(100),
  city VARCHAR2(50)
);

CREATE TABLE products (
  product_id NUMBER PRIMARY KEY,
  product_name VARCHAR2(100),
  category VARCHAR2(50),
  price NUMBER(10,2)
);

CREATE TABLE orders (
  order_id NUMBER PRIMARY KEY,
  customer_id NUMBER REFERENCES customers(customer_id),
  order_date DATE
);

CREATE TABLE order_items (
  order_item_id NUMBER PRIMARY KEY,
  order_id NUMBER REFERENCES orders(order_id),
  product_id NUMBER REFERENCES products(product_id),
  quantity NUMBER
);

-- 5 Customers
INSERT INTO customers VALUES (1, 'Alice Smith', 'alice@example.com', 'New York');
INSERT INTO customers VALUES (2, 'Bob Jones', 'bob@example.com', 'Chicago');
INSERT INTO customers VALUES (3, 'Charlie Brown', 'charlie@example.com', 'Los Angeles');
INSERT INTO customers VALUES (4, 'Diana Prince', 'diana@example.com', 'New York');
INSERT INTO customers VALUES (5, 'Evan Wright', 'evan@example.com', 'Seattle');

-- 8 products
INSERT INTO products VALUES (101, 'Organic Milk', 'Dairy', 3.50);
INSERT INTO products VALUES (102, 'Cheddar Cheese', 'Dairy', 5.00);
INSERT INTO products VALUES (103, 'Whole Wheat Bread', 'Bakery', 2.50);
INSERT INTO products VALUES (104, 'Chocolate Chip Cookie', 'Bakery', 1.50);
INSERT INTO products VALUES (105, 'Apple Juice', 'Beverages', 4.00);
INSERT INTO products VALUES (106, 'Green Tea', 'Beverages', 3.00);
INSERT INTO products VALUES (107, 'Greek Yogurt', 'Dairy', 2.00);
INSERT INTO products VALUES (108, 'Croissant', 'Bakery', 2.00);

-- 15 orders
INSERT INTO orders VALUES (1, 1, DATE '2026-09-01');
INSERT INTO orders VALUES (2, 2, DATE '2026-09-02');
INSERT INTO orders VALUES (3, 1, DATE '2026-09-03');
INSERT INTO orders VALUES (4, 3, DATE '2026-09-03');
INSERT INTO orders VALUES (5, 4, DATE '2026-09-04');
INSERT INTO orders VALUES (6, 2, DATE '2026-09-05');
INSERT INTO orders VALUES (7, 1, DATE '2026-09-07');
INSERT INTO orders VALUES (8, 3, DATE '2026-09-08');
INSERT INTO orders VALUES (9, 4, DATE '2026-09-09');
INSERT INTO orders VALUES (10, 2, DATE '2026-09-10');
INSERT INTO orders VALUES (11, 1, DATE '2026-09-11');
INSERT INTO orders VALUES (12, 3, DATE '2026-09-12');
INSERT INTO orders VALUES (13, 4, DATE '2026-09-13');
INSERT INTO orders VALUES (14, 2, DATE '2026-09-14');
INSERT INTO orders VALUES (15, 1, DATE '2026-09-15');

-- 25 order_items
INSERT INTO order_items VALUES (1, 1, 101, 2);
INSERT INTO order_items VALUES (2, 1, 103, 1);
INSERT INTO order_items VALUES (3, 2, 102, 3);
INSERT INTO order_items VALUES (4, 2, 105, 2);
INSERT INTO order_items VALUES (5, 3, 106, 4);
INSERT INTO order_items VALUES (6, 3, 104, 2);
INSERT INTO order_items VALUES (7, 4, 107, 5);
INSERT INTO order_items VALUES (8, 4, 101, 1);
INSERT INTO order_items VALUES (9, 5, 108, 3);
INSERT INTO order_items VALUES (10, 5, 105, 1);
INSERT INTO order_items VALUES (11, 6, 102, 2);
INSERT INTO order_items VALUES (12, 6, 103, 2);
INSERT INTO order_items VALUES (13, 7, 104, 6);
INSERT INTO order_items VALUES (14, 8, 106, 2);
INSERT INTO order_items VALUES (15, 8, 107, 3);
INSERT INTO order_items VALUES (16, 9, 101, 4);
INSERT INTO order_items VALUES (17, 10, 105, 3);
INSERT INTO order_items VALUES (18, 10, 108, 2);
INSERT INTO order_items VALUES (19, 11, 102, 1);
INSERT INTO order_items VALUES (20, 12, 103, 3);
INSERT INTO order_items VALUES (21, 13, 106, 5);
INSERT INTO order_items VALUES (22, 13, 104, 4);
INSERT INTO order_items VALUES (23, 14, 107, 2);
INSERT INTO order_items VALUES (24, 15, 101, 2);
INSERT INTO order_items VALUES (25, 15, 105, 1);

COMMIT;