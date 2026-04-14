select * from food limit 8;

alter table food alter column order_date type date using order_date :: timestamp without time zone;

--1.which restaurants have the highest avg delivery time ?

select restaurant_name, round(avg(delivery_time_mins)::numeric,2) as highest_a_d_time
from food group by restaurant_name order by highest_a_d_time desc limit 5 ;

--2.which cuisine type generates the highest total order value?

select cuisine_type,count(order_id)as total_order
from food group by cuisine_type order by total_order desc limit 5 ;

select column_name from information_schema.columns where table_name = 'food';
 
--3.which delivery partners handle the most orders but still exceed average delivery time?

select delivery_boy_id,
	count(order_id)as total_order,
	round(avg(delivery_time_mins)::numeric,2)as avg_time
	from food
	group by delivery_boy_id having avg(delivery_time_mins) > (select avg(delivery_time_mins) from food)
	order by total_order desc limit 5;

--4.At which time slots do orders peak, and how does delivery time vary across them?
select peak_hour,count(order_id) as total_order , 
round(avg(delivery_time_mins)::numeric,2) as  avg_delivery_time
from food group by peak_hour order by total_order desc;

--5.Are high- discount orders generating higher order values or lower?
select discount_applied_inr,round(sum(total_value)::numeric,2) as order_value
from food group by discount_applied_inr order by order_value desc
 
--6.Rank delivery partners by total orders handled within each cuisine type using window functions?
select delivery_boy_id,cuisine_type,count(order_id)as total_orders, 
rank()over(partition by cuisine_type order by count(order_id)desc) as rank_num
from food group by delivery_boy_id,cuisine_type order by cuisine_type,rank_num desc;

--much cleaner only 1st _id
select * from (
		select delivery_boy_id,cuisine_type,count(order_id)as total_orders,
		rank()over(partition by cuisine_type order by count(order_id)desc) as rank_num
		from food group by delivery_boy_id,cuisine_type
		)ranked 
where rank_num = 1 order by cuisine_type;
 
--7.find customers who placed orders in every month of the dataset (no gap in monthly activity)?
select customer_id,count(distinct to_char(order_date,'YYYY-MM'))as active_month
	from food group by customer_id
	having count(distinct to_char(order_date,'YYYY-MM'))=1 

select  distinct to_char(order_date,'YYYY-MM')FROM food order by 1;
select * from food limit 5 ;