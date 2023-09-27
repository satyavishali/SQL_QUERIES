 create table grades(grade number(10),min_sal number(10),max_sal number(10));

insert into grades values(1 , 800 ,  1300);
insert into grades values( 2 ,1301 , 1500);
insert into grades values( 3 ,1501 ,2100);
insert into grades values( 4,2101 , 3100);
insert into grades values( 5,3101 ,  9999);
commit;
   
   
create table  departmentn(dep_id int,dept_name varchar2(20),dep_location varchar2(20));

insert into departmentn values(1001 ,'FINANCE' ,' SYDNEY');
insert into departmentn values(2001 , 'AUDIT','MELBOURNE');
insert into departmentn values(3001 ,'MARKETING','PERTH');
insert into departmentn values(4001 , 'PRODUCTION' , 'BRISBANE');
commit;
drop table employes;
 create table employes(emp_id number(10),
                       emp_name varchar2(20),
                       job_name varchar2(20),
                       manager_id number(10),
                        hire_date date,
                        salary  decimal(10),
                        commission decimal(10),
                        dep_id number(10));
                        
                     
insert into employes values(68319 , 'KAYLING',  'PRESIDENT' ,null,'18-11-1991',  6000,null,  1001);
insert into employes values(66928 , 'BLAZE',    'MANAGER'   ,68319 , '05-01-1991' , 2750.00 ,null, 3001);
insert into employes values(67832 ,'CLARE' , 'MANAGER',  68319 , '09-06-1991', 2550.00 ,null ,1001);
insert into employes values(65646 , 'JONAS',    'MANAGER'   ,   68319 , '04-02-1991' , 2957.00 ,null, 2001);
insert into employes values(  67858 , 'SCARLET ' , 'ANALYST'  ,     65646 ,'19-04-1997' , 3100.00 , null ,  2001);
insert into employes values( 69062 , 'FRANK'    ,'ANALYST'   ,    65646 ,'03-12-1991' ,3100.00 ,null,  2001);
insert into employes values( 63679 , 'SANDRINE' , 'CLERK'  ,  69062 ,'18-12-1990' ,  900.00 ,  null, 2001);
insert into employes values (64989 ,' ADELYN '  , 'SALESMAN',  66928 ,'20-02-1991', 1700.00 ,400.00, 3001);
insert into employes values  (65271 , 'WADE ',    'SALESMAN'  ,    66928 ,'22-01-1991', 1350.00 ,    600.00,   3001);
insert into employes values (66564 , 'MADDEN'   ,'SALESMAN' ,  66928 , '28-09-1991',1350.00 , 1500.00 , 3001);
insert into employes values(68454 , 'TUCKER' ,'SALESMAN'  ,  66928 , '08-09-1991',  1600.00 ,  0.00 ,   3001);
insert into employes values(68736 , 'ADNRES ' , 'CLERK' ,  67858 ,'23-05-1997', 1200.00 , null, 2001);
insert into employes values(69000 , 'JULIUS'   , 'CLERK' , 66928 ,'03-12-1991', 1050.00,null ,3001);
insert into employes values(69324 ,'MARKER ' ,'CLERK', 67832 ,'23-01-1992', 1400.00,null,  1001);
commit;




select sysdate from dual;

select * from employes;
select * from departmentn;
select * from grades;

--1.complete information about the employees.
select * from employes;

--2. write a SQL query to find the salaries of all employees. Return salary.
select salary from employes;

--3.write a SQL query to find the unique designations of the employees. Return job name.
select distinct job_name from employes;

--4. write a SQL query to list the employees’ name, increased their salary by 15%, and expressed as number of Dollars.
select emp_name,
       to_char(1.15*salary,'$99,999') AS "Salary"
from employes;

--5.write a SQL query to list the employee's name and job name as a format of "Employee & Job".
select emp_name||' '||job_name AS "Employes & Job"  from employes;



--6. Write a query in SQL to produce the output of employees as follows.
--Employee
--JONAS(manager).

select emp_name||'('||job_name||')' from employes;

--7.write a SQL query to find those employees with hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.
select emp_id,emp_name,salary, to_char(hire_date,'MON dd,yyyy') from employes ;

--8.write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.
select emp_name,length(emp_name) AS "lan" from employes;


