-- View the order details table
select * from order_details;

-- What is the date range of the table
select * from order_details
order by order_date;

select min(order_date), max(order_date) from order_details;

-- How many orders were made within this date range 
select count(distinct order_id) as item_ordered from order_details
order by order_date;


-- How many items were ordered within this date range
select count(order_id)from order_details
order by order_date;

-- Which orders had the most number of the items
select order_id, count(item_id) as num_dishes from order_details
group by order_id
order by num_dishes desc;


-- How many orders have more than 12 items
select count(*) from
(select order_id, count(item_id) as num_dishes from order_details
group by order_id
having num_dishes>12) as num_orders;
