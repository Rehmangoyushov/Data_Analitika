select substr(phone_number,1,instr(phone_number,'.',1,1)-1) from hr.employees

select substr(job_id,instr(job_id,'_',1,1)+1,length(job_id)-instr(job_id,'_',1,1)) from hr.employees

select job_id from hr.employees

select substr(phone_number,instr(phone_number,'.',1,1)+1,instr(phone_number,'.',1,2)-1-instr(phone_number,'.',1,1))
from hr.employees

select distinct length(phone_number)-length(replace(phone_number,'.','')) from hr.employees

select department_id, manager_id, sum(salary) from hr.employees
group by rollup(department_id, manager_id)
having department_id is null and manager_id is null
order by department_id, manager_id

select department_id, manager_id, sum(salary) from hr.employees
group by cube(department_id, manager_id)
order by department_id, manager_id

select department_id, manager_id, sum(salary), grouping(department_id), grouping(manager_id)
from hr.employees
group by grouping sets((department_id, manager_id),())
having grouping(department_id)=0 and grouping(manager_id)=0
order by department_id, manager_id

select next_day(add_months(trunc(sysdate,'MM'),1),'MONDAY') from hr.employees

select department_id, manager_id, job_id, sum(salary)
from hr.employees
group by grouping sets ((department_id, manager_id, job_id),(department_id), (manager_id), (job_id))
order by department_id, manager_id, job_id

select first_name, email, count(*)
from hr.employees
group by first_name, email

select first_name, phone_number, email, count(*)
from hr.employees
group by grouping sets((first_name, phone_number, email), (first_name, email), (first_name, phone_number), ())

select first_name, phone_number, email, count(*)
from hr.employees
group by grouping sets((first_name, phone_number, email), (first_name, email), (first_name, phone_number), ())
having first_name='Amit'

select to_char(hire_date,'MM')||to_char(hire_date,'fmMonth'), sum(salary)
from hr.employees
where to_char(hire_date,'MM')<=3
group by grouping sets((to_char(hire_date,'MM')||to_char(hire_date,'fmMonth')),())
order by to_char(hire_date,'MM')||to_char(hire_date,'fmMonth')
