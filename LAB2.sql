*select * from car 
order by year asc;


select count(report_num)
from car c , participated p
where c.reg_num=p.reg_num and c.model='lancer';

select count(driver_id)
from accident a,participated p
where a.report_num=p.report_num and a.accident_date like '__08%';


select avg(damage_amount) as 'average' from participated;


select name
from person a ,participated p
where a.driver_id=p.driver_id and p.damage_amount >(select avg(damage_amount) from participated);



select max(damage_amount) from participated;
