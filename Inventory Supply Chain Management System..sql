create database Inventory_supply_Chain;
use Inventory_supply_Chain;
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact VARCHAR(15),
    city VARCHAR(50)
);
insert into suppliers
(supplier_id, supplier_name, contact, city)
values
(101, 'ABC Electronics', '9876543210', 'Delhi'),
(102, 'Sharma Traders', '9876501234', 'Noida'),
(103, 'Global Supplies', '9812345678', 'Mumbai'),
(104, 'Tech World', '9898989898', 'Bangalore'),
(105, 'Reliable Distributors', '9123456789', 'Jaipur');

INSERT INTO suppliers
(supplier_id, supplier_name, contact, city)
VALUES
(106, 'Prime Suppliers', '9988776655', 'Pune'),
(107, 'National Traders', '9876123456', 'Lucknow'),
(108, 'Metro Supplies', '9765432109', 'Chandigarh'),
(109, 'Smart Distributors', '9654321098', 'Kolkata'),
(110, 'Fast Supply Co', '9543210987', 'Hyderabad');

SELECT 
    *
FROM
    suppliers;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10 , 2 ),
    supplier_id INT,
    unit VARCHAR(20),
    FOREIGN KEY (supplier_id)
        REFERENCES Suppliers (supplier_id)
); 
INSERT INTO Products
(product_id, product_name, category, price, supplier_id, unit)
VALUES
(1001, 'Wireless Mouse', 'Electronics', 599.00, 101, 'Piece'),
(1002, 'USB Keyboard', 'Electronics', 799.00, 101, 'Piece'),
(1003, 'HDMI Cable', 'Accessories', 349.00, 102, 'Piece'),
(1004, 'USB-C Cable', 'Accessories', 450.00, 102, 'Piece'),
(1005, 'Bluetooth Speaker', 'Electronics', 1299.00, 103, 'Piece'),

(1006, 'Power Bank 10000mAh', 'Electronics', 999.00, 103, 'Piece'),
(1007, 'LED Monitor 24 Inch', 'Electronics', 8499.00, 104, 'Piece'),
(1008, 'Wireless Headphones', 'Electronics', 1799.00, 104, 'Piece'),
(1009, 'Laptop Stand', 'Accessories', 899.00, 105, 'Piece'),
(1010, 'HD Webcam', 'Electronics', 1599.00, 105, 'Piece'),

(1011, 'Office Chair', 'Furniture', 6999.00, 106, 'Piece'),
(1012, 'Computer Table', 'Furniture', 5499.00, 106, 'Piece'),
(1013, 'Desk Lamp', 'Furniture', 799.00, 107, 'Piece'),
(1014, 'Notebook A4', 'Stationery', 120.00, 107, 'Pack'),
(1015, 'Ball Pen Pack', 'Stationery', 150.00, 108, 'Pack'),

(1016, 'Stapler', 'Stationery', 180.00, 108, 'Piece'),
(1017, 'Laser Printer', 'Electronics', 8999.00, 109, 'Piece'),
(1018, 'Printer Ink Cartridge', 'Accessories', 1299.00, 109, 'Piece'),
(1019, 'A4 Paper', 'Stationery', 450.00, 110, 'Ream'),
(1020, 'File Folder', 'Stationery', 80.00, 110, 'Pack'),

(1021, 'External Hard Drive 1TB', 'Storage', 5499.00, 101, 'Piece'),
(1022, 'USB Flash Drive 64GB', 'Storage', 699.00, 102, 'Piece'),
(1023, 'SSD 500GB', 'Storage', 4299.00, 103, 'Piece'),
(1024, 'RAM 8GB', 'Computer Parts', 2199.00, 104, 'Piece'),
(1025, 'Laptop Cooling Pad', 'Accessories', 999.00, 105, 'Piece'),

