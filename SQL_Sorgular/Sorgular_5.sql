select yekun.fn, yekun.ln, yekun.hd, dep.department_name, js.job_title from
(select job_id as ji, first_name as fn, last_name as lm, department_id as di, hire_date as hd 
from hr.employees 
where hire_date>date'1997-01-01' and hire_date<date'2006-01-31') yekun
left join
hr.jobs js
on yekun.ji=js.job_id
left join
(select job_id as ji, first_name as fn, last_name as lm, department_id as di, hire_date as hd 
from hr.employees 
where hire_date>date'1997-01-01' and hire_date<date'2006-01-31') yekun
on js.job_id=yekun.ji
left JOIN
hr.departments dep
on yekun.di=dep.department_id

select js.job_title, yekun.fn, yekun.lnn, yekun.hd, dep.department_name from hr.jobs js
left JOIN
(select first_name as fn, last_name as lnn, job_id as ji, department_id as di, hire_date as hd from hr.employees 
where hire_date>date'1997-01-01' and hire_date<date'2006-01-31') yekun
on js.job_id=yekun.ji
left JOIN
hr.departments dep
on yekun.di=dep.department_id

select yekun.*, dep.department_name from
(select department_id as di, count(*) as co from hr.employees group by department_id) yekun
left JOIN
hr.departments dep
on yekun.di=dep.department_id

select distinct department_id,employee_id from hr.employees where department_id in(100,20,90)

select case
when lower(job_title) like 'prog%' then 'programmer'
when lower(job_title) like 'rep%' then 'repper'
end status 
from hr.jobs

select substr(first_name,1,3)||substr(last_name,-3) as email_adress from hr.employees

select email, substr(first_name,1,1)||last_name as email_2 from hr.employees

select email from hr.employees where email<>upper(substr(first_name,1,1)||last_name)

select case
when email=upper(substr(first_name,1,1)||last_name) then 'true'
else'wrong'
end status
from hr.employees

select * from hr.employees where hire_date in(select start_date from hr.job_history)

select salary-salary*commission_pct from hr.employees where commission_pct is not null

select trunc(extract(year from hire_date)), trunc(extract(month from hire_date)), count(*) 
from hr.employees 
group by trunc(extract(year from hire_date)), trunc(extract(month from hire_date))
offset 1 rows fetch first 1 rows only
