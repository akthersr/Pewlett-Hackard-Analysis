# Pewlett-Hackard-Analysis
## Overview of the analysis:
 The HR department of Pewlett-Hackard company needed an analysis, to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program.Because a significant amount of current employee reached their retirement age,HR would like to set up a mentorship program based on the employees year of experience.The HR department is tasked with analyzing employees data in SQL and advise Pewlett Hackard management on preparing for the upcoming Silver Tsunami.
 The purpose of this analysis is to create two deliverables,first to determine the number of retiring employees according to their position titles and the second one is to identify the employees who are eligible for the mentorship program.
 
 ## Resources:
 ### Data Source:

- departments.csv

- dept_emp.csv

- employees.csv

- dept_managers.csv

- salaries.csv

- titles.csv
 
 ### Software:
 
 - PostgreSQL
 
 - pgAdmin
 
 - VSCode
 
 ## Results:
 ### Deliverable 1: The Number of Retiring Employees by Title:
 
 1. At first,we retrieve the emp_no, first_name, and last_name columns from the Employees table and retrieve the title, from_date, and to_date columns from the Titles table.Then,filter the data on the birth_date column to create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955.The Retirement Titles table is as follows:
 
 ![](https://github.com/akthersr/Pewlett-Hackard-Analysis/blob/main/Resources/retirement_titles.png)
 
 2. Because some employees may have multiple titles in the database—for example, due to promotions—we use the DISTINCT ON with Orderby to remove duplicate rows and to create a table that contains the most recent title of each employee.
 
 ![](https://github.com/akthersr/Pewlett-Hackard-Analysis/blob/main/Resources/retiring_dept.png)
 
 3. We create a Unique Titles table using the INTO clause.Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.The Unique Titles table is as follows:
 
 ![](https://github.com/akthersr/Pewlett-Hackard-Analysis/blob/main/Resources/unique_titles.png)
 
 4. Then,we use the COUNT() function to create a table that has the number of retirement-age employees by most recent job title.The Retiring Titles table is as follows:
 
 ![](https://github.com/akthersr/Pewlett-Hackard-Analysis/blob/main/Resources/retiring_titles.png)
 
 The resuts from the analysis show that 25,916 Senior Engineers, and 24,926 Senior Staff will be eligible to retire. Given that there are more than 70 thousand employees eligible to retire, a large percent of them are senior level.
 
 5. Finally, because we want to include only current employees in our analysis, exclude those employees who have already left the company.
 
 ### Deliverable 2: The Employees Eligible for the Mentorship Program:
 
 We will create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.
 
 1. At the beginning,we retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table and retrieve the from_date and to_date columns from the Department Employee table.Later,we retrieve the title column from the Titles table.
 2. Use  DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
 3. Join the Employees and the Department Employee tables on the primary key and join the Employees and the Titles tables on the primary key.
 4. Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.Then,we order the table by the employee number.The Mentorship Eligibility table is as follows:
 
 ![](https://github.com/akthersr/Pewlett-Hackard-Analysis/blob/main/Resources/mentorship_eligibilty.png)
 
  Almost one third of the retirees are Senior Engineers, while another third includes the rest of the Senior Staff.As a result, Senior Engineer and Senior Staff positions have the greatest priority when it comes to deciding which roles the company would like to fill.According to the mentorship eligibility criteria, 1,549 current employees are eligible for the program. 
 
 ## Summary:
 
 1.To determine the number of roles need to be filled as the "silver tsunami" begins to make an impact,we can create a new table with the retirees according to their age groups.This table will help us to find out how many positions needed to be filled up in the future(for each year).All these will help Pewlett Hackard Company remain functional during and in the aftermath of the "Silver Tsunami", the large wave of retirements.The "silver tsunami" mainly affected the Senior Engineer and Senior Staff with 25,916 and 24,926 retiring employees respectively.So,the company would have to create an effective program that can cover the disparity between the number of people retiring and the number of people who can be trained to fill these positions.
 
 2.As we saw in the analysis,that there are not enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees,we can breakdown the retirees by department to plan better.As we have found in earlier analysis,there are over 70,000 thousand positions to be vacant soon and there are just over 1,500 mentors available to guide the next generation of employees as per the mentorship criteria.From there, the company can prioritize how many younger employees need to be trained to fill up the retired positions. It would also be beneficial if we created a query that grouped mentor-eligible employees into position titles.
 
 
