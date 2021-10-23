-- Aggregate Window Functions MAX(), MIN(), AVG(), SUM(), COUNT();
SELECT 
	OrderID,
	OrderDate,
	MAX(OrderPrice) OVER(PARTITION BY YEAR(OrderDate)) MaxPrice,
	MIN(OrderPrice) OVER(PARTITION BY YEAR(OrderDate)) MinPrice,
	AVG(OrderPrice) OVER(PARTITION BY YEAR(OrderDate)) AvgPrice,
	SUM(OrderPrice) OVER(PARTITION BY YEAR(OrderDate)) SumPrice,
	COUNT(OrderID) OVER(PARTITION BY YEAR(OrderDate)) NumOrders
	FROM Orders
ORDER BY OrderDate ASC;

-- Aggregate Functions MAX(), MIN(), AVG(), SUM(), COUNT();
SELECT 
YEAR(OrderDate) [Year],
MAX(OrderPrice) MaxPrice,
MIN(OrderPrice) MinPrice,
AVG(OrderPrice) AvgPrice,
SUM(OrderPrice) SumPrice,
COUNT(DISTINCT OrderID) NumOfOrders
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY YEAR(OrderDate) ASC;

-- Ranking Window Functions ROW_NUMBER(), RANK(), DENSE_RANK(), NTILE();
-- Value Window Functions LAG(), LEAD(), FIRST_VALUE(), LAST_VALUE();
SELECT 
OrderID,
OrderDate,
OrderPrice,
LAG(OrderPrice) OVER(PARTITION BY YEAR(OrderDate) ORDER BY OrderID ASC) [LAG], 
LEAD(OrderPrice) OVER(PARTITION BY YEAR(OrderDate) ORDER BY OrderID ASC) [LEAD]
FROM Orders;

SELECT 
OrderID,
OrderDate,
OrderPrice,
FIRST_VALUE(OrderPrice) OVER(PARTITION BY YEAR(OrderDate) ORDER BY OrderID ASC) [FIRST VALUE]
FROM Orders;

SELECT 
OrderID,
OrderDate,
OrderPrice,
LAST_VALUE(OrderPrice) OVER(PARTITION BY YEAR(OrderDate) ORDER BY OrderID ASC) [LAST VALUE]
FROM Orders;





