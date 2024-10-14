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
