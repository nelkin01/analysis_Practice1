USE superstoredb;
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

-- drop table superstoresales;

CREATE TABLE SuperstoreSales (
    OrderID VARCHAR(20),
    OrderDate date,
    ShipDate date,
    ShipMode VARCHAR(255),
    CustomerID VARCHAR(20),
    CustomerName VARCHAR(255),
    Segment VARCHAR(255),
    Region VARCHAR(255),
    Category VARCHAR(255),
    SubCategory VARCHAR(255),
    ProductName VARCHAR(255),
    Sales DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(5, 2),
    Profit DECIMAL(10, 2),
    Price DECIMAL(10, 2),
    TotalSales DECIMAL(10, 2)
);




LOAD DATA LOCAL INFILE 'C:/Users/nelki/Downloads/SuperstoreSales.csv'
INTO TABLE SuperstoreSales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- SET OrderDate = STR_TO_DATE(@var1, '%m-%d-%Y'),     
-- ShipDate = STR_TO_DATE(@var2, '%m-%d-%Y');

SELECT * FROM SuperstoreSales LIMIT 5;

-- UPDATE superstoresales SET ShipDate = STR_TO_DATE(OrderDate, '%Y-%m%d');


SELECT Region, SUM(TotalSales) AS Total_Revenue
FROM SuperstoreSales
GROUP BY Region
ORDER BY Total_Revenue DESC;


SELECT ProductName, SUM(Quantity) AS Total_Units_Sold
FROM SuperstoreSales
GROUP BY ProductName
ORDER BY Total_Units_Sold DESC
LIMIT 10;

SELECT CustomerName, SUM(Profit) AS Total_Profit
FROM SuperstoreSales
GROUP BY CustomerName
ORDER BY Total_Profit DESC
LIMIT 10;

SELECT AVG(DATEDIFF(ShipDate, OrderDate)) AS Avg_Shipping_Days
FROM SuperstoreSales;



