drop table if exists zepto;

create table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,	
quantity INTEGER
);


-- -----------------------------------------------------------------------------------------------------------------------
-- Data Exploration 
-- -----------------------------------------------------------------------------------------------------------------------
-- count of rows 

SELECT COUNT(*) AS "Total" 


FROM zepto;

-- Sample data 

SELECT * FROM zepto
LIMIT 10 ;

-- null values 

SELECT * FROM zepto 
WHERE name IS NULL OR category IS NULL OR mrp IS NULL OR discountpercent IS NULL OR availablequantity IS NULL OR weightInGms IS NULL
OR outofstock IS NULL OR quantity IS NULL ;

-- Different Product category 

SELECT DISTINCT category 
From zepto
order by category;

-- products in stock vs out of stock

SELECT name , category 
FROM zepto 
WHERE outofstock = True;


SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

-- product names present multiple time

SELECT name , COUNT(sku_id) AS "Number_of_Sku"
FROM zepto
GROUP BY name 
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC;

-- -------------------------------------------------------------------------------------------------------------------------------------
-- Data Cleaning 
-- -------------------------------------------------------------------------------------------------------------------------------------

-- product with price = 0 

SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;


-- convert paise to rupees

update zepto 
set mrp = mrp /100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

-- --------------------------------------------------------------------------------------------------------------------------------
-- Business Insights 
-- --------------------------------------------------------------------------------------------------------------------------------

-- 1. Found top 10 best-value products based on discount percentage

SELECT DISTINCT name, mrp, discountPercent
FROM zepto 
ORDER BY discountpercent DESC
LIMIT 10;


-- 2. Identified high-MRP products that are currently out of stock

SELECT DISTINCT name , category , mrp 
FROM zepto 
WHERE outOfstock = True 
ORDER BY mrp DESC ;


-- 3. Estimated potential revenue for each product category

SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

;

-- 4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- 5.Ranked top 5 categories offering highest average discounts

SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;


-- 6. Calculated price per gram to identify value-for-money products

SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- 7. Grouped products based on weight into Low, Medium, and Bulk categories


SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

-- Measured total inventory weight per product category

SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;