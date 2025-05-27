-- Active: 1747974131746@@127.0.0.1@5432@university_db

-- Database creation 
CREATE DATABASE university_db;

-- Create a table for storing student information
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    frontend_mark INT NOT NULL,
    backend_mark INT NOT NULL,
    status VARCHAR(20)
);

-- Create a table for storing course information
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL
);

-- Create a table for storing enrollment information
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL REFERENCES students(student_id),
    course_id INT NOT NULL REFERENCES courses(course_id)
);

-- Insert sample data into students table
INSERT into students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES ('Sameer',   21,	'sameer@example.com',	48,	60,	NULL),
       ('Zoya',	    23,	'zoya@example.com',    	52,	58,	NULL),
       ('Nabil',	22,	'nabil@example.com',	37,	46,	NULL),
	   ('Rafi',	    24,	'rafi@example.com',	    41,	40,	NULL),
	   ('Sophia',	22,	'sophia@example.com',	50,	52,	NULL),
       ('Hasan',	23,	'hasan@gmail.com',      43,	39,	NULL);

-- Insert sample data into courses table
INSERT into courses (course_name, credits)
VALUES ('Next.js', 3),
       ('React.js', 4),
       ('Databases', 3),
       ('Prisma', 3);

-- Insert sample data into enrollment table
INSERT into enrollment (student_id, course_id)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (3, 2);

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollment;


-- Insert a student with a NULL status
INSERT into students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES ('Sameer',   21,	'sameer15@example.com',	48,	60,	NULL);


-- Find all students enrolled in the 'Next.js' course
SELECT student_name from enrollment
    JOIN students USING(student_id)
    JOIN courses USING(course_id)
    where course_name = 'Next.js';


-- Delete all courses that have no students enrolled
DELETE FROM courses
    WHERE course_id NOT IN(
        SELECT course_id FROM enrollment
    );

-- Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name FROM students LIMIT 2 OFFSET 2;

-- Retrieve the course names and the number of students enrolled in each course.
SELECT course_name, count(*) as students_enrolled FROM enrollment
    JOIN courses USING(course_id)
    GROUP BY course_name;

-- Calculate and display the average age of all students.
SELECT avg(age) as average_age FROM students;

-- Retrieve the names of students whose email addresses contain 'example.com'.
SELECT student_name FROM students WHERE email LIKE '%example.com%';
