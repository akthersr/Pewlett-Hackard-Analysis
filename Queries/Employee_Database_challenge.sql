


-- Deliverable 1: The Number of Retiring Employees by Title

SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.titles,
	t.from_date,
    t.to_date
INTO retirement_titles
FROM employees AS e
	INNER JOIN titles AS t
	ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no)emp_no,
                   first_name,
				   last_name,
				   titles
INTO unique_titles
FROM retirement_titles
WHERE to_date= ('9999-01-01')
ORDER BY emp_no,to_date DESC;

SELECT * FROM unique_titles;

-- Count total number of retiring employees by titles


SELECT COUNT(emp_no),titles
INTO retiring_titles
FROM unique_titles
GROUP BY titles
ORDER BY COUNT (titles) DESC;

SELECT * FROM retiring_titles;

-- Deliverable 2: The Employees Eligible for the Mentorship Program

SELECT DISTINCT ON (e.emp_no)e.emp_no, 
e.first_name,
e.last_name, 
 e.birth_date,
 de.from_date, 
 de.to_date,
 t.titles
 INTO mentorship_eligibilty
 FROM employees as e
 LEFT JOIN dept_emp as de
 ON (e.emp_no=de.emp_no)
 LEFT JOIN titles as t
 ON (e.emp_no=t.emp_no)
 WHERE de.to_date = ('9999-01-01')
 AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
 ORDER BY e.emp_no;
 
 SELECT * FROM mentorship_eligibilty;
 
 -- Number of retirement employees by department

 SELECT DISTINCT ON (rt.emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.titleS,
	d.dept_name
INTO retiring_dept
FROM retirement_titles AS rt
	INNER JOIN dept_emp AS de
	ON (rt.emp_no = de.emp_no)
	INNER JOIN departments AS d
	on (de.dept_no = d.dept_no)
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no;

SELECT* FROM retiring_dept;




























