-- SQL Student Management System Project

USE StudentDB;

-- Drop Existing Tables

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;

-- Create Tables

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    marks INT
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT
);

-- Insert Data

INSERT INTO Students VALUES
(1,'Ravi','Hyderabad',85),
(2,'Srinu','Vijayawada',92),
(3,'Kiran','Guntur',78),
(4,'Anil','Hyderabad',88),
(5,'Sai','Visakhapatnam',95);

INSERT INTO Courses VALUES
(101,'SQL'),
(102,'Python'),
(103,'Excel');

INSERT INTO Enrollments VALUES
(1,1,101),
(2,1,102),
(3,2,101),
(4,3,103),
(5,4,102),
(6,5,101);

-- View Data

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

-- Students from Hyderabad

SELECT *
FROM Students
WHERE city = 'Hyderabad';

-- Students with Marks > 90

SELECT name, marks
FROM Students
WHERE marks > 90;

-- Student and Course Details

SELECT
    Students.name,
    Courses.course_name
FROM Students
INNER JOIN Enrollments
ON Students.student_id = Enrollments.student_id
INNER JOIN Courses
ON Enrollments.course_id = Courses.course_id;

-- City Wise Student Count

SELECT city, COUNT(*) AS Total_Students
FROM Students
GROUP BY city;

-- Average Marks by City

SELECT city, AVG(marks) AS Average_Marks
FROM Students
GROUP BY city
HAVING AVG(marks) > 85;

SELECT MAX(marks)
FROM Students;