(1026, 'Ethernet Cable 10m', 'Networking', 499.00, 106, 'Piece'),
(1027, 'WiFi Router', 'Networking', 1899.00, 107, 'Piece'),
(1028, 'Network Switch 8 Port', 'Networking', 2299.00, 108, 'Piece'),
(1029, 'Barcode Scanner', 'Office Equipment', 3499.00, 109, 'Piece'),
(1030, 'Thermal Printer', 'Office Equipment', 6499.00, 110, 'Piece');
SELECT 
    *
FROM
    Products;
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.price,
    s.supplier_name
FROM
    Products p
        JOIN
    Suppliers s ON p.supplier_id = s.supplier_id;
CREATE TABLE warehouses (
    warehouse_id INT PRIMARY KEY,
    warehouses_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    manager_name VARCHAR(100),
    capacity INT
);
INSERT INTO Warehouses
(warehouse_id, warehouses_name, city, manager_name, capacity)
VALUES
(201, 'Delhi Central Warehouse', 'Delhi', 'Amit Sharma', 5000),
(202, 'Noida Distribution Center', 'Noida', 'Rahul Verma', 4000),
(203, 'Mumbai Storage Hub', 'Mumbai', 'Vikas Singh', 6000),
(204, 'Bangalore Tech Warehouse', 'Bangalore', 'Rohit Kumar', 4500),
(205, 'Jaipur Regional Warehouse', 'Jaipur', 'Sandeep Yadav', 3500);
SELECT 
    *
FROM
    Warehouses;
SELECT 
    COUNT(*) AS total_warehouses
FROM
    Warehouses;
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT,
    warehouse_id INT,
    stock_quantity INT,
    last_updated DATE,
    FOREIGN KEY (product_id)
        REFERENCES Products (product_id),
    FOREIGN KEY (warehouse_id)
        REFERENCES Warehouses (warehouse_id)
);
INSERT INTO Inventory
(inventory_id, product_id, warehouse_id, stock_quantity, last_updated)
VALUES
(1, 1001, 201, 120, '2026-08-01'),
(2, 1002, 201, 85, '2026-08-01'),
(3, 1003, 202, 200, '2026-08-02'),
(4, 1004, 202, 150, '2026-08-02'),
(5, 1005, 203, 65, '2026-08-03'),

(6, 1006, 203, 90, '2026-08-03'),
(7, 1007, 204, 25, '2026-08-04'),
(8, 1008, 204, 40, '2026-08-04'),
(9, 1009, 205, 75, '2026-08-05'),
(10, 1010, 205, 30, '2026-08-05'),

(11, 1011, 201, 15, '2026-08-06'),
(12, 1012, 201, 10, '2026-08-06'),
(13, 1013, 202, 45, '2026-08-07'),
(14, 1014, 202, 300, '2026-08-07'),
(15, 1015, 203, 250, '2026-08-08'),

(16, 1016, 203, 180, '2026-08-08'),
(17, 1017, 204, 12, '2026-08-09'),
(18, 1018, 204, 35, '2026-08-09'),
(19, 1019, 205, 120, '2026-08-10'),
(20, 1020, 205, 200, '2026-08-10'),

(21, 1021, 201, 18, '2026-08-11'),
(22, 1022, 202, 70, '2026-08-11'),
(23, 1023, 203, 25, '2026-08-12'),
(24, 1024, 204, 40, '2026-08-12'),
(25, 1025, 205, 55, '2026-08-13'),

(26, 1026, 201, 100, '2026-08-14'),
(27, 1027, 202, 35, '2026-08-14'),
(28, 1028, 203, 20, '2026-08-15'),
(29, 1029, 204, 15, '2026-08-15'),
(30, 1030, 205, 8, '2026-08-16'),

(31, 1001, 202, 60, '2026-08-17'),
(32, 1002, 203, 45, '2026-08-17'),
(33, 1003, 204, 90, '2026-08-18'),
(34, 1004, 205, 110, '2026-08-18'),
(35, 1005, 201, 30, '2026-08-19'),