--9. write a SQL query to find the employee ID, salary, and commission of all the employees.
select emp_id,salary, commission  from employes;


--10. write a SQL query to find the unique department with jobs. Return department ID, Job name.
select distinct dep_id,job_name from employes;

--11.write a SQL query to find those employees who do not belong to the department 2001. Return complete information about the employees.

select * from employes where dep_id not in (2001);

--12write a SQL query to find those employees who joined before 1991. Return complete information about the employees.
select * from employes where to_char(hire_date,'yyyy')<1991;

--13.  write a SQL query to calculate the average salary of employees who work as analysts. Return average salary.
select avg(salary) from employes where job_name='ANALYST';

--14. write a SQL query to find the details of the employee ‘BLAZE’.

select * from employes where emp_name='BLAZE';


--15.write a SQL query to identify employees whose commissions exceed their salaries. Return complete information about the employees.
select * from employes where salary<commission;

--16.write a SQL query to identify those employees whose salaries exceed 3000 after receiving a 25% salary increase. Return complete information about the employees.
select * from employes where salary*1.25>3000;

--17. write a SQL query to find the names of the employees whose length is six. Return employee name.
select emp_name from employes where length(emp_name)=6;

--18.write a SQL query to find out which employees joined in the month of January. Return complete information about the employees.

select * from employes where to_char(hire_date,'mon')='jan';

--19. write a SQL query to separate the names of employees and their managers by the string 'works for'.
select e.emp_name||'work for'||m.emp_name from employes e,employes m where e.manager_id=m.emp_id;

--20. write a SQL query to find those employees whose designation is ‘CLERK’. Return complete information about the employees.

select * from employes where job_name='CLERK';

--21. write a SQL query to identify employees with more than 27 years of experience. Return complete information about the employees.

with a as (select  emp_id ,emp_name ,job_name  , manager_id , hire_date  , salary ,  commission , dep_id,round(months_between(sysdate,hire_date)/12)  years from employes)
select * from a where years >27;

--22.write a SQL query to find those employees whose salaries are less than 3500. Return complete information about the employees.

select * from employes where salary <3500.00;

--23.write a SQL query to find the employee whose designation is ‘ANALYST’. Return employee name, job name and salary.
select * from employes where job_name='ANALYST';


--24.write a SQL query to identify those employees who joined the company in 1991. Return complete information about the employees.
select * from employes where to_char(hire_date,'yyyy') =1991;

--25.write a SQL query to find those employees who joined before 1st April 1991. Return employee ID, employee name, hire date and salary.
select emp_id,emp_name,hire_date,salary from employes where to_char(hire_date,'mm-dd-yyyy')<'01-apr-1991';


--26.write a SQL query identify the employees who do not report to a manager. Return employee name, job name.

select emp_name,job_name from employes where manager_id is null;

--27.write a SQL query to identify the experience of the employees who work under the manager whose ID number is 68319. Return employee ID, employee name, salary, experience.

SELECT emp_id,
       emp_name,
       salary,
      round(months_between(sysdate,hire_date)/12) "Experience"
FROM employes
WHERE manager_id=68319;

--28.write a SQL query to identify the employees whose salaries are odd. Return complete information about the employees.
select * from employes where mod(salary,2)=1;

--30.write a SQL query to identify employees whose salaries contain only three digits. Return complete information about the employees.

SELECT * FROM employes
WHERE length(TRIM(TO_CHAR(salary,'9999'))) = 3;

--31. write a SQL query to find those employees who joined in the month of APRIL. Return complete information about the employees.

SELECT * FROM employes
WHERE TO_CHAR(hire_date,'mon') = 'apr';


--32.write a SQL query to find out which employees joined the company before the 19th of the month. Return complete information about the employees.
SELECT * FROM employes
WHERE TO_CHAR(hire_date,'dd') = '19';

--33.write a SQL query to identify those employees who have been working as a SALESMAN and month portion of the experience is more than 10. Return complete information about the employees.

SELECT *
FROM employes
WHERE round(months_between(sysdate,hire_date)/12)>10 and job_name='SALESMAN';


--34. write a SQL query to find those employees of department id 3001 or 1001 and joined in the year 1991. Return complete information about the employees.

SELECT * FROM employes 
   where dep_id in (3001,1001) AND to_char(hire_date,'yyyy')='1991';
   
