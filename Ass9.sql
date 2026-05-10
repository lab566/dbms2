CREATE DATABASE AirlineDB;
USE AirlineDB;

CREATE TABLE Passenger (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(100),
    age INT,
    gender VARCHAR(10)
);
CREATE TABLE Flight (
    flight_no VARCHAR(20) PRIMARY KEY,
    airline_name VARCHAR(100),
    departure_time DATETIME,
    arrival_time DATETIME
);
CREATE TABLE Ticket (
    ticket_id INT PRIMARY KEY,
    passenger_id INT,
    flight_no VARCHAR(20),
    source VARCHAR(50),
    destination VARCHAR(50),
    pilot_name VARCHAR(100),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id),
    FOREIGN KEY (flight_no) REFERENCES Flight(flight_no)
);

INSERT INTO Passenger VALUES
(1, 'Rahul Sharma', 30, 'Male'),
(2, 'Priya Singh', 28, 'Female'),
(3, 'Amit Kumar', 35, 'Male');
INSERT INTO Flight VALUES
('AI101', 'Air India', '2026-04-10 10:00:00', '2026-04-10 12:00:00'),
('AI102', 'Air India', '2026-04-11 14:00:00', '2026-04-11 16:00:00'),
('AI103', 'Air India', '2026-04-12 09:00:00', '2026-04-12 11:00:00');
INSERT INTO Ticket VALUES
(1, 1, 'AI101', 'Delhi', 'Mumbai', 'Captain Verma'),
(2, 2, 'AI102', 'Pune', 'Bangalore', 'Captain Mehta'),
(3, 3, 'AI103', 'Chennai', 'Hyderabad', 'Captain Rao');

SELECT * FROM Passenger;
SELECT * FROM Flight;
SELECT * FROM Ticket;

SELECT t.ticket_id, p.passenger_name, t.flight_no, t.source, t.destination, t.pilot_name
FROM Ticket t
JOIN Passenger p ON t.passenger_id = p.passenger_id;

drop database AirlineDB;

-- CMD COMMANDS --
mysqldump -u root -p AirlineDB > backup.sql
mysql -u root -p AirlineDB2 < backup.sql

-- NEW DATA BASE USED WITH BACKUP -- 
create database AirlineDB2;
use AirlineDB2;
SELECT t.ticket_id, p.passenger_name, t.flight_no, t.source, t.destination, t.pilot_name
FROM Ticket t
JOIN Passenger p ON t.passenger_id = p.passenger_id;
drop database AirlineDB;
create database AirlineDB2;