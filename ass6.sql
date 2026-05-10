create database employees; 
use employees; 
create table employees( 
Emp_ID INT PRIMARY KEY, 
Emp_Name VARCHAR(25), 
Salary INT, 
Dept_Name VARCHAR(10) 
); 
create table employees_audit( 
Emp_ID INT PRIMARY KEY, 
Emp_Name VARCHAR(25), 
Salary INT, 
Dept_Name VARCHAR(10) 
); 
truncate employees; 
INSERT INTO employees VALUES 
(101, 'Amit', 50000, 'HR'), 
(102, 'Sneha', 55000, 'HR'), 
(103, 'Rahul', 60000, 'IT'), 
(104, 'Priya', 52000, 'Finance'), 
(105, 'Karan', 48000, 'Sales'), 
(106, 'Neha', 47000, 'Marketing'), 
(107, 'Rohit', 62000, 'HR'), 
(108, 'Pooja', 51000, 'Admin'), 
(109, 'Arjun', 70000, 'HR'), 
(110, 'Meena', 45000, 'IT'), 
(111, 'Vikas', 58000, 'IT'), 
(112, 'Anjali', 54000, 'Marketing'), 
(113, 'Suresh', 61000, 'HR'), 
(114, 'Kavita', 49000, 'Sales'), 
(115, 'Manish', 53000, 'Finance'), 
(116, 'Deepa', 46000, 'Admin'), 
(117, 'Nikhil', 72000, 'HR'), 
(118, 'Shreya', 68000, 'IT'), 
(119, 'Tarun', 50000, 'Marketing'), 
(120, 'Divya', 51000, 'Sales'); 
DELIMITER // 
CREATE TRIGGER Insert_values 
AFTER  
INSERT 
ON employees 
FOR EACH ROW 
BEGIN 
 INSERT INTO employees_audit(Emp_ID, Emp_Name, Salary, Dept_Name) 
    VALUES(NEW.Emp_ID, NEW.Emp_Name, NEW.Salary, NEW.Dept_Name); 
END // 
DELIMITER ; 
 
SELECT * FROM employees_audit; 
 
DELIMITER // 
CREATE TRIGGER Update_Salary 
AFTER 
UPDATE 
ON employees 
FOR EACH ROW 
BEGIN 
    IF OLD.Salary <> NEW.Salary THEN 
        UPDATE employees_audit 
        SET Salary = NEW.Salary 
        WHERE Emp_ID = NEW.Emp_ID; 
    END IF; 
END // 
 
DELIMITER ; 
 
UPDATE employees 
SET Salary = 90000 
WHERE Emp_ID = 101; 
 
SELECT * FROM employees_audit; 
 
DELIMITER // 
CREATE TRIGGER delete_employee 
AFTER DELETE ON employees 
FOR EACH ROW 
BEGIN 
    DELETE FROM employees_audit 
    WHERE Emp_ID = OLD.Emp_ID; 
END // 
DELIMITER ; 
 
DELETE FROM employees 
WHERE Emp_ID = 101; 
 
SELECT * FROM employees_audit; 
 
DELIMITER // 
CREATE TRIGGER check_salary_insert 
BEFORE INSERT ON employees 
FOR EACH ROW 
BEGIN 
    IF NEW.Salary < 10000 THEN 
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Salary cannot be less than 10000'; 
    END IF; 
END // 
DELIMITER ; 
 
INSERT INTO employees VALUES (121, 'Ananya', 9000, 'HR'); 
 
DELIMITER // 
 
CREATE PROCEDURE Update_Salary() 
BEGIN 
    DECLARE done INT DEFAULT 0; 
    DECLARE e_id INT; 
    DECLARE e_sal DECIMAL(10,2); 
 
    DECLARE e_cursor CURSOR FOR 
        SELECT Emp_ID, Salary FROM employees 
        WHERE Dept_Name = 'IT'; 
 
    DECLARE CONTINUE HANDLER FOR NOT FOUND 
        SET done = 1; 
 
    OPEN e_cursor; 
 
    read_loop: LOOP 
        FETCH e_cursor INTO e_id, e_sal; 
 
        IF done = 1 THEN 
            LEAVE read_loop; 
        END IF; 
 
        UPDATE employees 
        SET Salary = e_sal + e_sal * 0.10 
        WHERE Emp_ID = e_id; 
 
    END LOOP; 
CLOSE e_cursor; 
END // 
DELIMITER ; 
CALL Update_Salary(); 
SELECT * FROM employees_audit;