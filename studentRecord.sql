-- Creating the Student Record Database
CREATE DATABASE StudentRecords;

-- Use the database
USE StudentRecords;

-- Creating the tables for the Database
CREATE TABLE students (
    admission_no INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE
);

CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    admission_no INT,
    subject_id INT,
    enrollment_date DATE,
    form VARCHAR(2),
    FOREIGN KEY (admission_no) REFERENCES students(admission_no),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);
-- Inserting data into the tables
INSERT INTO departments (department_name) VALUES
('Sciences'), ('Mathematics'), ('Languages'), ('Humanities');

INSERT INTO students (admission_no, first_name, last_name, phone)
VALUES
(101, 'James', 'Musau','0734567890'),
(102, 'Michael', 'Wachira','0787654321'),
(103, 'Elvis', 'Kiptoo','0709483529');

INSERT INTO subjects (subject_name, department_id)
VALUES
('Physics', 1),
('Mathematics', 2),
('English', 3),
('Kiswahili', 3),
('Biology', 1),
('Chemistry', 1),
('Geography', 4),
('History', 4),
('CRE', 4);

INSERT INTO enrollments (admission_no, subject_id, enrollment_date, form)
VALUES
(101, 1, '2024-09-01', 2),
(101, 2, '2024-09-01', 2),
(101, 3, '2024-09-01', 2),
(101, 4, '2024-09-01', 2),
(101, 5, '2024-09-01', 2),
(101, 6, '2024-09-01', 2),
(101, 9, '2024-09-01', 2),
(102, 4, '2024-09-01', 2),
(102, 1, '2024-09-01', 2),
(102, 3, '2024-09-01', 2),
(102, 2, '2024-09-01', 2),
(102, 5, '2024-09-01', 2),
(102, 7, '2024-09-01', 2),
(102, 8, '2024-09-01', 2),
(103, 6, '2024-09-01', 2),
(103, 2, '2024-09-01', 2),
(103, 3, '2024-09-01', 2),
(103, 4, '2024-09-01', 2),
(103, 6, '2024-09-01', 2),
(103, 7, '2024-09-01', 2),
(103, 9, '2024-09-01', 2);

-- Select all students enrolled in a particular subject 
SELECT s.first_name, s.last_name, e.enrollment_date
FROM students s
JOIN enrollments e ON s.admission_no = e.admission_no
JOIN subjects su ON e.subject_id = su.subject_id
WHERE su.subject_name = 'English';