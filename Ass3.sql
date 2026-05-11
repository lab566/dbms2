CREATE DATABASE student;
USE student; 
show tables; 
CREATE TABLE Student ( 
StudentID INT PRIMARY KEY, 
Name VARCHAR(50), 
Email VARCHAR(50), 
Age INT, 
Address VARCHAR(100) ); 

CREATE TABLE Instructor ( 
InstructorID INT PRIMARY KEY, 
Name VARCHAR(50), 
Email VARCHAR(50), 
Department VARCHAR(50) 
);

CREATE TABLE Course ( 
CourseID INT PRIMARY KEY, 
CourseName VARCHAR(50), 
Credits INT, 
InstructorID INT, 
FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID) 
);

CREATE TABLE Enrollment ( 
EnrollmentID INT PRIMARY KEY, 
StudentID INT, 
CourseID INT, 
EnrollmentDate DATE, 
FOREIGN KEY (StudentID) REFERENCES Student(StudentID), 
FOREIGN KEY (CourseID) REFERENCES Course(CourseID) 
);

INSERT INTO Student (StudentID, Name, Email, Age, Address) VALUES 
(1, 'Amit Sharma', 'amit@gmail.com', 20, 'Pune'), 
(2, 'Neha Verma', 'neha@gmail.com', 21, 'Mumbai'), 
(3, 'Rahul Patil', 'rahul@gmail.com', 19, 'Nashik'), 
(4, 'Priya Singh', 'priya@gmail.com', 22, 'Delhi'), 
(5, 'Kunal Mehta', 'kunal@gmail.com', 20, 'Ahmedabad'), 
(6, 'Sneha Joshi', 'sneha@gmail.com', 21, 'Nagpur'), 
(7, 'Rohit Kulkarni', 'rohit@gmail.com', 23, 'Kolhapur'), 
(8, 'Anjali Deshmukh', 'anjali@gmail.com', 19, 'Aurangabad'), 
(9, 'Saurabh Jain', 'saurabh@gmail.com', 22, 'Indore'), 
(10, 'Pooja Nair', 'pooja@gmail.com', 21, 'Kochi'),
(11, 'Aditya Rao', 'aditya@gmail.com', 20, 'Bengaluru'), 
(12, 'Riya Choudhary', 'riya@gmail.com', 19, 'Jaipur'), 
(13, 'Vikas Gupta', 'vikas@gmail.com', 23, 'Noida'), 
(14, 'Simran Kaur', 'simran@gmail.com', 21, 'Chandigarh'), 
(15, 'Arjun Malhotra', 'arjun@gmail.com', 22, 'Gurgaon'); 

INSERT INTO Instructor (InstructorID, Name, Email, Department) VALUES
(1, 'Dr. Meena Iyer', 'meena@college.edu', 'Computer Science'), 
(2, 'Dr. Rajesh Kumar', 'rajesh@college.edu', 'Mechanical'), 
(3, 'Dr. Sunita Patil', 'sunita@college.edu', 'Electronics'), 
(4, 'Dr. Anil Sharma', 'anil@college.edu', 'Civil'), 
(5, 'Dr. Kavita Joshi', 'kavita@college.edu', 'IT'), 
(6, 'Dr. Suresh Rao', 'suresh@college.edu', 'AI & DS'), 
(7, 'Dr. Neeraj Singh', 'neeraj@college.edu', 'Mathematics'), 
(8, 'Dr. Pankaj Verma', 'pankaj@college.edu', 'Physics'), 
(9, 'Dr. Ritu Jain', 'ritu@college.edu', 'Chemistry'), 
(10, 'Dr. Mahesh Kulkarni', 'mahesh@college.edu', 'Statistics'), 
(11, 'Dr. Alok Mishra', 'alok@college.edu', 'Cyber Security'), 
(12, 'Dr. Nidhi Kapoor', 'nidhi@college.edu', 'Data Science'), 
(13, 'Dr. Sanjay Nair', 'sanjay@college.edu', 'Robotics'), 
(14, 'Dr. Pooja Shah', 'pooja@college.edu', 'Cloud Computing'), 
(15, 'Dr. Vinay Deshpande', 'vinay@college.edu', 'IoT');

INSERT INTO Course (CourseID, CourseName, Credits, InstructorID) VALUES 
(1, 'Database Management', 4, 1), 
(2, 'Operating Systems', 4, 5), 
(3, 'Data Structures', 4, 1), 
(4, 'Machine Learning', 5, 6), 
(5, 'Artificial Intelligence', 5, 12), 
(6, 'Computer Networks', 4, 11), 
(7, 'Cloud Computing', 3, 14), 
(8, 'Cyber Security', 4, 11), 
(9, 'IoT Fundamentals', 3, 15), 
(10, 'Robotics', 4, 13), 
(11, 'Engineering Mathematics', 4, 7), 
(12, 'Physics', 3, 8), 
(13, 'Chemistry', 3, 9), 
(14, 'Statistics', 4, 10), 
(15, 'Data Science Basics', 5, 12);

INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES 
(1, 1, 1, '2025-01-10'), 
(2, 2, 3, '2025-01-11'), 
(3, 3, 4, '2025-01-12'), 
(4, 4, 5, '2025-01-13'), 
(5, 5, 2, '2025-01-14'), 
(6, 6, 6, '2025-01-15'), 
(7, 7, 7, '2025-01-16'), 
(8, 8, 8, '2025-01-17'), 
(9, 9, 9, '2025-01-18'), 
(10, 10, 10, '2025-01-19'), 
(11, 11, 11, '2025-01-20'), 
(12, 12, 12, '2025-01-21'), 
(13, 13, 13, '2025-01-22'), 
(14, 14, 14, '2025-01-23'), 
(15, 15, 15, '2025-01-24');

SELECT*FROM Student WHERE Age BETWEEN 18 AND 20;
SELECT*FROM Instructor WHERE Department='CS';
SELECT*FROM Student WHERE email='%ac%';
select*from course where Instructorid in (11,13);
select*from student order by Age desc;
select*from course order by Credits desc;
select*from instructor order by Department asc,Name asc;
select*from student order by Address asc,Age asc;

select count(*) from student;
select avg(Age) from student;
select Instructorid,count(*) as course_count from course group by Instructorid;
select Courseid,count(*) as student_count from enrollment group by Courseid;
SELECT MAX(Age) FROM student;
SELECT MIN(Age) FROM student;

select*from enrollment where EnrollmentDate > 2025-01-15;

select Name 
from student
where Studentid in(
				select Studentid
				from enrollment
                where Courseid =(select Courseid
							    from course
                                where Name= 'DBMS'));
