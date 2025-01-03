create database supp;
 use supp;


create table Supplier(
 s_id int primary key, 
s_name varchar(30), city varchar(30)

create table Parts( p_id int primary key, p_name varchar(30), color varchar(30));


create table Catalog( s_id int,
p_id int, cost float,
foreign key(s_id) references Supplier(s_id), foreign key(p_id) references Parts(p_id));


select distinct p.p_name
from Supplier s, Catalog c, Parts p where s.s_id = c.s_id and
p.p_id = c.p_id and c.s_id is not null;


select distinct s_name
from Supplier s, Catalog c, Parts p where s.s_id = c.s_id
group by s.s_id, s.s_name
having count(distinct c.p_id)=(select count(*) from Parts p);


select distinct s_name
from Supplier s, Catalog c, Parts p where s.s_id = c.s_id and
c.p_id in (select p_id from Parts p where p.color = 'Red')

  
select distinct p_name from Supplier s, Parts p, Catalog c where p.p_id in (select c.p_id from Catalog c, Supplier s where
s.s_id = c.s_id and s.s_name = 'Acme_Widget') and
p.p_id not in (select c.p_id from Catalog c, Supplier s where s.s_id = c.s_id and s.s_name != 'Acme_Widget');


create view Average(p_id, Average_Product_Cost) as select c.p_id, avg(cost)
from Catalog c group by c.p_id;
select c.s_id from Catalog c, Average a where c.p_id = a.p_id and c.cost>(a.Average_Product_Cost)
group by c.p_id, c.s_id;



select distinct s.s_name, c.cost, c.p_id from Catalog c, Supplier s where s.s_id = c.s_id and
c.cost in (select max(cost) from Catalog c group by c.p_id);

