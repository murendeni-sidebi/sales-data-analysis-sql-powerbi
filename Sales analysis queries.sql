--Total sales & Profit
USE SalesAnalysis;
GO
SELECT 
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    COUNT(*) AS TotalOrders
FROM orders;

--Sales by category
SELECT 
    p.Category,
    SUM(o.Sales) AS TotalSales,
    SUM(o.Profit) AS TotalProfit
FROM orders o
JOIN products p ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalSales DESC;

--Sales by Region
SELECT 
    c.Region,
    SUM(o.Sales) AS TotalSales,
    COUNT(*) AS Quantity
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Region
ORDER BY TotalSales DESC;

--Top 10 products
SELECT TOP 10
    p.ProductName,
    p.Category,
    SUM(o.Sales) AS TotalSales
FROM orders o
JOIN products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName, p.Category
ORDER BY TotalSales DESC;

--Monthly sales trend
SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(Sales) AS MonthlySales
FROM orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;