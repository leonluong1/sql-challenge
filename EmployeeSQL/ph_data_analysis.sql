-- Data Analysis

select * from Employees;
select * from Departments;
select * from Dept_Emp;
select * from Dept_Manager;
select * from Titles;
select * from Salaries;

-- Question 1
select e.emp_no, last_name, first_name, sex, salary 
from Employees as e
join Salaries as s on e.emp_no=s.emp_no
;
-- Question 2
select first_name, last_name, hire_date
from Employees
where extract('year' from hire_date)=1986
;
-- Question 3
select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from Dept_Manager as dm
join Departments as d on dm.dept_no=d.dept_no
join Employees as e on dm.emp_no=e.emp_no
;
-- Question 4
select d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from Dept_Emp as de
join Departments as d on de.dept_no=d.dept_no
join Employees as e on de.emp_no=e.emp_no
;
-- Question 5
select first_name, last_name, sex
from Employees
where first_name='Hercules' and last_name like 'B%'
;
-- Question 6
select e.emp_no, e.last_name, e.first_name
from Dept_Emp as de
join Departments as d on de.dept_no=d.dept_no
join Employees as e on de.emp_no=e.emp_no
where d.dept_name='Sales'
;
-- Question 7
select e.emp_no, e.last_name, e.first_name, d.dept_name
from Dept_Emp as de
join Departments as d on de.dept_no=d.dept_no
join Employees as e on de.emp_no=e.emp_no
where d.dept_name='Sales' or d.dept_name='Development'
;
-- Question 8
select last_name, count(last_name)
from Employees
group by last_name
order by count DESC
;
