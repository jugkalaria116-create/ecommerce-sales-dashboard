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



// To the the dataset is imported successfully

// First 10 row of dataset 

USE ecommerce_dashboard;
SELECT * FROM sales LIMIT 10;

// Counts total rows

SELECT COUNT(*) AS total_rows FROM sales;

// Total sales 
SELECT ROUND(SUM(sales),2) AS total_sales
FROM sales;

// Total profit 
SELECT ROUND(SUM(profit),2) AS total_profit
FROM sales;

// Sales by category 
SELECT category,
ROUND(SUM(sales),2) AS revenue
FROM sales
GROUP BY category
ORDER BY revenue DESC;

// Profit  by region 
SELECT region,
ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_profit DESC;

// Top 10 cities by sales 
SELECT city,
ROUND(SUM(sales),2) AS revenue
FROM sales
GROUP BY city
ORDER BY revenue DESC
LIMIT 10;

// Top 5 Most Profitable Cities
SELECT city,
ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY city
ORDER BY total_profit DESC
LIMIT 5;

// Bottom 5 Loss-Making Cities
SELECT city,
ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY city
ORDER BY total_profit ASC
LIMIT 5;


// Highest Sales Sub-Categories
SELECT sub_category,
ROUND(SUM(sales),2) AS revenue
FROM sales
GROUP BY sub_category
ORDER BY revenue DESC;

// Discount Impact on Profit
SELECT discount,
ROUND(AVG(profit),2) AS avg_profit
FROM sales
GROUP BY discount
ORDER BY discount;

// Segment Wise Profit 
SELECT segment,
ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY segment
ORDER BY total_profit DESC;

// Average Sales Per Category
SELECT category,
ROUND(AVG(sales),2) AS avg_sales
FROM sales
GROUP BY category;

// Top States By Revenue
SELECT state,
ROUND(SUM(sales),2) AS revenue
FROM sales
GROUP BY state
ORDER BY revenue DESC
LIMIT 10;   