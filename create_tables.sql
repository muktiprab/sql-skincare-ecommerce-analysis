CREATE TABLE customers (
	customer_id VARCHAR(10) PRIMARY KEY,
	customer_name VARCHAR(100),
	city VARCHAR(100),
	state VARCHAR(100),
	gender VARCHAR(20),
	age_group VARCHAR(50),
	signup_date VARCHAR(20),
	acquisition_channel VARCHAR(100),
);

CREATE TABLE orders (
	order_id VARCHAR(10) PRIMARY KEY,
	customer_id VARCHAR(10) NOT NULL,
	order_date VARCHAR(20),
	order_status VARCHAR(50),
	payment_method VARCHAR(50),
	sales_channel VARCHAR(50),
	gross_amount DECIMAL(18,2),
	discount_amount DECIMAL(18,2),
	shipping_fee DECIMAL(18,2),
	final_amount DECIMAL(18,2),
	delivered_date VARCHAR(20),

	CONSTRAINT FK_orderitems_customers 
		FOREIGN KEY (customer_id) 
		REFERENCES customers(customer_id)
);

CREATE TABLE products (
	product_id VARCHAR(10) PRIMARY KEY,
	product_name VARCHAR(100),
	category VARCHAR(50),
	concern VARCHAR(50),
	skin_type VARCHAR(50),
	key_ingredient VARCHAR(100),
	size VARCHAR(10),
	mrp INT,
	cost_price INT,
	stock_qty INT,
	launch_date VARCHAR(20),
);

CREATE TABLE order_items (
	order_item_id VARCHAR(10) PRIMARY KEY,
	order_id VARCHAR(10) NOT NULL,
	product_id VARCHAR(10) NOT NULL,
	quantity INT,
	unit_price INT,
	discount_pct INT,
	item_total DECIMAL(18,2),

	CONSTRAINT FK_orderitems_orders
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT FK_orderitems_products
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

CREATE TABLE returns (
	return_id VARCHAR(10) PRIMARY KEY,
	order_id VARCHAR(10) NOT NULL,
	product_id VARCHAR(10) NOT NULL,
	return_date VARCHAR(20),
	return_reason VARCHAR(100),
	refund_status VARCHAR(50)

	CONSTRAINT FK_returns_orders
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT FK_returns_products
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

CREATE TABLE reviews (
	review_id VARCHAR(10) PRIMARY KEY,
	customer_id VARCHAR(10) NOT NULL,
	product_id VARCHAR(10) NOT NULL,
	order_id VARCHAR(10) NOT NULL,
	rating DECIMAL(18,2),
	review_date VARCHAR(20)

	CONSTRAINT FK_reviews_customers
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT FK_reviews_products
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),

	CONSTRAINT FK_reviews_orders
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);