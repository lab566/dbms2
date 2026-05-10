create database salesinfo;
use salesinfo;

create table sale(
	sale_id INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    QTY INT,
    Price INT,
    sale_date DATE
);

INSERT INTO sale VALUES
(1, 'Laptop', 2, 55000, '2024-01-05'),
(2, 'Mouse', 5, 500, '2024-01-06'),
(3, 'Keyboard', 3, 1200, '2024-01-07'),
(4, 'Monitor', 1, 15000, '2024-01-08'),
(5, 'Printer', 2, 8000, '2024-01-09'),
(6, 'Tablet', 4, 22000, '2024-01-10'),
(7, 'Speaker', 6, 3000, '2024-01-11'),
(8, 'Headphones', 3, 2500, '2024-01-12'),
(9, 'Webcam', 2, 1800, '2024-01-13'),
(10, 'Charger', 7, 900, '2024-01-14'),
(11, 'USB Drive', 10, 600, '2024-01-15'),
(12, 'SSD', 2, 7000, '2024-01-16'),
(13, 'HDD', 1, 5000, '2024-01-17'),
(14, 'Graphics Card', 1, 45000, '2024-01-18'),
(15, 'Router', 3, 3500, '2024-01-19'),
(16, 'Smartwatch', 2, 12000, '2024-01-20'),
(17, 'Mobile', 4, 20000, '2024-01-21'),
(18, 'Power Bank', 5, 1500, '2024-01-22'),
(19, 'Microphone', 2, 4000, '2024-01-23'),
(20, 'Projector', 1, 30000, '2024-01-24');

DELIMITER //

CREATE PROCEDURE insert_sale_record(
    IN p_sale_id INT,
    IN p_product_name VARCHAR(50),
    IN p_qty INT,
    IN p_price INT,
    IN p_sale_date DATE
)
BEGIN
    INSERT INTO sale(sale_id, Product_Name, QTY, Price, sale_date)
    VALUES(p_sale_id, p_product_name, p_qty, p_price, p_sale_date);
END //

DELIMITER ;

CALL insert_sale_record(21, 'Camera', 2, 25000, '2024-02-01');

DELIMITER //

CREATE FUNCTION total_records()
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE t INT;

SELECT COUNT(*) INTO t FROM sale;

RETURN t;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION update_sale_date(sid INT, newdate DATE)
RETURNS INT
DETERMINISTIC
BEGIN
UPDATE sale SET sale_date = newdate
WHERE sale_id = sid;

RETURN 1;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE update_price(
IN pname VARCHAR(50),
IN newprice INT
)
BEGIN
UPDATE sale
SET Price = newprice
WHERE Product_Name = pname;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION sales_between(d1 DATE, d2 DATE)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE c INT;

SELECT COUNT(*) INTO c
FROM sale
WHERE sale_date BETWEEN d1 AND d2;

RETURN c;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION top_product()
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
DECLARE p VARCHAR(50);

SELECT Product_Name INTO p
FROM sale
ORDER BY QTY DESC
LIMIT 1;

RETURN p;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION monthly_revenue(m INT, y INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE rev INT;

SELECT SUM(QTY*Price) INTO rev
FROM sale
WHERE MONTH(sale_date)=m AND YEAR(sale_date)=y;

RETURN rev;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sell_summary()
BEGIN
SELECT 
COUNT(*) AS total_sales,
SUM(QTY) AS total_quantity,
SUM(QTY*Price) AS total_revenue
FROM sale;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION product_sell(pname VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE q INT;

SELECT SUM(QTY) INTO q
FROM sale
WHERE Product_Name = pname;

RETURN q;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION total_sell()
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE s INT;

SELECT SUM(QTY*Price) INTO s FROM sale;

RETURN s;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION avg_sell()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE a DECIMAL(10,2);

SELECT AVG(QTY*Price) INTO a FROM sale;

RETURN a;
END //

DELIMITER ;