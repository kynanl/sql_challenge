-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries 
on salaries.emp_no = employees.emp_no;

-- 2.List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date 
from employees 
where hire_date BETWEEN '1986-01-01' and  '1986-12-31'
order by hire_date;

--3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
--create view as department_maangers

select dept_manager.dept_no, dept_manager.emp_no, depts.dept_name, employees.last_name, employees.first_name
from dept_manager
left join employees
on employees.emp_no = dept_manager.emp_no
left join depts
on depts.dept_no = dept_manager.dept_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.


select employees.emp_no, employees.last_name, employees.first_name, depts.dept_name
from employees 
left join dept_emp
on dept_emp.emp_no = employees.emp_no
left join depts
on depts.dept_no = dept_emp.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."

select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

--6.)List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, depts.dept_name
from employees 
left join dept_emp
on dept_emp.emp_no = employees.emp_no
left join depts
on depts.dept_no = dept_emp.dept_no 
			where depts.dept_name  = 'Sales';

--7.)List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, depts.dept_name
from employees 
left join dept_emp
on dept_emp.emp_no = employees.emp_no
left join depts
on depts.dept_no = dept_emp.dept_no 
			where depts.dept_name  = 'Sales' or depts.dept_name = 'Development';


--In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.

select last_name, count (last_name) as "name_count"
from employees
group by last_name
order by "name_count" desc;





