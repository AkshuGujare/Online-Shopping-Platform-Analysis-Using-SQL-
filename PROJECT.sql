Create database RetailDB_1;
use RetailDB_1;
CREATE TABLE Customers (
 customer_id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100),
 email VARCHAR(150) UNIQUE,
 city VARCHAR(50),
 signup_date DATE
);

CREATE TABLE Products (
 product_id INT AUTO_INCREMENT PRIMARY KEY,
 product_name VARCHAR(100),
 category VARCHAR(50),
 price DECIMAL(10,2)
);

CREATE TABLE Orders (
 order_id INT AUTO_INCREMENT PRIMARY KEY,
 customer_id INT,
 product_id INT,
 order_date DATE,
 quantity INT,
 total_amount DECIMAL(10,2),
 payment_mode VARCHAR(50),
 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
 FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
SELECT * FROM Customers;
select * from Orders;
select * from Products;

-- 1 Fetch all customers from the database.
SELECT * FROM Customers;

-- 2. Show only the customer names and their cities.
Select name,city from Customers;

-- 3. Find customers who live in Mumbai.
Select name,city from Customers where city="Mumbai";

-- 4. Get all orders placed after 1st August 2024.
Select * from Orders WHERE order_date>"1/8/2024";

-- 5. List all products priced greater than ₹5000.
Select product_name, price from Products where price >5000;

-- 6. Count how many customers exist in the system.
Select count(customer_id) from Customers;

-- 7. Update a customer’s city (e.g., change Rohit Kumar’s city to Hyderabad).
set sql_safe_updates=0;
update Customers set city="Hyderabad" where name="Rohit Kumar";
select * from Customers;

-- 8. Delete an order (e.g., remove order with ID = 5).
delete from Orders where order_id=5; 
select * from Orders;

-- 9. Display product names with their original price and price increased by 10%.
Select product_name,price,(price*1.10) as increment_price from Products;

-- 10.Show only the unique cities where customers live
Select Distinct city from Customers;

-- 11. Get the first 3 customers who signed up.
Select name from Customers where customer_id<4;

-- 12.Skip the first 2 customers and fetch the next 3 customers.
Select name from Customers where customer_id>=3 and customer_id<=5;

-- 13.Find products with prices between ₹2000 and ₹6000.
Select product_name,price from Products where price>2000 and price<6000;

-- 14.Find customers who are from Mumbai OR Chennai.
Select * from Customers where city="Mumbai" or city="Chennai";

-- 15.Find customers who are NOT from Delhi.
Select * from Customers where not city="Delhi";

-- 16.Find orders that are NOT paid by UPI.
Select * from Orders where not payment_mode="UPI";

-- 17.Get the average order amount across all orders.
Select sum(total_amount)/count(order_id) as average_amount from Orders; 

-- 18.Show the highest order amount.
select max(total_amount) from Orders;

-- 19.Show the lowest product price
select min(price) from Products;

-- 20.Find the total money spent across all orders.
Select sum(total_amount) from orders;