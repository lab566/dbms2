CREATE DATABASE Customerinfo;
USE Customerinfo;

CREATE TABLE customertable(
	Customerid INT PRIMARY KEY,
	Customername VARCHAR(25),
	City VARCHAR(25),
	email VARCHAR(50)
);

CREATE TABLE ordertable(
	Orderid INT PRIMARY KEY,
	Orderdate DATE,
	Customerid INT,
    Amount INT,
    FOREIGN KEY(Customerid)
	REFERENCES customertable(Customerid)
);

INSERT INTO customertable VALUES
(1,'Amit','Pune','amit@gmail.com'),
(2,'Neha','Mumbai','neha@gmail.com'),
(3,'Rohit','Delhi','rohit@gmail.com'),
(4,'Sneha','Pune','sneha@gmail.com'),
(5,'Karan','Bangalore','karan@gmail.com'),
(6,'Priya','Pune','priya@gmail.com'),
(7,'Rahul','Chennai','rahul@gmail.com'),
(8,'Simran','Mumbai','simran@gmail.com'),
(9,'Arjun','Delhi','arjun@gmail.com'),
(10,'Meera','Pune','meera@gmail.com'),
(11,'Vikas','Nagpur','vikas@gmail.com'),
(12,'Pooja','Hyderabad','pooja@gmail.com'),
(13,'Riya','Pune','riya@gmail.com'),
(14,'Kabir','Jaipur','kabir@gmail.com'),
(15,'Anjali','Indore','anjali@gmail.com');

INSERT INTO ordertable VALUES
(101,'2024-01-05',1,6000),
(102,'2024-01-10',2,3000),
(103,'2024-01-12',1,7000),
(104,'2024-01-20',3,2000),
(105,'2024-02-01',4,8000),
(106,'2024-02-05',5,1500),
(107,'2024-02-10',6,9000),
(108,'2024-02-15',2,NULL),
(109,'2024-02-20',7,4500),
(110,'2024-03-01',8,5000),
(111,'2024-03-05',9,2500),
(112,'2024-03-10',10,10000),
(113,'2024-03-12',1,3500),
(114,'2024-03-15',4,4000),
(115,'2024-03-18',11,2800),
(116,'2024-03-20',12,6200),
(119,'2024-03-27',6,NULL),
(120,'2024-03-30',13,5200);

INSERT INTO ordertable VALUES(121,'2024-03-15',NULL,2000),
(122,'2023-02-12',NULL,30000);

SELECT DISTINCT c.*
FROM customertable c
INNER JOIN ordertable o
ON c.Customerid = o.Customerid;

SELECT c.*, o.Orderid, o.Amount
FROM customertable c
LEFT JOIN ordertable o
ON c.Customerid = o.Customerid;

SELECT c.*, o.*
FROM customertable c
RIGHT JOIN ordertable o
ON c.Customerid = o.Customerid;

SELECT c.Customername, o.Amount
FROM customertable c
JOIN ordertable o
ON c.Customerid = o.Customerid
WHERE o.Amount > 5000;

SELECT c.Customername, COUNT(o.Orderid) AS TotalOrders
FROM customertable c
JOIN ordertable o
ON c.Customerid = o.Customerid
GROUP BY c.Customername
HAVING COUNT(o.Orderid) > 1;

SELECT o.Orderid, o.Amount, c.City
FROM ordertable o
JOIN customertable c
ON o.Customerid = c.Customerid;

SELECT c.*
FROM customertable c
LEFT JOIN ordertable o
ON c.Customerid = o.Customerid
WHERE o.Orderid IS NULL;

SELECT Customerid, MAX(Amount) AS HighestAmount
FROM ordertable
GROUP BY Customerid;

SELECT Customerid, SUM(Amount) AS TotalAmount
FROM ordertable
GROUP BY Customerid;

SELECT c.Customername, o.Orderdate, o.Amount
FROM customertable c
JOIN ordertable o
ON c.Customerid = o.Customerid
ORDER BY o.Orderdate;

SELECT c.Customername, SUM(o.Amount) AS TotalAmount
FROM customertable c
JOIN ordertable o
ON c.Customerid = o.Customerid
WHERE c.City = 'Pune'
GROUP BY c.Customername;

SELECT c.Customername, o.Orderid, o.Amount
FROM customertable c
RIGHT JOIN ordertable o
ON c.Customerid = o.Customerid;

SELECT c.Customername, MAX(o.Orderdate) AS LatestOrder
FROM customertable c
JOIN ordertable o
ON c.Customerid = o.Customerid
GROUP BY c.Customername;

SELECT DISTINCT c.Customername
FROM customertable c
JOIN ordertable o
ON c.Customerid = o.Customerid
WHERE c.City = 'Pune';