(36, 1006, 202, 55, '2026-08-19'),
(37, 1007, 203, 18, '2026-08-20'),
(38, 1008, 204, 25, '2026-08-20'),
(39, 1009, 205, 40, '2026-08-21'),
(40, 1010, 201, 22, '2026-08-21'),

(41, 1011, 202, 8, '2026-08-22'),
(42, 1012, 203, 6, '2026-08-22'),
(43, 1013, 204, 30, '2026-08-23'),
(44, 1014, 205, 150, '2026-08-23'),
(45, 1015, 201, 100, '2026-08-24'),

(46, 1016, 202, 75, '2026-08-24'),
(47, 1017, 203, 7, '2026-08-25'),
(48, 1018, 204, 20, '2026-08-25'),
(49, 1019, 205, 80, '2026-08-26'),
(50, 1020, 201, 120, '2026-08-26');
SELECT 
    *
FROM
    Inventory;
SELECT 
    COUNT(*) AS total_inventory_records
FROM
    Inventory;
SELECT 
    i.inventory_id,
    p.product_name,
    w.warehouses_name,
    i.stock_quantity,
    i.last_updated
FROM
    Inventory i
        JOIN
    Products p ON i.product_id = p.product_id
        JOIN
    Warehouses w ON i.warehouse_id = w.warehouse_id;
CREATE TABLE Purchase_Orders (
    purchase_order_id INT PRIMARY KEY,
    supplier_id INT,
    order_date DATE,
    delivery_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (supplier_id)
        REFERENCES Suppliers (supplier_id)
);
DESC Purchase_Orders;
INSERT INTO Purchase_Orders
(purchase_order_id, supplier_id, order_date, delivery_date, status)
VALUES
(5001, 101, '2026-01-05', '2026-01-09', 'Delivered'),
(5002, 102, '2026-01-08', '2026-01-13', 'Delivered'),
(5003, 103, '2026-01-12', '2026-01-18', 'Delivered'),
(5004, 104, '2026-01-15', '2026-01-22', 'Delivered'),
(5005, 105, '2026-01-20', '2026-01-26', 'Delivered'),

(5006, 106, '2026-01-25', '2026-01-30', 'Delivered'),
(5007, 107, '2026-02-02', '2026-02-07', 'Delivered'),
(5008, 108, '2026-02-05', '2026-02-12', 'Delivered'),
(5009, 109, '2026-02-10', '2026-02-17', 'Delivered'),
(5010, 110, '2026-02-14', '2026-02-20', 'Delivered'),

(5011, 101, '2026-02-20', '2026-02-25', 'Delivered'),
(5012, 102, '2026-02-24', '2026-03-01', 'Delivered'),
(5013, 103, '2026-03-01', '2026-03-07', 'Delivered'),
(5014, 104, '2026-03-05', '2026-03-12', 'Delivered'),
(5015, 105, '2026-03-10', '2026-03-16', 'Delivered'),

(5016, 106, '2026-03-15', '2026-03-22', 'Delivered'),
(5017, 107, '2026-03-20', '2026-03-26', 'Delivered'),
(5018, 108, '2026-03-25', '2026-04-01', 'Delivered'),
(5019, 109, '2026-04-02', '2026-04-08', 'Delivered'),
(5020, 110, '2026-04-06', '2026-04-12', 'Delivered'),

(5021, 101, '2026-04-12', '2026-04-18', 'Delivered'),
(5022, 102, '2026-04-18', '2026-04-25', 'Delivered'),
(5023, 103, '2026-05-01', '2026-05-07', 'Delivered'),
(5024, 104, '2026-05-05', '2026-05-13', 'Delivered'),
(5025, 105, '2026-05-10', '2026-05-17', 'Delivered'),

(5026, 106, '2026-05-15', '2026-05-22', 'Pending'),
(5027, 107, '2026-05-20', '2026-05-27', 'Pending'),
(5028, 108, '2026-06-01', '2026-06-08', 'Pending'),
(5029, 109, '2026-06-05', '2026-06-13', 'Pending'),
(5030, 110, '2026-06-10', '2026-06-18', 'Pending');

