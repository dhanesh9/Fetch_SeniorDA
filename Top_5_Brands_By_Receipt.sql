-- Q1: Top 5 brands by receipt count for users 21 years and older 

-- Part 1: Creating a CTE with list of users 21 years and older (using birth_date)
WITH Users_Age_21_Over AS (
    SELECT id
    FROM USERS
    WHERE TIMESTAMPDIFF(YEAR, birth_date, CURRENT_DATE) >= 21
)

-- Part 2: Calculating the receipts by user (using CTE above) and grouping by brand
SELECT p.BRAND, COUNT(DISTINCT t.receipt_id) AS receipt_count
FROM TRANSACTIONS t
-- Joining with CTE (using user ID) to filter receipts for users 21 years and over
    JOIN Users_Age_21_Over u ON t.user_id = u.id
-- Joining with Products (using barcode) to get brand level data 
    JOIN PRODUCT p ON t.barcode = p.barcode
-- Ignoring the count for brands with no data (blank) 
WHERE NOT p.BRAND IS NULL
-- Grouping by brand and getting the top 5 brands by receipt count
GROUP BY p.BRAND
ORDER BY receipt_count DESC
LIMIT 5;
