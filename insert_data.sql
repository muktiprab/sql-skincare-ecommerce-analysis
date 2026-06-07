BULK INSERT customers
FROM 'D:\Project SQL\Customers.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', TABLOCK);

SELECT * FROM customers;

BULK INSERT products
FROM 'D:\Project SQL\Products.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', TABLOCK);

SELECT * FROM products;

BULK INSERT orders
FROM 'D:\Project SQL\Orders.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', TABLOCK);

SELECT * FROM orders;

BULK INSERT order_items
FROM 'D:\Project SQL\Order_Items.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', TABLOCK);

SELECT * FROM order_items;

BULK INSERT returns
FROM 'D:\Project SQL\Returns.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', TABLOCK);

SELECT * FROM returns;

BULK INSERT reviews
FROM 'D:\Project SQL\Reviews.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', TABLOCK);

SELECT * FROM reviews;