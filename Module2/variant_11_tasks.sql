-- Вариант 11
-- Задание 1. Создание представления по категориям
CREATE VIEW Category AS
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM Orders
GROUP BY Category;

select * from category c;
-- Задание 2. Рассчитать возвраты по регионам
SELECT
    o.Region,
    COUNT(*) AS Total_Returns,
    SUM(o.Sales) AS Total_Returned_Sales
FROM Orders o
INNER JOIN "returns" r   ON o.order_id  = r.region
WHERE r.person  = 'Yes'
GROUP BY o.Region
ORDER BY Total_Returned_Sales DESC;
 
-- Задание 3. Определить выручку по месяцам
SELECT
    to_char("order_date", 'yyyy-mm') AS Order_Month,
    SUM(Sales) AS Total_Revenue
FROM Orders
GROUP BY to_char("order_date", 'yyyy-mm') 
ORDER BY Order_Month;


