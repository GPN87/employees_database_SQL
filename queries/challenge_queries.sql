
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no=s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' and hire_date <= '1986-12-31';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept.dept_no, dept.dept_name, mgr.emp_no, emp.last_name, emp.first_name
FROM departments as dept
JOIN dept_manager as mgr ON
dept.dept_no=mgr.dept_no
JOIN employees as emp ON
mgr.emp_no=emp.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT demp.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees as emp
JOIN dept_employees as demp ON
emp.emp_no=demp.emp_no
JOIN departments as dept ON
demp.dept_no=dept.dept_no;

-- List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no, emp.last_name, emp.first_name
FROM employees as emp
WHERE emp_no IN(
	SELECT emp_no FROM dept_employees
	WHERE dept_no IN(
		SELECT dept_no FROM departments
		WHERE dept_name = 'Sales'
	)
);

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_employees ON 
employees.emp_no=dept_employees.emp_no
JOIN departments ON
dept_employees.dept_no=departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(last_name) as "surname count"
FROM employees
GROUP BY last_name
ORDER BY "surname count" DESC;



