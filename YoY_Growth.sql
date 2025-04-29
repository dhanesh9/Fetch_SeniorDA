-- Q3: Fetch YoY Growth

-- Using user count to calculate YoY growth
SELECT 
    EXTRACT(YEAR FROM created_date) AS year, 
    COUNT(id) AS current_year_users,
-- Lag function to get the previous year user count
    LAG(current_year_users) OVER (ORDER BY year) AS previous_year_users,
-- YoY growth using the current year and previous year users
    (current_year_users - previous_year_users)/ NULLIF(previous_year_users, 0) * 100 AS yoy_growth_percent
FROM Users
GROUP BY year
ORDER BY year;
