-- Titles table
CREATE TABLE "Titles" (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

-- Employees table
CREATE TABLE "Employees" (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(10) REFERENCES "Titles"(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

-- Departments table
CREATE TABLE "Departments" (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);

-- Dept_Emp table
CREATE TABLE "Dept_Emp" (
    emp_no INT REFERENCES "Employees"(emp_no),
    dept_no VARCHAR(10) REFERENCES "Departments"(dept_no),
    PRIMARY KEY (emp_no, dept_no) -- Composite Primary Key
);

-- Dept_Manager table
CREATE TABLE "Dept_Manager" (
    dept_no VARCHAR(10) REFERENCES "Departments"(dept_no),
    emp_no INT REFERENCES "Employees"(emp_no),
    PRIMARY KEY (dept_no, emp_no) -- Composite Primary Key
);

-- Salaries table
CREATE TABLE "Salaries" (
    emp_no INT REFERENCES "Employees"(emp_no),
    salary INT NOT NULL,
    PRIMARY KEY (emp_no, salary) --Composite Primary Key.
);