SELECT 
    *
FROM
    Purchase_Orders;

SELECT 
    COUNT(*) AS total_orders
FROM
    Purchase_Orders;

SELECT 
    po.purchase_order_id,
    s.supplier_name,
    po.order_date,
    po.delivery_date,
    po.status
FROM
    Purchase_Orders po
        JOIN
    Suppliers s ON po.supplier_id = s.supplier_id;
 
 CREATE TABLE Purchase_Order_Details (
    detail_id INT PRIMARY KEY,
    purchase_order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(12,2),

    FOREIGN KEY (purchase_order_id)
        REFERENCES Purchase_Orders(purchase_order_id),

    FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);
    DESC Purchase_Order_Details;
    INSERT INTO Purchase_Order_Details
(detail_id, purchase_order_id, product_id, quantity, unit_price, total_amount)
VALUES
(1, 5001, 1001, 50, 599.00, 29950.00),
(2, 5001, 1002, 30, 799.00, 23970.00),
(3, 5002, 1003, 80, 349.00, 27920.00),
(4, 5002, 1004, 60, 450.00, 27000.00),
(5, 5003, 1005, 40, 1299.00, 51960.00),
(6, 5003, 1006, 50, 999.00, 49950.00),

(7, 5004, 1007, 20, 8499.00, 169980.00),
(8, 5004, 1008, 25, 1799.00, 44975.00),
(9, 5005, 1009, 40, 899.00, 35960.00),
(10, 5005, 1010, 30, 1599.00, 47970.00),

(11, 5006, 1011, 10, 6999.00, 69990.00),
(12, 5006, 1012, 8, 5499.00, 43992.00),
(13, 5007, 1013, 50, 799.00, 39950.00),
(14, 5007, 1014, 100, 120.00, 12000.00),
(15, 5008, 1015, 80, 150.00, 12000.00),
(16, 5008, 1016, 60, 180.00, 10800.00),

(17, 5009, 1017, 15, 8999.00, 134985.00),
(18, 5009, 1018, 25, 1299.00, 32475.00),
(19, 5010, 1019, 70, 450.00, 31500.00),
(20, 5010, 1020, 100, 80.00, 8000.00),

(21, 5011, 1021, 20, 5499.00, 109980.00),
(22, 5011, 1022, 50, 699.00, 34950.00),
(23, 5012, 1023, 25, 4299.00, 107475.00),
(24, 5012, 1024, 30, 2199.00, 65970.00),
(25, 5013, 1025, 40, 999.00, 39960.00),
(26, 5013, 1026, 50, 499.00, 24950.00),

(27, 5014, 1027, 30, 1899.00, 56970.00),
(28, 5014, 1028, 20, 2299.00, 45980.00),
(29, 5015, 1029, 15, 3499.00, 52485.00),
(30, 5015, 1030, 10, 6499.00, 64990.00),

(31, 5016, 1001, 60, 599.00, 35940.00),
(32, 5016, 1005, 30, 1299.00, 38970.00),
(33, 5017, 1007, 15, 8499.00, 127485.00),
(34, 5017, 1008, 20, 1799.00, 35980.00),
(35, 5018, 1011, 12, 6999.00, 83988.00),
(36, 5018, 1013, 40, 799.00, 31960.00),

(37, 5019, 1017, 10, 8999.00, 89990.00),
(38, 5019, 1018, 20, 1299.00, 25980.00),
(39, 5020, 1019, 60, 450.00, 27000.00),
(40, 5020, 1020, 80, 80.00, 6400.00),

(41, 5021, 1021, 15, 5499.00, 82485.00),
(42, 5021, 1023, 20, 4299.00, 85980.00),
(43, 5022, 1024, 25, 2199.00, 54975.00),
(44, 5022, 1025, 30, 999.00, 29970.00),
(45, 5023, 1026, 45, 499.00, 22455.00),
(46, 5023, 1027, 20, 1899.00, 37980.00),

