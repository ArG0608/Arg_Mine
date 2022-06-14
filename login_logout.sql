create table job_time(
time varchar(10),
status varchar(10));

insert into job_time values('10:06','off');
select * from job_time;

with rank_no as(
select status , row_number() over(partition by status) as rn, time from job_time order by time
)
select status, time, rank_no.rn,coalesce(lag(rank_no.rn,1) over (order by time), 0) as lagged from rank_no
;
select *,case when status='on' then 1 else 0 end as on_off_flag from job_time order by time;
select time as login ,status,lead(time,1,'00:00') over(order by time) as logout from job_time;
select time,status,lag(status,1,'off') over(order by time) as prev_status from job_time;
use test_schema;

##Query --->
#Step 1 - get the time as a login time ,current status and previous status (if null set to off)
select cast(time as time) as login,status,lag(status,1,'off') over(order by time) as prev_status  from job_time;

#Step 2 - Get the login time,next login time and status fro the above sub query with prev_status should not match with current status.

select login ,lead(login) over(order by login) as logout, status from (
select cast(time as time) as login,status,lag(status,1,'off') over(order by time) as prev_status  from job_time
) tab
where tab.status<>tab.prev_status;

#Step -3 -  Get the required login time and logout time and runtime from the above subquery with filter status is 'on'
#Beacuse teh on interval is having the log out time.

select login,logout,timediff(logout,login) as runtime from(
select login ,lead(login) over(order by login) as logout, status from (
select cast(time as time) as login,status,lag(status,1,'off') over(order by time) as prev_status  from job_time
) tab
where tab.status<>tab.prev_status
)tab2
where tab2.status='on';






