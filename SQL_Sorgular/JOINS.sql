select emp.department_id from hr.employees emp
left JOIN
hr.departments dep
on emp.department_id=dep.department_id

select emp.department_id, lo.location_id from hr.employees emp
left JOIN
hr.departments dep
on emp.department_id=dep.department_id
left join
hr.locations lo
on dep.location_id=lo.location_id

select yekun.fn, lo.city from
(select first_name as fn, department_id as di, count(*) as co 
from hr.employees 
group  by first_name, department_id 
having count(*)>2) yekun
left JOIN
hr.departments dep
on yekun.di=dep.department_id
left JOIN
hr.locations lo
on dep.location_id=lo.location_id
