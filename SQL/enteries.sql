--create table entries ( 
--name varchar(20),
--address varchar(20),
--email varchar(20),
--floor int,
--resources varchar(10));

--insert into entries 
--values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
--,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR')

with
resources_used as ( select distinct name, resources from entries),
resources_aggregate as ( select name,string_agg(resources,',') as used_resources from resources_used group by name),
total_VISIT As (select name,count(1) as total_visit, string_agg(resources, ',') as resources from entries
group by name),
CTE AS (
select name,floor,count(1) as no_of_floor_visit, rank() over(partition by name order by count(1) desc) as RN from entries
group by name,floor
)

select A.name,A.floor as most_visit_floor,B.total_visit,ar.used_resources
from CTE A inner join total_VISIT B on A.name = B.name 
inner join resources_aggregate ar on  A.name = ar.name
where RN = 1



