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

