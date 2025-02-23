# Pewlett Hackard Employee Data Analysis

## Overview

This project involves analyzing employee data from Pewlett Hackard, a fictional company, spanning the 1980s and 1990s. The dataset consists of six CSV files, and the project is divided into three main parts: data modeling, data engineering, and data analysis.

## Project Structure
* `README.md`: This file, providing an overview of the project.
* `ERD_Employees`: a image file of ERD
* `SQL_Challenge_table_schemata.sql`: SQL script to create the database tables.
* `SQL_Challenge_query`: SQL script for Data Analysis queries. 
* `employees.csv`, `departments.csv`, `dept_emp.csv`, `dept_manager.csv`, `salaries.csv`, `titles.csv`: The dataset CSV files.

## Part 1: Data Modeling

### Description

In this phase, the provided CSV files were inspected, and an Entity-Relationship Diagram (ERD) was created to represent the relationships between the tables.

### ERD Details

* **Entities:** Employees, Departments, Dept_Emp, Dept_Manager, Salaries, Titles.
* **Relationships:**
    * Employees (1) <---> (M) Salaries
    * Employees (1) <---> (1) Titles
    * Employees (1) <---> (M) Dept_Emp
    * Departments (1) <---> (M) Dept_Emp
    * Employees (1) <---> (M) Dept_Manager
    * Departments (1) <---> (M) Dept_Manager
* **Primary Keys:** `emp_no` (Employees), `dept_no` (Departments), `title_id` (Titles), (Composite keys for Dept_Emp, Dept_Manager and Salaries)
* **Foreign Keys:** `emp_title_id` (Employees), `emp_no` (Dept_Emp, Dept_Manager, Salaries), `dept_no` (Dept_Emp, Dept_Manager)

### ERD Creation Tool

* [quickdatabasediagrams.com](quickdatabasediagrams.com) was used to generate the ERD.

## Part 2: Data Engineering

### Description

This section covers the creation of the database tables and the import of the CSV data.

### Steps

1.  **Table Schema Creation:**
    * The `table_schemata.sql` file contains the SQL `CREATE TABLE` statements for each table.
    * Primary keys, foreign keys, data types, and constraints were defined.
2.  **Data Import:**
    * The CSV files were imported into the corresponding tables.
    * The import order was: Titles, Departments, Employees, Dept_Emp, Dept_Manager, Salaries.
  
## Part 3: Data Analysis

### Description

This section includes the SQL queries used to answer specific questions about the employee data.

### Queries

1.  **Employee Details:** List the employee number, last name, first name, sex, and salary of each employee.
    ```sql
    SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary FROM "Employees" e JOIN "Salaries" s ON e.emp_no = s.emp_no;
    ```
2.  **Employees Hired in 1986:** List the first name, last name, and hire date for employees hired in 1986.
    ```sql
    SELECT first_name, last_name, hire_date FROM "Employees" WHERE EXTRACT(YEAR FROM hire_date) = 1986;
    ```
3.  **Department Managers:** List the manager of each department along with their department number, department name, employee number, last name, and first name.
    ```sql
    SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name FROM "Dept_Manager" dm JOIN "Departments" d ON dm.dept_no = d.dept_no JOIN "Employees" e ON dm.emp_no = e.emp_no;
    ```
4.  **Employee Departments:** List the department number for each employee along with their employee number, last name, first name, and department name.
    ```sql
    SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name FROM "Dept_Emp" de JOIN "Employees" e ON de.emp_no = e.emp_no JOIN "Departments" d ON de.dept_no = d.dept_no;
    ```
5.  **Hercules B Employees:** List the first name, last name, and sex of employees named Hercules with last names starting with 'B'.
    ```sql
    SELECT first_name, last_name, sex FROM "Employees" WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
    ```
6.  **Sales Department Employees:** List employees in the Sales department.
    ```sql
    SELECT e.emp_no, e.last_name, e.first_name FROM "Employees" e JOIN "Dept_Emp" de ON e.emp_no = de.emp_no JOIN "Departments" d ON de.dept_no = d.dept_no WHERE d.dept_name = 'Sales';
    ```
7.  **Sales and Development Employees:** List employees in the Sales and Development departments.
    ```sql
    SELECT e.emp_no, e.last_name, e.first_name, d.dept_name FROM "Employees" e JOIN "Dept_Emp" de ON e.emp_no = de.emp_no JOIN "Departments" d ON de.dept_no = d.dept_no WHERE d.dept_name IN ('Sales', 'Development');
    ```
8.  **Last Name Frequency:** List the frequency counts of employee last names in descending order.
    ```sql
    SELECT last_name, COUNT(*) AS frequency FROM "Employees" GROUP BY last_name ORDER BY frequency DESC;
    ```
### Reference
1. Module 9 Class Materials
2. Google and Stack Overflow website to search for solution when errors occured. 
