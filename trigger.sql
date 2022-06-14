    use test_schema;
    CREATE TABLE employee(  
		id INT PRIMARY KEY,
        name varchar(45) NOT NULL,    
        occupation varchar(35) NOT NULL,    
        working_date date,  
        working_hours varchar(10)  
    ); 
    commit;
INSERT INTO employee VALUES    
    (10,'Pritam', 'Cashier', '2020-10-06', 08);
    INSERT INTO employee VALUES    
    (1,'Robin', 'Scientist', '2020-10-04', 12),  
    (2,'Warner', 'Engineer', '2020-10-04', 10),  
    (3,'Peter', 'Actor', '2020-10-04', 13),  
    (4,'Marco', 'Doctor', '2020-10-04', 14),  
    (5,'Brayden', 'Teacher', '2020-10-04', 12),  
    (6,'Antonio', 'Business', '2020-10-04', 11);  
    
select * from employee;
drop table employee;

CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT NOT NULL,
    emp_name varchar(30) DEFAULT NULL,
    emp_occupation varchar(30) DEFAULT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);
drop table employees_audit;

CREATE TRIGGER after_employee_update 
AFTER UPDATE ON employee
FOR EACH ROW 
INSERT INTO employees_audit
SET action = 'update',
emp_name = OLD.name,
emp_id=OLD.id,
emp_occupation=OLD.occupation,
changedat = NOW();

CREATE TRIGGER before_employee_insert
before insert ON employee
FOR EACH ROW 
INSERT INTO employees_audit
SET action = 'insert',
emp_name = NEW.name,
emp_id=NEW.id,
emp_occupation=NEW.occupation,
changedat = NOW();


select * from employees_audit;


drop trigger after_employee_update;
select * from employees_audit;
desc employee;
update employee set 
name ='JerrY',
occupation='Manager' where id=6; 