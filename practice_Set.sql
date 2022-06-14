use test_schema;
###LEAD AND LAG ---> https://www.javatpoint.com/mysql-lead-and-lag-function
select * from sales_table group by country order by country;
SELECT Year, Product,country,Sale, coalesce(LEAD(Sale,1) OVER (PARTITION BY Year ORDER BY Country),0 )AS Next_Sale FROM sales_table;     
SELECT Year, Product,Sale,coalesce(LAG(Sale, 1, 0) OVER (PARTITION BY Year ORDER BY Country),0) AS Previous_Sale_LAG , country FROM sales_table order by country;  

select max(hire_date) , DEPARTMENT_ID  from employees group by DEPARTMENT_ID order by DEPARTMENT_ID;

commit;
####Find the Nth Ranking Salary --
select * from 
(select employee_id,concat(concat(First_Name,' '),last_name) as Full_name,salary,DEPARTMENT_ID,dense_rank() over(partition by DEPARTMENT_ID order by salary desc) as sal_rank 
from test_schema.employees) as temp where temp.sal_rank=1 and temp.DEPARTMENT_ID=110;

####Find the max  Salary dept wise --
select employee_id,concat(concat(First_Name,' '),last_name) as Full_name,salary,DEPARTMENT_ID from test_schema.employees e where salary in (select max(salary) from test_schema.employees group by DEPARTMENT_ID=e.DEPARTMENT_ID order by max(salary) desc);
select employee_id,concat(concat(First_Name,' '),last_name) as Full_name,salary,DEPARTMENT_ID from test_schema.employees group by DEPARTMENT_ID having salary=max(salary) order by DEPARTMENT_ID;


##Find the rececnt Hired eployee in each dept -
select employee_id,concat(concat(First_Name,' '),last_name) as Full_name,DEPARTMENT_ID,hire_date from test_schema.employees where HIRE_DATE in (select max(hire_date) from test_schema.employees group by DEPARTMENT_ID order by DEPARTMENT_ID desc );
select employee_id,concat(concat(First_Name,' '),last_name) as Full_Name,DEPARTMENT_ID,hire_date  from employees group by DEPARTMENT_ID having hire_date in(max(hire_date)) order by DEPARTMENT_ID ;
### Duplicate Recod Extraction --
select * from test_schema.employees where FIRST_NAME like '%Michael%';
select *, count(*) as count from test_schema.employees group by FIRST_NAME  having count>1 order by FIRST_NAME asc;
select FIRST_NAME,EMPLOYEE_ID, count(*) as count from test_schema.employees group by FIRST_NAME  having count>1 ;
select * from 
(select employee_id,concat(concat(First_Name,' '),last_name) as Full_name,salary,DEPARTMENT_ID,row_number() over(partition by FIRST_NAME  order by FIRST_NAME  asc ) as row_chk 
from test_schema.employees) as temp where temp.row_chk>1 ;


## Select MAX 3 Salary ->
Select distinct salary from test_schema.employees;
select count(distinct salary) from test_schema.employees where 5800<=salary;
Select distinct salary from test_schema.employees e1 where 3>=(select count(distinct salary) from test_schema.employees where e1.salary<=salary) order by e1.salary asc;

## Select Min 3 Salary ->

Select distinct salary from test_schema.employees e1 where 3>=(select count(distinct salary) from test_schema.employees where e1.salary>=salary) order by e1.salary asc;


###Indexing --
create index salary on test_schema.employees(salary);
explain select salary from test_schema.employees where salary>1000;
show indexes from test_schema.employees;

Select * from test_schema.employees;
Select * from test_schema.emp;
Select quarter(convert(DateofJoining,datetime)) as Quarter,DateofJoining from test_schema.emp;
Select str_to_date(DateofJoining,'%d,%m,%Y') as Quarter, DateofJoining from test_schema.emp;
select date_format(REGEXP_REPLACE(DateofJoining,"/","-"),"YYYY-MM-DD") as date_2 from test_schema.emp;
select str_to_date(REGEXP_REPLACE(DateofJoining,"/",","),'%d,%m,%Y') as date_1 from test_schema.emp;
Select quarter(curdate()) as Quarter,curdate() from test_schema.emp;
desc test_schema.emp;

use test_schema;
with cte_date_conv as (
select str_to_date(REGEXP_REPLACE(DateofJoining,"/",","),'%d,%m,%Y') as conv_date,REGEXP_REPLACE(DateofJoining,"/","-") as DateofJoining from test_schema.emp
)
Select quarter(cte_date_conv.conv_date) as Quarter,DateofJoining from cte_date_conv 
where cte_date_conv.conv_date is not null
;



SELECT STR_TO_DATE('21,5,2013','%d,%m,%Y');
select null=null from dual;

use test_schema;
select * from (select * , row_number() over ( order by gender ) as rn, 0 as num 
from  emp
where gender = 'M'
union all
select * , row_number()over ( order by gender ) as rn, 1 as num
from  emp
where gender = 'F') tempt order by tempt.rn, tempt.num limit 4;


#Department Wise Max Salary -->
select distinct(Department_id) from employees order by Department_id ;
desc employees;
use test_schema;
create table dept(
DEPARTMENT_ID int,
DEPARTMENT_NAME varchar(50)
);

select employee_id,concat(concat(First_Name,' '),last_name) as Full_name,DEPARTMENT_ID,hire_date from test_schema.employees where HIRE_DATE in (select distinct max(hire_date) from test_schema.employees group by DEPARTMENT_ID order by DEPARTMENT_ID desc );

select distinct e.employee_id,concat(concat(e.First_Name,' '),e.last_name) as Full_name,e.DEPARTMENT_ID,d.DEPARTMENT_NAME,e.salary from employees e inner join dept d on e.DEPARTMENT_ID=d.DEPARTMENT_ID where salary in (select max(salary) from employees group by e.DEPARTMENT_ID=DEPARTMENT_ID) order by salary desc;