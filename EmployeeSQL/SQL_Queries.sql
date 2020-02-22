--list the following details of each employee
select
e.employee_number,
first_name,
last_name,
gender,
salary
from employees e
left join salaries s on s.employee_number=e.employee_number
;
--list the employees who were hired in 1986
select *
from employees e
where hire_date
between '1986-01-01' and '1986-12-31'
;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select 
dm.department_number,
d.department_name,
dm.employee_number,
e.first_name,
e.last_name,
dm.from_date,
dm.to_date
from
department_managers dm
left join departments d on d.department_number=dm.department_number
left join employees e on e.employee_number=dm.employee_number;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select * 
from(
select 
e.employee_number,
e.last_name,
e.first_name,
d.department_name,
row_number() over (partition by e.employee_number order by de.from_date desc)
as employee_rank_by_from_date
from employees e
inner join department_employees de on de.employee_number=e.employee_number
inner join departments d on d.department_number=de.department_number
) A
where employee_rank_by_from_date='1'
;
--List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where first_name='Hercules'
and last_name like 'B%'
;

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select 
e.employee_number,
e.last_name,
e.first_name,
d.department_name
from employees e
inner join department_employees de on de.employee_number=e.employee_number
inner join departments d on d.department_number=de.department_number
where d.department_name='Sales'
;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select 
e.employee_number,
e.last_name,
e.first_name,
d.department_name
from employees e
inner join department_employees de on de.employee_number=e.employee_number
inner join departments d on d.department_number=de.department_number
where d.department_name IN ('Sales','Development')
;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select 
count(last_name) as count_last_name,
last_name
from employees e
group by 2
order by count_last_name desc
;
