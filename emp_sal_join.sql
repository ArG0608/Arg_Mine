SELECT * FROM test_schema.emp_d;

select e.id,e.dept,p.salary from emp_d e left join payroll p on p.id=e.id;

select e.id,e.dept,p.salary from emp_d e left join payroll p on p.id=e.id where p.salary in(
select max(p.salary) as max_salary from payroll p left join emp_d e on e.id=p.id group by e.dept
);




select e.id,e.dept, max(p.salary) as max_salary from payroll p left join emp_d e on e.id=p.id group by e.dept;
