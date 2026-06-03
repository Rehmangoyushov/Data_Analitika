select first_name, last_name, salary, salary*12 from hr.employees where salary*12>50000

select * from hr.employees where lower(job_id) like 'it_prog' or lower(job_id) like 'fi_account'

select * from hr.employees where salary is not null and commission_pct is not null

select * from hr.employees 
where lower(job_id) like 'it_prog'
or lower(job_id) like 'sa_rep' 
or (lower(job_id) like 'fi_account' and (salary is not null and commission_pct is not null))

select * from hr.employees where extract(year from hire_date)=2002 and extract(month from hire_date)=8

select sum(salary*12) from hr.employees group by department_id

select * from hr.employees where salary*12 between 50000 and 150000

select * from hr.employees where length(job_id)=5

select * from hr.employees where substr(phone_number,1,3)=515 and substr(phone_number,-1)=8

select emp.first_name, dep.department_name from hr.employees emp
left join
hr.departments dep
on emp.department_id=dep.department_id

select dep.* from hr.departments dep
full join
hr.locations lo
on dep.location_id=lo.location_id
where dep.manager_id is not null

select * from hr.employees where salary<>(select max(salary) from hr.employees) and salary<>(select min(salary) from hr.employees)
