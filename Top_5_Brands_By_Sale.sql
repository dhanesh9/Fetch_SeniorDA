-- Q2: Top 5 brands by sales(in $) for users with accounts older than 6 months old 

-- Part 1: Creating a CTE with list of users with accounts older than 6 months old (using created_date)
WITH Users_Over_6Months AS (
    SELECT id
    FROM USERS
    WHERE TIMESTAMPDIFF(MONTH, created_date, CURRENT_DATE) >= 6
)

-- Part 2: Calculating the sales(in $) by user (using CTE above) and grouping by brand
SELECT p.BRAND, SUM(t.final_sale) AS total_sales_$
FROM TRANSACTIONS t
-- Joining with CTE (using user ID) to filter receipts for users with accounts older than 6 months old
    JOIN Users_Over_6Months u ON t.user_id = u.id
-- Joining with Products (using barcode) to get brand level data 
    JOIN PRODUCT p ON t.barcode = p.barcode
-- Ignoring the count for brands with no data (blank) 
WHERE NOT p.BRAND IS NULL
-- Grouping by brand and getting the top 5 brands by sales(in $)
GROUP BY p.BRAND
ORDER BY total_sales_$ DESC
LIMIT 5;
