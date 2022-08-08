	 
-- Part 1 of the Challenge: 

SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
	 
	 
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;
	 
	 
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--# of employees by title about to retire:
SELECT COUNT(*) AS total, title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(*) DESC;

--retrieve the number of titles from the Unique Titles table.
SELECT COUNT(*) AS total, title 
FROM unique_titles
GROUP BY title
ORDER BY COUNT(*) DESC;





--create a mentorship-eligibility table 
--that holds the current employees who were born 
--between January 1, 1965 and December 31, 1965.

--#1 Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
SELECT emp_no, first_name, last_name, birth_date
FROM employees;

--#2 Retrieve the from_date and to_date columns from the Department Employee table.
SELECT from_date, to_date
FROM dept_emp;


--#3 Retrieve the title column from the Titles table.
SELECT titles
FROM titles;
	 
--#4 Use a DISTINCT ON statement to retrieve
--the first occurrence of the employee number
--for each set of rows defined by the ON () clause.	 
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title

--#5 Create a new table using the INTO clause.
INTO mentorship_eligibilty
FROM employees AS e
--#6 Join the Employees and the Department Employee tables on the primary key.
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
--#7 Join the Employees and the Titles tables on the primary key.
INNER JOIN titles AS t ON e.emp_no = t.emp_no

--#8 get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
--#9 Order the table by the employee number.
ORDER BY e.emp_no, t.to_date DESC; 


SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN titles AS t ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no, t.to_date DESC; 