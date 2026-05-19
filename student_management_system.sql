CREATE DATABASE student_management_system;

USE student_management_system;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    department VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

SHOW DATABASES;

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    duration VARCHAR(50),
    fee DECIMAL(10,2)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,

    FOREIGN KEY (student_id) REFERENCES students(student_id),

    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    attendance_date DATE,
    status VARCHAR(10),

    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
);

CREATE TABLE marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_name VARCHAR(100),
    marks INT,

    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
);

INSERT INTO students
(student_name, gender, age, department, email, phone)
VALUES
('Sindhu', 'Female', 21, 'CSE', 'sindhu@gmail.com', '9876543210'),

('Rahul', 'Male', 22, 'ECE', 'rahul@gmail.com', '9876543211'),

('Anjali', 'Female', 20, 'IT', 'anjali@gmail.com', '9876543212');

INSERT INTO courses
(course_name, duration, fee)
VALUES
('SQL', '3 Months', 5000),

('Python', '4 Months', 7000),

('Java', '5 Months', 8000);

INSERT INTO enrollments
(student_id, course_id, enrollment_date)
VALUES
(1, 1, '2026-01-10'),

(2, 2, '2026-01-11'),

(3, 3, '2026-01-12');

INSERT INTO attendance
(student_id, attendance_date, status)
VALUES
(1, '2026-05-01', 'Present'),

(2, '2026-05-01', 'Absent'),

(3, '2026-05-01', 'Present');

INSERT INTO marks
(student_id, subject_name, marks)
VALUES
(1, 'DBMS', 90),

(2, 'DBMS', 75),

(3, 'DBMS', 85);

SELECT * FROM students;

SELECT
    students.student_name,
    courses.course_name
FROM enrollments
JOIN students
ON enrollments.student_id = students.student_id
JOIN courses
ON enrollments.course_id = courses.course_id;

SELECT
    student_id,
    AVG(marks) AS average_marks
FROM marks
GROUP BY student_id;

SELECT
    MAX(marks) AS highest_marks
FROM marks;

SELECT
    students.student_name,
    attendance.status
FROM attendance
JOIN students
ON attendance.student_id = students.student_id
WHERE status = 'Present';

CREATE VIEW student_course_view AS
SELECT
    students.student_name,
    courses.course_name
FROM enrollments
JOIN students
ON enrollments.student_id = students.student_id
JOIN courses
ON enrollments.course_id = courses.course_id;

SELECT * FROM student_course_view;

DELIMITER //

CREATE PROCEDURE GetAllStudents()
BEGIN
    SELECT * FROM students;
END //

DELIMITER ;