(47, 5024, 1028, 15, 2299.00, 34485.00),
(48, 5024, 1029, 10, 3499.00, 34990.00),
(49, 5025, 1030, 8, 6499.00, 51992.00),
(50, 5025, 1002, 40, 799.00, 31960.00),

(51, 5026, 1003, 100, 349.00, 34900.00),
(52, 5026, 1004, 80, 450.00, 36000.00),
(53, 5027, 1006, 70, 999.00, 69930.00),
(54, 5027, 1009, 50, 899.00, 44950.00),
(55, 5028, 1014, 150, 120.00, 18000.00),
(56, 5028, 1015, 100, 150.00, 15000.00),

(57, 5029, 1016, 80, 180.00, 14400.00),
(58, 5029, 1018, 30, 1299.00, 38970.00),
(59, 5030, 1022, 60, 699.00, 41940.00),
(60, 5030, 1025, 40, 999.00, 39960.00);
    
SELECT 
    *
FROM
    Purchase_Order_Details;
SELECT 
    COUNT(*) AS total_details
FROM
    Purchase_Order_Details;
SELECT 
    pod.detail_id,
    po.purchase_order_id,
    p.product_name,
    pod.quantity,
    pod.unit_price,
    pod.total_amount
FROM
    Purchase_Order_Details pod
        JOIN
    Purchase_Orders po ON pod.purchase_order_id = po.purchase_order_id
        JOIN
    Products p ON pod.product_id = p.product_id;
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    sale_date DATE,
    warehouse_id INT,
    payment_method VARCHAR(30),
    status VARCHAR(30),
    FOREIGN KEY (warehouse_id)
        REFERENCES Warehouses (warehouse_id)
);
  INSERT INTO Sales
(sale_id, customer_name, sale_date, warehouse_id, payment_method, status)
VALUES
(6001, 'Rahul Kumar', '2026-01-03', 201, 'UPI', 'Completed'),
(6002, 'Amit Verma', '2026-01-05', 202, 'Credit Card', 'Completed'),
(6003, 'Priya Sharma', '2026-01-08', 203, 'Cash', 'Completed'),
(6004, 'Neha Singh', '2026-01-12', 204, 'UPI', 'Completed'),
(6005, 'Rohit Gupta', '2026-01-15', 205, 'Debit Card', 'Completed'),

(6006, 'Anjali Verma', '2026-01-18', 201, 'UPI', 'Completed'),
(6007, 'Vikas Kumar', '2026-01-20', 202, 'Cash', 'Completed'),
(6008, 'Pooja Yadav', '2026-01-24', 203, 'Credit Card', 'Completed'),
(6009, 'Suresh Singh', '2026-01-27', 204, 'UPI', 'Completed'),
(6010, 'Karan Sharma', '2026-01-30', 205, 'Debit Card', 'Completed'),

(6011, 'Mohit Verma', '2026-02-02', 201, 'UPI', 'Completed'),
(6012, 'Nisha Gupta', '2026-02-05', 202, 'Credit Card', 'Completed'),
(6013, 'Deepak Kumar', '2026-02-08', 203, 'Cash', 'Completed'),
(6014, 'Riya Singh', '2026-02-11', 204, 'UPI', 'Completed'),
(6015, 'Arjun Yadav', '2026-02-15', 205, 'Debit Card', 'Completed'),

(6016, 'Manish Sharma', '2026-02-18', 201, 'UPI', 'Completed'),
(6017, 'Kavita Verma', '2026-02-21', 202, 'Cash', 'Completed'),
(6018, 'Sanjay Gupta', '2026-02-24', 203, 'Credit Card', 'Completed'),
(6019, 'Simran Singh', '2026-02-27', 204, 'UPI', 'Completed'),
(6020, 'Varun Kumar', '2026-02-28', 205, 'Debit Card', 'Completed'),

