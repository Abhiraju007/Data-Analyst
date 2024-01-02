--create table customer_orders (
--order_id integer,
--customer_id integer,
--order_date date,
--order_amount integer

--insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
--,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
--,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)
--;


WITH CTE AS (
select customer_id, min(order_date) as first_order from customer_orders
group by customer_id)
,Visit_flag as 
(select C.*, case when C.order_date = A.first_order then 1 else 0 end as first_visit,
case when C.order_date != A.first_order then 1 else 0 end as repeat_customer  
from customer_orders C inner join CTE A on C.customer_id= A.customer_id
)

select order_date, sum(first_visit) as new_customer, sum(repeat_customer) as repeat_customer from Visit_flag
group by order_date


