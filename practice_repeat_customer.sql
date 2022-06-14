create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);
select * from customer_orders;
insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)
;

with first_vist as(
select customer_id, min(order_date) as fvd from customer_orders group by customer_id
)
select co.order_date,
sum(case when co.order_date=fv.fvd then 1 else 0 end ) as new_cust_count,
sum(case when co.order_date!=fv.fvd then 1 else 0 end ) as repeat_cust_count,
sum(case when co.order_date=fv.fvd then co.order_amount else 0 end) as new_cust_rev,
sum(case when co.order_date!=fv.fvd then co.order_amount else 0 end) as repeat_cust_rev
from customer_orders co inner join first_vist fv 
on fv.customer_id=co.customer_id
group by co.order_date
; 
