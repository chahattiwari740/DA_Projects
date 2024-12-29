use pizzadb;

select cast(sum(total_price)as Decimal(10,2)) As Total_sale
from pizza_sales;

/* Total Orders */
select count( distinct order_id) as Total_orders
from pizza_sales;

/* Average Price Per order */
select cast(sum(total_price)/count(distinct order_id)As decimal(10,2) )
As Average_price_per_order
from pizza_sales; 

/* Total_pizzas_sold */
select SUM(quantity) as total_pizzas_sold from pizza_sales;





/* Average Pizzas per orders */

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;

/*Sales_by_category*/
select pizza_category,cast(sum(total_price) as decimal(10,2)) as Sales_by_category,cast(sum(total_price)*100/(select Sum(total_price)from pizza_sales) as decimal(10,2)) as Percentage_Per_cat
from pizza_sales
group by pizza_category;

/*sales_per_month */
select 
pizza_size ,cast(sum(total_price) as decimal(10,2)) as sales_per_size,cast(sum(total_price)*100/( select sum(total_price) from  pizza_sales) as decimal(10,2)) As Percent_per_size
from pizza_sales 
group by pizza_size
order by sales_per_size desc;


/*sales_per_month */

select DATENAME(month,order_date) as month_name, cast(SUM(total_price) as decimal(10,2)) as sales_per_month 
from pizza_sales
group by DATENAME(month,order_date)
order by sales_per_month  Desc;



/* sale on weekdays */
select DATENAME(DW,order_date) as Day_name, cast(SUM(total_price) as decimal(10,2)) as sales_per_Day 
from pizza_sales
group by DATENAME(DW,order_date)
order by sales_per_Day  Desc;

/*top 5 Pizzas on Quantity */
select Top 5 pizza_name,Sum( quantity) as Quantity_sold     ,cast(SUM(total_price) as decimal(10,2)) as per_pizza_sales
from pizza_sales
group by pizza_name
order by per_pizza_sales Desc ;

/*worst 5 pizzas on Quantity */
select Top 5 pizza_name,Sum( quantity) as Quantity_sold,cast(SUM(total_price) as decimal(10,2)) as per_pizza_sales
from pizza_sales
group by pizza_name
order by per_pizza_sales Asc

;

/* Top 5 Pizzas By order */
select top 5 pizza_name,count(distinct order_id) as orders
from pizza_sales
Group by pizza_name
order by orders Desc;

/* bottom 5 Pizzas By order */
select top 5 pizza_name,count(distinct order_id) as orders
from pizza_sales
Group by pizza_name
order by orders Asc;


/* Top 5 Pizzas By revenue */
select Top 5 pizza_name,cast(SUM(total_price) as decimal(10,2)) as per_pizza_sales
from pizza_sales
group by pizza_name
order by per_pizza_sales Desc ;

/* Bottom 5 Pizzas By revenue */
select Top 5 pizza_name,cast(SUM(total_price) as decimal(10,2)) as per_pizza_sales
from pizza_sales
group by pizza_name
order by per_pizza_sales ASC ;

