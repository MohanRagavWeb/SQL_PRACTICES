CREATE DATABASE CollegeDB;
GO

USE CollegeDB;

CREATE TABLE Students (
    StudentId INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    Marks INT
);
