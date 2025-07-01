# 🧾 SQL Developer Internship – Task 6

## 📌 Task Title: Subqueries and Nested Queries

This task focuses on writing advanced SQL queries using subqueries inside SELECT, WHERE, and FROM clauses, including correlated subqueries and logical operators like IN, EXISTS, ANY, and ALL.

## 🧠 Objective

- Understand and apply different types of subqueries in SQL.  
- Use scalar, correlated, and nested subqueries in various clauses.  
- Practice filtering using IN, EXISTS, NOT EXISTS, ANY, and ALL.  
- Analyze data using subquery-based conditions and comparisons

  ## 🛠️ Tools & Environment

- **SQL Dialect:** MySQL  
- **Platform:** MySQL Workbench  
- **Database Used:** `ECommerceDB`

## ⚙️ Process Executed 

1. Identified relevant tables: Customer, Orders, Product, etc.  
2. Wrote and tested queries involving different types of subqueries.  
3. Used subqueries in SELECT, WHERE, and FROM clauses.  
4. Verified behavior of EXISTS, ALL, and ANY logic.  

## ✅ Key Concepts Used

- Scalar subquery (returns a single value)  
- Correlated subquery (depends on outer query)  
- Subqueries in SELECT, FROM, and WHERE  
- IN, NOT IN, EXISTS, NOT EXISTS, ANY, ALL  
- Derived tables (subquery as a virtual table)

## 🧪 How to Run the Project

1. Use `ECommerceDB` database
2. Open your SQL environment (MySQL Workbench)
3. Paste and run the SQL from `TASK-06.sql`.
4. Use the following queries to verify results:

SELECT Name FROM customer  
WHERE CustomerID IN (
 SELECT CustomerID FROM orders
WHERE TotalAmount > 10000
);

SELECT CategoryID, AVG(Price) AS AvgPrice  
FROM (
SELECT * FROM product WHERE 
Stock > 100)
AS FilteredProduct
GROUP BY CategoryID;

SELECT Name FROM product   
WHERE Price > ALL(
SELECT Price FROM Product 
WHERE CategoryID > 2); 

SELECT Name FROM product 
WHERE Price < ANY (
SELECT Price FROM product 
WHERE CategoryID = 1);

SELECT Name, (SELECT COUNT(*) FROM orders WHERE orders.CustomerID = customer.CustomerID)
AS OrderCount FROM customer;

SELECT Name From product P  
WHERE Price > (
SELECT AVG(Price) FROM product 
WHERE CategoryID = P.CategoryID);

SELECT Name FROM customer C 
WHERE EXISTS (
SELECT * FROM orders O WHERE O.CustomerID = C.CustomerID);

SELECT Name FROM customer C 
WHERE NOT EXISTS (
SELECT * FROM orders O WHERE O.CustomerID = C.CustomerID);
