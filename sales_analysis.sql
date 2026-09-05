-- Sales Insights Project
-- SQL Analysis

-- 1. View all transactions
SELECT *
FROM sales.transactions;


-- 2. Count transactions for market Mark001
SELECT COUNT(*)
FROM sales.transactions
WHERE market_code = 'Mark001';


-- 3. View transactions with USD currency
SELECT *
FROM sales.transactions
WHERE currency = 'USD';


-- 4. Join transactions with date table for 2020
SELECT 
    sales.transactions.*,
    sales.date.*
FROM sales.transactions
INNER JOIN sales.date
    ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020;


-- 5. Calculate revenue for 2020
SELECT 
    SUM(sales.transactions.sales_amount) AS Revenue
FROM sales.transactions
INNER JOIN sales.date
    ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020;


-- 6. Calculate revenue for Chennai (Mark001) in 2020
SELECT 
    SUM(sales.transactions.sales_amount) AS RevenueChennai
FROM sales.transactions
INNER JOIN sales.date
    ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020
    AND sales.transactions.market_code = 'Mark001';


-- 7. Find distinct products sold in Chennai (Mark001)
SELECT DISTINCT product_code
FROM sales.transactions
WHERE market_code = 'Mark001';