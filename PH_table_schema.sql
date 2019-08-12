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
