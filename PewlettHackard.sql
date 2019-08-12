drop table department;
create table department(
	dept_no varchar(4) primary key,
	dept_name varchar(30)
);

select * from department;

drop table employees;
create table employees(
	emp_no integer primary key,
	birth_date date not null,
	first_name varchar(50) not null,
	last_name varchar (50) not null,
	gender varchar(2) not null,
	hire_date date not null 
);

select * from employees;

create table dept_emp(
	emp_no integer not null,
	dept_no varchar(4) not null,
	foreign key(emp_no) references employees(emp_no),
	foreign key(dept_no) references department(dept_no),
	from_date date not null,
	to_date date not null
);
select * from dept_emp;
drop table dept_manager;
create table dept_manager(
	dept_no varchar(4) not null,
	emp_no integer not null,
	from_date date not null,
	to_date date not null,
	foreign key(dept_no) references department (dept_no),
	foreign key(emp_no) references employees (emp_no)
);
select * from dept_manager;

Alter table dept_manager
add mgr_id serial primary key;

drop table salaries;
create table salaries(
	emp_no integer not null,
	salary integer not null,
	from_date date not null,
	to_date date not null,
	foreign key(emp_no) references employees (emp_no)
);
Alter table salaries
add sal_id serial primary key;

select * from salaries;

create table titles(
	emp_no integer not null,
	title varchar not null,
	from_date date not null,
	to_date date not null,
	foreign key(emp_no) references employees (emp_no)
);
Alter table titles
add title_id serial primary key;

select * from titles;

/* 1.  List the following details of each employee: employee
number, last name, first name, gender, and salary*/

SELECT employees.emp_no,
  employees.last_name,
  employees.first_name,
  employees.gender,
  salaries.salary
FROM employees
JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- 2.  List employees who were hired afterin 1986

SELECT emp_no, first_name, last_name, hire_date 
FROM employees
WHERE EXTRACT (YEAR FROM hire_date) = 1986
order by hire_date;

/* 3. List the manager of each department with the 
following info: dept #, dept name, mgr's employee #,
last and first name, and start and end employment dates*/

select department.dept_no,
department.dept_name,
dept_manager.emp_no,
employees.last_name,
employees.first_name,
dept_manager.from_date,
dept_manager.to_date
from dept_manager
join department
on dept_manager.dept_no = department.dept_no
join employees
on dept_manager.emp_no = employees.emp_no;

/* 4.  List the department of each employee with the
following information: empl #, last name, first name,
and department name*/

SELECT employees.emp_no,
  employees.last_name,
  employees.first_name,
  department.dept_name
 FROM dept_emp
JOIN employees ON
dept_emp.emp_no = employees.emp_no
join department on
dept_emp.dept_no=department.dept_no;

/* 5.  List all employees whose first name is "Hercules"
and last name begins with "B"*/

select first_name, last_name 
from employees
where last_name like 'B%' and first_name='Hercules';

/* 6.  List all employees in the Sales Department including
their employee number, last name, first name, and
department name*/

select employees.emp_no,employees.last_name,employees.first_name,department.dept_name
from dept_emp
join employees
on employees.emp_no = dept_emp.emp_no
join department
on dept_emp.dept_no = department.dept_no
WHERE department.dept_name = 'Sales';

/* 7.  List all employees in the Sales Department including
their employee number, last name, first name, and
department name*/

select employees.emp_no,employees.last_name,employees.first_name,department.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join department
on dept_emp.dept_no = department.dept_no
WHERE (dept_name = 'Sales' or dept_name='Development');


/* 8. In descending order, list the frequency count of
of employees last names*/

SELECT last_name, COUNT(last_name) AS "employee count"
FROM employees
GROUP BY last_name
ORDER BY "employee count" DESC;

--Search for employee number 499942

select first_name, last_name 
from employees
where emp_no=499942;

--April Foolsday




