(6021, 'Rakesh Yadav', '2026-03-03', 201, 'UPI', 'Completed'),
(6022, 'Komal Sharma', '2026-03-06', 202, 'Credit Card', 'Completed'),
(6023, 'Ajay Verma', '2026-03-09', 203, 'Cash', 'Completed'),
(6024, 'Sneha Gupta', '2026-03-12', 204, 'UPI', 'Completed'),
(6025, 'Vivek Singh', '2026-03-15', 205, 'Debit Card', 'Completed'),

(6026, 'Pankaj Kumar', '2026-03-18', 201, 'UPI', 'Completed'),
(6027, 'Shivani Yadav', '2026-03-21', 202, 'Cash', 'Completed'),
(6028, 'Nitin Sharma', '2026-03-24', 203, 'Credit Card', 'Completed'),
(6029, 'Muskan Verma', '2026-03-27', 204, 'UPI', 'Completed'),
(6030, 'Gaurav Gupta', '2026-03-30', 205, 'Debit Card', 'Completed'),

(6031, 'Akash Singh', '2026-04-02', 201, 'UPI', 'Completed'),
(6032, 'Ritu Sharma', '2026-04-05', 202, 'Credit Card', 'Completed'),
(6033, 'Sachin Kumar', '2026-04-08', 203, 'Cash', 'Completed'),
(6034, 'Preeti Yadav', '2026-04-11', 204, 'UPI', 'Completed'),
(6035, 'Harsh Verma', '2026-04-14', 205, 'Debit Card', 'Completed'),

(6036, 'Monika Gupta', '2026-04-17', 201, 'UPI', 'Completed'),
(6037, 'Ravi Singh', '2026-04-20', 202, 'Cash', 'Completed'),
(6038, 'Shweta Sharma', '2026-04-23', 203, 'Credit Card', 'Completed'),
(6039, 'Tarun Kumar', '2026-04-26', 204, 'UPI', 'Completed'),
(6040, 'Jyoti Yadav', '2026-04-29', 205, 'Debit Card', 'Completed'),

(6041, 'Ashish Verma', '2026-05-02', 201, 'UPI', 'Completed'),
(6042, 'Meena Gupta', '2026-05-05', 202, 'Credit Card', 'Completed'),
(6043, 'Lokesh Singh', '2026-05-08', 203, 'Cash', 'Completed'),
(6044, 'Payal Sharma', '2026-05-11', 204, 'UPI', 'Completed'),
(6045, 'Ramesh Kumar', '2026-05-14', 205, 'Debit Card', 'Completed'),

(6046, 'Naveen Yadav', '2026-05-17', 201, 'UPI', 'Completed'),
(6047, 'Swati Verma', '2026-05-20', 202, 'Cash', 'Completed'),
(6048, 'Yash Gupta', '2026-05-23', 203, 'Credit Card', 'Completed'),
(6049, 'Piyush Singh', '2026-05-26', 204, 'UPI', 'Completed'),
(6050, 'Rakesh Sharma', '2026-05-29', 205, 'Debit Card', 'Completed');
SELECT 
    product_name, category, price
FROM
    Products
ORDER BY price DESC;
SELECT 
    product_id, product_name, category, price
FROM
    Products
WHERE
    price > 2000;
SELECT 
    category, COUNT(*) AS total_products
FROM
    Products
GROUP BY category;
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.price,
    s.supplier_name,
    s.city
FROM
    Products p
        JOIN
    Suppliers s ON p.supplier_id = s.supplier_id;
    
    
    -- INSIGHT 1:
-- Find the total quantity of products currently available
-- across all warehouses.
-- Business Use: Helps management understand overall stock availability.

SELECT 
    SUM(stock_quantity) AS total_stock
FROM Inventory;


-- INSIGHT 2:
-- Calculate the total stock available in each warehouse.
-- Business Use: Identifies warehouses holding the highest and lowest
-- amount of inventory.

SELECT 
    w.warehouses_name,
    SUM(i.stock_quantity) AS total_stock
FROM Inventory i
JOIN Warehouses w
    ON i.warehouse_id = w.warehouse_id
