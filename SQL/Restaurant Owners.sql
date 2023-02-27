-- sqlite command
.mode markdown
.header on

-- Create Menu Table (Dimension Table 1)
Create Table menu (
    menu_id int not null primary key,
    menu_name TEXT,
    price real
  );

-- Insert Menu
Insert into menu values
  (1,   'Pork Loin BBQ',            99),
  (2,   'Honey Glazed Pork Chop',  199),
  (3,   'Bacon Cheese Burger',     119),
  (4,   'Hawai Chicken',            69),
  (5,   'Spicy Grilled Chicken',    69),
  (6,   'Apple Salad',              79),
  (7,   'Cheese Burger',            69),
  (8,   'Baked Spanish & Cheese',   60),
  (9,   'Baked Potato',             40),
  (10,  'Cheese Toast',             25);

-- Create Menu Table (Dimension Table 2)
CREATE TABLE customer (
    customer_id int not null primary key,
    customer_name TEXT,
    customer_lastname TEXT,
    gender TEXT,
    age int
);

-- Insert Customer Table
Insert into customer values
    (1,  'Jim',    'Dole',  'M',  25),
    (2,  'Sarah',  'Leigh', 'F',  27),
    (3,  'Andy',   'Green', 'M',  18),
    (4,  'Dennis', 'Gray',  'F',  35),
    (5,  'Peter',  'Pan',   'M',  30),
    (6,  'James',  'Bond',  'M',  40),
    (7,  'Jack',   'Brown', 'M',  33),
    (8,  'Jennie', 'Kim',   'F',  22),
    (9,  'Anne',   'Black', 'F',  68),
    (10, 'John',   'Lennon','M',  55);

-- Create Payment Table (Dimension Table 3)
CREATE TABLE payment (
    payment_id int not null primary key,
    payment_name TEXT
);

-- Insert Payment Table
Insert into payment values
  (1,  'Cash'),
  (2,  'QR Code'),
  (3,  'Credit Card'),
  (4,  'Debit Card');

-- Create Promotion Coupon Table (Dimension Table 4)
CREATE TABLE promotion (
    promotion_id int not null primary key,
    promotion_name TEXT,
    promotion_discount real
);

-- Insert Promotion Coupon Table
Insert into promotion values
  (1, 'Discount 5%', 0.05),
  (2, 'Discount 10%', 0.10),
  (3, 'Discount 20%', 0.20),
  (4, 'Discount 30%', 0.30);

-- Create Pattern Table (Dimension Table 5)
CREATE TABLE pattern (
    pattern_id int not null primary key,
    pattern_name TEXT
);

-- Insert Pattern Table
Insert into pattern values
  (1, 'Dine-in'),
  (2, 'Take away'),
  (3, 'Food delivery');
-------------------------------------------------------

-- Create Order Table (Fact)
CREATE TABLE orders (
    orders_id INT NOT NULL PRIMARY KEY,
    orders_date TEXT,
    customer_id INT,
    menu_id INT,
    payment_id INT,
    pattern_id INT,
    promotion_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id),
    FOREIGN KEY (payment_id) REFERENCES payment(payment_id),
    FOREIGN KEY (pattern_id) REFERENCES pattern(pattern_id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(promotion_id)
);

-- Insert order table
INSERT INTO orders values
    (1, "2022-01-20", 1, 3, 3, 2, 3),
    (2, "2022-01-20", 2, 1, 1, 2, 1),
    (3, "2022-02-11", 3, 2, 4, 1, 2),
    (4, "2022-02-12", 4, 9, 1, 3, 1),
    (5, "2022-02-20", 5, 6, 2, 1, 4),
    (6, "2022-03-19", 6, 4, 4, 3, 3),
    (7, "2022-04-17", 7, 2, 2, 2, 1),
    (8, "2022-04-29", 8, 5, 4, 1, 2),
    (9, "2022-05-08", 9, 7, 2, 2, 3),
    (10, "2022-05-11", 10, 8, 3, 3, 4);
-------------------------------------------------------

-- Q1 How much the total income gained by each Menu?

SELECT 
    m.menu_name,
    sum(m.price * (1 - pro.promotion_discount)) as total_income
FROM customer AS c 
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN menu AS m ON m.menu_id = o.menu_id
JOIN promotion AS pro ON pro.promotion_id = o.promotion_id
GROUP BY 1
ORDER BY 2 DESC ;


-- Q2 Which Pattern gained the most income?

SELECT 
    p.pattern_name,
    sum(m.price * (1 - pro.promotion_discount)) as total_income
FROM menu AS m
JOIN orders AS o ON m.menu_id = o.menu_id
JOIN pattern AS p ON p.pattern_id = o.pattern_id
JOIN promotion AS pro ON pro.promotion_id = o.promotion_id
GROUP BY 1
ORDER BY 2 DESC ;


-- Q3 Amount income transfered on 2022-01-20

WITH orders_20220120 AS (
    SELECT * 
    FROM orders AS o
    JOIN menu AS m ON m.menu_id = o.menu_id 
    JOIN promotion AS pro ON o.promotion_id = pro.promotion_id
    WHERE orders_date = '2022-01-20'
)
  
SELECT 
  orders_date,
	sum(m.price * (1 - pro.promotion_discount)) AS total_income
FROM orders_20220120 AS os
JOIN menu AS m ON m.menu_id = os.menu_id
JOIN promotion AS pro ON pro.promotion_id = os.promotion_id;
 
