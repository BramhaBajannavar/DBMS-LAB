select e.empname, p.*
from employee e , project p, assigned_to a
where e.empno=a.empno and p.pno=a.pno;


select i.empno, e.empname, sum(i.incentive_amt) as total_incentive
from incentives i, employee e
where i.empno=e.empno
group by empno;


select p.pname, p.ploc 
from project p
where pno in (select pno from assigned_to a where job_role='manager');


select d.dname, count(e.empno)
from dept d, employee e
where d.deptno =e. deptno
group by d.dname;


select e.empno, e.empname
from employee e
where not exists (select 1 from assigned_to a where e.empno=a.empno); 


select e.empname , d.deptno, d.dloc
from employee e , dept d
where e.deptno=d.deptno;


select *
from employee e 
where mgr_no=111;


select p.pname, count(e.empno)
from project p, assigned_to e
where e.pno=p.pno
group by p.pname;


select empno, count(incentive_date) as number_of_times, sum(incentive_amt) as total_amt
from incentives
group by empno;


select e.empno, e.empname
from employee e
where e.empno in (select empno from assigned_to where empno=e.empno and job_role='developer');


select deptno , avg(sal) as average
from employee
group by deptno;
