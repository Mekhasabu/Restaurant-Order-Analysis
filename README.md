# Restaurant-Order-Analysis
SQL Project
## About 
A quarter's worth of orders from a fictitious restaurant serving international cuisine, including the date and time of each order, the items ordered, and additional details on the type, name and price of the items.

## Dataset
[Maven Analytics](https://mavenanalytics.io/data-playground?order=date_added%2Cdesc&pageSize=10&search=Restau)

## Objectives
#### Objective 1: Explore the Items Table
1. View the menu items table and write a query to find the number of items on the table
2. What are the least and most expensive items on the menu.
3. How many Italian dishes are o the menu? What are the least and most expensive Italian dishes on the menu?
4. How many dishes are in each category? What is he average dish price within each category?
#### Objective 2: Explore the orders table
1.View the order details table. What is the date range of the table?
2.How many orders were made within this date range?How many items were ordered within this date range?
3.Which orders had the most number of items?
4.How many orders had more than 12 items?
#### Objective 3: Analyze Customer behaviour
1. Combine the menu items and order_details into a single table
2. What were the least and most ordered items?Whatcategories were they in?
3. What were the top 5 orders that spent the most money in?
4. View the details of the highest spend orders. What insights can you gather from the results?
5. View the details of the top 5 highest spend orders. What insights can you gather from the results?   
### Objective 1. Explore the items table   
```sql
-- View the menu items table
select * from menu_items;
-- Find the number of items on the table
select count(*) from menu_items;

```
| Solution |
| -------- |
|  32      |
```sql
-- What are the least and the most expensive items on the table?
select * from menu_items
order by price;
```
#### solution
| menu_item_id| item_name    | category   | price |
| --- | -------------------- | --------- | ----- |
| 113 | Edamame              | Asian     |  5.00 |
| 130 | Shrimp Scampi        | Italian   | 19.95 |

```sql

-- How many italian dishes are on the menu?
select count(category) from menu_items
where category='Italian';
```
| Solution |
| -------- |
|  9    |

```sql
-- How many dishes are in each category?
select category, count(menu_item_id) as num_dishes
from menu_items
group by category;

```
#### Solution
| Category  | num_dishes |
| -------- | ---------------- |
| American | 6                |
| Asian    | 8                |
| Mexican  | 9                |
| Italian  | 9                |

```sql
-- What is the average dish price within each category?
select category, avg(price) as avg_price_dishes
from menu_items
group by category;
```
#### Solution
| Category  | avg_price_dishes |
| -------- | -------------- |
| American | 10.07          |
| Asian    | 13.48          |
| Mexican  | 11.80          |
| Italian  | 16.75          |

### Objective 2:Explore the orders table
```sql
-- View the order details table
select * from order_details;

-- What is the date range of the table
select * from order_details
order by order_date;

select min(order_date), max(order_date) from order_details;
```
#### Solution
|min(order_date)|max(order_date)|
|-------------|------------|
|2023-01-01|	2023-03-31|

```sql
-- How many orders were made within this date range 
select count(distinct order_id) as item_ordered from order_details
order by order_date;
```

| Solution |
| -------- |
|  5370     |
			
```sql
-- How many items were ordered within this date range
select count(order_id)from order_details
order by order_date;

```

| Solution |
| -------- |
|  12234  |

```sql
-- Which orders had the most number of the items
select order_id, count(item_id) as num_dishes from order_details
group by order_id
order by num_dishes desc;
```
#### Solution
| order_id  | num_dishes |
| ---- | ----- |
| 4305 | 14    |
| 3473 | 14    |
| 1957 | 14    |
| 330  | 14    |
| 440  | 14    |
| 443  | 14    |
| 2675 | 14    |
```sql
-- How many orders have more than 12 items
select count(*) from
(select order_id, count(item_id) as num_dishes from order_details
group by order_id
having num_dishes>12) as num_orders;
```
| Solution |
| -------- |
|  20  |

#### Objective 4 : Customer Behaviour
```sql
-- Combine the menu_items and order_details tables into single table

select *
from order_details od left join menu_items mi 
on od.item_id = mi.menu_item_id;
```
```sql
-- What were the least and most ordered items? What categories were they in?
select item_name, count(order_details_id) as num_purchases
from order_details od left join menu_items mi 
    on od.item_id = mi.menu_item_id
group by item_name
order by num_purchases desc;

select item_name,category,count(order_details_id) as num_purchases
from order_details od left join menu_items mi 
    on od.item_id = mi.menu_item_id
group by item_name, category
order by num_purchases desc;
```

#### Solution
| item_name                  | Category   | num_purchases |
| ---------------------- | --------- | -------- |
| Hamburger              | American  | 622      |
| Chicken Tacos          | Mexican   | 123      |

```sql
-- What were the top 5 orders that spent the most money?
select order_id, sum(price) as total_spend
from order_details od left join menu_items mi 
    on od.item_id = mi.menu_item_id
group by order_id
order by total_spend desc
limit 5;
```
#### Solution
| order_id   | total_spend  |
| ---- | ------- |
| 440  | 192.15  |
| 2075 | 191.05  |
| 1957 | 190.10  |
| 330  | 189.70  |
| 2675 | 185.10  |

```sql
-- View the details of the top 5 orders. What insights can you gather from the results?
select category ,count(item_id) as num_id
from order_details od left join menu_items mi 
    on od.item_id = mi.menu_item_id
where order_id=440
group by category;
```
#### Solution
| Category  | num_id |
| -------- | ----- |
| Mexican  | 2     |
| American | 2     |
| Italian  | 8     |
| Asian    | 2     |

```sql
-- View the details of the top 5 highest spend order. What insights can you gather from the results?
select order_id,category ,count(item_id) as num_id
from order_details od left join menu_items mi 
    on od.item_id = mi.menu_item_id
where order_id in (440,2075,1957,330,2675)
group by order_id, category;
```
#### Solution
| order_id  | Category  | num_id |
| ---- | -------- | ----- |
| 330  | Asian    | 6     |
| 330  | American | 1     |
| 330  | Italian  | 3     |
| 330  | Mexican  | 4     |
| 440  | Mexican  | 2     |
| 440  | American | 2     |
| 440  | Italian  | 8     |
| 440  | Asian    | 2     |
| 1957 | Asian    | 3     |
| 1957 | American | 3     |
| 1957 | Italian  | 5     |
| 1957 | Mexican  | 3     |
| 2075 | Asian    | 3     |
| 2075 | Mexican  | 3     |
| 2075 | American | 1     |
| 2075 | Italian  | 6     |
| 2675 | American | 3     |
| 2675 | Asian    | 3     |
| 2675 | Italian  | 4     |
| 2675 | Mexican  | 4     |

### Insights
1. There are 32 items in total in the menu which belongs to different categories like asian, american , italian and mexican
2. The most expensive item in the menu is Shrimp Scampi which is an Italian Cuisines and least expensive is edamame which is an asian dish.
3. 5370 orders were made within three months time period
4. Hamburger which belongs to Amercan cuisine is the most popular and chicken tacos is less popular
5. Italian cuisines are most ordered cuisine among the customers