--35.write a SQL query to find the employees who are working for the department ID 1001 or 2001. Return complete information about the employees.

SELECT * FROM employes 
    WHERE dep_id IN (1001,2001);
--36.write a SQL query to find those employees whose designation is ‘CLERK’ and work in the department ID 2001. Return complete information about the employees.
SELECT * FROM employes 
 WHERE dep_id=2001 AND job_name='CLERK'; 

--37..1. the employees receive some commission which should not be more than the salary and annual salary including commission is below 34000.
--2. Designation is ‘SALESMAN’ and working in the department ‘3001’. Return employee ID, employee name, salary and job name.
SELECT emp_id,emp_name,salary,job_name FROM employes
WHERE 12*(salary+commission) < 34000
  AND commission IS NOT NULL
  AND commission < salary
  AND job_name = 'SALESMAN'
  AND dep_id = 3001;

--38.write a SQL query to find those employees who are either CLERK or MANAGER. Return complete information about the employees.

SELECT * FROM employes 
WHERE job_name in ('CLERK', 'MANAGER');


--39.write a SQL query to identify those employees who joined in any month other than February. Return complete information about the employees.

SELECT * FROM employes
WHERE to_char(hire_date,'mon') NOT IN 'feb';

--40.write a SQL query to identify the employees who joined the company in June 1991. Return complete information about the employees.

SELECT * FROM employes
WHERE TO_CHAR(hire_date,'mon-yyyy')='jun-1991';

--41. write a SQL query to search for all employees with an annual salary between 24000 and 50000 (Begin and end values are included.).
--Return complete information about the employees
SELECT * FROM employes
WHERE salary BETWEEN 2400.0 AND 5000.0 ;

--42. write a SQL query to find out which employees are working under the managers 63679, 68319, 66564, or 69000. Return complete information about the employees.

SELECT * FROM EMPLOYES WHERE manager_id IN (63679,66564,69000,68319);

--43 write a SQL query to find employees along with their department details. 
--Return employee ID, employee name, job name, manager ID, hire date, salary, commission, department ID, and department name.
SELECT e.emp_id,e.emp_name,e.job_name,e.salary,e.commission ,e.dep_id,d.dept_name FROM employes e JOIN departmentn d
ON e.dep_id=d.dep_id;

--44. write a SQL query to identify those employees who earn 60000 or more per year or do not work as ANALYST. 
--Return employee name, job name, (12*salary) as Annual Salary, department ID, and grade.
SELECT e.emp_name,
       e.job_name,
       (12*e.salary)"Annual Salary",
       e.dep_id,
       d.dept_name,
       s.grade
FROM employes e,
     departmentn d,
     grades s
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_sal AND s.max_sal
  AND (((12*e.salary)>= 60000)
       OR (e.job_name != 'ANALYST'))
       
       

--45 write a SQL query to find those employees whose salaries are less than 6000. Return full name (first and last name), and salary.

select emplname||' '||empfname,salary employees  where salary>6000;

--46.write a SQL query to find those employees whose first name does not contain the letter ‘M’. Sort the result-set in ascending order by department ID. 

SELECT * from employes where emp_name like '%M%';



--47.write a SQL query to find those employees who do not earn any commission. Return  name, and salary.

SELECT emp_name,salary from employes where commission IS NULL;


--48. write a SQL query to find the employees whose first name ends with the letter ‘S’. Return the name, and salary.
SELECT EMP_NAME ,SALARY FROM EMPLOYES WHERE emp_name like '%S';


--49.write a SQL query to find the employees of grade 2 and 3.Return all the information of employees and salary details.

SELECT *
FROM employes e,
     gradeS s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal
  AND s.grade IN (2, 3);

--50.write a SQL query to find those employees whose salary is more than the salary of JONAS. Return complete information about the employees.

SELECT * FROM EMPLOYES WHERE SALARY > (SELECT SALARY FROM EMPLOYES WHERE EMP_NAME='JONAS');

--50.write a SQL query to find those employees who work as same designation of FRANK. Return complete information about the employees
SELECT * FROM EMPLOYES WHERE JOB_NAME= (SELECT JOB_NAME FROM EMPLOYES WHERE EMP_NAME='FRANK');
