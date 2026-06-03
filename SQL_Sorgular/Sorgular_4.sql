select case
when count(*)>10 then 'tamamlandi'
when count(*)>5 then 'natamam'
when count(*)=3 then 'arasdirilsin'
end status
from hr.employees

select max(ms) from (select max(salary) as ms from hr.employees group by manager_id) yekun

select first_name, last_name, salary 
from hr.employees where salary<all(select salary from hr.employees where employee_id=100)

select emp.first_name, emp.last_name, dep.department_name, dep.department_id from hr.employees emp
left join
hr.departments dep
on emp.department_id=dep.department_id

select dep.department_name, yekun.al, yekun.co from hr.departments dep
left join
(select avg(salary) as al, count(*) as co, department_id as di 
from hr.employees where commission_pct is not null group by department_id) yekun
on dep.department_id=yekun.di

select dep.department_name, yekun.al, yekun_2.co from hr.departments dep
left join
(select department_id as di, trunc(avg(salary))||' '||'AZN' as al from hr.employees group by department_id) yekun
on dep.department_id=yekun.di
left join
(select department_id as ddi, count(*)||' '||'eded' as co from hr.employees where commission_pct is not null group by department_id) yekun_2
on yekun.di=yekun_2.ddi
