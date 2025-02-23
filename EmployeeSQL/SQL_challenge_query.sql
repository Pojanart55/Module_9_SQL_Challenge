-- 1. Employee Number, Last Name, First Name, Sex, and Salary:
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM
    "Employees" e
JOIN
    "Salaries" s ON e.emp_no = s.emp_no;

--2. First Name, Last Name, and Hire Date for Employees Hired in 1986:
SELECT
    first_name,
    last_name,
    hire_date
FROM
    "Employees"
WHERE
    EXTRACT(YEAR FROM hire_date) = 1986;

--3.Manager of Each Department (Department Number, Department Name, Employee Number, Last Name, First Name):
SELECT
    dm.dept_no,
    d.dept_name,
    dm.emp_no,
    e.last_name,
    e.first_name
FROM
    "Dept_Manager" dm
JOIN
    "Departments" d ON dm.dept_no = d.dept_no
JOIN
    "Employees" e ON dm.emp_no = e.emp_no;

--4.Department Number, Employee Number, Last Name, First Name, and Department Name for Each Employee:
SELECT
    de.dept_no,
    de.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    "Dept_Emp" de
JOIN
    "Employees" e ON de.emp_no = e.emp_no
JOIN
    "Departments" d ON de.dept_no = d.dept_no;

--5. First Name, Last Name, and Sex of Employees Named Hercules with Last Name Beginning with 'B':
SELECT
    first_name,
    last_name,
    sex
FROM
    "Employees"
WHERE
    first_name = 'Hercules' AND last_name LIKE 'B%';

--6. Employees in the Sales Department (Employee Number, Last Name, First Name):
SELECT
    e.emp_no,
    e.last_name,
    e.first_name
FROM
    "Employees" e
JOIN
    "Dept_Emp" de ON e.emp_no = de.emp_no
JOIN
    "Departments" d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';

--7. Employees in the Sales and Development Departments (Employee Number, Last Name, First Name, Department Name):
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    "Employees" e
JOIN
    "Dept_Emp" de ON e.emp_no = de.emp_no
JOIN
    "Departments" d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');

--8. Frequency Counts of Employee Last Names (Descending Order):
SELECT
    last_name,
    COUNT(*) AS frequency
FROM
    "Employees"
GROUP BY
    last_name
ORDER BY
    frequency DESC;