select 
yekun.fn, yekun.l_n, yekun.di, yekun.ro
from (select
first_name as fn,
last_name as l_n,
department_id as di,
salary as s_s,
rank() over(partition by department_id order by salary) as ro,
dense_rank() over(partition by department_id order by salary),
row_number() over(partition by department_id order by salary desc)
from hr.employees) yekun
where yekun.ro=1

select first_name, last_name, round(ratio_to_report (salary) over(),3)
from hr.employees

select first_name, last_name, percent_rank() over(order by salary desc)
from hr.employees

select first_name, last_name, hire_date, department_id, sum(salary) over(order by department_id)
from hr.employees

select first_name, last_name, hire_date, department_id, trunc(sum(salary) over(partition by department_id)) 
from hr.employees
where department_id=20

select first_name, last_name, hire_date, lead(hire_date) over(order by hire_date)-hire_date
from hr.employees

select yekun.ay, sum(yekun.cem)
from (select to_char(hire_date, 'fmMonth') as ay, sum(salary) over(partition by to_char(hire_date, 'fmMonth')) as cem
from hr.employees) yekun
group by yekun.ay

select
yekun.ay,
yekun.cem,
trunc((lead(yekun.cem) over(order by yekun.ay)-yekun.cem)/yekun.cem*100)
from (select to_char(hire_date, 'MM')||to_char(hire_date, 'fmMonth') as ay, sum(salary) as cem
from hr.employees
group by to_char(hire_date, 'MM')||to_char(hire_date, 'fmMonth')
order by to_char(hire_date, 'MM')||to_char(hire_date, 'fmMonth')) yekun