GROUP BY w.warehouse_id, w.warehouses_name
ORDER BY total_stock DESC;
    
    
    -- INSIGHT 3:
-- Analyze total inventory quantity by product category.
-- Business Use: Helps identify which categories occupy the
-- largest portion of physical inventory.

SELECT 
    p.category,
    SUM(i.stock_quantity) AS total_units
FROM Inventory i
JOIN Products p
    ON i.product_id = p.product_id
GROUP BY p.category
ORDER BY total_units DESC;

-- INSIGHT 4:
-- Calculate the monetary value of inventory for each product category.
-- Inventory Value = Stock Quantity × Product Price
-- Business Use: Helps management identify categories where
-- the highest amount of capital is currently invested.

SELECT 
    p.category,
    SUM(i.stock_quantity) AS total_units,
    SUM(i.stock_quantity * p.price) AS inventory_value
FROM Inventory i
JOIN Products p
    ON i.product_id = p.product_id
GROUP BY p.category
ORDER BY inventory_value DESC;

-- INSIGHT 5:
-- Identify the products with the highest inventory value.
-- Business Use: Helps management focus on high-value products
-- and reduce the risk of excess capital being locked in stock.

SELECT 
    p.product_name,
    SUM(i.stock_quantity) AS total_stock,
    SUM(i.stock_quantity * p.price) AS inventory_value
FROM Inventory i
JOIN Products p
    ON i.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY inventory_value DESC
LIMIT 10;


-- INSIGHT 6:
-- Identify products whose total stock is below 20 units.
-- Business Use: Helps the purchasing team identify products
-- that may require replenishment.

SELECT 
    p.product_name,
    SUM(i.stock_quantity) AS total_stock
FROM Inventory i
JOIN Products p
    ON i.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(i.stock_quantity) < 20
ORDER BY total_stock ASC;

-- INSIGHT 7:
-- Calculate warehouse capacity utilization.
-- Utilization % = Current Stock / Warehouse Capacity × 100
-- Business Use: Helps management identify warehouses with
-- higher stock concentration and available storage capacity.

SELECT 
    w.warehouses_name,
    w.capacity,
    SUM(i.stock_quantity) AS current_stock,
    ROUND(
        SUM(i.stock_quantity) * 100.0 / w.capacity,
        2
    ) AS utilization_percentage
FROM Warehouses w
JOIN Inventory i
    ON w.warehouse_id = i.warehouse_id
GROUP BY 
    w.warehouse_id,
    w.warehouses_name,
    w.capacity
ORDER BY utilization_percentage DESC;

-- INSIGHT 8:
-- Calculate the total monetary value of all purchase orders.
-- Business Use: Shows the total procurement investment made
-- with suppliers.

SELECT 
    SUM(total_amount) AS total_purchase_value
FROM Purchase_Order_Details;

-- INSIGHT 9:
-- Calculate the total purchase value for each supplier.
-- Business Use: Identifies the suppliers receiving the highest
-- procurement spending.

SELECT 
    s.supplier_name,
    SUM(pod.total_amount) AS total_purchase_value
FROM Purchase_Order_Details pod
JOIN Purchase_Orders po
    ON pod.purchase_order_id = po.purchase_order_id
JOIN Suppliers s
    ON po.supplier_id = s.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_purchase_value DESC;

-- INSIGHT 10:
-- Count purchase orders according to their current status.
-- Business Use: Helps management monitor delivered versus
-- pending procurement orders.

SELECT 
    status,
    COUNT(*) AS total_orders
FROM Purchase_Orders
GROUP BY status;

-- INSIGHT 11:
-- Calculate the total monetary value of pending purchase orders.
-- Business Use: Shows how much procurement value is still
-- waiting for delivery.

SELECT 
    SUM(pod.total_amount) AS pending_order_value
FROM Purchase_Orders po
JOIN Purchase_Order_Details pod
    ON po.purchase_order_id = pod.purchase_order_id
