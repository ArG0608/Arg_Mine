select * from dept;
select * from (
select department_id,department_name,row_number () over (partition by department_id order by department_name) as rn from dept ) rn_table;
delete from dept where
(select row_number () over (partition by department_id order by department_name) from dept )>1;

with del_val as
(
select row_number () over (partition by department_id order by department_name) as rn from dept
)
delete from del_val where del_val.rn>1
;
desc dept;
alter table dept add primary key(department_id);

delete from dept where department_id=40;
with first_vist as(
select customer_id, min(order_date) as fvd from customer_orders group by customer_id
);