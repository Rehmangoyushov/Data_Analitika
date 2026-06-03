select count(*) 
from (select case
when commission_pct is not null then 'Yes'
when commission_pct is null then 'No'
end status, count(*)
from hr.employees 
group by case
when commission_pct is not null then 'Yes'
when commission_pct is null then 'No'
end) yekun
where status='Yes' or status='No'

select case 
when commission_pct is not null then 'Yes'
when commission_pct is null then 'No'
end status, count(*)
from hr.employees
group by case 
when commission_pct is not null then 'Yes'
when commission_pct is null then 'No'
end

select lpad(phone_number,length(phone_number)+1,'+') from hr.employees where substr(phone_number,1,2)=44

select '+'||phone_number from hr.employees where substr(phone_number,1,2)=44

select substr(phone_number,1,4)||lpad(phone_number,length(phone_number,'*')) from hr.employees

select yekun.di from
(select department_id as di from hr.employees where department_id is not null) yekun
left join
(select department_id as dii from hr.departments where department_id is not null) yekun_2
on yekun.di=yekun_2.dii

select yekun.di from
(select department_id as di from hr.employees where department_id is null) yekun
left join
(select department_id as dii from hr.departments where department_id is null) yekun_2
on yekun.di-yekun_2.dii
