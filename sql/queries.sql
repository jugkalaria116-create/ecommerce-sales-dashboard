//creates the database 
CREATE DATABASE ecommerce_dashboard;

//creates the table 
CREATE TABLE sales (
ship_mode VARCHAR(50),
segment VARCHAR(50),
country VARCHAR(50),
city VARCHAR(100),
state VARCHAR(100),
postal_code INT,
region VARCHAR(50),
category VARCHAR(50),
sub_category VARCHAR(50),
sales DECIMAL(10,2),
quantity INT,
discount DECIMAL(5,2),
profit DECIMAL(10,2)
);



//to the the dataset is imported successfully

//first 10 row of dataset 

USE ecommerce_dashboard;
SELECT * FROM sales LIMIT 10;

//counts total rows

SELECT COUNT(*) AS total_rows FROM sales;

//total sales 
SELECT ROUND(SUM(sales),2) AS total_sales
FROM sales;

//total profit 
SELECT ROUND(SUM(profit),2) AS total_profit
FROM sales;

// sales by category 
SELECT category,
ROUND(SUM(sales),2) AS revenue
FROM sales
GROUP BY category
ORDER BY revenue DESC;

// profit  by region 
SELECT region,
ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_profit DESC;

// top 10 cities by sales 
SELECT city,
ROUND(SUM(sales),2) AS revenue
FROM sales
GROUP BY city
ORDER BY revenue DESC
LIMIT 10;