WHERE po.status = 'Pending';

-- INSIGHT 12:
-- Calculate the average delivery time taken by each supplier.
-- Business Use: Helps compare supplier delivery performance
-- and identify suppliers with longer lead times.

SELECT 
    s.supplier_name,
    ROUND(
        AVG(DATEDIFF(po.delivery_date, po.order_date)),
        2
    ) AS avg_delivery_days
FROM Purchase_Orders po
JOIN Suppliers s
    ON po.supplier_id = s.supplier_id
WHERE po.status = 'Delivered'
GROUP BY s.supplier_id, s.supplier_name
ORDER BY avg_delivery_days ASC;

-- INSIGHT 13:
-- Identify the most expensive products in the product catalog.
-- Business Use: Helps management identify high-value products
-- that may require tighter inventory control.

SELECT 
    product_name,
    category,
    price
FROM Products
ORDER BY price DESC
LIMIT 10;


-- INSIGHT 14:
-- Count the number of products available in each category.
-- Business Use: Helps understand the size and diversity of
-- the product portfolio.

SELECT 
    category,
    COUNT(*) AS total_products
FROM Products
GROUP BY category
ORDER BY total_products DESC;

-- INSIGHT 15:
-- Count how many products are supplied by each supplier.
-- Business Use: Helps identify supplier dependency and
-- understand supplier-product relationships.

SELECT 
    s.supplier_name,
    COUNT(p.product_id) AS total_products
FROM Suppliers s
LEFT JOIN Products p
    ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_products DESC;

-- INSIGHT 16:
-- Identify products with the highest total stock quantity.
-- Business Use: Helps identify products that may have
-- high availability or potential overstocking.

SELECT 
    p.product_name,
    SUM(i.stock_quantity) AS total_stock
FROM Inventory i
JOIN Products p
    ON i.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_stock DESC
LIMIT 10;

-- INSIGHT 17:
-- Calculate the total monetary value of inventory stored
-- in each warehouse.
-- Business Use: Helps management understand how much capital
-- is physically stored at each warehouse.

SELECT 
    w.warehouses_name,
    SUM(i.stock_quantity) AS total_units,
    SUM(i.stock_quantity * p.price) AS inventory_value
FROM Inventory i
JOIN Products p
    ON i.product_id = p.product_id
JOIN Warehouses w
    ON i.warehouse_id = w.warehouse_id
GROUP BY w.warehouse_id, w.warehouses_name
ORDER BY inventory_value DESC;

-- INSIGHT 18:
-- Calculate the average price of products supplied by each supplier.
-- Business Use: Helps understand whether a supplier mainly
-- provides low-value or high-value products.

SELECT 
    s.supplier_name,
    ROUND(AVG(p.price), 2) AS average_product_price
FROM Suppliers s
JOIN Products p
    ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY average_product_price DESC;

-- INSIGHT 19:
-- Identify products that are stocked in more than one warehouse.
-- Business Use: Helps understand product distribution and
-- warehouse-level availability.

SELECT 
    p.product_name,
    COUNT(DISTINCT i.warehouse_id) AS warehouse_count,
    SUM(i.stock_quantity) AS total_stock
FROM Inventory i
JOIN Products p
    ON i.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(DISTINCT i.warehouse_id) > 1
ORDER BY warehouse_count DESC, total_stock DESC;

-- INSIGHT 20:
-- Identify products that have more than 100 units in stock
-- but have a relatively low unit price.
-- Business Use: Helps identify products that consume warehouse
-- space despite having relatively low individual value.

SELECT 
    p.product_name,
    p.category,
    p.price,
    SUM(i.stock_quantity) AS total_stock,
    SUM(i.stock_quantity * p.price) AS inventory_value
FROM Inventory i
JOIN Products p
    ON i.product_id = p.product_id
GROUP BY 
    p.product_id,
    p.product_name,
    p.category,
    p.price
HAVING SUM(i.stock_quantity) > 100
ORDER BY total_stock DESC;