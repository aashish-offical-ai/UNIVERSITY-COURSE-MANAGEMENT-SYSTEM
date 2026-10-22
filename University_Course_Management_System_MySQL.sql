CREATE DATABASE IF NOT EXISTS UniversityCourseDB;
USE UniversityCourseDB;

-- 1. CREATE TABLES
CREATE TABLE IF NOT EXISTS Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(120) NOT NULL UNIQUE,
    BirthDate DATE NOT NULL,
    EnrollmentDate DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    Credits INT NOT NULL,
    CONSTRAINT chk_course_credits CHECK (Credits > 0),
    CONSTRAINT fk_courses_department
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE IF NOT EXISTS Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(120) NOT NULL UNIQUE,
    DepartmentID INT NOT NULL,
    Salary DECIMAL(10,2) NOT NULL DEFAULT 0,
    CONSTRAINT fk_instructors_department
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE IF NOT EXISTS Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    CONSTRAINT fk_enrollments_student
        FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT fk_enrollments_course
        FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    CONSTRAINT uq_student_course UNIQUE (StudentID, CourseID)
);

-- 2. SAMPLE DATA
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics')
ON DUPLICATE KEY UPDATE DepartmentName = VALUES(DepartmentName);

INSERT INTO Students
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'Amit', 'Patel', 'amit.patel@email.com', '2002-03-10', '2023-07-15'),
(4, 'Sara', 'Khan', 'sara.khan@email.com', '2001-11-20', '2024-08-01'),
(5, 'Ravi', 'Shah', 'ravi.shah@email.com', '2000-09-05', '2020-08-01'),
(6, 'Priya', 'Mehta', 'priya.mehta@email.com', '2003-02-14', '2025-08-01'),
(7, 'Neha', 'Joshi', 'neha.joshi@email.com', '2002-06-22', '2022-07-20'),
(8, 'Arjun', 'Verma', 'arjun.verma@email.com', '2001-12-02', '2021-07-25'),
(9, 'Mina', 'Desai', 'mina.desai@email.com', '2004-04-18', '2023-08-10'),
(10, 'Kabir', 'Singh', 'kabir.singh@email.com', '2000-07-30', '2019-08-01'),
(11, 'Isha', 'Rao', 'isha.rao@email.com', '2003-10-12', '2024-07-15'),
(12, 'Dev', 'Joshi', 'dev.joshi@email.com', '2002-01-08', '2022-08-15')
ON DUPLICATE KEY UPDATE FirstName = VALUES(FirstName);

INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 1, 4),
(103, 'Calculus', 2, 4),
(104, 'Statistics', 2, 3)
ON DUPLICATE KEY UPDATE CourseName = VALUES(CourseName);

INSERT INTO Instructors
(InstructorID, FirstName, LastName, Email, DepartmentID, Salary) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 85000.00),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 78000.00),
(3, 'Carlos', 'Miller', 'carlos.miller@univ.com', 1, 92000.00),
(4, 'Divya', 'Patel', 'divya.patel@univ.com', 2, 81000.00)
ON DUPLICATE KEY UPDATE Salary = VALUES(Salary);

-- 12 students are enrolled in Introduction to SQL, so Query 12 can return results.
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 101, '2021-08-01'),
(3, 3, 101, '2023-07-15'),
(4, 4, 101, '2024-08-01'),
(5, 5, 101, '2020-08-01'),
(6, 6, 101, '2025-08-01'),
(7, 7, 101, '2022-07-20'),
(8, 8, 101, '2021-07-25'),
(9, 9, 101, '2023-08-10'),
(10, 10, 101, '2019-08-01'),
(11, 11, 101, '2024-07-15'),
(12, 12, 101, '2022-08-15'),
(13, 1, 102, '2022-08-05'),
(14, 2, 102, '2021-08-05'),
(15, 3, 102, '2023-07-20'),
(16, 4, 103, '2024-08-05'),
(17, 5, 103, '2020-08-05'),
(18, 6, 104, '2025-08-05')
ON DUPLICATE KEY UPDATE EnrollmentDate = VALUES(EnrollmentDate);

-- ============================================================
-- 3. CRUD OPERATIONS
-- ============================================================

START TRANSACTION;

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (99, 'Temporary Department');
SELECT * FROM Departments WHERE DepartmentID = 99;
UPDATE Departments SET DepartmentName = 'Temporary Department Updated'
WHERE DepartmentID = 99;
DELETE FROM Departments WHERE DepartmentID = 99;

