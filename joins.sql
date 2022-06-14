use test_schema;
truncate table b;
truncate table a;
select * from b;
alter table a modify column p_id INT;
alter table b modify column p_id INT;

desc b;
desc a; 
select * from b;
select * from a;
insert into a values (3);
insert into b values (4);
commit;

###Left Join -->

select * from a left join b on a.p_id=b.p_id ;
##Righ Join -->

select * from a right join b on a.p_id=b.p_id ;
##Inner Join -->

select * from a inner join b on a.p_id=b.p_id ;
##Full Join-->

select * from a left join b on a.p_id=b.p_id 
union all
select * from a right join b on a.p_id=b.p_id ;
##Union 
select p_id from b
union all
select p_id from a;

##Union All -->
select p_id from b
union all
select p_id from a;
select * from a full join b;