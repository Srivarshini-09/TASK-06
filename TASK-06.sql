USE ECommerceDB;

SELECT Name FROM customer  -- select name from customer with id from orders where totamt>10000
WHERE CustomerID IN (
 SELECT CustomerID FROM orders
WHERE TotalAmount > 10000
);

SELECT CategoryID, AVG(Price) AS AvgPrice  -- filters prod with stock>100 then groups them by categoryID and avg price
FROM (
SELECT * FROM product WHERE 
Stock > 100)
AS FilteredProduct
GROUP BY CategoryID;

SELECT Name FROM product   -- select all the product that is costlier than those of selected
WHERE Price > ALL(
SELECT Price FROM Product 
WHERE CategoryID > 2); 

SELECT Name FROM product  -- Fetches product whose price is less than atleast one product in category 1
WHERE Price < ANY (
SELECT Price FROM product 
WHERE CategoryID = 1);

SELECT Name, (SELECT COUNT(*) FROM orders WHERE orders.CustomerID = customer.CustomerID)
AS OrderCount FROM customer;

SELECT Name From product P  -- filters product whose price is more than average of all products in table
WHERE Price > (
SELECT AVG(Price) FROM product 
WHERE CategoryID = P.CategoryID);

SELECT Name FROM customer C 
WHERE EXISTS (
SELECT * FROM orders O WHERE O.CustomerID = C.CustomerID);

SELECT Name FROM customer C 
WHERE NOT EXISTS (
SELECT * FROM orders O WHERE O.CustomerID = C.CustomerID);