-- [Bài tập] Quản lý Khách hàng & Đơn hàng

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    price double,
    quantity INT
);

-- Thêm 2 khách hàng mới vào bảng customers
INSERT INTO customers (customer_id, customer_name, email)
VALUES
(1, 'Nguyen Van An', 'an@gmail.com'),
(2, 'Tran Thi Binh', 'binh@gmail.com');
-- Liệt kê những khách hàng đã có ít nhất một đơn hàng
SELECT DISTINCT 
    c.customer_id,
    c.customer_name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;
-- Tìm những khách hàng chưa từng đặt đơn hàng nào
SELECT 
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
-- Tính toán tổng doanh thu mà mỗi khách hàng đã mang lại
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(od.price * od.quantity) AS total_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_details od
ON o.order_id = od.order_id
GROUP BY c.customer_id, c.customer_name;
-- Xác định khách hàng đã mua sản phẩm có giá cao nhất
SELECT DISTINCT
    c.customer_id,
    c.customer_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_details od
ON o.order_id = od.order_id
WHERE od.price = (
    SELECT MAX(price)
    FROM order_details
);