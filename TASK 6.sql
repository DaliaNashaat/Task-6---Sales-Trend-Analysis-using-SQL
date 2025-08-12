-- Task 6: Sales Trend Analysis Using Aggregations
-- a. Use EXTRACT(MONTH FROM order_date) to extract the month from the order date.
-- b. Group data by year and month using GROUP BY.
-- c. Use SUM() to calculate total revenue for each group.
-- d. Use COUNT(DISTINCT order_id) to count unique orders (volume).
-- e. Use ORDER BY to sort results chronologically by year and month.
-- f. Use WHERE clause to limit results to specific time periods.

SELECT
  YEAR(STR_TO_DATE(`Order Date`, '%d/%m/%Y')) AS year,                     -- Extract year from order date
  MONTH(STR_TO_DATE(`Order Date`, '%d/%m/%Y')) AS month,                   -- Extract month from order date
  SUM(CAST(REPLACE(REPLACE(Sales, '$', ''), ' ', '') AS DECIMAL(10,2))) AS total_revenue,  -- Sum revenue after cleaning
  COUNT(DISTINCT `Order ID`) AS total_orders                               -- Count unique orders
FROM
  `Sample - Superstore`
WHERE
  STR_TO_DATE(`Order Date`, '%d/%m/%Y') BETWEEN '2015-01-01' AND '2016-12-31'  -- Filter data for specific time period
GROUP BY
  year, month                                                             -- Group by year and month
ORDER BY
  year, month;                                                            -- Sort by year and month chronologically
