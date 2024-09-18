--creating Customers table
CREATE TABLE comm_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    contact_number VARCHAR2(15),
    address VARCHAR2(255)
);

--creating Categories table
CREATE TABLE comm_categories (
    category_id INT PRIMARY KEY,
    name VARCHAR2(100) NOT NULL
);

--creating Products table
CREATE TABLE comm_products (
    product_id INT PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    description VARCHAR2(255),
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES comm_categories(category_id)
);

--creating Shopping Cart table
CREATE TABLE comm_shopping_cart (
    cart_id INT PRIMARY KEY,
    status VARCHAR2(20) CHECK (status IN ('Active', 'Checked Out'))
);
--creating Orders table
CREATE TABLE comm_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    cart_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES comm_customers(customer_id),
    FOREIGN KEY (cart_id) REFERENCES comm_shopping_cart(cart_id)
);

--creating Cart Items table (junction table)
CREATE TABLE comm_cart_items (
    cart_item_id INT PRIMARY KEY,
    cart_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cart_id) REFERENCES comm_shopping_cart(cart_id),
    FOREIGN KEY (product_id) REFERENCES comm_products(product_id)
);

--creating Shipping Information table
CREATE TABLE comm_shipping_information (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    address VARCHAR2(255) NOT NULL,
    status VARCHAR2(20) CHECK (status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled', 'Returned')),
    FOREIGN KEY (order_id) REFERENCES comm_orders(order_id)
);



-- Populating tables 

-- comm_customers
INSERT INTO comm_customers (customer_id, name, email, contact_number, address) VALUES
(1, 'John Doe', 'john.doe@example.com', '416-123-4567', '123 Brampton St, Brampton, ON, Canada');
INSERT INTO comm_customers (customer_id, name, email, contact_number, address) VALUES
(2, 'Jane Smith', 'jane.smith@example.com', '647-987-6543', '456 Gardineer Rd, Quebec City, QC, Canada');
INSERT INTO comm_customers (customer_id, name, email, contact_number, address) VALUES
(3, 'Alice Johnson', 'alice.johnson@example.com', '905-234-5678', '789 Mission Ave, Mission, BC, Canada');
INSERT INTO comm_customers (customer_id, name, email, contact_number, address) VALUES
(4, 'Bob Brown', 'bob.brown@example.com', '519-345-6789', '321 Earlsbridge Blvd, Calgary, AB, Canada');
INSERT INTO comm_customers (customer_id, name, email, contact_number, address) VALUES
(5, 'Carol White', 'carol.white@example.com', '613-456-7890', '654 Steeles Av, Brampton, ON, Canada');

-- comm_categories
INSERT INTO comm_categories (category_id, name) VALUES
(1, 'Electronics');
INSERT INTO comm_categories (category_id, name) VALUES
(2, 'Clothing');
INSERT INTO comm_categories (category_id, name) VALUES
(3, 'Books');
INSERT INTO comm_categories (category_id, name) VALUES
(4, 'Home and Kitchen');
INSERT INTO comm_categories (category_id, name) VALUES
(5, 'Sports and Outdoors');

-- comm_products
INSERT INTO comm_products (product_id, name, description, price, category_id) VALUES
(1, 'MacBook Pro', 'Apple MacBook Pro 13-inch', 1799.99, 1);
INSERT INTO comm_products (product_id, name, description, price, category_id) VALUES
(2, 'Levi''s Jeans', 'Levi''s 501 Original Fit Jeans', 90.00, 2);
INSERT INTO comm_products (product_id, name, description, price, category_id) VALUES
(3, 'Harry Potter', 'Harry Potter and the Philosopher''s Stone', 10.49, 3);
INSERT INTO comm_products (product_id, name, description, price, category_id) VALUES
(4, 'LG Washing Machine', 'Super efficient washing machine', 629.99, 4);
INSERT INTO comm_products (product_id, name, description, price, category_id) VALUES
(5, 'Mountain Bike', 'BMX 7 Mountain Bike', 849.99, 5);

-- comm_orders
INSERT INTO comm_orders (order_id, customer_id, cart_id, order_date) VALUES
(1, 1, 1, '2024-07-01');
INSERT INTO comm_orders (order_id, customer_id, cart_id, order_date) VALUES
(2, 2, 2, '2024-07-02');
INSERT INTO comm_orders (order_id, customer_id, cart_id, order_date) VALUES
(3, 3, 3, '2024-07-03');
INSERT INTO comm_orders (order_id, customer_id, cart_id, order_date) VALUES
(4, 4, 4, '2024-07-04');
INSERT INTO comm_orders (order_id, customer_id, cart_id, order_date) VALUES
(5, 5, 5, '2024-07-05');

-- comm_shopping_cart
INSERT INTO comm_shopping_cart (cart_id, status) VALUES
(1, 'Active');
INSERT INTO comm_shopping_cart (cart_id, status) VALUES
(2, 'Active');
INSERT INTO comm_shopping_cart (cart_id, status) VALUES
(3, 'Checked Out');
INSERT INTO comm_shopping_cart (cart_id, status) VALUES
(4, 'Active');
INSERT INTO comm_shopping_cart (cart_id, status) VALUES
(5, 'Checked Out');

-- comm_cart_items
INSERT INTO comm_cart_items (cart_item_id, cart_id, product_id, quantity, price) VALUES
(1, 1, 1, 1, 1799.99);
INSERT INTO comm_cart_items (cart_item_id, cart_id, product_id, quantity, price) VALUES
(2, 2, 2, 2, 90.00);
INSERT INTO comm_cart_items (cart_item_id, cart_id, product_id, quantity, price) VALUES
(3, 3, 3, 1, 10.49);
INSERT INTO comm_cart_items (cart_item_id, cart_id, product_id, quantity, price) VALUES
(4, 4, 4, 1, 629.99);
INSERT INTO comm_cart_items (cart_item_id, cart_id, product_id, quantity, price) VALUES
(5, 5, 5, 2, 849.99);

-- comm_shipping_information
INSERT INTO comm_shipping_information (shipping_id, order_id, address, status) VALUES
(1, 1, '123 Brampton St, Brampton, ON, Canada', 'Pending');
INSERT INTO comm_shipping_information (shipping_id, order_id, address, status) VALUES
(2, 2, '456 Gardineer Rd, Quebec City, QC, Canada', 'Shipped');
INSERT INTO comm_shipping_information (shipping_id, order_id, address, status) VALUES
(3, 3, '789 Mission Ave, Mission, BC, Canada', 'Delivered');
INSERT INTO comm_shipping_information (shipping_id, order_id, address, status) VALUES
(4, 4, '321 Earlsbridge Blvd, Calgary, AB, Canada', 'Cancelled');
INSERT INTO comm_shipping_information (shipping_id, order_id, address, status) VALUES
(5, 5, '654 Steeles Av, Brampton, ON, Canada', 'Returned');
