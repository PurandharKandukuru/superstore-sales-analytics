-- 1. Total sales & profit by region
SELECT Region, ROUND(SUM(Sales),2) AS Total_Sales, ROUND(SUM(Profit),2) AS Total_Profit
FROM "Sample - Superstore"
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 2. Top 5 most profitable products
SELECT "Product Name", ROUND(SUM(Profit),2) AS Total_Profit
FROM "Sample - Superstore"
GROUP BY "Product Name"
ORDER BY Total_Profit DESC
LIMIT 5;

-- 3. Monthly sales trend
SELECT 
  substr("Order Date", -4) || '-' || 
  substr('00' || substr("Order Date", 1, instr("Order Date",'/')-1), -2) AS Month,
  ROUND(SUM(Sales),2) AS Monthly_Sales
FROM "Sample - Superstore"
GROUP BY Month
ORDER BY Month;

-- 4. Sales & profit by category and sub-category
SELECT Category, "Sub-Category", ROUND(SUM(Sales),2) AS Sales, ROUND(SUM(Profit),2) AS Profit
FROM "Sample - Superstore"
GROUP BY Category, "Sub-Category"
ORDER BY Profit ASC;

-- 5. Average discount vs profit by segment
SELECT Segment, ROUND(AVG(Discount),3) AS Avg_Discount, ROUND(AVG(Profit),2) AS Avg_Profit
FROM "Sample - Superstore"
GROUP BY Segment;