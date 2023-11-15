
ALTER table categories add constraint primary key (Category_ID);
ALTER table customers add constraint primary key (CustomerID);
ALTER table employees add constraint primary key (EmployeeID);
ALTER table orders add constraint primary key (OrderID);
ALTER table products add constraint primary key (ProductID);
ALTER table shippers add constraint primary key (ShipperID);
ALTER table suppliers add constraint primary key (SupplierID);
ALTER table  order_details add constraint primary key (OrderDetailID);

ALTER TABLE products
ADD CONSTRAINT fk_products_CategoryID
FOREIGN KEY (CategoryID)
REFERENCES categories(Category_ID);


select *
from suppliers;

select  *
from shippers;

select *
from order_details;
 
 select *
from products;

select * 
from categories;

select *
from employees;

select *
from order_details;

select * 
from orders; 

select *
from products; 

select productName, price
from products
order by price desc;

select productName, price
from products
order by ProductName
limit 5 offset 5;

SELECT ProductName
FROM products
WHERE price = (
  SELECT MIN(price) 
  FROM products
);

select CustomerName, orders.OrderID, Quantity
from customers
join orders
on customers.CustomerID = orders.CustomerID
join order_details
on order_details.OrderID = orders. OrderID;

select Orders.orderId, concat(firstName, " " , LastName) as fullName
From orders
join employees
on orders. EmployeeID = employees.EmployeeID;

select CustomerName
from customers
join orders
on customers.CustomerID = orders.CustomerID
where OrderID = '10248';


select orders.OrderID, ProductName 
from orders
join order_details
on orders.OrderID = order_details.OrderID
join  products
on products. ProductID = order_details. ProductID;

select order_details.OrderID, ProductName 
from products
left join order_details
on products. ProductID = order_details.ProductID;  

select customerName, orders.OrderID, quantity
from customers
join orders
on customers.CustomerID = orders.CustomerID
join order_details
on order_details.orderid = orders.orderID
where quantity > 50 ;
-- ANALYSIS QUESTIONS
-- TOTAL NUMBER OF PRODUCTS SOLD
select count(productID) as Total_Product
from products;

-- TOTAL REVENUE
select sum(price) as Total_Revenue
from products;

-- UNIQUE PRODUCT BY CATEGORY
SELECT DISTINCT 
	ProductID,
    ProductName,
    CategoryID,
    Category_Name
FROM products
JOIN categories
ON products.CategoryID = categories.Category_ID;

-- TOTAL PURCHASE
select count(orderID) as Total_Purchase
from orders;

-- TOTAL NO CUSTOMER 
SELECT COUNT(DISTINCT CustomerName) AS TOTAL_CUSTOMER
FROM customers;

-- TOP 5 CUSTOMERS
SELECT distinct ContactName, orders.OrderID, price 
FROM customers
JOIN orders
ON customers.CustomerID = orders.CustomerID
join order_details
on order_details.OrderID = orders.OrderID
join products
on products.ProductID = order_details.ProductID
order by Price desc 
limit  5;

-- BEST SELLING PRODUCTS
select productNAme, sum(Quantity) as Top_5
from products
join order_details
on products.ProductID = order_details.ProductID
group by ProductName
order by Top_5 desc
limit 1;

-- TOP 5 BEST SELLING PRODUCTS
select productNAme, sum(Quantity) as Top_5
from products
join order_details
on products.ProductID = order_details.ProductID
group by ProductName
order by Top_5 desc
limit 5;

-- Transaction values per month
select orderDate,
extract( year FROM ORDERDATE) AS YEAR,
extract( MONTH FROM ORDERDATE) AS MONTH,
extract( DAY FROM ORDERDATE) AS DAY
from orders;

select monthname(orderDate)
from orders;

select orderdate,monthname(orderDate)
from orders;



-- BEST SELLING PRODUCTS CATEGORY

SELECT distinct Category_Name, sum(price) AS total_sales
FROM categories
join products
on categories.Category_ID = products.CategoryID
group by category_name
order by total_sales desc
limit 1;

-- product by category
SELECT distinct Category_Name, sum(price) AS total_sales
FROM categories
join products
on categories.Category_ID = products.CategoryID
group by category_name
order by total_sales desc;

-- customers with more than one transaction
select CustomerName, count(orderID) as highest_order
from customers
join orders
on customers.CustomerID = orders.CustomerID
where OrderID > 1
group by CustomerName
order by highest_order desc;


-- customer with highest order 

select CustomerName, count(orderID) as highest_order
from customers
join orders
on customers.CustomerID = orders.CustomerID
group by CustomerName
order by highest_order desc
limit 1;

-- MOST USE SHIPPER
select ShipperName, count(OrderID)
from shippers
join orders
on shippers.ShipperID = orders.ShipperID
group by shipperName
order by count(OrderID) desc
limit 1 ;

--  SHIPPER USE
select ShipperName, count(OrderID)
from shippers
join orders
on shippers.ShipperID = orders.ShipperID
group by shipperName
order by count(OrderID) desc;


-- MOST USE Supplier
select supplierName ,count(orders.orderID)
from suppliers 
join products
on suppliers.supplierID = products.supplierID
join order_details
on products.ProductID = order_details.ProductID
join orders
on orders.OrderID = order_details.OrderID
group by SupplierName
order by count(orders.orderID) desc
limit 1;

-- TOP 5 Supplier
select supplierName ,count(orders.orderID)
from suppliers 
join products
on suppliers.supplierID = products.supplierID
join order_details
on products.ProductID = order_details.ProductID
join orders
on orders.OrderID = order_details.OrderID
group by SupplierName
order by count(orders.orderID) desc
limit 5;










 
























