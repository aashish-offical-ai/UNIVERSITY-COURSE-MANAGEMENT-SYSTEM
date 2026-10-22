# University Course Management System

## Project Overview

The **University Course Management System** is a MySQL database project designed to manage university departments, students, courses, instructors, and student enrollments.

The project demonstrates database creation, table relationships, data manipulation, filtering, joins, aggregate functions, subqueries, string functions, date functions, and window functions.

## Database Tables

| Table | Purpose |
|---|---|
| `Departments` | Stores department IDs and department names. |
| `Students` | Stores student details, including enrollment dates. |
| `Courses` | Stores course details, credit values, and department relationships. |
| `Instructors` | Stores instructor information, names, salaries, and department relationships. |
| `Enrollments` | Connects students to the courses they take. |

Primary keys identify records uniquely. Foreign keys connect related tables and help maintain referential integrity. Unique constraints can prevent duplicate values or duplicate student-course enrollments.

## Questions / Tasks Covered

The project follows the 16 questions provided for the assignment:

1. Perform CRUD operations on all tables.
2. Retrieve students who enrolled after 2022.
3. Retrieve Mathematics department courses, limited to five courses.
4. Count students enrolled in each course and show courses with more than five students.
5. Find students enrolled in both *Introduction to SQL* and *Data Structures*.
6. Find students enrolled in either *Introduction to SQL* or *Data Structures*.
7. Calculate the average credits across all courses.
8. Find the maximum instructor salary in the Computer Science department.
9. Count students enrolled in each department.
10. Use an `INNER JOIN` to retrieve students and their corresponding courses.
11. Use a `LEFT JOIN` to retrieve all students and their corresponding courses, if any.
12. Use a subquery to find students enrolled in courses with more than ten students.
13. Extract the year from `EnrollmentDate`.
14. Concatenate an instructor's first and last name.
15. Calculate a running total of student enrollments.
16. Label students as `Senior` or `Junior` based on their enrollment date.

## SQL Concepts Demonstrated

- Database and table creation
- Primary keys and foreign keys
- `INSERT`, `SELECT`, `UPDATE`, and `DELETE` (CRUD)
- `WHERE`, `IN`, `DISTINCT`, `ORDER BY`, and `LIMIT`
- `INNER JOIN` and `LEFT JOIN`
- `COUNT()`, `AVG()`, and `MAX()`
- `GROUP BY` and `HAVING`
- Subqueries
- Date functions such as `YEAR()` and `CURDATE()`
- String functions such as `CONCAT()`
- Window functions such as `COUNT() OVER (...)`
- Conditional logic using `CASE`

## Requirements

- MySQL Server
- MySQL Workbench or another MySQL client
- The provided SQL script: `University_Course_Management_System_MySQL.sql`

## How to Run

1. Open MySQL Workbench and connect to your MySQL server.
2. Open `University_Course_Management_System_MySQL.sql`.
3. Execute the script to create the database, tables, and sample data.
4. Run the queries in MySQL Workbench to view the results.
5. If using the MySQL command-line client, move to the folder containing the SQL file and run:

   ```sql
   SOURCE D:\final project sql\University_Course_Management_System_MySQL.sql;
   ```

   Replace `/full/path/to/` with the actual path to your file. On Windows, use the actual Windows path, for example:

   ```sql
   SOURCE D:\final project sql\University_Course_Management_System_MySQL.sql;
   ```

## Output and Reasons File

The file `University_Course_Management_System_16_Questions_Output_Reasons.txt` contains the questions in assignment order, SQL queries, MySQL-style output tables, and explanations for why each query is used.

## Notes

- Query results depend on the sample data in the SQL script.
- Question 16 uses `CURDATE()`, so the `Senior` and `Junior` labels may change depending on the date when the query runs.
- For Question 1, if CRUD testing uses a transaction followed by `ROLLBACK`, temporary test changes are undone and are not kept in the database.
- If your actual SQL file uses different table or column names, make sure the README and query explanations match the script.

## Author

University Course Management System — MySQL Project
