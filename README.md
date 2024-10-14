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
|Solution|
| menu_item_id| item_name                | category   | price |
| --- | -------------------- | --------- | ----- |
| 113 | Edamame              | Asian     |  5.00 |
| 105 | Mac & Cheese         | American  |  7.00 |
| 106 | French Fries         | American  |  7.00 |
| 122 | Chips & Salsa        | Mexican   |  7.00 |
| 103 | Hot Dog              | American  |  9.00 |
| 114 | Potstickers          | Asian     |  9.00 |
| 123 | Chips & Guacamole    | Mexican   |  9.00 |
| 104 | Veggie Burger        | American  | 10.50 |
| 121 | Cheese Quesadillas   | Mexican   | 10.50 |
| 111 | California Roll      | Asian     | 11.95 |
| 115 | Chicken Tacos        | Mexican   | 11.95 |
| 119 | Chicken Torta        | Mexican   | 11.95 |
| 101 | Hamburger            | American  | 12.95 |
| 117 | Chicken Burrito      | Mexican   | 12.95 |
| 102 | Cheeseburger         | American  | 13.95 |
| 116 | Steak Tacos          | Mexican   | 13.95 |
| 120 | Steak Torta          | Mexican   | 13.95 |
| 108 | Tofu Pad Thai        | Asian     | 14.50 |
| 124 | Spaghetti            | Italian   | 14.50 |
| 126 | Fettuccine Alfredo   | Italian   | 14.50 |
| 112 | Salmon Roll          | Asian     | 14.95 |
| 118 | Steak Burrito        | Mexican   | 14.95 |
| 128 | Cheese Lasagna       | Italian   | 15.50 |
| 129 | Mushroom Ravioli     | Italian   | 15.50 |
| 107 | Orange Chicken       | Asian     | 16.50 |
| 132 | Eggplant Parmesan    | Italian   | 16.95 |
| 109 | Korean Beef Bowl     | Asian     | 17.95 |
| 110 | Pork Ramen           | Asian     | 17.95 |
| 125 | Spaghetti & Meatballs| Italian   | 17.95 |
| 127 | Meat Lasagna         | Italian   | 17.95 |
| 131 | Chicken Parmesan     | Italian   | 17.95 |
| 130 | Shrimp Scampi        | Italian   | 19.95 |


			
