CREATE DATABASE IF NOT EXISTS School_System;

USE School_System;

CREATE TABLE IF NOT EXISTS Students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone CHAR(15),
    age INT,
    address TEXT
);

CREATE TABLE IF NOT EXISTS Instructors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    department VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(id)
);

CREATE TABLE IF NOT EXISTS Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date TIMESTAMP NOT NULL,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (course_id) REFERENCES Courses(id)
);

INSERT INTO Students (name, email, phone, age, address) VALUES
('Ahmed', 'ahmed@example.com', 01269987563, 18,  "Alexandria"),
('Mohamed', 'mohamed@example.com', 01258896631, 14, 'Cairo'),
('Hany', 'hany@example.com', 01298874563, 16, 'Aswan'),
('Sara', 'sara@example.com', 01265539874, 17, 'Alexandria'),
('Ali', 'ali@example.com', 01236654701, 18,"Suez");

INSERT INTO Instructors (name, email, phone, department) VALUES
('Islam', 'islam@example.com', '0444444444', 'cs'),
('Ziad', 'ziad@example.com', '0555555555', 'Maths'),
('Nagdy', 'nagdy@example.com', '0666666666', 'English');

INSERT INTO Courses (name,instructor_id) VALUES
('cs', 1),
('Maths', 2),
( "English",3),
("c++", 1);

INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, NOW(), 'A'),
(1, 4, NOW(), 'B+'),
(2, 2, NOW(), 'A-'),
(3, 1, NOW(), 'B'),
(3, 3, NOW(), 'C'),
(4, 2, NOW(), 'A'),
(5, 4, NOW(), 'B'),
(5, 3, NOW(), 'A+');