INSERT INTO Students
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES (99, 'Test', 'Student', 'test.student@example.com', '2001-01-01', '2026-01-01');
SELECT * FROM Students WHERE StudentID = 99;
UPDATE Students SET LastName = 'Updated'
WHERE StudentID = 99;
DELETE FROM Students WHERE StudentID = 99;

INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits)
VALUES (999, 'Temporary Course', 1, 2);
SELECT * FROM Courses WHERE CourseID = 999;
UPDATE Courses SET Credits = 3 WHERE CourseID = 999;
DELETE FROM Courses WHERE CourseID = 999;

INSERT INTO Instructors
(InstructorID, FirstName, LastName, Email, DepartmentID, Salary)
VALUES (99, 'Test', 'Teacher', 'test.teacher@example.com', 1, 50000);
SELECT * FROM Instructors WHERE InstructorID = 99;
UPDATE Instructors SET Salary = 55000 WHERE InstructorID = 99;
DELETE FROM Instructors WHERE InstructorID = 99;

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES (999, 12, 104, '2026-01-10');
SELECT * FROM Enrollments WHERE EnrollmentID = 999;
UPDATE Enrollments SET EnrollmentDate = '2026-01-15'
WHERE EnrollmentID = 999;
DELETE FROM Enrollments WHERE EnrollmentID = 999;

ROLLBACK;


SELECT *
FROM Students
WHERE EnrollmentDate >= '2023-01-01';

SELECT c.CourseID, c.CourseName, c.DepartmentID, c.Credits
FROM Courses AS c
JOIN Departments AS d ON d.DepartmentID = c.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;

SELECT c.CourseID, c.CourseName, COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Courses AS c
JOIN Enrollments AS e ON e.CourseID = c.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(DISTINCT e.StudentID) > 5;

SELECT s.StudentID, s.FirstName, s.LastName
FROM Students AS s
JOIN Enrollments AS e ON e.StudentID = s.StudentID
JOIN Courses AS c ON c.CourseID = e.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;

SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students AS s
JOIN Enrollments AS e ON e.StudentID = s.StudentID
JOIN Courses AS c ON c.CourseID = e.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');

SELECT AVG(Credits) AS AverageCredits
FROM Courses;

SELECT MAX(i.Salary) AS MaximumSalary
FROM Instructors AS i
JOIN Departments AS d ON d.DepartmentID = i.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

SELECT d.DepartmentID, d.DepartmentName,
       COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Departments AS d
LEFT JOIN Courses AS c ON c.DepartmentID = d.DepartmentID
LEFT JOIN Enrollments AS e ON e.CourseID = c.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;

SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName, e.EnrollmentDate
FROM Students AS s
INNER JOIN Enrollments AS e ON e.StudentID = s.StudentID
INNER JOIN Courses AS c ON c.CourseID = e.CourseID
ORDER BY s.StudentID, c.CourseName;

SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
FROM Students AS s
LEFT JOIN Enrollments AS e ON e.StudentID = s.StudentID
LEFT JOIN Courses AS c ON c.CourseID = e.CourseID
ORDER BY s.StudentID, c.CourseName;

SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students AS s
JOIN Enrollments AS e ON e.StudentID = s.StudentID
WHERE e.CourseID IN (
    SELECT e2.CourseID
    FROM Enrollments AS e2
    GROUP BY e2.CourseID
    HAVING COUNT(DISTINCT e2.StudentID) > 10
);

SELECT StudentID, FirstName, LastName,
       YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;

SELECT InstructorID,
       CONCAT(FirstName, ' ', LastName) AS InstructorFullName
FROM Instructors;


SELECT EnrollmentID, StudentID, CourseID, EnrollmentDate,
       COUNT(*) OVER (
           ORDER BY EnrollmentDate, EnrollmentID
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS RunningEnrollmentTotal
FROM Enrollments
ORDER BY EnrollmentDate, EnrollmentID;

SELECT StudentID, FirstName, LastName, EnrollmentDate,
       CASE
           WHEN EnrollmentDate < DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
               THEN 'Senior'
           ELSE 'Junior'
       END AS StudentLevel
FROM Students
ORDER BY StudentID;

SELECT * FROM Departments;
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Enrollments;
