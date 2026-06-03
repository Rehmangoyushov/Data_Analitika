select  substr(job_id,4,length(job_id)) from hr.employees

select job_id from hr.employees
select hire_date, hire_date+interval '18' month from hr.employees
select * from hr.employees where hire_date<date'2015-01-31'
select * from hr.employees where (sysdate-hire_date)/365>10

select nvl(to_char(commission_pct),'teyin edilmeyib') from hr.employees
select case
when commission_pct is null then salary
when commission_pct is not null then salary-commission_pct
end Status
from hr.employees

select salary-salary*coalesce(commission_pct,0) from hr.employees

select * from hr.employees where extract(year from hire_date)>2015

select * from hr.employees where to_char(hire_date,'YYYY')>2015
select first_name, to_char(hire_date,'Month') from hr.employees
select * from hr.employees where extract(month from hire_date)=1 or extract(month from hire_date)=2

select department_id, salary, max(salary), min(salary), count(*) from hr.employees group by department_id, salary

select sum(salary) from hr.employees where department_id=30 or department_id=20

select department_id from hr.employees group by department_id having sum(salary)>20000

select sum(salary) from hr.employees where manager_id is not null and department_id is not null

select case
when salary<24000 then 'deputy'
when salary=24000 then 'ghfjd'
else 'gfhdj'
end Status
from hr.employees

select emp.department_id, emp.manager_id from hr.employees emp
full join hr.departments dep
on emp.department_id=dep.department_id
where emp.department_id is not null and emp.manager_id is not null

select min(salary)||' '||max(salary) from hr.employees group by department_id

select emp.first_name, jh.start_date from hr.employees emp
join
hr.job_history jh
on emp.employee_id=jh.employee_id

select co.COUNTRY_NAME, lo.STREET_ADDRESS from hr.countries co
join hr.locations lo
on co.country_id=lo.country_id

select emp.*, js.job_title from hr.employees emp
left join hr.jobs js
on emp.job_id=js.job_id

select job_title, max_salary from hr.jobs

select emp.first_name, yekun.msl from hr.employees emp
left join
(select js.max_salary as msl, js.job_id as ji from hr.jobs js) yekun
on emp.job_id=yekun.ji

select dep.department_name, emp.salary from hr.departments dep
left join hr.employees emp
on dep.department_id=emp.department_id

select dep.department_name from hr.departments dep
left join
(select * from hr.employees where manager_id=100) yekun
on dep.department_id=yekun.department_id

select emp.first_name, dep.department_name, lo.city from hr.employees emp
left join
hr.departments dep
on emp.department_id=dep.department_id
left join
hr.locations lo
on dep.location_id=lo.location_id

select case
when commission_pct in not null then 'Yes'
when commission_pct is null then 'No'
end Status, count(*)
from hr.employees
group by case
when commission_pct in not null then 'Yes'
when commission_pct is null then 'No'
end
having count('Yes') and count('No')
