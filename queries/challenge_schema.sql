CREATE TABLE departments(
dept_no VARCHAR(4) PRIMARY KEY,
dept_name VARCHAR (24) NOT NULL
);

SELECT * FROM departments;

CREATE TABLE titles(
title_id VARCHAR(5) PRIMARY KEY,
title VARCHAR(20) NOT NULL
);

SELECT * FROM titles;

CREATE TABLE employees(
emp_no INT PRIMARY KEY,
emp_title_id VARCHAR(5) NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR (20) NOT NULL,
sex VARCHAR (1) NOT NULL,
hire_date DATE NOT NULL,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * FROM employees;

CREATE TABLE salaries(
emp_no INT PRIMARY KEY,
salary INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;

CREATE TABLE dept_employees(
emp_no int NOT NULL,
dept_no VARCHAR(5) NOT NULL,
PRIMARY KEY (emp_no, dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_employees;

CREATE TABLE dept_manager(
dept_no VARCHAR NOT NULL,
emp_no INT NOT NULL,
PRIMARY KEY (dept_no, emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_manager;







